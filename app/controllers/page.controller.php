<?php
namespace trackle;

use Delight\Auth\AmbiguousUsernameException;
use Delight\Auth\AuthError;
use Delight\Auth\InvalidPasswordException;
use Delight\Auth\AttemptCancelledException;
use Delight\Auth\EmailNotVerifiedException;
use Delight\Auth\NotLoggedInException;
use Delight\Auth\TooManyRequestsException;

use Delight\Auth\UnknownUsernameException;

use trackle\Exceptions\CantCreateResultException;
use trackle\Exceptions\ResultNotFoundException;
use trackle\Exceptions\UserNotFoundException;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class PageController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  public function errorMessage($message) {
    header( $_SERVER["SERVER_PROTOCOL"] . ' 500 Internal Server Error');
    try {
      echo $this->app->twig->render('error.twig', [
        "message" => $message,
        "appData" => $this->app->appData->get()
      ]);
    } catch (LoaderError | RuntimeError | SyntaxError) {
      die("an unknown error occurred, please try again later");
    }
    die();
  }

  public function pageNotFound() {
    header( $_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
    try {
      echo $this->app->twig->render('404.twig', [
        "appData" => $this->app->appData->get()
      ]);
    } catch (LoaderError | RuntimeError | SyntaxError $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }

  public function maintenance() {
    header( $_SERVER["SERVER_PROTOCOL"] . ' 503 Service Unavailable');
    try {
      echo $this->app->twig->render('/misc/maintenance.twig', [
        "appData" => $this->app->appData->get()
      ]);
    } catch (LoaderError | RuntimeError | SyntaxError $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }
  
  //INDEX
  public function indexGet() {
    $redirect = ($this->app->auth->isLoggedIn()) ? "u/".$this->app->personController->getMe()->username() : "login";
    header("Location: /".$redirect);
  }
  
  //LOGIN
  public function loginGet() {
    if ($this->app->auth->isLoggedIn()){
      header("Location: /");
    } else {
      //Homepage
      try {
        echo $this->app->twig->render('login/login.twig');
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    }
  }
  
  public function logoutGet() {
    if (!$this->app->auth->isLoggedIn()){
      header("Location: /login");
    } else {
      try {
        $this->app->auth->logOut();
        $this->app->auth->destroySession();
      } catch (AuthError $e) {
        $this->errorMessage($e->getMessage());
      }
      header("Location: /");
    }
  }
  
  public function loginPost() {
    if ($this->app->auth->isLoggedIn()) {
      header("Location: /");
    } else {
      $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
      $password = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
      try {
        $this->app->auth->loginWithUsername($username, $password);
        header("Location: /");
      } catch (UnknownUsernameException | InvalidPasswordException) {
        header("Location: /login?invalid");
      } catch (
      AttemptCancelledException |
      EmailNotVerifiedException |
      TooManyRequestsException|
      AmbiguousUsernameException|
      AuthError $e) {
        $this->errorMessage($e->getMessage());
      }
    }
  }
  
  //HOMEPAGE
//  public function homeGet() {
//    try {
//      echo $this->app->twig->render('home/home.twig', [
//        "me" => $this->app->personController->getMe()
//      ]);
//    } catch (LoaderError | RuntimeError | SyntaxError $e) {
//      $this->errorMessage($e->getMessage());
//    }
//    die();
//  }

  //USER
  public function personGet($params) {
    try {
      $person = $this->app->personController->getByUsername($params['name']);
      $results = $this->app->resultController->getFromUser($person->id(), ["newestFirst" => true]);

      $graphData = [];

      $won = 0;
      $played = 0;
      $sum = 0;

      foreach (array_reverse($results) as $result) {
        $guess = ($result->guessesNo() == "X") ? null : $result->guessesNo();
        $graphData[] = ["number" => $result->puzzleNo(), "guesses" => $guess];
        $played += 1;
        if ($result->guessesNo() != "X") {
          $won += 1;
          $sum += $result->guessesNo();
        }
      }

      $winrate = round(($won / $played) * 100);
      $average = round($sum / $won, 2);

      $me = ($this->app->auth->isLoggedIn()) ? $this->app->personController->getMe() : false;

      echo $this->app->twig->render('person/person.twig', [
        "me" => $me,
        "person" => $person,
        "results" => $results,
        "graphData" => $graphData,
        "stats" => [
          "won" => $won,
          "played" => $played,
          "winrate" => $winrate,
          "total" => $sum,
          "average" => $average,
        ],
        "breadcrumb" => [
          ["link" => false, "display" => $person->username()]
        ],
      ]);
    } catch (UserNotFoundException) {
      $this->pageNotFound();
    } catch (LoaderError | RuntimeError | SyntaxError $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }

  //RESULT
  public function resultGet($params) {
    try {

      if (isset($params['id'])) {
        $result = $this->app->resultController->getSingle($params['id']);
      } else {
        $user = $this->app->personController->getByUsername($params['name']);
        $result = $this->app->resultController->getSingleFromUser($user->id(), $params['puzzleno']);
      }

      try {
        $previous = $this->app->resultController->getSingleFromUser($user->id(), (int)$params['puzzleno'] - 1);
      } catch (ResultNotFoundException) {
        $previous = null;
      }

      try {
        $next = $this->app->resultController->getSingleFromUser($user->id(), (int)$params['puzzleno'] + 1);
      } catch (ResultNotFoundException) {
        $next = null;
      }

      $me = ($this->app->auth->isLoggedIn()) ? $this->app->personController->getMe() : false;

      echo $this->app->twig->render('results/result.twig', [
        "me" => $me,
        "result" => $result,
        "next" => $next,
        "previous" => $previous,
        "breadcrumb" => [
          ["link" => "/u/" . $result->user()->username(), "display" => $result->user()->username()],
          ["link" => false, "display" => $result->puzzleNo()]
        ],
      ]);

    } catch (ResultNotFoundException | UserNotFoundException | LoaderError | RuntimeError | SyntaxError $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }

  public function resultAddGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        echo $this->app->twig->render('results/addresult.twig',[

        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }

  public function resultAddPost() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $user = $this->app->personController->getMe();

        $result = $this->app->resultController::parseFromShare($_POST['text']);
        $create = $this->app->resultController->create($result['puzzle_no'], $result['guesses_no'], $result['lines'], $user);

        header("Location: /r/".$create);
      } catch (CantCreateResultException) {
        $this->errorMessage("Result cannot be created!");
      }

      die();
    } else {
      header("Location: /login");
    }
  }
}
<?php
namespace trackle;

use Delight\Auth\AmbiguousUsernameException;
use Delight\Auth\AuthError;
use Delight\Auth\DuplicateUsernameException;
use Delight\Auth\InvalidEmailException;
use Delight\Auth\InvalidPasswordException;
use Delight\Auth\AttemptCancelledException;
use Delight\Auth\EmailNotVerifiedException;
use Delight\Auth\NotLoggedInException;
use Delight\Auth\TooManyRequestsException;

use Delight\Auth\UnknownIdException;
use Delight\Auth\UnknownUsernameException;

use Delight\Auth\UserAlreadyExistsException;
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
        if (isset($_GET['invalid'])) {
          echo $this->app->twig->render('login/login.twig',[
            "message" => "Username or Password is incorrect!"
          ]);
        } else {
          echo $this->app->twig->render('login/login.twig');
        }


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

  public function registerGet() {
    if ($this->app->auth->isLoggedIn()){
      header("Location: /");
    } else {
      //Homepage
      try {
        if (isset($_GET['invalid'])) {
          echo $this->app->twig->render('login/register.twig',[
            "message" => "Username or Password is incorrect!"
          ]);
        } else {
          echo $this->app->twig->render('login/register.twig');
        }


      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    }
  }

  public function registerPost() {
    if ($this->app->auth->isLoggedIn()) {
      header("Location: /");
    } else {
      $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
      $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
      $password = filter_var($_POST['password'], FILTER_SANITIZE_STRING);

      try {
        $this->app->auth->registerWithUniqueUsername($email, $password, $username);
        $this->app->auth->loginWithUsername($username, $password);
        header("Location: /");
      }
      catch (InvalidEmailException) {
        header("Location: /register?m=ie");
      }
      catch (InvalidPasswordException) {
        header("Location: /register?m=ip");
      }
      catch (UserAlreadyExistsException) {
        header("Location: /register?m=eae");
      }
      catch (DuplicateUsernameException) {
        header("Location: /register?m=uae");
      }
      catch (TooManyRequestsException) {
        header("Location: /register?m=tmr");
      }
      catch (
      AttemptCancelledException |
      EmailNotVerifiedException |
      UnknownUsernameException |
      AmbiguousUsernameException|
      AuthError $e) {
        $this->errorMessage($e->getMessage());
      }
    }
  }

  public function changeEmailPost() {
    if (!$this->app->auth->isLoggedIn()) {
      header("Location: /");
    } else {
      $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
      try {

        $this->app->auth->changeEmail($email, function($s, $t){
          $this->app->auth->confirmEmail($s, $t);
        });
        header("Location: /settings?m=ec");
      } catch (AuthError $e) {
        die($e->getmessage());
        header("Location: /settings?m=ae");
      } catch (InvalidEmailException) {
        header("Location: /settings?m=ie");
      } catch (NotLoggedInException) {
        header("Location: /");
      } catch (TooManyRequestsException) {
        header("Location: /settings?m=tmr");
      } catch (UserAlreadyExistsException) {
        header("Location: /settings?m=uae");
      } catch (EmailNotVerifiedException) {
        header("Location: /settings?m=env");
      }
    }
  }

  public function changePasswordPost() {
    if (!$this->app->auth->isLoggedIn()) {
      header("Location: /");
    } else {
      $oldpass = filter_var($_POST['oldpass'], FILTER_SANITIZE_STRING);
      $newpass = filter_var($_POST['newpass'], FILTER_SANITIZE_STRING);
      $newpassconfirm = filter_var($_POST['newpassconfirm'], FILTER_SANITIZE_STRING);
      try {
        if($newpass != $newpassconfirm) {
          header("Location: /settings?m=pdm");
        } else {
          $this->app->auth->changePassword($oldpass, $newpass);
          header("Location: /settings?m=pc");
        }
      } catch (AuthError) {
        header("Location: /settings?m=ae");
      } catch (InvalidPasswordException) {
        header("Location: /settings?m=ip");
      } catch (NotLoggedInException) {
        header("Location: /");
      } catch (TooManyRequestsException) {
        header("Location: /settings?m=tmr");
      }
    }
  }

  public function deleteUser($pass, $id = null) {
    if ($id == null) {
      $id = $this->app->auth->getUserId();
    }
    $cleanid = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
    try {
      if ($this->app->auth->reconfirmPassword($pass)) {
        $this->app->auth->admin()->deleteUserById($cleanid);
        $this->app->auth->logOutEverywhere();
        header("Location: /?m=ad");
      } else {
        header("Location: /deleteaccount?m=dapi");
      }
    }
    catch (UnknownIdException) {
      header("Location: /deleteaccount?m=uid");
    }
    catch (NotLoggedInException) {
      header("Location: /");
    }
    catch (TooManyRequestsException) {
      header("Location: /deleteaccount?m=tmr");
    }
    catch (AuthError) {
      header("Location: /deleteaccount?m=ae");
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
        if ($result->guessesNo() != "0") {
          $won += 1;
          $sum += $result->guessesNo();
        }
      }

      if ($played == 0) {
        $winrate = "n/a";
      } else {
        $winrate = round(($won / $played) * 100);
      }

      if ($won == 0) {
        $average = "0";
      } else {
        $average = $sum / $played;
//        $average = round(($won / $played) * 100);
      }

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
        $me = $this->app->personController->getMe();
        echo $this->app->twig->render('results/addresult.twig',[
          "me" => $me,
          "breadcrumb" => [
            ["link" => "/u/" . $me->username(), "display" => $me->username()],
            ["link" => false, "display" => "add"]
          ],
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
        $this->app->resultController->create($result['puzzle_no'], $result['guesses_no'], $result['lines'], $user);

        header("Location: /u/".$user->username());
      } catch (CantCreateResultException) {
        $this->errorMessage("Result cannot be created!");
      }

      die();
    } else {
      header("Location: /login");
    }
  }

  //USER
  public function settingsGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();
        echo $this->app->twig->render('settings/settings.twig', [
          "me" => $me,
          "breadcrumb" => [
            ["link" => "/u/".$me->username(), "display" => $me->username()],
            ["link" => false, "display" => "settings"]
          ],
        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }
}
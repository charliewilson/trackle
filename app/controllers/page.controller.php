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
use trackle\Exceptions\InvalidShareTextException;
use trackle\Exceptions\PuzzleAlreadyDoneException;
use trackle\Exceptions\ResultNotFoundException;
use trackle\Exceptions\UserNotFoundException;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;
use TypeError;

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

        $message = "";

        if (isset($_GET['invalid'])) {
          $message = "Username or Password is incorrect!";
        } elseif (isset($_GET['ad'])) {
          $message = "Account deleted successfully. Sorry to see you go!";
        }

        echo $this->app->twig->render('login/login.twig',[
          "message" => $message
        ]);

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
        $this->app->auth->loginWithUsername($username, $password, (int)(60 * 60 * 24 * 365.25));
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

        $message = "";

        if (isset($_GET['ie'])) {
          $message = "Invalid email";
        } elseif (isset($_GET['ip'])) {
          $message = "Invalid password";
        } elseif (isset($_GET['eae'])) {
          $message = "Email address already exists, please login";
        } elseif (isset($_GET['uae'])) {
          $message = "Username already exists, please login";
        } elseif (isset($_GET['tmr'])) {
          $message = "Too many requests, please try again later.";
        }

        echo $this->app->twig->render('login/register.twig',[
          "message" => $message
        ]);

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
        header("Location: /register?ie");
      }
      catch (InvalidPasswordException) {
        header("Location: /register?ip");
      }
      catch (UserAlreadyExistsException) {
        header("Location: /register?eae");
      }
      catch (DuplicateUsernameException) {
        header("Location: /register?uae");
      }
      catch (TooManyRequestsException) {
        header("Location: /register?tmr");
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
        header("Location: /settings?ec");
      } catch (AuthError $e) {
        die($e->getmessage());
        header("Location: /settings?ae");
      } catch (InvalidEmailException) {
        header("Location: /settings?ie");
      } catch (NotLoggedInException) {
        header("Location: /");
      } catch (TooManyRequestsException) {
        header("Location: /settings?tmr");
      } catch (UserAlreadyExistsException) {
        header("Location: /settings?uae");
      } catch (EmailNotVerifiedException) {
        header("Location: /settings?env");
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
          header("Location: /settings?pdm");
        } else {
          $this->app->auth->changePassword($oldpass, $newpass);
          header("Location: /settings?pc");
        }
      } catch (AuthError) {
        header("Location: /settings?ae");
      } catch (InvalidPasswordException) {
        header("Location: /settings?ip");
      } catch (NotLoggedInException) {
        header("Location: /");
      } catch (TooManyRequestsException) {
        header("Location: /settings?tmr");
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

      $resultsReversed = array_reverse($results);
      $firstPuzzle = (int)$resultsReversed[0]->puzzleNo();
      $lastPuzzle = (int)end($resultsReversed)->puzzleNo();
      $graphData = [];

      for ($i = $firstPuzzle; $i < ($lastPuzzle + 1); $i ++) {
        $graphData[$i] = null;
      }

      foreach (array_reverse($results) as $result) {
        $graphData[$result->puzzleNo()] = $result->guessesNo();
      }

      $me = ($this->app->auth->isLoggedIn()) ? $this->app->personController->getMe() : false;

      echo $this->app->twig->render('person/person.twig', [
        "me" => $me,
        "person" => $person,
        "results" => $results,
        "graphData" => $graphData,
        "stats" => $person->stats(),
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

  public function resultDeleteGet($params) {
    try {
      $user = $this->app->personController->getByUsername($params['name']);
      $result = $this->app->resultController->getSingleFromUser($user->id(), $params['puzzleno']);
      $me = ($this->app->auth->isLoggedIn()) ? $this->app->personController->getMe() : false;

      if ($user->id() == $me->id()) {
        if ($this->app->resultController->delete($result->puzzleNo(), $user)) {
          header("Location: /u/".$user->username()."?rd");
        } else {
          header("Location: /u/".$user->username()."/".$result->puzzleNo()."?cd");
        }
      } else {
        header("Location: /u/".$user->username()."/".$result->puzzleNo()."?cd");
      }

    } catch (ResultNotFoundException | UserNotFoundException $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }

  public function resultAddGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();

        $message = "";

        if (isset($_GET['pad'])) {
          $message = "You've already provided a solution to this wordle!";
        } elseif (isset($_GET['ist'])) {
          $message = "Unable to read pasted solution. Please try again!";
        }

        echo $this->app->twig->render('results/addresult.twig',[
          "me" => $me,
          "message" => $message,
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

        header("Location: /u/" . $user->username());
      } catch (TypeError | InvalidShareTextException) {
        header("Location: /r/add?ist");
      } catch (PuzzleAlreadyDoneException) {
        header("Location: /r/add?pad");
      } catch (CantCreateResultException) {
        $this->errorMessage("Result cannot be created!");
      }

      die();
    } else {
      header("Location: /login");
    }
  }

  public function leaderboardGet() {
    try {

      $me = ($this->app->auth->isLoggedIn()) ? $this->app->personController->getMe() : false;
      $users = $this->app->personController->getall();

      usort($users, function($a, $b) {
        if ($a->stats()['average'] == $b->stats()['average']) {
          return 0;
        }
        return ($a->stats()['average'] > $b->stats()['average']) ? +1 : -1;
      });

      echo $this->app->twig->render('leaderboard/leaderboard.twig', [
        "me" => $me,
        "people" => $users,
        "breadcrumb" => [
          ["link" => false, "display" => "leaderboard"]
        ],
      ]);

    } catch (ResultNotFoundException | UserNotFoundException | LoaderError | RuntimeError | SyntaxError $e) {
      $this->errorMessage($e->getMessage());
    }
    die();
  }

  //USER
  public function settingsGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();

        $message = "";

        if (isset($_GET['ec'])) {
          $message = "Email changed successfully";
        } elseif (isset($_GET['ae'])) {
          $message = "Auth Error occurred, please try again later.";
        } elseif (isset($_GET['ie'])) {
          $message = "Invalid email";
        } elseif (isset($_GET['tmr'])) {
          $message = "Too many requests, please try again later.";
        } elseif (isset($_GET['pc'])) {
          $message = "Password changed successfully";
        } elseif (isset($_GET['ip'])) {
          $message = "Old password is incorrect, please try again";
        } elseif (isset($_GET['pdm'])) {
          $message = "New and confirmed password don't match, please try again";
        } elseif (isset($_GET['uae'])) {
          $message = "This email belongs to another user.";
        }

        echo $this->app->twig->render('settings/settings.twig', [
          "me" => $me,
          "message" => $message,
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

  public function deleteAccountGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();

        $message = "";

        if (isset($_GET['ae'])) {
          $message = "Auth Error occurred, please try again later.";
        } elseif (isset($_GET['tmr'])) {
          $message = "Too many requests, please try again later.";
        } elseif (isset($_GET['ip'])) {
          $message = "Password is incorrect, please try again";
        }

        echo $this->app->twig->render('settings/delete_account.twig', [
          "me" => $me,
          "message" => $message,
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

  public function deleteAccountPost() {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();
        $pass = filter_var($_POST['password'], FILTER_SANITIZE_STRING);

        if ($this->app->auth->reconfirmPassword($pass)) {
          $this->app->resultController->deleteAllFromUser($me);
          $this->app->auth->admin()->deleteUserById($me->id());
          $this->app->auth->logOutEverywhere();
          header("Location: /login?ad");
        } else {
          header("Location: /settings/delete?ip");
        }
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      } catch (AuthError | UnknownIdException) {
        header("Location: /settings/delete?ae");
      } catch (TooManyRequestsException) {
        header("Location: /settings/delete?tmr");
      } catch (NotLoggedInException) {
        header("Location: /login");
      }
      die();
    } else {
      header("Location: /login");
    }
  }
}
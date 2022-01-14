<?php
namespace trackle;

use Delight\Auth\AmbiguousUsernameException;
use Delight\Auth\AuthError;
use Delight\Auth\InvalidPasswordException;
use Delight\Auth\AttemptCancelledException;
use Delight\Auth\EmailNotVerifiedException;
use Delight\Auth\TooManyRequestsException;

use Delight\Auth\UnknownUsernameException;

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
    $redirect = ($this->app->auth->isLoggedIn()) ? "home" : "login";
    header("Location: /".$redirect);
  }
  
  //LOGIN
  public function loginGet() {
    if ($this->app->auth->isLoggedIn()){
      header("Location: /home");
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
      header("Location: /home");
    } else {
      $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
      $password = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
      try {
        $this->app->auth->loginWithUsername($username, $password);
        header("Location: /home");
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
  public function homeGet() {
    if ($this->app->auth->isLoggedIn()){

//
//$input = <<<WORDLE
//Wordle 204 4/6
//
//⬜⬜🟨⬜⬜
//⬜🟩⬜🟨🟨
//⬜🟩🟩⬜🟩
//🟩🟩🟩🟩🟩
//WORDLE;
//

      try {
        echo $this->app->twig->render('home/home.twig', [
          "me" => $this->app->personController->getMe(),
          "users" => $this->app->personController->getAll()
        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }

  //USER
  public function personGet($params) {
    if ($this->app->auth->isLoggedIn()){
      try {
        $person = $this->app->personController->getByUsername($params['name']);
        echo $this->app->twig->render('person/person.twig', [
          "person" => $person,
          "results" => $this->app->resultController->getFromUser($person->id())
        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }

  //RESULT
  public function resultGet($params) {
    if ($this->app->auth->isLoggedIn()){
      try {
        $me = $this->app->personController->getMe();
        $result = $this->app->resultController->getSingle($params['id']);

        echo $this->app->twig->render('results/result.twig', [
          "result" => $result
        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }

  public function spotAddGet() {
    if ($this->app->auth->isLoggedIn()){
      try {
        echo $this->app->twig->render('spots/addspot.twig',[
//          "groups" => $this->app->groupController->getFromUser($this->app->auth->id())
        ]);
      } catch (LoaderError | RuntimeError | SyntaxError $e) {
        $this->errorMessage($e->getMessage());
      }
      die();
    } else {
      header("Location: /login");
    }
  }

  public function spotAddPost() {
    if ($this->app->auth->isLoggedIn()){
      $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
      $description = filter_var($_POST['description'], FILTER_SANITIZE_STRING);
      $group = $this->app->groupController->getSingle(filter_var($_POST['group'], FILTER_SANITIZE_NUMBER_INT));

      $latpieces = explode('.', $_POST['lat']);
      $lonpieces = explode('.', $_POST['lon']);
      $lat = $latpieces[0] . '.' . substr($latpieces[1],0,6);
      $lon = $lonpieces[0] . '.' . substr($lonpieces[1],0,6);

      $user = $this->app->personController->getMe();

      try {
        $create = $this->app->spotController->create($name, $lat, $lon, $description, $group, $user);
        header("Location: /s/".$create);
      } catch (Exception) {
        $this->errorMessage("Spot cannot be created!");
      }

      die();
    } else {
      header("Location: /login");
    }
  }
}
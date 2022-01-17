<?php

namespace trackle;

require_once("vendor/autoload.php");
require_once("config.php");
require_once("objects/objects.php");

use JetBrains\PhpStorm\ArrayShape;
use PDO;

use AltoRouter;
use Exception;

use Delight\Auth\Auth;

use Dotenv\Dotenv;

use Twig\Environment;
use Twig\Loader\FilesystemLoader;
use Twig\Extension\DebugExtension;
use Twig\Extra\Intl\IntlExtension;

class App {

  public PDO $db;
  public AltoRouter $router;
  public Environment $twig;
  public Auth $auth;
  public User $user;
  public AppData $appData;
  
  public PageController $pageController;
  public ResultController $resultController;
  public PersonController $personController;

  function __construct(PDO $db = null) {
    //Load environment variables
    Dotenv::createImmutable(__DIR__."/../..")->load();

    //If a DB instance has been passed (nested App objects), reuse the connection. Otherwise create
    //a new one.
    $this->db = ($db) ?: new PDO(
      'mysql:dbname='.db_name.';host='.db_host.';charset=utf8mb4',
      db_user,
      db_pass);

    $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $this->router = new AltoRouter();
    $this->twig = new Environment((new FilesystemLoader('app/views')),[
      'debug' => true
    ]);
    $this->twig->addExtension(new DebugExtension());
    $this->twig->addExtension(new IntlExtension());
//    $this->auth = new Auth($this->db);
    $this->auth = new Auth($this->db,$_SERVER['REMOTE_ADDR'],"",false);
    $this->user = new User($this->db);
    $this->appData = new appData;
    
    $this->pageController = new PageController($this);
    $this->resultController = new ResultController($this);
    $this->personController = new PersonController($this);
  }

}

class AppData {

  public string $appName;
  public string $version;

  function __construct() {
    $this->appName = 'trackle';
    $this->version = '1.0';
  }

  #[ArrayShape(["name" => "string", "version" => "string", "year" => "string"])]
  public function get(): array {
    return [
      "name" => $this->appName,
      "version" => $this->version,
      "year" => date("Y")
    ];
  }

}

class User {

  private PDO $db;

  function __construct(PDO $db) {
    $this->db = $db;
  }

  // Gets the full name from a user's email for use in adding comments etc.
  public function getName($email) {
    try {
      $q = $this->db->prepare("
        SELECT `name`
        FROM `users_data`
        WHERE `email` = :email
      ");

      $q->execute([
        ':email' => filter_var($email,FILTER_SANITIZE_EMAIL)
      ]);

      if ($q) {
        return ($q->fetch()['name']);
      } else {
        return false;
      }
    } catch (Exception $e) {
      return false;
    }
  }
}
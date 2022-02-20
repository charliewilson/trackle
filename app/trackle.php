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
    $this->user = new User($this->db, $this->auth);
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
  private Auth $auth;

  function __construct(PDO $db, Auth $auth) {
    $this->db = $db;
    $this->auth = $auth;
  }

  // Gets the full name from a user's email for use in adding comments etc.
  public function usesDarkMode($id = null): bool {

    if ($id == null) {
      $id = $this->auth->getUserId();
    }

    try {
      $q = $this->db->prepare("
        SELECT `data`
        FROM `users_data`
        WHERE `id` = :id
      ");

       if (
         $q->execute([
          ':id' => filter_var($id,FILTER_SANITIZE_NUMBER_INT)
        ])
       ) {
         $fetch = $q->fetch();
         $data = isset($fetch['data']) ? unserialize($fetch['data']) : [];
         $current = $data['darkMode'] ?? false;

         if (!$current) {
           $current = false;
         } else {
           $current = true;
         }

         return $current;
       } else {
         return false;
       }

    } catch (Exception) {
      return false;
    }
  }

  public function setDarkMode(bool $bool, $id = null): bool {

    if ($id == null) {
      $id = $this->auth->getUserId();
    }

    try {
      $q = $this->db->prepare("
        SELECT `data`
        FROM `users_data`
        WHERE `id` = :id
      ");

      if (
        $q->execute([
          ':id' => filter_var($id,FILTER_SANITIZE_NUMBER_INT)
        ])
      ) {

        $existing = unserialize($q->fetch()['data']);
        $existing["darkMode"] = ($bool) ? 1 : 0;

        $q2 = $this->db->prepare("
          UPDATE `users_data`
          SET `existing` = :serialized
          WHERE `id` = :id
        ");

        if (
          $q2->execute([
            ':serialized' => serialize($existing),
            ':id' => filter_var($id,FILTER_SANITIZE_NUMBER_INT)
          ])
        ){
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }

    } catch (Exception) {
      return false;
    }
  }
}
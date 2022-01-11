<?php

namespace ledge;

require_once("vendor/autoload.php");
require_once("config.php");
//require_once("exceptions.php");
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
  public SpotController $spotController;
  public GroupController $groupController;
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
    $this->auth = new Auth($this->db);
    $this->user = new User($this->db);
    $this->appData = new appData;
    
    $this->pageController = new PageController($this);
    $this->spotController = new SpotController($this);
    $this->groupController = new GroupController($this);
    $this->personController = new PersonController($this);
  }

}

class AppData {

  public string $appName;
  public string $version;

  function __construct() {
    $this->appName = 'ledge.club';
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

  // Confirms that the email exists and password is correct.
  // Returns true if correct, false in any other case.
  public function confirmDetails($email, $pass): bool {
    try {
      $q = $this->db->prepare("
        SELECT `email`, `password`
        FROM `users`
        WHERE `email` = :email
      ");

      $q->execute([
        ':email' => filter_var($email,FILTER_SANITIZE_EMAIL)
      ]);

      $data = $q->fetch();
      return password_verify(filter_var($pass, FILTER_SANITIZE_STRING), $data['password']);

    } catch (Exception $e) {
      return false;
    }

  }
  
  //Get single data key value for user with the supplied ID
  public function getData($userid, $key) {
    $user = $this->db->prepare("
      SELECT `data`
      FROM `users_data`
      WHERE `id` = :id
    ");
    $user->execute([':id' => filter_var($userid, FILTER_SANITIZE_NUMBER_INT)]);
    if ($user) {
      $userdata = $user->fetch();
      $data = unserialize(base64_decode($userdata['data']));
      return (isset($data["setting_".$key])) ? $data["setting_".$key] : false;
    } else {
      return false;
    }
  }

  //Set single data key value for user with the supplied ID
  public function setData($userid, $key, $value) {
    $user = $this->db->prepare("
      SELECT `data`
      FROM `users_data`
      WHERE `id` = :id
    ");
    $user->execute([':id' => filter_var($userid, FILTER_SANITIZE_NUMBER_INT)]);
      if ($user) {
        $userdata = $user->fetch();
        $data = unserialize(base64_decode($userdata['data']));
        $data['setting_'.$key] = $value;
        $finaldata = $this->db->prepare("
          UPDATE `users_data`
          SET `data` = :data
          WHERE `id` = :id
        ");
        $res = $finaldata->execute([
          ':data' => base64_encode(serialize($data)),
          ':id' => filter_var($userid, FILTER_SANITIZE_NUMBER_INT),
        ]);
        return ($res) ? true : false;
      } else {
        return false;
      }
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
<?php
namespace trackle;

use PDO;

class PersonController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  /**
   * @return Person
   */
  public function getMe(): Person {
    $person = $this->app->db->prepare("
      SELECT *
      FROM `users`
      WHERE `id` = :id
    ");

    $person->execute([':id' => $this->app->auth->id()]);

    return $person->fetchObject('\trackle\Person', [
      $this->app->db
    ]);
  }

  /**
   * @param int $personID_raw
   * @return Person
   */
  public function getSingle(int $personID_raw): Person {
    $personID = filter_var($personID_raw, FILTER_SANITIZE_NUMBER_INT);

    $person = $this->app->db->prepare("
      SELECT *
      FROM `users`
      WHERE `id` = :id
    ");

    $person->execute([':id' => $personID]);

    return $person->fetchObject('\trackle\Person', [
      $this->app->db
    ]);
  }

  /**
   * @param string $username_raw
   * @return Person
   */
  public function getByUsername(string $username_raw): Person {
    $username = filter_var($username_raw, FILTER_SANITIZE_STRING);

    $person = $this->app->db->prepare("
      SELECT *
      FROM `users`
      WHERE `username` = :username
    ");

    $person->execute([':username' => $username]);

    return $person->fetchObject('\trackle\Person', [
      $this->app->db
    ]);
  }

  /**
   * @param array $options
   * @return Person[]
   */
  public function getAll(array $options = []): array {

    $defaultOptions = [
      "flipArray" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    //Includes arbitrary status sort order
    $people = $this->app->db->prepare("
      SELECT *
      FROM `users`");

    $people->execute();

    $final = $people->fetchAll(PDO::FETCH_CLASS,'\trackle\Person', [
      $this->app->db
    ]);

    return ($defaultOptions['flipArray']) ? array_reverse($final) : $final;
  }

  /**
   * @param ?string $list
   * @return Person|Person[]|bool
   */
  public function getFromIDList(?string $list): Person|array|bool {
    if (strpos($list, ',')) {
      $peopleObjects = [];
      $ids = explode(',', $list);
      foreach ($ids as $person) {
        $peopleObjects[] = $this->app->personController->getSingle($person);
      }
      return $peopleObjects;
    } elseif ($list) {
      return Array(
        $this->app->personController->getSingle(intval($list))
      );
    } else {
      return false;
    }
  }

}
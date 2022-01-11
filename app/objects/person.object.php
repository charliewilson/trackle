<?php
namespace trackle;
use PDO;

class Person {
  
  private $app;
  
  private $id;
  private $email;
  private $username;
  private $groups;
  private $spots;
  
  /**
   * Person constructor.
   * @param PDO|null $dbInstance
   */
  function __construct(PDO $dbInstance = null) {
    $this->app = new App($dbInstance);
  }
  
  /**
   * @return int
   */
  public function id() {
    return intval($this->id);
  }
  
  /**
   * @return string
   */
  public function email() {
    return $this->email;
  }
  
  /**
   * @return string
   */
  public function username() {
    return $this->username;
  }

  /**
   * @return Spot[]
   */
  public function results() {
    return $this->app->resultController->getFromUser($this->id());
  }

}
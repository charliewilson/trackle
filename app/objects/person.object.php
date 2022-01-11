<?php
namespace ledge;
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
   * @return bool|Group[]
   */
  public function groups() {
    return $this->app->groupController->getFromUser($this->id());
  }
  
  /**
   * @return Spot[]
   */
  public function spots() {
    return $this->app->spotController->getFromUser($this->id());
  }
  
  /**
   * @param Spot $spot
   * @return bool
   */
  public function hasAccessToSpot(Spot $spot) {
    
    $gid = $spot->group()->id();
    $match = false;
    
    foreach ($this->groups() as $group) {
      if ($group->id() == $gid) {
        $match = true;
      }
    }
    
    return $match;
  }
  
  /**
   * @param Group $group
   * @return bool
   */
  public function isInGroup(Group $group) {
    
    $gid = $group->id();
    $match = false;
    
    foreach ($this->groups() as $group) {
      if ($group->id() == $gid) {
        $match = true;
      }
    }
    
    return $match;
  }

}
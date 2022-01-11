<?php
namespace ledge;
use PDO;

class Spot {
  
  private $app;
  
  private $id;
  private $userid;
  private $groupid;
  private $name;
  private $lat;
  private $lon;
  private $description;
  
  function __construct(PDO $dbInstance = null) {
    $this->app = new App($dbInstance);
  }

  public function id() {
    return $this->id;
  }

  public function user() {
    return $this->app->personController->getSingle($this->userid);
  }
  
  public function group() {
    return $this->app->groupController->getSingle($this->groupid);
  }
  
  public function name() {
    return $this->name;
  }
  
  public function lat() {
    return $this->lat;
  }
  
  public function lon() {
    return $this->lon;
  }
  
  public function description() {
    return $this->description;
  }
}
<?php
namespace ledge;
use PDO;

class Group {
  
  private $app;
  
  private $id;
  private $name;
  private $admins;
  private $users;
  
  function __construct(PDO $dbInstance = null) {
    $this->app = new App($dbInstance);
  }

  public function id() {
    return $this->id;
  }
  
  public function name() {
    return $this->name;
  }

  public function slug() {
    return strtolower(str_replace(" ", "_", $this->name()));
  }
  
  public function admins() {
    return $this->app->personController->getFromIDList($this->admins);
  }
  
  public function users() {
    return $this->app->personController->getFromIDList($this->users);
  }

  public function spots() {
    return $this->app->spotController->getFromGroup($this->id());
  }

}
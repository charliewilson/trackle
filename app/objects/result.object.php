<?php
namespace trackle;
use PDO;

class Result {
  
  private $app;
  
  private $id;
  private $user_id;
  private $puzzle_no;
  private $guesses_no;
  private $guess_data;

  function __construct(PDO $dbInstance = null) {
    $this->app = new App($dbInstance);
  }

  public function id(): int {
    return (int)$this->id;
  }

  public function user(): Person {
    return $this->app->personController->getSingle($this->user_id);
  }

  public function puzzleNo(): int {
    return (int)$this->puzzle_no;
  }

  public function guessesNo(): string|int {
    return ($this->guesses_no === "X") ? "X" : (int)$this->guesses_no;
  }

  public function guesses(): bool|string {
    return print_r(unserialize($this->guess_data), TRUE);
  }
}
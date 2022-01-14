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

  public function guesses(): array {
    return unserialize($this->guess_data);
  }

  public function toShare(): string {
    $lines[] = "Wordle ".$this->puzzleNo()." ".$this->guessesNo()."/6";

    foreach($this->guesses() as $guess) {

      $guessProcessed = str_replace('X', '⬛', $guess);

      //Yellow Square - in word; wrong position
      $guessProcessed = str_replace('Y', '🟨', $guessProcessed);

      //Green Square - in word; right position
      $guessProcessed = str_replace('G', '🟩', $guessProcessed);

      $lines[] = $guessProcessed;
    }

    return implode("\n", $lines);
  }
}
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
    return ($this->guesses_no == "") ? "X" : (int)$this->guesses_no;
  }

  public function guesses(): array {
    return unserialize($this->guess_data);
  }

  public function leaderboard(): array {
    $results = $this->app->resultController->getByPuzzleNo($this->puzzleNo());

    usort($results, function($a, $b) {
      $aguess = ($a->guessesNo() == "X") ? 7 : $a->guessesNo();
      $bguess = ($b->guessesNo() == "X") ? 7 : $b->guessesNo();

      if ($aguess == $bguess) {
        return 0;
      }
      return ($aguess > $bguess) ? +1 : -1;
    });

    return $results;
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

  public function render(): string {
    $username = $this->user()->username();
    $puzzle = $this->puzzleNo();
    $guess = $this->guessesNo();
    $lines = $this->guesses();

    $grid = [];
    $gridtemplate = "";

    //Add empty lines post-success so there are always 6 lines
    for ($i = 0; $i < 6; $i++) {
      if (isset($lines[$i])) {
        $grid[$i] = $lines[$i];
      } else {
        $grid[$i] = "WWWWW";
      }
    }

    foreach ($grid as $line) {
      foreach (str_split($line) as $character) {
        $gridtemplate .= "<div class='card-grid-square $character'></div>";
      }
    }

    return <<<TEMPLATE
<a href="/u/$username/$puzzle" class="card-link">
  <div class="card">
    <div class="card-header">
      <p>Puzzle #$puzzle</p>
      <p>$guess/6</p>
    </div>
    <div class="card-grid">
    $gridtemplate
    </div>
  </div>
</a>
TEMPLATE;
  }
}
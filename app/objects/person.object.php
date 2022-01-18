<?php
namespace trackle;
use PDO;

class Person {
  
  private App $app;
  
  private $id;
  private $email;
  private $username;
  
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
  public function id(): int {
    return intval($this->id);
  }
  
  /**
   * @return string
   */
  public function email(): string {
    return $this->email;
  }
  
  /**
   * @return string
   */
  public function username(): string {
    return $this->username;
  }

  /**
   * @return Result[]
   */
  public function results(): array {
    return $this->app->resultController->getFromUser($this->id());
  }

  /**
   * @return array
   */
  public function stats(): array {

    $won = 0;
    $played = 0;
    $sum = 0;

    foreach (array_reverse($this->results()) as $result) {
      $played += 1;
      if ($result->guessesNo() != "X") {
        $won += 1;
        $sum += $result->guessesNo();
      }
    }

    if ($played == 0) {
      $winrate = "n/a";
    } else {
      $winrate = round(($won / $played) * 100);
    }

    if ($won == 0) {
      $average = "0";
    } else {
      $average = number_format(round($sum / $played, 2), 2, '.','');
    }

    return [
      "won" => $won,
      "played" => $played,
      "winrate" => $winrate,
      "total" => $sum,
      "average" => $average
    ];

  }

}
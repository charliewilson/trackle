<?php
namespace trackle;

use DateTime;
use Error;
use JetBrains\PhpStorm\ArrayShape;
use trackle\Exceptions\CantCreateResultException;
use trackle\Exceptions\CantCreateSpotException;
use PDO;
use trackle\Exceptions\InvalidShareTextException;
use trackle\Exceptions\PuzzleAlreadyDoneException;
use trackle\Exceptions\ResultNotFoundException;
use TypeError;

class ResultController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  /**
   * @param int $spotID_raw
   * @return Result
   */
  public function getSingle(int $spotID_raw): Result {
    $spotID = filter_var($spotID_raw, FILTER_SANITIZE_NUMBER_INT);

    $spot = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `id` = :id
    ");

    $spot->execute([':id' => $spotID]);

    return $spot->fetchObject('\trackle\Result', [
      $this->app->db
    ]);
  }

  /**
   * @param int $userID
   * @param array $options
   * @return Result[]
   */
  public function getFromUser(int $userID, array $options = []): array {

    $defaultOptions = [
      "newestFirst" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    if ($defaultOptions["newestFirst"]) {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `user_id` = :userid
      ORDER BY `puzzle_no` DESC");
    } else {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `user_id` = :userid
      ORDER BY `puzzle_no`");
    }

    $projects->execute([
      ':userid' => filter_var($userID, FILTER_SANITIZE_NUMBER_INT)
    ]);

    return $projects->fetchAll(PDO::FETCH_CLASS,'\trackle\Result', [
      $this->app->db
    ]);
  }

  /**
   * @param int $puzzleNo
   * @param array $options
   * @return Result[]
   */
  public function getByPuzzleNo(int $puzzleNo, array $options = []): array {

    $defaultOptions = [
      "bestFirst" => false
    ];

    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    if ($defaultOptions["bestFirst"]) {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `puzzle_no` = :puzzleno
      ORDER BY `guesses_no`");
    } else {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `puzzle_no` = :puzzleno
      ORDER BY `id`");
    }

    $projects->execute([
      ':puzzleno' => filter_var($puzzleNo, FILTER_SANITIZE_NUMBER_INT)
    ]);

    return $projects->fetchAll(PDO::FETCH_CLASS,'\trackle\Result', [
      $this->app->db
    ]);
  }

  /**
   * @param int $userID
   * @param int $puzzleNo
   * @param array $options
   * @return Result
   * @throws ResultNotFoundException
   */
  public function getSingleFromUser(int $userID, int $puzzleNo, array $options = []): Result {

    $defaultOptions = [
      "newestFirst" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    if ($defaultOptions["newestFirst"]) {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `user_id` = :userid
      AND `puzzle_no` = :puzzleno
      ORDER BY `puzzle_no` DESC");
    } else {
      $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `user_id` = :userid
      AND `puzzle_no` = :puzzleno
      ORDER BY `puzzle_no`");
    }

    $projects->execute([
      ':userid' => filter_var($userID, FILTER_SANITIZE_NUMBER_INT),
      ':puzzleno' => filter_var($puzzleNo, FILTER_SANITIZE_NUMBER_INT)
    ]);

    $return = $projects->fetchObject('\trackle\Result', [
      $this->app->db
    ]);

    if (!$return) {
      throw new ResultNotFoundException("Result not found!");
    } else {
      return $return;
    }

  }

  /**
   * @param int $userID
   * @param int $puzzleNo
   * @return Bool
   */
  public function userHasDonePuzzle(int $userID, int $puzzleNo): bool {

    $projects = $this->app->db->prepare("
    SELECT *
    FROM `results`
    WHERE `user_id` = :userid
    AND `puzzle_no` = :puzzleno");


    $projects->execute([
      ':userid' => filter_var($userID, FILTER_SANITIZE_NUMBER_INT),
      ':puzzleno' => filter_var($puzzleNo, FILTER_SANITIZE_NUMBER_INT)
    ]);

    return $projects->rowCount() != 0;
  }

  /**
   * @param int $puzzle_no The puzzle's number e.g. 205
   * @param string $guesses_no The number of attempts until guessed (1-6 or X if it wasn't guessed)
   * @param array $guess_data The array of guess lines - (X - not present, Y - wrong place, G - right place)
   * @param Person|null $user The user to create it under - if not supplied, create under the logged in user
   * @return string|bool
   * @throws CantCreateResultException
   * @throws PuzzleAlreadyDoneException
   * @throws InvalidShareTextException
   */
  public function create(int $puzzle_no, string $guesses_no, array $guess_data, Person $user = null): string|bool {

    if (!$user) {
      $user = $this->app->personController->getMe();
    }

    $cleandata = [
      "puzzle_no" => filter_var($puzzle_no, FILTER_SANITIZE_NUMBER_INT),
      "guesses_no" => filter_var($guesses_no, FILTER_SANITIZE_STRING)
    ];

    if ($this->app->resultController->userHasDonePuzzle($user->id(), $cleandata['puzzle_no'])) {
      throw new PuzzleAlreadyDoneException();
    } else {

        //Includes arbitrary status sort order
        $spot = $this->app->db->prepare("
      INSERT INTO `results`
       (`id`,
       `user_id`,
       `puzzle_no`,
       `guesses_no`,
       `guess_data`)
      VALUES
        (NULL,
        :user,
        :puzzle_no,
        :guesses_no,
        :guess_data)");

        if ($spot->execute([
          ':user' => $user->id(),
          ':puzzle_no' => $cleandata['puzzle_no'],
          ':guesses_no' => $cleandata['guesses_no'],
          ':guess_data' => serialize($guess_data)
        ])) {
          return $this->app->db->lastInsertId();
        } else {
          throw new CantCreateResultException("Unable to create spot " . $cleandata['name']);
        }
    }
  }

  /**
   * @param int $puzzle_no The puzzle's number e.g. 205
   * @param Person $user The user to create it under - if not supplied, create under the logged in user
   * @return bool
   */
  public function delete(int $puzzle_no, Person $user): bool {

    $puzzleno = filter_var($puzzle_no, FILTER_SANITIZE_NUMBER_INT);

      //Includes arbitrary status sort order
      $query = $this->app->db->prepare("
      DELETE FROM `results`
      WHERE `user_id` = :user
      AND `puzzle_no` = :puzzleno");

      return $query->execute([
        ':user' => $user->id(),
        ':puzzleno' => $puzzleno
      ]);
  }

  /**
   * @param Person $user The user to delete all results from
   * @return bool
   */
  public function deleteAllFromUser(Person $user): bool {

    //Includes arbitrary status sort order
    $query = $this->app->db->prepare("
      DELETE FROM `results`
      WHERE `user_id` = :user");

    return $query->execute([
      ':user' => $user->id()
    ]);
  }

  public static function sanitiseShare($sharestring): string {
    return preg_filter("/[^Wordle0-9\/ \x{1F7E9}\x{2B1B}\x{2B1C}\x{1F7E8}\n]+/u", "", $sharestring);
  }

  /**
   * @throws InvalidShareTextException
   */
  #[ArrayShape([
    "puzzle_no" => "string",
    "guesses_no" => "string",
    "lines" => "array"])]
  public static function parseFromShare($shareString): array {

    try {
      $cleanShareString = ResultController::sanitiseShare($shareString);

      //Split the share text into lines of an array and remove blank ones
      $pieces = array_filter(preg_split("/\r\n|\n|\r/", $cleanShareString));

      //Splits the first line into array pieces
      $info = explode(' ', $pieces[0]);

      //Remove the first line from the $pieces array, leaving only the guess lines, and reinitialise the array keys
      unset($pieces[0]);
      $pieces = array_values($pieces);

      $lines = [];
      foreach ($pieces as $line) {

        //if it doesn't contain emojis, ignore the line.
        if (
          str_contains($line, '⬛') ||
          str_contains($line, '⬜') ||
          str_contains($line, '🟨') ||
          str_contains($line, '🟩')
        ) {
          //Black/White Square - not in word
          $lineProcessed = str_replace('⬛', 'X', $line);
          $lineProcessed = str_replace('⬜', 'X', $lineProcessed);

          //Yellow Square - in word; wrong position
          $lineProcessed = str_replace('🟨', 'Y', $lineProcessed);

          //Green Square - in word; right position
          $lineProcessed = str_replace('🟩', 'G', $lineProcessed);

          $lines[] = $lineProcessed;
        }
      }

      return [
        "puzzle_no" => $info[1],
        "guesses_no" => explode('/', $info[2])[0],
        "lines" => $lines
      ];
    } catch (TypeError) {
      throw new InvalidShareTextException();
    }

  }
}
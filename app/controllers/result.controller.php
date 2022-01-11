<?php
namespace trackle;

use DateTime;
use JetBrains\PhpStorm\ArrayShape;
use trackle\Exceptions\CantCreateSpotException;
use PDO;

class ResultController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  /**
   * @param int $spotID_raw
   * @return Result
   */
  public function getSingle(int $spotID_raw): Spot {
    $spotID = filter_var($spotID_raw, FILTER_SANITIZE_NUMBER_INT);

    $spot = $this->app->db->prepare("
      SELECT *
      FROM `spots`
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
  public function getFromUser(int $userID): array {

//    $defaultOptions = [
//      "includeDeleted" => false,
//      "flipArray" => false
//    ];
//    foreach($options as $option=>$value) {
//      if (isset($defaultOptions[$option])) {
//        $defaultOptions[$option] = $value;
//      }
//    }

    //Includes arbitrary status sort order
    $projects = $this->app->db->prepare("
      SELECT *
      FROM `results`
      WHERE `user_id` = :userid");

    $projects->execute([
      ':userid' => filter_var($userID, FILTER_SANITIZE_NUMBER_INT)
    ]);

    return $projects->fetchAll(PDO::FETCH_CLASS,'\trackle\Result', [
      $this->app->db
    ]);
  }
  
  /**
   * @param string $name
   * @param string $lat
   * @param string $lon
   * @param string $description
   * @param Group $group
   * @param Person|null $user
   * @return string|bool
   * @throws CantCreateSpotException
   */
  public function create(string $name, string $lat, string $lon, string $description, Group $group, Person $user = null): string|bool {

    if (!$user) {
      $user = $this->app->personController->getMe();
    }

    $cleandata = [
      "name" => filter_var($name, FILTER_SANITIZE_STRING),
      "lat" => filter_var($lat, FILTER_SANITIZE_STRING),
      "lon" => filter_var($lon, FILTER_SANITIZE_STRING),
      "description" => filter_var($description, FILTER_SANITIZE_STRING)
    ];
    
    $timestamp = (new DateTime())
      ->format('Y-m-d G:i:s');

    //Includes arbitrary status sort order
    $spot = $this->app->db->prepare("
      INSERT INTO `spots`
       (`id`,
       `userid`,
       `groupid`,
       `name`,
       `lat`,
       `lon`,
       `description`,
       `tags`,
       `created`,
       `updated`,
       `privacy`,
       `deleted`)
      VALUES
        (NULL,
        :user,
        :group,
        :name,
        :lat,
        :lon,
        :desc,
        NULL,
        :time,
        :time,
        '0',
        '0')");

    
    if ($spot->execute([
      ':user' => $user->id(),
      ':group' => $group->id(),
      ':name' => $cleandata['name'],
      ':lat' => $cleandata['lat'],
      ':lon' => $cleandata['lon'],
      ':desc' => $cleandata['description'],
      ':time' => $timestamp
    ])) {
      return $this->app->db->lastInsertId();
    } else {
      throw new CantCreateSpotException("Unable to create spot ".$cleandata['name']);
    }
  }

  #[ArrayShape(["puzzle_no" => "string", "guesses_no" => "string", "lines" => "array"])]
  public static function parseFromShare($shareString): array {

    $pieces = array_filter(preg_split("/\r\n|\n|\r/", $shareString));

    $info = explode(' ', $pieces[0]);
    unset($pieces[0]);
    $pieces = array_values($pieces);

    $lines = [];

    foreach($pieces as $line) {

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

  }
}
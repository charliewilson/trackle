<?php
namespace ledge;

use DateTime;
use ledge\Exceptions\CantCreateSpotException;
use PDO;

class SpotController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  /**
   * @param int $spotID_raw
   * @return Spot
   */
  public function getSingle(int $spotID_raw): Spot {
    $spotID = filter_var($spotID_raw, FILTER_SANITIZE_NUMBER_INT);

    $spot = $this->app->db->prepare("
      SELECT *
      FROM `spots`
      WHERE `id` = :id
    ");

    $spot->execute([':id' => $spotID]);

    return $spot->fetchObject('\ledge\Spot', [
      $this->app->db
    ]);
  }

  /**
   * @param array $options
   * @return Spot[]
   */
  public function getAll(array $options = []): array {

    $defaultOptions = [
      "includeDeleted" => false,
      "flipArray" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    //Includes arbitrary status sort order
    $projects = $this->app->db->prepare("
      SELECT *
      FROM `spots`
      WHERE `deleted` = :deleted");

    $projects->execute([
      ':deleted' => ($defaultOptions['includeDeleted']) ? '1' : '0'
    ]);

    $final = $projects->fetchAll(PDO::FETCH_CLASS,'\ledge\Spot', [
      $this->app->db
    ]);

    return ($defaultOptions['flipArray']) ? array_reverse($final) : $final;
  }

  /**
   * @param int $groupID
   * @param array $options
   * @return Spot[]
   */
  public function getFromGroup(int $groupID, array $options = []): array {

    $defaultOptions = [
      "includeDeleted" => false,
      "flipArray" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    //Includes arbitrary status sort order
    $projects = $this->app->db->prepare("
      SELECT *
      FROM `spots`
      WHERE `groupid` = :groupid
      AND `deleted` = :deleted");

    $projects->execute([
      ':groupid' => filter_var($groupID, FILTER_SANITIZE_NUMBER_INT),
      ':deleted' => ($defaultOptions['includeDeleted']) ? '1' : '0'
    ]);

    $final = $projects->fetchAll(PDO::FETCH_CLASS,'\ledge\Spot', [
      $this->app->db
    ]);

    return ($defaultOptions['flipArray']) ? array_reverse($final) : $final;
  }

  /**
   * @param int $userID
   * @param array $options
   * @return Spot[]
   */
  public function getFromUser(int $userID, array $options = []): array {

    $defaultOptions = [
      "includeDeleted" => false,
      "flipArray" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    //Includes arbitrary status sort order
    $projects = $this->app->db->prepare("
      SELECT *
      FROM `spots`
      WHERE `userid` = :userid
      AND `deleted` = :deleted");

    $projects->execute([
      ':userid' => filter_var($userID, FILTER_SANITIZE_NUMBER_INT),
      ':deleted' => ($defaultOptions['includeDeleted']) ? '1' : '0'
    ]);

    $final = $projects->fetchAll(PDO::FETCH_CLASS,'\ledge\Spot', [
      $this->app->db
    ]);

    return ($defaultOptions['flipArray']) ? array_reverse($final) : $final;
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
}
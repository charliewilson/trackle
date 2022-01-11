<?php
namespace ledge;

use PDO;

class GroupController {
  
  private App $app;
  
  function __construct(App $app) {
    $this->app = $app;
  }

  /**
   * @param int $groupID_raw
   * @return Group
   */
  public function getSingle(int $groupID_raw): Group {
    $groupID = filter_var($groupID_raw, FILTER_SANITIZE_NUMBER_INT);

    $group = $this->app->db->prepare("
      SELECT *
      FROM `groups`
      WHERE `id` = :id
    ");

    $group->execute([':id' => $groupID]);

    return $group->fetchObject('\ledge\Group', [
      $this->app->db
    ]);
  }

  /**
   * @param string $groupname_raw
   * @return Group|bool
   *
   * TODO: see if this is necessary? Linter reporting it's an unused element.
   */
  public function getByName(string $groupname_raw): Group|bool {
    $groupname = filter_var($groupname_raw, FILTER_SANITIZE_STRING);

    $group = $this->app->db->prepare("
      SELECT *
      FROM `groups`
      WHERE `name` = :name
    ");

    $group->execute([':name' => $groupname]);

    if ($group->rowCount() == 1) {
      return $group->fetchObject('\ledge\Group', [
        $this->app->db
      ]);
    } else {
      return false;
    }
  }

  /**
   * @param string $slug_raw
   * @return Group
   */
  public function getBySlug(string $slug_raw): Group {
    $slug = filter_var($slug_raw, FILTER_SANITIZE_STRING);

    $person = $this->app->db->prepare("
      SELECT *
      FROM `groups`
      WHERE `slug` = :slug
    ");

    $person->execute([':slug' => $slug]);

    return $person->fetchObject('\ledge\Group', [
      $this->app->db
    ]);
  }

  /**
   * @param array $options
   * @return Group[]
   */
  public function getAll(array $options = []): array {

    $defaultOptions = [
      "flipArray" => false
    ];
    foreach($options as $option=>$value) {
      if (isset($defaultOptions[$option])) {
        $defaultOptions[$option] = $value;
      }
    }

    //Includes arbitrary status sort order
    $groups = $this->app->db->prepare("
      SELECT *
      FROM `groups`");

    $groups->execute();

    $final = $groups->fetchAll(PDO::FETCH_CLASS,'\ledge\Group', [
      $this->app->db
    ]);

    return ($defaultOptions['flipArray']) ? array_reverse($final) : $final;
  }


  /**
   * @param int $userid
   * @return Group[]|bool
   */
  public function getFromUser(int $userid): array|bool {

    $cleanid = filter_var($userid, FILTER_SANITIZE_NUMBER_INT);

    $groups = $this->app->db->prepare("
      SELECT *
      FROM `groups`
      WHERE find_in_set(:user, cast(`users` as char)) > 0
    ");

    $groups->execute([':user' => $cleanid]);

    if ($groups->rowCount() > 0) {
      return $groups->fetchAll(PDO::FETCH_CLASS,'\ledge\Group', [
        $this->app->db
      ]);
    } else {
      return false;
    }

  }
}
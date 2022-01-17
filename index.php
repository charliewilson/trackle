<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

date_default_timezone_set('Europe/London');

require "vendor/autoload.php";
require "app/exceptions.php";
require "app/trackle.php";
require "app/controllers/controllers.php";
require "app/objects/objects.php";

use trackle\App;

$app = new App;

try {

  $app->router->addRoutes([
    //Homepage
    ['GET', '/', 'indexGet'],
    //Login
    ['GET', '/login', 'loginGet'],
    ['GET', '/register', 'registerGet'],
    ['GET', '/logout', 'logoutGet'],
    ['POST', '/login', 'loginPost'],
    ['POST', '/register', 'registerPost'],
    //Homepage and feed
    // ['GET', '/home', 'homeGet'],
    //Spots
    ['GET', '/r/[i:id]', 'resultGet'],
    ['GET', '/r/add', 'resultAddGet'],
    ['POST', '/r/add', 'resultAddPost'],
    //Users
    ['GET', '/u/[a:name]', 'personGet'],
    ['GET', '/u/[a:name]/[i:puzzleno]', 'resultGet'],
    ['GET', '/u/[a:name]/[i:puzzleno]/delete', 'resultDeleteGet'],
    //Settings
    ['GET', '/settings', 'settingsGet'],
    ['POST', '/settings/email', 'changeEmailPost'],
    ['POST', '/settings/password', 'changePasswordPost'],
     ['GET', '/settings/delete', 'deleteAccountGet'],
     ['POST', '/settings/delete', 'deleteAccountPost'],
  ]);
  
} catch (Exception $e) {
  $app->pageController->errorMessage($e->getMessage());
}

// match current request url
$match = $app->router->match();

// call the mapped pageController method or throw a 404
if (is_array($match)) {
  call_user_func([$app->pageController, $match['target']], $match['params']);
} else {
  $app->pageController->pageNotFound();
}
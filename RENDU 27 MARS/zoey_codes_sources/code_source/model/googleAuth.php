<?php

// this page handles calls from "connect with google" buttons, and send the given infos to the appropriate script (subscribe / connect)

function isEmailOk($str)
{
  return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? false : true;
}

// know if email is already used
function testMail($adresse_mail)
{
  if (isEmailOk($adresse_mail)) {
    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "SELECT idutilisateur FROM `utilisateur` WHERE adresse_mail = :adresse_mail";
    $req = $db->prepare($sql);

    $req->execute(array(
      ':adresse_mail' => $adresse_mail
    ));

    if ($req->rowCount() <= 0) {
      // unknown mail
      return "unknown mail";
    } else {
      // already registered
      return "known mail";
    }
  } else {
    return "invalid mail";
  }
}

// call postSubscribe with given infos
function subscribe($payload)
{
  $postContent = array(
    'mail' => $payload["email"],
  );

  if (isset($payload["given_name"])) {
    $postContent['pseudo'] = $payload["given_name"];
  } else if (isset($payload["name"])) {
    $postContent['pseudo'] = $payload["name"];
  } else {
    return false;
  }

  if (isset($payload["picture"])) {
    $pathToImage = '../public/images/upload/';
    $imgName = 'gdl-' . time() . '.jpg';
    // Save image
    $ch = curl_init($payload["picture"]);
    $fp = fopen($pathToImage . $imgName, 'wb');
    try {
      curl_setopt($ch, CURLOPT_FILE, $fp);
      curl_setopt($ch, CURLOPT_HEADER, 0);
      $response = curl_exec($ch);

      if (curl_errno($ch)) {
        echo curl_error($ch);
        return false;
      }

      $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
      if ($http_code == intval(200)) {
        $postContent['media'] = $imgName;
      } else {
        echo "Ressource introuvable 2 : " . $http_code;
        return false;
      }

      curl_close($ch);
    } catch (\Throwable $th) {
      throw $th;
    } finally {
      curl_close($ch);
      fclose($fp);
    }
  }

  if (isset($payload["sub"])) {
    $postContent['google_sub'] = $payload["sub"];
  } else {
    return false;
  }

  $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . dirname($_SERVER["REQUEST_URI"]) . "/postSubscribe.php";
  $ch = curl_init();
  try {
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postContent);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 1);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
      echo curl_error($ch);
      return false;
    }

    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if ($http_code == intval(200)) {
      return $response;
    } else {
      echo "Ressource introuvable 1 : " . $url . ' - ' . $http_code;
      return false;
    }
  } catch (\Throwable $th) {
    throw $th;
  } finally {
    curl_close($ch);
  }
}

// JWT decoding

$id_token = json_decode(file_get_contents('php://input'), true);

require_once '../vendor/autoload.php';

$CLIENT_ID = "866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com";

$client = new Google_Client(['client_id' => $CLIENT_ID]);  // Specify the CLIENT_ID of the app that accesses the backend
$payload = $client->verifyIdToken($id_token);

if (!$payload) {
  // Invalid ID token
  echo json_encode(false);
  return false;
}

// send connection infos back to client side
function connect($payload)
{
  $postContent = array(
    'mail' => $payload["email"],
  );

  if (isset($payload["sub"])) {
    $postContent['google_sub'] = $payload["sub"];
    echo json_encode(["connect", $postContent]);
  } else {
    echo json_encode("invalid");
    return false;
  }
}

// MAIN TEST :

switch (testMail($payload["email"])) {
  case false:
    // invalid mail
    echo json_encode("invalid");
    break;
  case "unknown mail":
    // subscribe
    $subscribe = subscribe($payload);
    if ($subscribe = "valid") {
      connect($payload);
    } else {
      echo json_encode([false]);
    }
    break;
  case "known mail":
    // already registered
    connect($payload);
    break;

  default:
    echo json_encode("invalid");
    break;
}

<?php
// header("Access-Control-Allow-Origin: *");

function isEmailOk($str)
{
  return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? false : true;
}

function testMail($adresse_mail)
{
  if (isEmailOk($adresse_mail)) {
    require("PDO.php");
    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

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
    $imgName = 'gdl-' . time() . '.jpg'; // how to know if image is jpg or png ?
    // Enregistrer l'image
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
        echo "Ressource introuvable : " . $http_code;
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
    // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
      echo curl_error($ch);
      return false;
    }

    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if ($http_code == intval(200)) {
      return $response;
    } else {
      echo "Ressource introuvable : " . $http_code;
      return false;
    }
  } catch (\Throwable $th) {
    throw $th;
  } finally {
    curl_close($ch);
  }
}

// function connect($payload)
// {
//   $postContent = array(
//     'mail' => $payload["email"],
//   );

//   if (isset($payload["sub"])) {
//     $postContent['google_sub'] = $payload["sub"];
//   } else {
//     return false;
//   }

//   $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . dirname($_SERVER["REQUEST_URI"]) . "/postConnect.php";
//   $ch = curl_init();
//   try {
//     curl_setopt($ch, CURLOPT_URL, $url);
//     curl_setopt($ch, CURLOPT_POST, true);
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $postContent);
//     curl_setopt($ch, CURLOPT_HEADER, false);
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//     curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
//     curl_setopt($ch, CURLOPT_TIMEOUT, 5);
//     curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
//     curl_setopt($ch, CURLOPT_MAXREDIRS, 1);
//     // curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

//     $response = curl_exec($ch);

//     if (curl_errno($ch)) {
//       echo curl_error($ch);
//       // die();
//       return false;
//     }

//     $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
//     if ($http_code == intval(200)) {
//       return $response;
//     } else {
//       echo "Ressource introuvable : " . $http_code;
//       return false;
//     }
//   } catch (\Throwable $th) {
//     throw $th;
//   } finally {
//     curl_close($ch);
//   }
// }


// JWT decoding

$id_token = json_decode(file_get_contents('php://input'), true);
// $id_token = "eyJhbGciOiJSUzI1NiIsImtpZCI6ImY0YmIyMjBjZDA5NGIwYWU5MGRkNzNlMTBjMTBlN2RiNTRiODkyODAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJuYmYiOjE2NDQ5MzQ1MzgsImF1ZCI6Ijg2NjIxNDc2ODU4My0xM2plb2toMTBpYW05cTFjaG1laXBoZ29rM2dia3IxaS5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjEwNTc5MDU3NTYxNDEyMDcxNDc2NCIsImVtYWlsIjoibWFyaW4uYm91YW5jaGF1ZEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiODY2MjE0NzY4NTgzLTEzamVva2gxMGlhbTlxMWNobWVpcGhnb2szZ2JrcjFpLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwibmFtZSI6Ik1hcmluIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdpdzJwaU4xUUhEdW1TaHdrN05ER2NJd2VPN3V1RC1IMWpWcjNEcHZnPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6Ik1hcmluIiwiaWF0IjoxNjQ0OTM0ODM4LCJleHAiOjE2NDQ5Mzg0MzgsImp0aSI6ImQzNjUxMmY3YzQyZmQ5MTE5YjRiMDU1MzMyMjA3NmJkMzRiZmZhNGUifQ.ZMxk3fWkHFCVqyImTZxaoJND2GvCsIg9M3dsYbpTQFBGoqwa4yTXwBvVWLqKyKxdVWVB9tjSBjTfXyl_BZyrKyN9_c9FwLHHKo1TCdDdQrh74rHqWtOCaKWMeGkzoPFZOzKoXkO_UI9CxkV4Q9mxtp8IFI__qyDosGC6UHufJuZUrgaCNpIBbnE3M4cYBiEFxRXzIWUQJOxusVGEZm19SutIwyqMcmaROvDbhgdBaAGrt9CXVBduABa1R8H8bOWdXnEmOD9zau7_mKQo0rXbl6kUXd2fu5TPHbw1RcAySGfu37eAggmEdIppGXKSH3x-NOT0ABOgpSaktBoS4wipyQ";

require_once '../vendor/autoload.php';

// Get $id_token via HTTPS POST.

$CLIENT_ID = "866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com";

$client = new Google_Client(['client_id' => $CLIENT_ID]);  // Specify the CLIENT_ID of the app that accesses the backend
$payload = $client->verifyIdToken($id_token);

if (!$payload) {
  // Invalid ID token
  echo json_encode(false);
  return false;
}

// If valid token :
// $userid = $payload['email'];
// echo json_encode($payload);

switch (testMail($payload["email"])) {
  case false:
    // invalid mail
    echo json_encode("invalid");
    break;
  case "unknown mail":
    // subscribe
    // echo json_encode("subscribe");
    // echo json_encode($payload["sub"]);
    $subscribe = subscribe($payload);
    echo json_encode([$subscribe]);
    break;
  case "known mail":
    // already registered
    $postContent = array(
      'mail' => $payload["email"],
    );

    if (isset($payload["sub"])) {
      $postContent['google_sub'] = $payload["sub"];
    } else {
      echo json_encode("invalid");
      return false;
    }
    echo json_encode(["connect", $postContent]);
    break;

  default:
    echo json_encode("invalid");
    break;
}

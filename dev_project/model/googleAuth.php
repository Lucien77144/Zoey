<?php
header("Access-Control-Allow-Origin: *");
$id_token = json_decode(file_get_contents('php://input'), true);

require_once '../vendor/autoload.php';

// Get $id_token via HTTPS POST.

$CLIENT_ID = "866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com";

$client = new Google_Client(['client_id' => $CLIENT_ID]);  // Specify the CLIENT_ID of the app that accesses the backend
$payload = $client->verifyIdToken($id_token);

if ($payload) {
  // $userid = $payload['email'];
  echo json_encode($payload);
} else {
  // Invalid ID token
  return false;
}

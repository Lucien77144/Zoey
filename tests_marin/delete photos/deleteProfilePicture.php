<?php
require("PDO.php");
$db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

// get and delete image
$sql = "SELECT url_photo FROM utilisateur where idutilisateur = :idanimal";
$req = $db->prepare($sql);

$req->execute(array(
    ':idanimal' => 80
));

$photo = $req->fetch();
$deletePhoto = $photo["url_photo"];
require('deletePhoto.php');

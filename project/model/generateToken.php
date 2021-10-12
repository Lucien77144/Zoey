<?php

$randomToken = bin2hex(random_bytes(35));
$creationDate = time();
$token = $randomToken . "-" . $_SESSION['idUser'] . "-" . $creationDate;
$_SESSION['token'] = $token;

// set_cookie() -> checkbox rester connecté

// sql send token

function sendToken(){
        
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = 'UPDATE utilisateur SET token = :token WHERE idutilisateur = :id;';
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':token' => $_SESSION['token'],
        ':id' => $_SESSION['idUser']));    
}

try {
    sendToken();
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
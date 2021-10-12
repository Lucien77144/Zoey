<?php

$_SESSION['token']

// sql send token

function verifyToken(){
        
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = 'SELECT token FROM `utilisateur` WHERE idutilisateur = 54;';
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':token' => $_SESSION['token'],
        ':id' => $_SESSION['idUser']));    
}

try {
    verifyToken();
} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
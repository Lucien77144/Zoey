<?php
session_start();

require("model.php");
require("verifyToken.php");

function postDeleteRefuge(){
    $idrefuge = safeEntry($_POST['idrefuge']);

    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "DELETE FROM `refuge` WHERE `refuge`.`idrefuge` = :idrefuge";
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':idrefuge' => $idrefuge
    ));

    if (!$req)
        throw new Exception("Le refuge n'a pas pu être supprimé");

    return "valid";
}

try {
    if (verifyToken()
    && $_SESSION['statut'] == 1
    &&isset($_POST['idrefuge'])
    ){
        $postDeleteRefuge = postDeleteRefuge();
        echo $postDeleteRefuge;
    } else {
        throw new Exception("Le refuge n'a pas pu être supprimé");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    echo $errorMsg;
}
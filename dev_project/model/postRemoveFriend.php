<?php
session_start();

require("model.php");
require_once("isFriend.php");

function postRemoveFriend(){
    $removeFriendId = safeEntry($_POST['removeFriendId']);
    $idUser = $_SESSION['idUser'];

    if (!isFriend($removeFriendId))
        // throw new Exception("Votre demande a déjà été envoyée");
        return false;
    
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "DELETE FROM liste_amis WHERE (id_demandeur = :idUser AND id_receveur = :removeFriendId) OR (id_receveur = :idUser AND id_demandeur = :removeFriendId) ";
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':removeFriendId' => $removeFriendId,
        ':idUser' => $idUser));

    if (!$req)
        // throw new Exception("La demande d'ami n'a pas pu être envoyée");
        return false;

    return true;
}

try {
    if (isset($_POST['removeFriendId'])
    &&isset($_SESSION['idUser']))
    {
        $postRemoveFriend = postRemoveFriend();
        echo $postRemoveFriend;
    } else {        
        // throw new Exception("La demande d'ami n'a pas pu être envoyée");
        return false;
    }

} catch (Exception $e) {
    // echo "catch";
    $errorMsg = $e->getMessage();
    // echo $errorMsg;
    return false;
    // require(BASE_URL . "view/errorView.php");
}
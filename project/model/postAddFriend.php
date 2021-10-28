<?php
session_start();

require("model.php");
require_once("isFriend.php");

function postAddFriend(){
    $addFriendId = safeEntry($_POST['addFriendId']);
    $idUser = $_SESSION['idUser'];

    if (isFriend($addFriendId))
        // throw new Exception("Votre demande a déjà été envoyée");
        return false;
    
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO liste_amis (id_demandeur, id_receveur) VALUES (:idUser, :addFriendId)";
    $req = $db -> prepare($sql);
    
    $req -> execute(array(
        ':addFriendId' => $addFriendId,
        ':idUser' => $idUser));

    if (!$req)
        // throw new Exception("La demande d'ami n'a pas pu être envoyée");
        return false;

    return true;
}

try {
    if (isset($_POST['addFriendId'])
    &&isset($_SESSION['idUser']))
    {
        $postAddFriend = postAddFriend();
        echo $postAddFriend;
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
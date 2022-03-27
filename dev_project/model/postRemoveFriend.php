<?php
session_start();

// remove a friendship relation between two users

require("model.php");

function postRemoveFriend()
{
    $removeFriendId = safeEntry($_POST['removeFriendId']);
    $idUser = $_SESSION['idUser'];

    if (!isFriend($removeFriendId))
        return false;

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "DELETE FROM liste_amis WHERE (id_demandeur = :idUser AND id_receveur = :removeFriendId) OR (id_receveur = :idUser AND id_demandeur = :removeFriendId) ";
    $req = $db->prepare($sql);

    $req->execute(array(
        ':removeFriendId' => $removeFriendId,
        ':idUser' => $idUser
    ));

    if (!$req)
        return false;

    return true;
}

try {
    if (
        isset($_POST['removeFriendId'])
        && isset($_SESSION['idUser'])
    ) {
        $postRemoveFriend = postRemoveFriend();
        echo $postRemoveFriend;
    } else {
        return false;
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
    return false;
}

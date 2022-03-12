<?php

session_start();

require("model.php");

function postAcceptFriend()
{
    $acceptFriendId = safeEntry($_POST['acceptFriendId']);
    $idUser = $_SESSION['idUser'];

    if (isFriend($acceptFriendId) != 12) { // l'utilisateur est bien receveur de la demande
        return false;
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $sql = "UPDATE `liste_amis` SET `statut` = '2' WHERE `liste_amis`.`id_receveur` = :idUser AND `liste_amis`.`id_demandeur` = :acceptFriendId";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':idUser' => $idUser,
        ':acceptFriendId' => $acceptFriendId
    ));

    if (!$valid) {
        // throw new Exception("La demande d'ami n'a pas pu être envoyée");
        return false;
    } else {
        return true;
    }
}

try {
    if (
        isset($_POST['acceptFriendId'])
        && isset($_SESSION['idUser'])
    ) {
        $postAcceptFriend = postAcceptFriend();
        echo $postAcceptFriend;
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

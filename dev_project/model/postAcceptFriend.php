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
        return false;
    } else {
        // vérifier s'il existe déjà une conversation entre l'utilisateur et l'ami
        $sql = "SELECT utilisateur_idutilisateur
                FROM conversation_has_utilisateur
                WHERE conversation_has_utilisateur.conversation_idconversation IN (SELECT conversation_has_utilisateur.conversation_idconversation
                        FROM ( 
                            SELECT conversation_idconversation idConv
                            FROM `conversation_has_utilisateur` 
                            WHERE utilisateur_idutilisateur = :idUser
                        ) userConv
                        INNER JOIN conversation_has_utilisateur ON conversation_has_utilisateur.conversation_idconversation = userConv.idConv
                        WHERE conversation_has_utilisateur.utilisateur_idutilisateur != :idUser AND conversation_has_utilisateur.utilisateur_idutilisateur = :addFriendId)
                AND conversation_has_utilisateur.utilisateur_idutilisateur != :idUser";
        $req = $db->prepare($sql);
        $req->execute(array(
            ':addFriendId' => $idUser,
            ':idUser' => $acceptFriendId
        ));

        $alreadyHasAConversation = $req->fetchAll();

        if ($alreadyHasAConversation) { // il existe déjà une conversation avec cet ami, mettre fin à la fonction postAddFriend()
            return true;
        } else { // il n'existe pas encore de conversation avec cet ami, créer cette conversation
            $sql = "INSERT INTO `conversation` (`idconversation`) VALUES (NULL)";
            $req = $db->prepare($sql);
            $req->execute();
            $createdId = $db->lastInsertId();

            $sql = "INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`) VALUES (:idConv, :idUser), (:idConv, :addFriendId);";
            $req = $db->prepare($sql);
            $req->execute(array(
                ':idConv' => $createdId,
                ':addFriendId' => $idUser,
                ':idUser' => $acceptFriendId
            ));
        }
    }
    return true;
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

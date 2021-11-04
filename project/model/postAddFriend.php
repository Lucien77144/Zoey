<?php
session_start();

require("model.php");
require_once("isFriend.php");

function postAddFriend(){
    $addFriendId = safeEntry($_POST['addFriendId']);
    $idUser = $_SESSION['idUser'];

    if (isFriend($addFriendId)){
        // throw new Exception("Votre demande a déjà été envoyée");
        return false;
    }
    
    require("PDO.php");

    $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
    (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO liste_amis (id_demandeur, id_receveur) VALUES (:idUser, :addFriendId)";
    $req = $db -> prepare($sql);
    
    $valid = $req -> execute(array(
        ':addFriendId' => $addFriendId,
        ':idUser' => $idUser));

    if (!$valid){
        // throw new Exception("La demande d'ami n'a pas pu être envoyée");
        return false;
    } else { // Si l'ajout d'un nouvel ami a fonctionné, vérifier s'il existe déjà une conversation entre l'utilisateur et l'ami
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
        $req = $db -> prepare($sql);
        $req -> execute(array(
                    ':addFriendId' => $addFriendId,
                    ':idUser' => $idUser
                ));

        $alreadyHasAConversation = $req->fetchAll();

        // var_dump($alreadyHasAConversation);
        // var_dump(count($alreadyHasAConversation));

        if ($alreadyHasAConversation){ // il existe déjà une conversation avec cet ami, mettre fin à la fonction postAddFriend()
            return true;
        } else { // il n'existe pas encore de conversation avec cet ami, créer cette conversation
            $sql = "INSERT INTO `conversation` (`idconversation`) VALUES (NULL)";
            $req = $db -> prepare($sql);
            $req -> execute();
            $createdId = $db->lastInsertId();
    
            $sql = "INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`) VALUES (:idConv, :idUser), (:idConv, :addFriendId);";
            $req = $db -> prepare($sql);
            $req -> execute(array(
                ':idConv' => $createdId,
                ':addFriendId' => $addFriendId,
                ':idUser' => $idUser
            ));
        }
    }        

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
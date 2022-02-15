<?php
session_start();

require("model.php");
require_once("verifyToken.php");

function postAddMessage()
{

    function isUserIdInArray()
    {
        $idUser = $_SESSION['idUser'];
        $postedIdConv = intval(safeEntry($_POST['idconversation']));
        $usersInConv = array();
        $getConversationUsers = getConversationUsers($postedIdConv);
        while ($convUser = $getConversationUsers->fetch(PDO::FETCH_NUM)) {
            array_push($usersInConv, $convUser['0']);
        }
        $getConversationUsers->closeCursor();
        if (in_array($idUser, $usersInConv)) {
            return true;
        } else {
            return false;
        }
    }

    $isUserIdInArray = isUserIdInArray();

    if (!$isUserIdInArray) {
        throw new Exception("Nous n'avons pas trouvé cette conversation !");
    } else {
        if (!empty($_POST['media']) && !empty($_POST['msg'])) {
            $msg = safeEntry($_POST['msg']);
            $fileName = safeEntry($_POST['media']);
        } else if (!empty($_POST['msg'])) {
            $msg = safeEntry($_POST['msg']);
            $fileName = NULL;
        } else if (!empty($_POST['media'])) {
            $msg = NULL;
            $fileName = safeEntry($_POST['media']);
        }

        $postedIdConv = intval(safeEntry($_POST['idconversation']));
        $idUser = $_SESSION['idUser'];
    }

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

    $sql = "INSERT INTO `message` (`texte_message`, `url_media`, `utilisateur_idutilisateur`, `conversation_idconversation`) VALUES (:msg, :media, :idUser, :idConv)";
    $req = $db->prepare($sql);

    $valid = $req->execute(array(
        ':msg' => $msg,
        ':media' => $fileName,
        ':idUser' => $idUser,
        ':idConv' => $postedIdConv
    ));

    if (!$valid)
        throw new Exception("Nous n'avons pas pu envoyer ce message.");



    return "valid";
}

try {
    if (
        isset($_POST['idconversation'])
        && is_numeric($_POST['idconversation'])
        && (!empty($_POST['msg']) || !empty($_POST['media']))
        && verifyToken()
    ) {
        $postAddMessage = postAddMessage();
        echo $postAddMessage;
    } else {
        throw new Exception("Nous n'avons pas pu envoyer ce message.1");
    }
} catch (Exception $e) {
    // echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}

<?php
session_start();

require("model.php");

function postConvSearch()
{
    $search = safeEntry($_POST['convSearch']);

    require("PDO.php");

    $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

    $idList = getIdFromPseudoSearch($search);

    $friends = array();
    $others = array();

    foreach ($idList as $id) {
        if (isFriend($id[0]) == 2) {
            $idDM = getDirectConversation($id[0])->fetch();
            $idAccount = getAccount($id[0])->fetch();

            $conv = array(
                'photo' => $idAccount['photo_user'],
                'pseudo' => $idAccount['pseudo_user'],
                'lastMessage' => getLastMessagePreview($idDM['idconversation'], '../'),
                'idconv' => $idDM['idconversation'],
            );

            array_push($friends, $conv);
        } else {
            $account = getAccount($id[0]);
            array_push($others, $account->fetchAll(PDO::FETCH_ASSOC));
        }
    }

    if (count($friends) > 0 || count($others) > 0) {
        $convAndFriends = array('friends' => $friends, 'others' => $others);
        return json_encode($convAndFriends);
    } else {
        return false;
    }
}

try {
    if (
        isset($_POST['convSearch']) && isset($_SESSION['idUser'])
    ) {
        $postConvSearch = postConvSearch();
        echo $postConvSearch;
    } else {
        throw new Exception("L'importation a échoué.2");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}

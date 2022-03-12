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

            // foreach ($convIdsArray as $id) {

            // $convUsers = getConversationUsers($idDM)->fetchAll(PDO::FETCH_ASSOC);

            // foreach ($convUsers as $index => $user) {
            //     if ($user["user"] == $_SESSION["idUser"]) {
            //         unset($convUsers[$index]);
            //     }
            // }

            $conv = array(
                'photo' => $idAccount['photo_user'],
                'pseudo' => $idAccount['pseudo_user'],
                'lastMessage' => getLastMessagePreview($idDM['idconversation'], '../'),
                'idconv' => $idDM['idconversation'],
            );

            array_push($friends, $conv);
            // }
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
    echo $errorMsg;
}



//////////////////////////////

// look for a particular conversation on the messages page (-> via pseudo of other users in the conversation)

/*
require('model.php');

$search = safeEntry($_POST['convSearch']);

$idToSearch = getIdFromPseudo($search);

if (!$idToSearch) {
    return false;
}

$messages = getFilteredMessages($idToSearch);

if (!$messages) {
    return false;
}

while ($chat = $messages->fetch()) {
?>
    <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
        <article class="defaultBlock">
            <h1>
                <?= htmlspecialchars($chat['titre']) ?>
            </h1>
            <p> <span>Membres de la conversation :</span> </br>
                <?php
                $getConversationUsers = getConversationUsers($chat['idconversation']);
                if ($getConversationUsers) { // pas d'erreur envoyée si false !! le champ sera vide.
                    $user = $getConversationUsers->fetchAll();
                    for ($i = 0; $i < count($user); $i++) {
                        echo htmlspecialchars(getPseudoFromId($user[$i]['user']));
                        if ($i < count($user) - 1) {
                            echo ", ";
                        } else {
                            echo ".";
                        }
                    }
                    for ($i = 0; $i < count($user); $i++) {
                ?>
                        <img src="./public/images/upload/<?= htmlspecialchars($user[$i]['url_photo']) ?>" alt="">
                <?php
                    }
                }
                ?>
            </p>
        </article>
    </a>
<?php
}
$messages->closeCursor();
*/
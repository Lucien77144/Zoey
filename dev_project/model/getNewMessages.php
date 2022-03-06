<?php
session_start();

define("BASE_URL", "");

// this page looks for new messages on the instant messaging page (openend conversations)

require("model.php");
require_once("verifyToken.php");

function decrypt($ciphertext, $tag)
{
    // decrypt
    $ressource = fopen('../private_crypt/key.json', 'r');
    $stored = fread($ressource, filesize('../private_crypt/key.json'));
    $stored = json_decode($stored, true);
    $key = base64_decode($stored['key']);
    $iv = base64_decode($stored['iv']);
    // tag and ciphertext from db
    $original_plaintext = openssl_decrypt($ciphertext, "aes-128-gcm", $key, $options = 0, $iv, $tag);

    if ($original_plaintext) {
        return $original_plaintext;
    } else {
        return false;
    }
}

function getNewMessages()
{

    function getNewChat()
    {

        $idConv = safeEntry($_POST['id']);
        $storedIdConv = safeEntry($_SESSION['chatLastId']['idConv']);

        if ($idConv == $storedIdConv) {
            $lastId = safeEntry($_SESSION['chatLastId']['lastId']);
        } else {
            throw new Exception("Nous n'avons pas trouvé cette conversation");
        }

        // if (!isset($flagGetChatPrepare)){ // check flag prepare PDO : don't prepare the request if already prepared

        require("PDO.php");

        $db = new PDO("mysql:host={$host};dbname={$dbname};", $username, $password, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4'));

        $sql = "SELECT idmessage, texte_message msg, url_media media, utilisateur_idutilisateur iduser, utilisateur_idutilisateur authorId, utilisateur.pseudo authorPseudo, conversation_idconversation idConv, utilisateur.url_photo authorPic, date_envoi_msg, tag
        FROM `message` 
        INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
        WHERE conversation_idconversation = :idConv AND idmessage > :lastId";


        // $sql = "SELECT msg.* 
        //     FROM ( 
        //         SELECT idmessage, texte_message msg, url_media media, utilisateur_idutilisateur iduser, utilisateur_idutilisateur authorId, utilisateur.pseudo authorPseudo, conversation_idconversation idConv, utilisateur.url_photo authorPic, date_envoi_msg
        //         FROM `message` 
        //         INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
        //         WHERE conversation_idconversation = :idConv
        //         ORDER BY date_envoi_msg DESC LIMIT :offset, :numberOfMessages
        //     ) msg
        //     ORDER BY idmessage ASC";

        $req = $db->prepare($sql);

        //     $flagGetChatPrepare = true; // flag prepare PDO
        // }

        $req->execute(
            array(
                ':idConv' => $idConv,
                ':lastId' => $lastId
            )
        );

        if ($req->rowCount() <= 0)
            return false;

        return $req;
    }

    $chat = getNewChat();

    if (!$chat) {
        return false;
    }

    // GENERATE HTML
    ob_start();
    while ($message = $chat->fetch()) {
        $idMessage = $message['idmessage'];
        $idConv = $message['idConv'];

        if (!empty($message['msg'])) {
            $msg = decrypt($message['msg'], $message['tag']);
            if (!$msg) {
                $msg = null;
            }
        } else {
            $msg = null;
        }

        $currentTime = new DateTime(date('Y-m-d', time()));
        $currentTime->setTimezone(new DateTimeZone('Europe/Paris'));
        $currentDay = $currentTime->format('d');

        $sendTime = new DateTime($message["date_envoi_msg"]);
        $sendTime->setTimezone(new DateTimeZone('Europe/Paris'));
        $sendDay = $sendTime->format('d');

        if ($sendDay == $currentDay - 1) {
            $time = "Hier à " . $sendTime->format('G') . "h" . $sendTime->format('i');
        } else if ($sendDay == $currentDay) {
            $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i');
        } else {
            $time = "Le " . $sendTime->format('d/m/Y') . " à " . $sendTime->format('G') . "h" . $sendTime->format('i');
        }

        if ($message['authorId'] == $_SESSION['idUser']) { ?>
            <article class="myMessages">
            <?php } else { ?>
                <article>
                <?php } ?>

                <div class="chatMsgContainer">
                    <?php
                    if (!empty($msg)) {
                    ?>
                        <p>
                            <?= htmlspecialchars($msg) ?>
                        </p>
                    <?php
                    }
                    ?>
                    <?php
                    if (!empty($message['media'])) {
                    ?>
                        <div class="imgChat" style='background-image: url("<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['media']) ?>")' alt=""></div>
                    <?php
                    }
                    ?>
                    <p>
                        <?php
                        if (!empty($message['authorPic'])) {
                        ?>
                            <img class="authorPic" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['authorPic']) ?>" alt="">
                        <?php
                        }
                        ?>
                        <a class="username" href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a>
                        <?= $time ?>.
                    </p>
                </div>
                </article>
        <?php
    }

    $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage); // store last message's id in SESSION
    $chat->closeCursor();
    $generatedHtml = ob_get_clean();
    return $generatedHtml;
}

try {
    if (
        isset($_POST['id'])
        && verifyToken()
    ) {
        $getNewMessages = getNewMessages();
        echo $getNewMessages;
    } else {
        throw new Exception("Vous êtes déconnecté.");
    }
} catch (Exception $e) {
    // echo "catch";
    $errorMsg = $e->getMessage();
    // echo $errorMsg;
    // require("../view/errorView.php");
}

<?php
session_start();

// load more older messages on a conversation page (only the last 10 are printed by default)

require("model.php");
require_once("verifyToken.php");

function postLoadMoreMessages()
{

    $offsetCoef = safeEntry($_POST['offsetCoef']);

    $chat = getChat($offsetCoef);

    if (!$chat) {
        return false;
    }

    // GENERATE HTML
    ob_start();
    while ($message = $chat->fetch()) {
        $idMessage = $message['idmessage'];
        $idConv = $message['idConv'];

        if (!empty($message['msg'])) {
            $msg = decrypt($message['msg'], $message['tag'], '../');
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
                    if (!empty($message['media'])) {
                    ?>
                        <div class="imgChat" style='background-image: url("<?= './public/images/upload/' . htmlspecialchars($message['media']) ?>")' alt=""></div>
                    <?php } ?>
                    <p>
                        <?php
                        if (!empty($message['authorPic'])) {
                        ?>
                            <img class="authorPic" src="<?= './public/images/upload/' . htmlspecialchars($message['authorPic']) ?>" alt="">
                        <?php
                        }
                        ?>
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
        isset($_POST['offsetCoef'])
        && isset($_POST['id'])
        && verifyToken()
    ) {
        $postLoadMoreMessages = postLoadMoreMessages();
        echo $postLoadMoreMessages;
    } else {
        throw new Exception("Nous n'avons pas trouvé d'autres messages");
    }
} catch (Exception $e) {
    $errorMsg = $e->getMessage();
}

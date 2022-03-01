<?php
$pageTitle = 'Conversation';
// CONTENT BLOCK
ob_start();
?>

<div class="convName">
    <h1>
        <?php
        if (isset($convUsers[0]['titre'])) {
            echo htmlspecialchars($convUsers[0]['titre']);
        } else {
            for ($i = 0; $i < count($convUsers); $i++) {
                echo htmlspecialchars($convUsers[$i]['pseudo']);
                if ($i < count($convUsers) - 1) {
                    echo ", ";
                }
            }
        }
        ?>
    </h1>
</div>

<button class="btn" id="loadMoreMessages">Afficher les messages précédents</button>
<span id="confirmationMessage"></span>
<div id="chatContainer">

    <?php

    if ($chat) {
        while ($message = $chat->fetch()) {
            $idMessage = $message['idmessage'];
            $idConv = $message['idConv'];

            $currentTime = new DateTime(date('Y-m-d', time()));
            $currentDay = $currentTime->format('d');

            $sendTime = new DateTime($message["date_envoi_msg"]);
            $sendDay = $sendTime->format('d');

            if ($sendDay == $currentDay - 1) {
                $time = "Hier à " . $sendTime->format('G') . "h" . $sendTime->format('i');
            } else if ($sendDay == $currentDay) {
                $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i');
            } else {
                $time = "Le " . $sendTime->format('d/m/Y') . " à " . $sendTime->format('G') . "h" . $sendTime->format('i');
            }
    ?>

    <article>
        <div class="chatMsgContainer">
            <?php
                if (!empty($message['msg'])) {
                ?>
            <p>
                <?= htmlspecialchars($message['msg']) ?>
            </p>
            <?php
                }
                ?>
            <?php
                if (!empty($message['media'])) {
                ?>
            <div class="imgChat"
                style='background-image: url("<?= BASE_URL ?>public/images/upload/<?= htmlspecialchars($message['media']) ?>")'>
            </div>
            <?php
                }
                ?>

        <p>
            <?php
                    if (!empty($message['authorPic'])) {
                    ?>
            <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['authorPic']) ?>" alt="">
            <?php
                    }
                    ?>
            <a
                href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a>
            <?= $time ?>.
        </p>
        </div>
    </article>
    <?php
        }

        $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage); // store last message's id in SESSION
        $chat->closeCursor();
    } else {
        ?>
    <p id="noMessagesYet">Vous n'avez pas encore échangé de messages !</p>
    <?php
        $idMessage = 0;
        $idConv = safeEntry($_GET['id']);
        $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage);
    }

    ?>
</div>

<div class="inputMessage">
    <form id="addMessageForm">
        <textarea id="msg" name="description" type="text" rows="5" cols="33"></textarea><br>
        <span id="ConfirmationMessage"></span><br>
        <div class="mobileContainer">
            <div class="mediaContainer">
                <div class="labelForMedia">Ajouter une image</div>
                <label for="media">
                    <img src="public/images/icons/addPost.svg" class="currentPicture">
                    <input type="file" id="media" name="media" accept="image/png, image/jpeg">
                </label>
            </div>
            <input type="submit" id="submitAddMessage" value="Envoyer">
        </div>

    </form>
</div>


<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_chat.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/chat.js"></script>
<script src="public/js/addAnimal.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');
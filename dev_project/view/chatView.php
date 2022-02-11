<?php
$pageTitle = 'Conversation';
// CONTENT BLOCK
ob_start();
?>
<button id="loadMoreMessages">Afficher les messages précédents</button>
<span id="confirmationMessage"></span>
<div id="chatContainer">

    <?php

    if ($chat) {
        while ($message = $chat->fetch()) {
            $idMessage = $message['idmessage'];
            $idConv = $message['idConv'];
    ?>

            <article class="defaultBlock">
                <p>
                    <?= htmlspecialchars($message['msg']) ?>
                </p>
                <?php
                if (isset($message['media'])) {
                ?>
                    <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['media']) ?>" alt="">
                <?php
                }
                ?>
                <p>envoyé par <a href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a></p>
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

    ?> &
</div>

<div class="inputMessage">
    <form id="addMessageForm">
        <textarea id="description" name="description" type="text" rows="5" cols="33"></textarea> <br>
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
    <span id="ConfirmationMessage"></span>
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

<?php 
$pageTitle = 'Conversation';
// CONTENT BLOCK
ob_start();
?>
<button id="loadMoreMessages">Afficher les messages précédents</button>
<span id="confirmationMessage"></span>
<div id="chatContainer">
    
<?php

if ($chat){
    while ($message = $chat->fetch())
    {
        $idMessage = $message['idmessage'];
        $idConv = $message['idConv'];
    ?>

        <article class="defaultBlock">
            <p>
                <?= htmlspecialchars($message['msg']) ?>
            </p>
            <?php
            if (isset($message['media'])){
                ?>
                    <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($message['media']) ?>" alt="">
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

?>
</div>

<form id="addMessageForm">
    <label for="msg">message</label>
    <input type="text" name="msg" id="msg"> <br>

    <label for="media">photo</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg">

    <input type="submit" id="submitAddMessage">
</form>
<span id="ConfirmationMessage"></span>

<?php
    $viewContent = ob_get_clean();
    
    // SCRIPT BLOCK
    ob_start(); ?>
    <script src="public/js/chat.js"></script>
<?php
    $scriptsBlock = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
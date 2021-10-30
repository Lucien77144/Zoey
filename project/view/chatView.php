<?php 
$pageTitle = 'Conversation';
ob_start();

while ($message = $chat->fetch())
{
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
?>

<form id="addMessageForm">
    <label for="msg">message</label>
    <input type="text" name="msg" id="msg"> <br>

    <label for="media">photo</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg">

    <input type="submit" id="submitAddMessage">
</form>
<span id="ConfirmationMessage"></span>

<?php
$chat->closeCursor();
?>
<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
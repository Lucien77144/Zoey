<?php
session_start();

// load more older messages on a conversation page (only the last 10 are printed by default)

require("model.php");
require_once("verifyToken.php");

function postLoadMoreMessages(){

    $offsetCoef = safeEntry($_POST['offsetCoef']);

    $chat = getChat($offsetCoef);

    if (!$chat){
        return false;
    }

    // GENERATE HTML
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
                    <img src="<?= 'public/images/' . htmlspecialchars($message['media']) ?>" alt="">
                <?php
            }
            ?>
            <p>envoyé par <a href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a></p>
        </article>
    <?php
    }
    $generatedHtml = ob_get_clean();
    return $generatedHtml;
}

try {
    if (isset($_POST['offsetCoef'])
        && isset($_POST['id'])
        && verifyToken() )
    {
        $postLoadMoreMessages = postLoadMoreMessages();
        echo $postLoadMoreMessages;
    } else {        
        throw new Exception("Nous n'avons pas trouvé d'autres messages");
    }

} catch (Exception $e) {
    echo "catch";
    $errorMsg = $e->getMessage();
    echo $errorMsg;
    // require(BASE_URL . "view/errorView.php");
}
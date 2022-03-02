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
    while ($message = $chat->fetch()){

        if($message['authorId'] == $_SESSION['idUser']){ ?>
            <article class="myMessages">
        <?php }else{ ?>
            <article>
        <?php } ?>

        <div class="chatMsgContainer">
            
            <?php 

            var_dump($message);
            
            if (!empty($message['msg'])) { ?>
                <p>
                    <?= htmlspecialchars($message['msg']) ?>
                </p>
            <?php
            }
            if (!empty($message['media'])) {
            ?>
                <div class="imgChat" style='background-image: url("<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['media']) ?>")' alt=""></div>
            <?php } ?>
            <p>
                <?php
                if (!empty($message['authorPic'])) {
                ?>
                    <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['authorPic']) ?>" alt="">
                <?php
                }
                ?>
                <a href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a>
                <?= $time ?>.
            </p>

        </div>
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
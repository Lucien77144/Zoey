<?php
session_start();

require("model.php");
require_once("verifyToken.php");

function getNewMessages(){

    function getNewChat(){

        $idConv = safeEntry($_POST['id']);
        $storedIdConv = $_SESSION['chatLastId']['idConv'];

        if ($idConv == $storedIdConv){
            $lastId = $_SESSION['chatLastId']['lastId'];
        } else {
            throw new Exception("Nous n'avons pas trouvé cette conversation");
        }
    
        // if (!isset($flagGetChatPrepare)){ // check flag prepare PDO : don't prepare the request if already prepared
    
            require("PDO.php");
    
            $db = new PDO ("mysql:host={$host};dbname={$dbname};", $username, $password, array
            (PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    
            $sql = "SELECT idmessage, texte_message msg, url_media media, utilisateur_idutilisateur iduser, utilisateur_idutilisateur authorId, utilisateur.pseudo authorPseudo, conversation_idconversation idConv
            FROM `message`
            INNER JOIN utilisateur ON message.utilisateur_idutilisateur = utilisateur.idutilisateur
            WHERE conversation_idconversation = :idConv AND idmessage > :lastId";
    
            $req = $db -> prepare($sql);
    
        //     $flagGetChatPrepare = true; // flag prepare PDO
        // }
        
        $req -> execute(
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

    if (!$chat){
        return false;
    }

    // GENERATE HTML
    ob_start();
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
                    <img src="<?= 'public/images/' . htmlspecialchars($message['media']) ?>" alt="">
                <?php
            }
            ?>
            <p>envoyé par <a href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a></p>
        </article>
    <?php
    }

    $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage); // store last message's id in SESSION
    $chat->closeCursor();
    $generatedHtml = ob_get_clean();
    return $generatedHtml;
}

try {
    if (isset($_POST['id'])
        && verifyToken() )
    {
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
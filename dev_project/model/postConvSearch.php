<?php
session_start();

// look for a particular conversation on the messages page (-> via pseudo of other users in the conversation)

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

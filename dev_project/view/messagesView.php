<?php
// view all conversations (every friend on zoey)

$pageTitle = 'Mes messages';
ob_start();
?>

<div id="convContainer">
    <form id="formSearch">
        <label for="convSearch">Rechercher des amis : </label>
        <input type="search" id="convSearch" name="convSearch" aria-label="Rechercher une conversation" placeholder="pseudo ou nom du groupe">
        <span id="confirmationMessage"></span>
    </form>
    <div id="messagesContainer">
        <?php
        if ($messages) {
        ?>
            <?php
            while ($chat = $messages->fetch()) {
                $convUsers = getConversationUsers($chat["idconversation"]);
                if ($convUsers) {
                    $convUsers = $convUsers->fetchAll();
                    foreach ($convUsers as $index => $user) {
                        if ($user["user"] == $_SESSION["idUser"]) {
                            unset($convUsers[$index]);
                        }
                    }
                    sort($convUsers);
                } else {
                    throw new Exception("La conversation n'a pas été trouvée");
                }
                $lastMessage = getLastMessagePreview($chat['idconversation']);
            ?>
                <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
                    <div class="profilePicturesContainer">
                        <?php
                        for ($i = 0; $i < count($convUsers); $i++) {
                        ?>
                            <img class="profilePicture" src="./public/images/upload/<?= htmlspecialchars($convUsers[$i]['url_photo']) ?>" alt="">

                        <?php
                        }
                        ?>
                    </div>
                    <div class="ConversationTextsContainer">
                        <p>
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
                        </p>
                        <p><?= htmlspecialchars($lastMessage) ?></p>
                    </div>
                </a>

            <?php
            }
            ?>
        <?php
        } else {
        ?>
            <p class="addFriends">Ajoutez des amis via le fil d'actualité ou la barre de recherche pour commencer des conversations !</p>
        <?php
        }
        ?>
    </div>
</div>
<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_messages.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/messages.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

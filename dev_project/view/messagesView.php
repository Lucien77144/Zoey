<?php
$pageTitle = 'Mes messages';
ob_start();
?>

<div id="convContainer">
    <?php
    if ($messages) {
    ?>
        <form id="formSearch">
            <label for="convSearch">Rechercher une conversation : </label>
            <input type="search" id="convSearch" name="convSearch" aria-label="Rechercher une conversation" placeholder="pseudo ou nom du groupe">
            <span id="confirmationMessage"></span>
        </form>

        <div id="messagesContainer">
        <?php
        while ($chat = $messages->fetch()) {
        ?>
            <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
                <article class="defaultBlock">
                    <h1>
                        <?= htmlspecialchars($chat['titre']) ?>
                    </h1>
                    <div>
                        <p> <strong>Membres de la conversation :</strong> </br>
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
                            }
                            ?>
                        </p>
                            <div class="profilePicturesContainer">
                                <?php
                                    for ($i = 0; $i < count($user); $i++) {
                                        ?>
                                        <img class="profilePicture" src="../dev_project/public/images/upload/<?= htmlspecialchars($user[$i]['url_photo']) ?>" alt="">
                                        <?php
                                    }
                                ?>
                            </div>
                    </div>
                </article>
            </a>
            
        <?php
        }
        ?>
        </div>
    <?php
    } else {
        ?>
        <p>Ajoutez des amis pour commencer des conversations !</p>
    <?php
    }
    ?>
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
<?php
$pageTitle = 'Mes messages';
ob_start();
?>

<div id="convContainer">
    <?php
    if ($messages) {
    ?>
        <form action="">
            <label for="convSearch">Rechercher une conversation : </label>
            <input type="search" id="convSearch" name="convSearch" aria-label="Rechercher une conversation" placeholder="pseudo ou nom du groupe">
            <!-- <input type="submit" class="btn" value="Rechercher"> -->
            <span id="confirmationMessage"></span>
        </form>


        <?php
        while ($chat = $messages->fetch()) {
        ?>
            <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
                <!-- <a href="blog/<?= htmlspecialchars($chat['id']) ?>"> -->
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
                        }
                        ?>
                    </p>
                </article>
            </a>
        <?php
        }
        $messages->closeCursor();
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
<!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

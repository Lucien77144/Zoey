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
            ?>
                <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
                     <div class="profilePicturesContainer">
                        <?php
                        for ($i = 0; $i < count($convUsers); $i++) {
                        ?>
                            <img class="profilePicture" src="../dev_project/public/images/upload/<?= htmlspecialchars($convUsers[$i]['url_photo']) ?>" alt="">
                        <?php
                        }
                        ?>
                    </div>
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

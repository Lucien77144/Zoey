<?php 
$pageTitle = 'Mes messages';
ob_start();
?>

<div id="convContainer">
    <?php
    if ($messages) {
        ?>

        <label for="convSearch">Rechercher une conversation : </label>
        <input type="search" id="convSearch" name="convSearch" aria-label="Rechercher une conversation" placeholder="pseudo ou nom du groupe">
        <span id="confirmationMessage"></span>
        
        <?php
        while ($chat = $messages->fetch())
        {
        ?>
            <a href="index.php?action=messages&id=<?= htmlspecialchars($chat['idconversation']) ?>">
            <!-- <a href="blog/<?= htmlspecialchars($chat['id']) ?>"> -->
                <article class="defaultBlock">
                    <h1>
                        <?= htmlspecialchars($chat['titre']) ?>
                    </h1>
                    <p> Membres de la conversation : 
                        <?php 
                            $getConversationUsers = getConversationUsers($chat['idconversation']);
                            if ($getConversationUsers){ // pas d'erreur envoyée si false !! le champ sera vide.
                                $user = $getConversationUsers -> fetchAll();
                                for ($i=0; $i < count($user); $i++) {                            
                                    echo htmlspecialchars(getPseudoFromId($user[$i]['user']));
                                    if ($i < count($user) - 1){
                                        echo ", ";
                                    } 
                                    else {
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
    require(BASE_URL . 'public/template/template.php');
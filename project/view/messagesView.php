<?php 
$pageTitle = 'Mes messages';
ob_start();

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
?>
<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
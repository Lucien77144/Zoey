<?php
$pageTitle = 'Post';

/*
if(isset($_SESSION['idUser'])){
    if($post['iduser'] == $_SESSION['idUser'] && verifyToken()){
?>
        <a href="index.php?action=modifyPost">modifier le post</a>
<?php
    }} */

$post = $post->fetch();
ob_start();
?>
<article class="defaultBlock">
    <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
    <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
        <h1>
            <?= htmlspecialchars($post['nom']) ?>
        </h1>
    </a>

    <p>
        <?= nl2br(htmlspecialchars($post['description'])) ?>
    </p>
</article>
<?php

$viewContent = ob_get_clean();
require(BASE_URL . 'public/template/template.php');

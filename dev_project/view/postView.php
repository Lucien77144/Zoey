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
    <img class="postImg" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
    <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
        <h1>
            <?= htmlspecialchars($post['nom']) ?>
        </h1>
    </a>

    <p>
        <?= nl2br(htmlspecialchars($post['description'])) ?>
    </p>
    <!-- <p><?= nl2br(htmlspecialchars($post['date_publication'])) ?> </p> -->
</article>
<?php

$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_post.css" />

<?php
require(BASE_URL . 'public/template/template.php');

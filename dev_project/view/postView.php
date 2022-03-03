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

$currentTime = new DateTime(date('Y-m-d', time()));
$currentDay = $currentTime->format('d');

$sendTime = new DateTime($post["date_publication"]);
$sendDay = $sendTime->format('d');

if ($sendDay == $currentDay - 1) {
    $time = "Hier à " . $sendTime->format('G') . "h" . $sendTime->format('i');
} else if ($sendDay == $currentDay) {
    $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i');
} else {
    $time = "Le " . $sendTime->format('d/m/Y') . " à " . $sendTime->format('G') . "h" . $sendTime->format('i');
}


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

    <p>
        <?= $time ?>
    </p>
</article>
<?php

$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_post.css" />

<?php
require(BASE_URL . 'public/template/template.php');

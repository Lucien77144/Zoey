<?php
$article = $article->fetch();
$pageTitle = htmlspecialchars($article['titre']);
ob_start();
?>

<section class="section1">
    <h1 class="titleArt"><?= htmlspecialchars($article['titre']) ?></h1>
    <!-- <h2 class="categorie">EVENEMENT</h2> -->
    <p class="intro"><?= nl2br($article['texte1']) ?></p>
</section>
<section class="article">
    <div class="illustration">
        <img src="<?= BASE_URL ?>public/images/blog/<?= htmlspecialchars($article['url_image']) ?>" alt="">
        <p class="descIllu"><?= htmlspecialchars($article['description_photo']) ?></p>
    </div>
    <p>
        <?= nl2br($article['texte2']) ?>
    </p>
    <div class="btnWrap">
        <a href="index.php?action=blog" class="btn">Retourner aux Actualités</a>
    </div>
</section>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_article.css">
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
$scriptsBlock = ob_get_clean();
require(BASE_URL . 'public/template/template.php');

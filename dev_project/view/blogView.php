<?php
$pageTitle = 'Blog';
$printLegal = true;
$metaDesc = "Flash info sur l’actualité animalière, interviews de professionnels vétérinaires et ostéopathes animaliers, démarches d’adoption dans le but de vous informer au quotidien !";
ob_start();
?>
<section>

    <?php

    while ($article = $blog->fetch()) {
    ?>
        <article class="contentBlog">
            <h1><?= htmlspecialchars($article['titre']) ?></h1>
            <a href="index.php?action=blog&id=<?= htmlspecialchars($article['id']) ?>" class="img" style='background-image: url("<?= BASE_URL ?>public/images/blog/<?= htmlspecialchars($article['url_image']) ?>")'></a>
            <p><?= nl2br(htmlspecialchars($article['resume'])) ?></p>
            <a class="btn" href="index.php?action=blog&id=<?= htmlspecialchars($article['id']) ?>">Lire la suite</a>
        </article>
    <?php
    }
    $blog->closeCursor();
    ?>
</section>
<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_blog.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

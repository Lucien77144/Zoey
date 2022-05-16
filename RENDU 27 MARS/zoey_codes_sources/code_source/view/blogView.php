<?php
// main page for the blog : view all articles

$pageTitle = 'Blog';
$printLegal = true;
$metaDesc = "Flash info sur l’actualité animalière, interviews de professionnels vétérinaires et ostéopathes animaliers, démarches d’adoption dans le but de vous informer au quotidien !";
ob_start();
?>
<section>

    <?php
    $flag = 1;
    while ($article = $blog->fetch()) {
        $lazy = "";
        $flag++;
        if ($flag > 6) {
            $lazy = 'loading="lazy"';
        }
    ?>
        <article class="contentBlog">
            <h1><?= htmlspecialchars($article['titre']) ?></h1>
            <a href="index.php?action=blog&id=<?= htmlspecialchars($article['id']) ?>" class="img">
                <img <?= $lazy ?> src="<?= BASE_URL ?>public/images/blog/<?= htmlspecialchars($article['url_image']) ?>" alt="">
            </a>
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

require(BASE_URL . 'public/template/template.php');
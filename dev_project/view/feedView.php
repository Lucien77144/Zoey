<?php 
$pageTitle = 'Feed';
$printNewsletter = false;
ob_start();
?>

<main>

<?php
while ($post = $feed->fetch())
{
?>
    <article class="defaultBlock">
        <img class="blockIllus" src="<?= BASE_URL . 'public/images/' . htmlspecialchars($post['media']) ?>" alt="">
        <a href="index.php?action=animal&id=<?= htmlspecialchars($post['idanimal']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
            <h1>
                <?= htmlspecialchars($post['nom']) ?>
            </h1>
        </a>
        
        <p>
            <?= nl2br(htmlspecialchars($post['description'])) ?>
        </p>
        <a href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">voir le post</a>
    </article>

<?php
}
?>

</main>

<?php
$feed->closeCursor();
?>
<?php 
    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_feed.css" />
<?php
    $stylesBlock = ob_get_clean();

    require(BASE_URL . 'public/template/template.php');

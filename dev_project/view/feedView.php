<?php 
$pageTitle = 'Feed';
ob_start();

while ($post = $feed->fetch())
{
?>
    <article class="defaultBlock">
        <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($post['media']) ?>" alt="">
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
$feed->closeCursor();
?>
<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
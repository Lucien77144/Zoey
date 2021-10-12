<?php 
$pageTitle = 'Feed';
ob_start();

while ($post = $feed->fetch())
{
?>
    <a href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">
        <article class="defaultBlock">
            <h1>
                <?= htmlspecialchars($post['animal']) ?>
            </h1>
            
            <p>
                <?= nl2br(htmlspecialchars($post['description'])) ?>
            </p>
        </article>
    </a>
<?php
}
$blog->closeCursor();
?>
<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
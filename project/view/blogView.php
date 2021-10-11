<?php 
$pageTitle = 'Blog';
ob_start();

while ($article = $blog->fetch())
{
?>
    <!-- <a href="index.php?action=blog&id=<?= htmlspecialchars($article['id']) ?>"> -->
    <a href="blog/<?= htmlspecialchars($article['id']) ?>">
        <article class="defaultBlock">
            <h1>
                <?= htmlspecialchars($article['titre']) ?>
            </h1>
            
            <p>
                <?= nl2br(htmlspecialchars($article['resume'])) ?>
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
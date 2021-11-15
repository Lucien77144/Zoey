<?php 
$pageTitle = 'Blog';
ob_start();
?>
<section>

<?php

while ($article = $blog->fetch())
{
?>
    <article class="contentBlog">
        <h1><?= htmlspecialchars($article['titre']) ?></h1>
        <div class="img" style='background-image: url("<?= BASE_URL ?>public/images/blog/<?= htmlspecialchars($article['url_image']) ?>")'></div>
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
    require(BASE_URL . 'public/template/template.php');
<?php 
$pageTitle = 'Blog';
ob_start();

while ($article = $blog->fetch())
{
?>
    <article class="defaultBlock">
        <h1>
            <?= htmlspecialchars($article['titre']) ?>
        </h1>
        
        <p>
            <?= nl2br(htmlspecialchars($article['resume'])) ?>
        </p>
    </article>
<?php
}
$blog->closeCursor();
?>
<?php 
    $viewContent = ob_get_clean();
    require('template.php');
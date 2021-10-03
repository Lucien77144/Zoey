<?php 
$article = $article->fetch();
$pageTitle = htmlspecialchars($article['titre']);
ob_start();
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
    $viewContent = ob_get_clean();
    require('template.php');
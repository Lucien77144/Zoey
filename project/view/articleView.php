<?php 
$article = $article->fetch();
$pageTitle = htmlspecialchars($article['titre']);
ob_start();
?>
    <main class="defaultBlock">
        <?php
            if (isset($article['url_contenu_article']) && file_exists(BASE_URL . htmlspecialchars($article['url_contenu_article']))) {
                include(BASE_URL . htmlspecialchars($article['url_contenu_article']));
            } else { ?>
                <h1>
                    <?= htmlspecialchars($article['titre']) ?>
                </h1>
                
                <p>
                    <?= nl2br(htmlspecialchars($article['resume'])) ?>
                </p>
            <?php } ?>
    </main>
<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
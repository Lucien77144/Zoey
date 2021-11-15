<?php 
$article = $article->fetch();
$pageTitle = htmlspecialchars($article['titre']);
ob_start();
?>

<section class="section1">
    <h1 class="titleArt"><?= htmlspecialchars($article['titre']) ?></h1>
    <!-- <h2 class="categorie">EVENEMENT</h2> -->
    <p class="intro"><?= nl2br(htmlspecialchars($article['texte1'])) ?></p>
</section>
<section>
    <div class="illustration">
    <img src="<?= BASE_URL ?>public/images/blog/<?= htmlspecialchars($article['url_image']) ?>" alt="">
    <p class="descIllu"><?= htmlspecialchars($article['description_photo']) ?></p>
    </div>
    <p>
    <?= nl2br(htmlspecialchars($article['texte2'])) ?>
    </p>
    <div class="btnWrap">
    <a href="index.php?action=blog" class="btn">Retourner aux Actualités</a>
    </div>
</section>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
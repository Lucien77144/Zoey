<?php
$pageTitle = 'Feed';
$printNewsletter = false;
ob_start();
?>

<main>

    <?php
    while ($post = $feed->fetch()) {
    ?>
        <article class="defaultBlock">
            <img class="blockIllus" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
            <div class="textContent">
                <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
                    <h1>
                        <?= htmlspecialchars($post['nom']) ?>
                    </h1>
                </a>

                <p>
                    <?= nl2br(htmlspecialchars($post['description'])) ?>
                </p>
                <a class="seeMore" href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">voir le post</a>
            </div>
        </article>

    <?php
    }
    ?>

</main>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_feed.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="<?= BASE_URL ?>public/js/feed.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

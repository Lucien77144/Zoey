<?php
// help page to install the app

$pageTitle = 'Installer Zoey';
$printLegal = true;
ob_start();
?>

<div class="bgContainer">
    <h1 class="underline title">Installer Zoey</h1>
</div>
<p>Pour installer ZOEY sur votre téléphone en tant qu'application, il vous suffit de suivre <b>les consignes de cette
        courte vidéo</b> afin de pouvoir profiter pleinement de notre plateforme.</p>
<div class="videoContainer">
    <video controls>
        <source src="./public/images/presentation/tutorial.mp4" type="video/mp4">
        <p>Votre navigateur ne prend pas en charge les vidéos HTML5.
            Voici <a href="./public/images/presentation/tutorial.mp4">un lien pour télécharger la vidéo</a>.</p>
    </video>
</div>



<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_pwa.css" />
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

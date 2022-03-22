<?php
$pageTitle = 'Installer Zoey';
$printLegal = true;
ob_start();
?>

<div class="bgContainer">
    <h1 class="underline title">Installer Zoey</h1>
</div>
<p>Pour installer ZOEY sur votre téléphone en tant qu'application, il vous suffit de suivre les consignes de cette courte vidéo afin de pouvoir profiter pleinement de notre plateforme.</p>



<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_pwa.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

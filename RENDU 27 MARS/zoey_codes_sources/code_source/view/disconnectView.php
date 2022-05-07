<?php
// when you disconnect from your zoey account

$printNewsletter = false;
$pageTitle = "Vous avez bien été déconnecté";
ob_start();
?>

<div class="disconnectContainer">
    <h1>Vous avez bien été déconnecté.</h1>
    <h4>Si vous n'êtes pas redirigés, <a href="index.php">cliquez ici</a></h4>
</div>



<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_disconnect.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="<?= BASE_URL ?>public/js/disconnect.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

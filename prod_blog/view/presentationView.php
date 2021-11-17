<?php 
$pageTitle = 'Qui sommes-nous ?';
ob_start();
?>
 
 

 
<!-- qui sommes+nous HTML goes here -->



<?php
    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/ YOUR STYLE GOES HERE " /> -->
<?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
    $scriptsBlock = ob_get_clean();

    require(BASE_URL . 'public/template/template.php');
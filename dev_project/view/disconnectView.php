<?php 
$printNewsletter = false;
$pageTitle = "Vous avez bien été déconnecté";
ob_start();
?>

<h1>Vous avez bien été déconnecté.</h1>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
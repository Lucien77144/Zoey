<?php 
$pageTitle = "Mon compte";
ob_start();
?>

<h1>Mon compte</h1>
<h2>work in progress</h2>

<p>utilisateur connecté : <?= $_SESSION['pseudo'] ?></p>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
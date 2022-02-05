<?php 
$printNewsletter = false;
$pageTitle = "Se connecter";
ob_start();
?>
<div class="connexion">
<h1>Connectez vous !</h1>
    <form class="connectForm">

    <div class="inputContainer">
        <div class="pseudoContainer">
            <label for="pseudo">pseudonyme *</label>
            <input type="text" name="pseudo" id="pseudo" placeholder="pseudo">
        </div>
        <div class="passwordContainer">
             <label for="password">mot de passe *</label>
            <input type="password" name="password" id="password">
        </div>
    </div>
        
 
        <div class="linksContainer">
            <input type="submit" id="submitConnect" value="se connecter">
            <a href="">Pas encore inscrit ?</a>
        </div>

        <p>*: Champs obligatoires</p>
</form>
</div>

<span id="ConfirmationMessage"></span>


<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');

    // styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_connexion.css">
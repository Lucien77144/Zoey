<?php
$printNewsletter = false;
$pageTitle = "Mot de passe oublié ?";
ob_start();
?>

<h1 class="forgotMDP">Mot de passe oublié</h1>

<form class="connectForm">

    <div class="inputContainer">
        <div class="pseudoContainer">
            <label for="mail">Adresse mail liée au compte *</label> <br>
            <input type="email" name="mail" id="forgotMail">
        </div>
    </div>

    <div class="linksContainer">
        <input type="submit" id="submitForgotMail" value="Envoyer">
        <a href="index.php?action=connect">Se connecter</a>
        <br>
        <a href="index.php?action=subscribe">Pas encore inscrit ?</a>
    </div>

    <p>*: Champs obligatoires</p>
</form>

<span id="confirmationMessage"></span>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_connexion.css">
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

<?php
$printNewsletter = false;
$pageTitle = "Se connecter";
ob_start();
?>
<div class="connexion">
    <?php
    if (isset($_GET["src"]) && $_GET["src"] = "quizz") {
    ?>
        <h1>Connectez vous !</h1>
        <h2>Pour sauvegarder vos résultats du quiz et accéder à l'ensemble des services de Zoey.</h2>
        <p>Pour voir les résultats du quiz sans créer de compte, <a href="index.php?action=adoption">c'est par ici</a>.</p>
    <?php
    }
    ?>
    <div class="googleWrapper">
        <h3>Connectez-vous avec Google</h3>
        <div id="googleAuthButton"></div>
    </div>

    <h3>ou</h3>

    <form class="connectForm">

        <div class="inputContainer">
            <div class="pseudoContainer">
                <label for="pseudo">Identifiant *</label>
                <input type="text" name="pseudo" id="pseudo" placeholder="Votre identifiant...">
            </div>
            <div class="passwordContainer">
                <label for="password">Mot de passe *</label>
                <input type="password" name="password" id="password">
            </div>
        </div>
        <input type="submit" id="submitConnect" value="Se connecter">
        <p class="champs">*: Champs obligatoires</p>
    </form>

    <div class="linksContainer">
        <a href="index.php?action=subscribe">Pas encore inscrit ?</a>
        <br>
        <a href="index.php?action=forgotmypw">Mot de passe oublié ?</a>
    </div>
</div>

<span id="ConfirmationMessage"></span>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_connexion.css">
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
/*ob_start(); ?>
<?php
$scriptsBlock = ob_get_clean();*/

require(BASE_URL . 'public/template/template.php');

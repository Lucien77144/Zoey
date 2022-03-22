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
                <div class="pwContainer">
                    <input type="password" name="password" id="password">
                    <svg class="viewPW" viewBox="0 0 488.85 488.85">
                        <path d="M244.425,98.725c-93.4,0-178.1,51.1-240.6,134.1c-5.1,6.8-5.1,16.3,0,23.1c62.5,83.1,147.2,134.2,240.6,134.2s178.1-51.1,240.6-134.1c5.1-6.8,5.1-16.3,0-23.1C422.525,149.825,337.825,98.725,244.425,98.725z M251.125,347.025c-62,3.9-113.2-47.2-109.3-109.3c3.2-51.2,44.7-92.7,95.9-95.9c62-3.9,113.2,47.2,109.3,109.3C343.725,302.225,302.225,343.725,251.125,347.025z M248.025,299.625c-33.4,2.1-61-25.4-58.8-58.8c1.7-27.6,24.1-49.9,51.7-51.7c33.4-2.1,61,25.4,58.8,58.8C297.925,275.625,275.525,297.925,248.025,299.625z"/>
                    </svg>
                </div>
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

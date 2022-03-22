<?php
$printNewsletter = false;
$pageTitle = "S'inscrire";

/*
<input type="file" id="media" hidden />
<label class="choose_photo" for="media">Choisir une photo</label>

<div class="name formContent">
    <label for="nom">Nom et prénom *</label>
    <input type="text" name="nom" id="nom" placeholder="nom" required='required'>
    <input type="text" name="prenom" id="prenom" placeholder="prenom" required='required'>
</div>

<div class="dateOfBirthContainer formContent">
    <label for="date_naissance">date de naissance *</label>
    <input type="date" name="date_naissance" id="date_naissance" required='required'>
</div>
*/

ob_start();
?>

<div class="subscribe">
    <h1>Inscrivez vous !</h1>

    <div class="googleContainer">
        <p>Inscrivez-vous en 1 clic avec Google :</p>
        <div id="googleAuthButton"></div>
        <p>En créant un compte, vous vous engagez à respecter les <a href="index.php?action=legal">conditions d'utilisation</a>.</p>
    </div>

    <div class="btn btn-nogoogle" id="btn-nogoogle">Pas de compte google ?</div>

    <form class="subscribeForm" id="subscribeForm" style="display:none;">

        <div class="pseudoContainer formContent">
            <label for="pseudo">Pseudo *</label>
            <input type="text" name="pseudo" id="pseudoSubscribe" placeholder="pseudo" required='required'> <span id="pseudoConfirmationMessage"></span>
        </div>
        <div class="mailContainer formContent">
            <label for="mail">Adresse e-mail *</label>
            <input type="email" name="mail" id="mail" placeholder="exemple@zoey.fr" required='required'>
        </div>

        <div class="formContent">
            <div class="passwordContainer">
                <label for="password">Mot de passe *</label>
                <div class="pwContainer">
                    <input type="password" name="password" id="password" required='required'>
                    <svg class="viewPW" viewBox="0 0 488.85 488.85">
                        <path d="M244.425,98.725c-93.4,0-178.1,51.1-240.6,134.1c-5.1,6.8-5.1,16.3,0,23.1c62.5,83.1,147.2,134.2,240.6,134.2s178.1-51.1,240.6-134.1c5.1-6.8,5.1-16.3,0-23.1C422.525,149.825,337.825,98.725,244.425,98.725z M251.125,347.025c-62,3.9-113.2-47.2-109.3-109.3c3.2-51.2,44.7-92.7,95.9-95.9c62-3.9,113.2,47.2,109.3,109.3C343.725,302.225,302.225,343.725,251.125,347.025z M248.025,299.625c-33.4,2.1-61-25.4-58.8-58.8c1.7-27.6,24.1-49.9,51.7-51.7c33.4-2.1,61,25.4,58.8,58.8C297.925,275.625,275.525,297.925,248.025,299.625z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="checkboxContainer">
            <label for="legalAge">
                <input type="checkbox" name="checkbox" id="legalAge" required='required'>
                <p>Je m'engage à respecter les <a href="index.php?action=legal">conditions d'utilisation</a>.</p>
            </label>
        </div>

        <div class="linksContainer">
            <input type="submit" id="submitSubscribe" value="S'inscrire">

        </div>

        <input type="hidden" name="recaptcha_response" id="recaptchaResponse">
        <p>
            *: Champs obligatoires
        </p>

    </form>

    <p>
        <a class="linkToConnect" href="index.php?action=connect">Déjà inscrit ?</a>
    </p>
</div>
<span id="ConfirmationMessage"></span>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css">
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="https://www.google.com/recaptcha/api.js?render=6Ld4D9oeAAAAAECFDuVReBAtfMb_jpIJF5yrQBCw"></script>
<script>
    grecaptcha.ready(() => {
        grecaptcha.execute('6Ld4D9oeAAAAAECFDuVReBAtfMb_jpIJF5yrQBCw', {
            action: 'subscribe'
        }).then(token => {
            document.querySelector('#recaptchaResponse').value = token;
        });
    });

    function showForm() {
        document.getElementById('btn-nogoogle').onclick = () => {
            document.getElementById('subscribeForm').style.display = 'flex';
            document.getElementById('btn-nogoogle').classList.add("active");
        }
    }
    window.onload = showForm()
</script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

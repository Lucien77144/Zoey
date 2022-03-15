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
            <label for="password">mot de passe *</label>
            <input type="password" name="password" id="password" required='required'>
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
<script src="https://accounts.google.com/gsi/client" async defer></script>
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
<script src="<?= BASE_URL ?>public/js/googleAuth.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

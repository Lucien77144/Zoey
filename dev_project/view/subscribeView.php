<?php
$pageTitle = "S'inscrire";
ob_start();
?>

<div class="subscribe">
    <h1>Inscrivez vous !</h1>
    <form class="subscribeForm">

        <div class="accountContainer">
            <div class="pseudoContainer formContent">
                <label for="pseudo">Pseudo / photo de profil *</label>
                <input type="text" name="pseudo" id="pseudoSubscribe" placeholder="pseudo" required='required'>
                <input type="file" id="media" hidden />
                <label class="choose_photo" for="media">Choisir une photo</label>
            </div>
        </div>

        <div class="name formContent">
            <label for="nom">Nom et prénom *</label>
            <input type="text" name="nom" id="nom" placeholder="nom" required='required'>
            <input type="text" name="prenom" id="prenom" placeholder="prenom" required='required'>
        </div>
        <div class="mailAndBirthContainer">
            <div class="mailContainer formContent">
                <label for="mail">Adresse e-mail *</label>
                <input type="email" name="mail" id="mail" placeholder="example@zoey.fr" required='required'>
            </div>
            <div class="dateOfBirthContainer formContent">
                <label for="date_naissance">date de naissance *</label>
                <input type="date" name="date_naissance" id="date_naissance" required='required'>
            </div>
        </div>

        <div class="formContent">
            <label for="password">mot de passe</label>
            <input type="password" name="password" id="password" required='required'>
        </div>

        <div class="checkboxContainer">
            <input type="checkbox" name="checkbox" required='required'>
            <label for="checkbox">Je certifie être majeur, ou dans le cas contraire, j’utilise ZOEY sous la supervision d’un responsable légale.</label>
        </div>

        <div class="linksContainer">
            <input type="submit" id="submitSubscribe" value="s'inscrire">
            <a href="">Déjà inscrit ?</a>
        </div>

        <p>*: Champs obligatoires</p>

    </form>
</div>
<span id="ConfirmationMessage"></span>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css">
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

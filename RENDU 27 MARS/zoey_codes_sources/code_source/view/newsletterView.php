<?php
// (not used anymore since february 2021)
// "work in progress" page to tell visitors to subscribe to the newsletter while waiting for the app to be released

$pageTitle = 'Qui sommes-nous ?';
$printNewsletter = false;
ob_start();
?>

<h1 class="underline title">Bientôt sur Zoey</h1>
<h2 class="title2">Un réseau social pour vos animaux de compagnie</h2>
<p>
    Partagez des photos et des vidéos de votre animal de compagnie.
</p>

<form class="newsletter" id="newsletterForm">
    <h1>Restez informés sur la sortie de notre réseau social !</h1>
    <input type="text" name="prenom" id="newsletterName" placeholder="Votre prénom">
    <input type="email" name="email" id="newsletterMail" placeholder="Votre e-mail *" required>
    <input type="submit" value="S'abonner" id="submitNewsletter">
    <p>*: Champs obligatoires</p>
    <span id="confirmationMessage"></span>
</form>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_presentation.css" />
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

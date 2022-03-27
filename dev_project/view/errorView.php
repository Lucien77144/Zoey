<?php
// page displayed when an error occured somewhere in the app

// default page title
$printNewsletter = false;
if (!isset($errorMsg)) {
    $errorMsg = 'Il y a eu une erreur';
}
ob_start();
?>

<main class="error">
    <section>
        <h1>Désolé :/</h1>
        <img src="<?= BASE_URL ?>public/images/icons/error.svg" alt="logo d'erreur">
        <h2><?= nl2br(htmlspecialchars($errorMsg)) ?></h2>
        <p>Nous contacter :</p>
        <div class="button_container">
            <a class="btn" href="mailto:contact@zoey-app.fr">Contacter par mail</a>
            <a class="btn" href="index.php">Retour à l'accueil</a>
        </div>
    </section>
</main>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_error.css">
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

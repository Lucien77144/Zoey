<?php
$pageTitle = "Administration";
$printNewsletter = false;
ob_start();
?>

<h2>Ajouter un refuge</h2>

<form>
    <label for="nom">nom*</label>
    <input type="text" name="nom" id="nom"> <br>

    <!-- <label for="description">description</label>
    <textarea name="description" id="description" cols="30" rows="10"></textarea> <br> -->
    
    <label for="lien">lien (site web, sinon page facebook ou autre)*</label>
    <input type="text" name="lien" id="lien"> <br>

    <label for="mail">mail</label>
    <input type="email" name="mail" id="mail"> <br>

    <!-- <label for="tel">telephone</label>
    <input type="tel" name="tel" id="tel"> <br> -->

    <label for="maps">lien google maps (vf <a href="https://drive.google.com/file/d/14KIEP_cR4EEhS5pTobZRoCDlT5H5jczq/view?usp=sharing" target="_blank">tuto lien embed</a>)*</label>
    
    <input type="text" name="maps" id="maps"> <br>

    <label for="adresse">adresse</label>
    <input type="text" name="adresse" id="adresse"> <br>

    <label for="logo">logo</label>
    <input type="file" name="logo" id="media"> <br>

    <input type="submit" value="Enregistrer" id="submitAjouterRefuge">
    <span id="confirmationMessage"></span>
</form>

<a href="index.php?action=admin" class="btn">Retour à la page d'administration</a>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css"> -->
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

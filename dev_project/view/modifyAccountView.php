<?php
$pageTitle = "Modifier mon compte";

/* autres champs de formulaire
    <form>
        <label for="nom">Nom :</label>
        <input type="text" name="nom" id="nom" placeholder="Nom">
        <input class="submitButton" type="submit" id="submitModifyAccountNom">
    </form>

    <form>
        <label for="prenom">Prénom :</label>
        <input type="text" name="prenom" id="prenom" placeholder="Prénom">
        <input class="submitButton" type="submit" id="submitModifyAccountPrenom">
    </form>

<form>
    <label for="date_naissance">Date de naissance :</label>
    <input type="date" name="date_naissance" id="date_naissance">
    <input class="submitButton" type="submit" id="submitModifyAccountDate">
</form>

<a class="btn seeAccount" href="index.php?action=account">voir mon compte</a>
*/

ob_start();

?>

<div class="mainModifyAccount">
    <h1>Modifier mes informations</h1>
    <?php

    if ($google) {
    ?>
        <p>Votre adresse mail est liée à votre compte Google, vous ne pouvez pas la modifier.</p>
        <a class="btn seeAccount" href="index.php?action=account">Retourner sur votre profil</a>
    <?php
    } else {
    ?>

        <div class="formsContainer">
            <form>
                <label for="mail">Adresse mail :</label>
                <input type="email" name="mail" id="mail" placeholder="adresse@mail.fr">
                <input class="submitButton" type="submit" value="Enregistrer" id="submitModifyAccountMail">
            </form>

            <form>
                <label for="password">Mot de passe :</label>
                <input type="password" name="password" id="password" placeholder="mot de passe">
                <input class="submitButton" type="submit" value="Enregistrer" id="submitModifyAccountPassword">
            </form>

            <span id="confirmationMessage"></span>
        </div>
</div>


<?php
    }
    $viewContent = ob_get_clean();

    // styles BLOCK
    ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_modifyAccount.css" />
<?php
$stylesBlock = ob_get_clean();
require(BASE_URL . 'public/template/template.php');

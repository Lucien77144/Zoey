<?php 
$pageTitle = "Modifier mon compte";
ob_start();
?>

<h1>Modifier mes informations</h1>

<div class="formsContainer">
    <form>
    <label for="nom">Nom :</label>
    <input type="text" name="nom" id="nom" placeholder="Nom">
    <input type="submit" id="submitModifyAccountNom">
</form>

<form>
    <label for="prenom">Prénom :</label>
    <input type="text" name="prenom" id="prenom" placeholder="Prénom"> 
    <input type="submit" id="submitModifyAccountPrenom">
</form>

<form>
    <label for="mail">Mail :</label>
    <input type="email" name="mail" id="mail" placeholder="adresse@mail.fr"> 
    <input type="submit" id="submitModifyAccountMail">
</form>

<form>
    <label for="date_naissance">Date de naissance :</label>
    <input type="date" name="date_naissance" id="date_naissance"> 
    <input type="submit" id="submitModifyAccountDate">
</form>

<form>
    <label for="password">Mot de passe :</label>
    <input type="password" name="password" id="password" placeholder="mot de passe"> 

    <input type="submit" id="submitModifyAccountPassword">
</form>

<span id="confirmationMessage"></span>
</div>


<a class="btn" href="index.php?action=account">voir mon compte</a>

<?php
    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_modifyAccount.css" />
<?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php    
    require(BASE_URL . 'public/template/template.php');
<?php 
$pageTitle = "Modifier mon compte";
ob_start();
?>

<h1>Modifier mon compte</h1>

<form>
    <label for="pseudo">pseudo</label>
    <input type="text" name="pseudo" id="pseudoSubscribe"> <br>
    <span id="pseudoConfirmationMessage"></span>
    <input type="submit" id="submitModifyAccountPseudo">
</form>

<form>
    <label for="media">photo de profil</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg"> <br>
    <input type="submit" id="submitModifyAccountMedia">
</form>

<form>
    <label for="nom">nom</label>
    <input type="text" name="nom" id="nom"> <br>
    <input type="submit" id="submitModifyAccountNom">
</form>

<form>
    <label for="prenom">prenom</label>
    <input type="text" name="prenom" id="prenom"> <br>
    <input type="submit" id="submitModifyAccountPrenom">
</form>

<form>
    <label for="mail">mail</label>
    <input type="email" name="mail" id="mail"> <br>
    <input type="submit" id="submitModifyAccountMail">
</form>

<form>
    <label for="date_naissance">date de naissance</label>
    <input type="date" name="date_naissance" id="date_naissance"> <br>
    <input type="submit" id="submitModifyAccountDate">
</form>

<form>
    <label for="password">mot de passe</label>
    <input type="password" name="password" id="password"> <br>

    <input type="submit" id="submitModifyAccountPassword">
</form>

<span id="confirmationMessage"></span>

<br>

<a href="index.php?action=account">voir mon compte</a>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
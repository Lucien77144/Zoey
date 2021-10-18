<?php 
$pageTitle = "Mondifier mon compte";
ob_start();
?>

<h1>Modifier mon compte</h1>

<form class="modifyAccountForm">
    <label for="pseudo">pseudo</label>
    <input type="text" name="pseudo" id="pseudoSubscribe"> <br>
    <label for="nom">nom</label>
    <input type="text" name="nom" id="nom"> <br>
    <label for="prenom">prenom</label>
    <input type="text" name="prenom" id="prenom"> <br>
    <label for="mail">mail</label>
    <input type="email" name="mail" id="mail"> <br>
    <label for="date_naissance">date de naissance</label>
    <input type="date" name="date_naissance" id="date_naissance"> <br>
    <label for="password">mot de passe</label>
    <input type="password" name="password" id="password"> <br>

    <input type="submit" id="submitSubscribe">
</form>
<span id="ConfirmationMessage"></span>

<br>

<a href="index.php?action=account">voir mon compte</a>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
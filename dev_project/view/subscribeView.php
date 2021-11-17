<?php 
$pageTitle = "S'inscrire";
ob_start();
?>

<form class="subscribeForm">
    <label for="pseudo">pseudo</label>
    <input type="text" name="pseudo" id="pseudoSubscribe"> <br>

    <label for="media">photo de profil</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg"> <br>
    
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

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
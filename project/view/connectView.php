<?php 
$pageTitle = "Se connecter";
ob_start();
?>

<form class="connectForm">
    <label for="pseudo">pseudo</label>
    <input type="text" name="pseudo" id="pseudo"> <br>
    <label for="password">mot de passe</label>
    <input type="password" name="password" id="password"> <br>

    <input type="submit" id="submitConnect">
</form>
<span id="ConfirmationMessage"></span>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
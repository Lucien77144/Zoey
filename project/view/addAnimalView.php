<?php 
$pageTitle = "Ajouter un nouvel animal à mon panier";
ob_start();
?>

<form class="addAnimalForm">
    <label for="nom">nom</label>
    <input type="text" name="nom" id="nom"> <br>
    <label for="description">description</label>
    <input type="text" name="description" id="description"> <br>
    <label for="date_naissance">date de naissance</label>
    <input type="date" name="date_naissance" id="date_naissance"> <br>
    <label for="idtype">catégorie d'animal</label>
    
    <select name="idtype" id="idtype">
        <option value="">--Please choose an option--</option>
        <option value="1">Poule</option>
    </select>

    <input type="submit" id="submitAddAnimal">
</form>
<span id="ConfirmationMessage"></span>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
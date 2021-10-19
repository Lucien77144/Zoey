<?php 
$pageTitle = "Publier un post";
if (!$accountAnimals){
    throw new Exception("Vous n'avez pas encore ajouté vos animaux de compagnie dans votre profil ! Seuls les propriétaires d'animaux peuvent poster sur Zoey.");
}
ob_start();
?>

<form id="addPostForm">
    <label for="description">description</label>
    <input type="text" name="description" id="description"> <br>

    <label for="media">photo</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg">
    
    <label for="idAnimal">Mon animal</label>
    <select name="idAnimal" id="idAnimal">
        <option value="">--Please choose an option--</option>
        <?php
        $animalIdCounter = 0;
        while ($animal = $accountAnimals -> fetch()){
            ?>
                <option value="<?= $animalIdCounter ?>"><?= htmlspecialchars($animal['nom_animal']) ?></option>
            <?php
            $animalIdCounter++;
        }
        ?>
    </select>

    <input type="submit" id="submitAddPost">
</form>
<span id="ConfirmationMessage"></span>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
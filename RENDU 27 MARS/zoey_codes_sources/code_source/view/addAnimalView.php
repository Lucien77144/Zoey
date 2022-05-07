<?php
// form to add an animal on one's profile (for users)

$pageTitle = "Ajouter un nouvel animal à mon panier";

ob_start();
?>
<main>
    <h1>Ajouter un animal</h1>
    <form class="addAnimalForm">

        <div class="nomWrap">
            <label for="nom">Nom de l'animal</label><br>
            <input type="text" name="nom" id="nom" placeholder="Snoopy">
        </div>


        <div class="mediaContainer">
            <label for="media">
                <img src="public/images/icons/addAnimal.svg" class="currentPicture">
                <input type="file" id="media" name="media" accept="image/png, image/jpeg">
            </label>
        </div>

        <div class="descWrap">
            <label for="description">Description</label><br>
            <textarea id="description" name="description" type="text" rows="5" cols="33" placeholder="Je suis un super camarade, très joueur et amical, j'ai..."></textarea>
        </div>

        <input type="submit" id="submitAddAnimal" value="Ajouter">
    </form>
    <p id="ConfirmationMessage"></p>
</main>


<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_addAnimal.css" />
<script src="public/js/addAnimal.js"></script>
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

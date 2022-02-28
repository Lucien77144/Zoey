<?php 
$pageTitle = "Publier un post";
ob_start();
if (!$accountAnimals){
    ?>
    <p>Vous n'avez pas encore ajouté vos animaux de compagnie dans votre profil ! Seuls les propriétaires d'animaux peuvent poster sur Zoey.</p>
    <?php
} else {
?>

<h1>Ajouter un post</h1>

<h3>Pour quel animal ?</h3>
<form id="addPostForm">

<div class="containerSelectAnim">
    <div class="selectAnimal">
        <?php
            $animalIdCounter = 0;
            while ($animal = $accountAnimals -> fetch()){
                ?>
                <div class="cardSelector">
                    <input type="radio" id="idAnimal" name="idAnimal" value="<?= $animalIdCounter ?>">
                    <label for="<?= $animalIdCounter ?>">
                        <h3><?= htmlspecialchars($animal['nom']) ?></h3>
                        <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['url_photo']) ?>" alt="">
                    </label>
                </div>
                <?php
                $animalIdCounter++;
            }
        ?>
    </div>
</div>

    <!-- <select name="idAnimal" id="idAnimal">
        <option value=""></option>
        <?php
        $animalIdCounter = 0;
        while ($animal = $accountAnimals -> fetch()){
            ?>
                <option value="<?= $animalIdCounter ?>"><?= htmlspecialchars($animal['nom']) ?></option>
            <?php
            $animalIdCounter++;
        }
        ?>
    </select> -->

    <h3>Contenu publié</h3>
    <label for="media">
        <div class="imgLoader">

        </div>
        <h5 class="btn">+ Choisir une image</h5>
        <input type="file" id="media" name="media" accept="image/png, image/jpeg">
    </label>

    <h3>description</h3>
    <div class="descWrapper"><textarea placeholder="Veuillez remplir ce champ..." name="description" id="description" cols="100" rows="10"></textarea></div>

    <div class="sendWrapper"><input value="Publier" type="submit" id="submitAddPost"></div>
</form>
<span id="ConfirmationMessage"></span>

<?php
}
    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_addPost.css" />
<?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <script src="public/js/addPost.js"></script>
<?php
    $scriptsBlock = ob_get_clean();

    require(BASE_URL . 'public/template/template.php');
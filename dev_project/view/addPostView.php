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

    <?php
        $animalIdCounter = 0;
        while ($animal = $accountAnimals -> fetch()){
            ?>
            <div>
                <input type="radio" id="<?= $animalIdCounter ?>" name="animal" value="<?= $animalIdCounter ?>">
                <label for="<?= $animalIdCounter ?>">
                    <h3><?= htmlspecialchars($animal['nom']) ?></h3>
                    <img src="<?= htmlspecialchars($animal['url_photo']) ?>" alt="">
                </label>
            </div>
            <?php
            $animalIdCounter++;
        }
    ?>

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


    <label for="description">description</label>
    <input type="text" name="description" id="description"> <br>

    <label for="media">photo</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg">

    <input type="submit" id="submitAddPost">
</form>
<span id="ConfirmationMessage"></span>

<?php 
}
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
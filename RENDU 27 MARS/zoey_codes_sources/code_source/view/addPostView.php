<?php
// form to add a post (for users)

$pageTitle = "Publier un post";
ob_start();
if (!$accountAnimals) {
?>
    <div class="neverAdd">
        <p>Vous n'avez pas encore ajouté vos animaux de compagnie dans votre profil !</p>
        <p>Seuls les propriétaires d'animaux peuvent poster sur Zoey.</p>
        <a class="addFirstWrap" href="index.php?action=addAnimal">
            <div class="addFirst">
                Ajouter un animal
                <svg viewBox="0 0 20 20">
                    <rect x="8.5" width="3" height="20" rx="1.5" fill="white" />
                    <rect y="8.5" width="20" height="3" rx="1.5" fill="white" />
                </svg>
            </div>
        </a>

    </div>
<?php
} else {
?>

    <h1 class="underline">Ajouter un post</h1>

    <h3 class="underTitle">Pour quel animal ?</h3>
    <form id="addPostForm">

        <div class="containerSelectAnim">
            <div class="selectAnimal">
                <?php
                $animalIdCounter = 0;

                if (isset($_GET['checked'])) {
                    $checked = intval($_GET['checked']);
                } else {
                    $checked = null;
                }

                while ($animal = $accountAnimals->fetch()) {
                ?>
                    <div class="cardSelector<?= $animal['idanimal'] == $checked ? " cardActive" : "" ?>">
                        <input type="radio" id="idAnimal<?= $animalIdCounter ?>" name="idAnimal" value="<?= $animalIdCounter ?>" <?= $animal['idanimal'] == $checked ? "checked" : "" ?>>
                        <label for="idAnimal<?= $animalIdCounter ?>">
                            <h3> <?php
                                    if (strlen(htmlspecialchars($animal['nom'])) > 28) {
                                        echo substr(htmlspecialchars($animal['nom']), 0, 24) . " ...";
                                    } else {
                                        echo htmlspecialchars($animal['nom']);
                                    }
                                    ?> </h3>
                            <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['url_photo']) ?>" alt="">
                        </label>
                    </div>
                <?php
                    $animalIdCounter++;
                }
                ?>
            </div>
        </div>

        <h3 class="underTitle">Image *</h3>
        <label for="media">
            <div class="imgLoader">

            </div>
            <h5 class="btn">+ Choisir une image</h5>
            <input type="file" id="media" name="media" accept="image/png, image/jpeg">
        </label>

        <h3 class="underTitle">Description</h3>
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

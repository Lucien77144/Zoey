<?php
$pageTitle = "Administration";
$printNewsletter = false;
$badges = $badges_list -> fetchAll();
ob_start();
?>

<h2>Ajouter un animal à adopter</h2>

<form>
    <label for="nom">nom</label>
    <input type="text" name="nom" id="nom"> <br>

    <label for="sexe">sexe</label>
    <select name="sexe" id="sexe">
        <option value="0">mâle</option>
        <option value="1">femelle</option>
        <option value="2">autre</option>
    </select>

    <br><br>

    <label for="media">photo de profil de l'animal</label>
    <input type="file" id="media" name="media" accept="image/png, image/jpeg"> <br>

    <label for="description">description</label>
    <textarea name="description" id="description" cols="30" rows="10"></textarea> <br>

    <label for="date_anniversaire">date de naissance</label>
    <input type="date" name="date_naissance" id="date_anniversaire"> <br>
    
    <label for="badge1">Badge 1 (obligatoire)</label>
    
    <select name="badge1" id="badge1">
        <option value=""></option>
        <?php
        foreach ($badges as $badge) {
            ?>
                <option value="<?= htmlspecialchars($badge['id']) ?>"><?= htmlspecialchars($badge['nom']) ?></option>
            <?php
        };
        ?>        
    </select> <br><br>

    <label for="badge2">Badge 2</label>
    
    <select name="badge2" id="badge2">
        <option value=""></option>
        <?php
        foreach ($badges as $badge) {
            ?>
                <option value="<?= htmlspecialchars($badge['id']) ?>"><?= htmlspecialchars($badge['nom']) ?></option>
            <?php
        };
        ?>  
    </select> <br><br>

    <label for="badge3">Badge 3</label>
    
    <select name="badge3" id="badge3">
        <option value=""></option>
        <?php
        foreach ($badges as $badge) {
            ?>
                <option value="<?= htmlspecialchars($badge['id']) ?>"><?= htmlspecialchars($badge['nom']) ?></option>
            <?php
        };
        ?>  
    </select> <br><br>

    <label for="idtype">catégorie d'animal</label>
    
    <select name="idtype" id="idtype">
        <option value=""></option>
        <?php
        $categoryCounter = 0;
        while ($categorie = $types_animaux -> fetch()){
            ?>
                <option value="<?= $categoryCounter ?>"><?= htmlspecialchars($categorie['nom']) ?></option>
            <?php
            $categoryCounter++;
        }
        ?>
    </select> <br><br>

    <label for="idrefuge">refuge</label>
    
    <select name="idrefuge" id="idrefuge">
        <option value=""></option>
        <?php
        while ($refuge = $liste_refuges -> fetch()){
            ?>
                <option value="<?= htmlspecialchars($refuge['id']) ?>"><?= htmlspecialchars($refuge['nom']) ?></option>
            <?php
        }
        ?>
    </select> <br><br>

    <input type="submit" id="submitAjouterAnimalAdopter">
    <span id="confirmationMessage"></span>
</form>

<br>

<a href="index.php?action=admin" class="btn">Retour à la page d'administration</a>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css"> -->
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

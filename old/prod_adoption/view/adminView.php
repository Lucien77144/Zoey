<?php
$pageTitle = "Administration";
$printNewsletter = false;
ob_start();
?>

<h1>Page d'administration</h1>



<br><br>

<label for="idrefuge">Refuges</label>
    
<select name="idrefuge" id="idrefuge">
    <option value=""></option>
    <?php
    while ($refuge = $liste_refuges -> fetch()){
        ?>
            <option value="<?= htmlspecialchars($refuge['id']) ?>"><?= htmlspecialchars($refuge['nom']) ?></option>
        <?php
    }
    ?>
</select> 

<button id="deleteRefuge">Supprimer ce refuge</button>
<span id="confirmationMessageRefuge"></span>

<br><br>
<br>

<a href="index.php?action=adminAjouterRefuge" class="btn">Ajouter un refuge</a>


<br><br><br><br>

<label for="idanimal">Animaux à adopter</label>
    
<select name="idanimal" id="idanimal">
    <option value=""></option>
    <?php
    while ($aa = $liste_aa -> fetch()){
        ?>
            <option value="<?= htmlspecialchars($aa['id']) ?>"><?= htmlspecialchars($aa['nom']) . " (" . htmlspecialchars($aa['refuge']) . ")" ?></option>
        <?php
    }
    ?>
</select>
<button id="deleteAA">Supprimer cet animal</button>
<span id="confirmationMessageAA"></span>
 <br><br>

<br>

<a href="index.php?action=adminAjouterAnimalAdopter" class="btn">Ajouter un animal à adopter</a>
<br>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css"> -->
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

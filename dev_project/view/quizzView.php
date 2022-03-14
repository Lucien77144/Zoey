<?php
$printNewsletter = false;
$pageTitle = 'Trouver votre compagnon idéal';

/*
<label for="idtype<?= $i + 1 ?>">Votre animal <?= $i + 1; echo $i > 0 ? " (facultatif)" : null ?> :</label>
*/
ob_start();
?>
<h1>QUIZZ</h1>
<p class="quizzDescription">Avant de parcourir notre page adoption, ZOEY vous permet de trouver plus efficacement l’animal de compagnie qui vous
    correspond ! Il vous suffit de répondre aux 8 questions de ce quizz. </p>
<form>
    <div>
        <h2>1. De quel espace de vie disposez-vous ?</h2>
        <div><input type="radio" name="space" id="space1" value="0"><label for="space1">un studio</label><br></div>
        <div><input type="radio" name="space" id="space2" value="0"><label for="space2">un appartement spacieux</label><br></div>
        <div><input type="radio" name="space" id="space3" value="0"><label for="space3">une maison sans jardin</label><br></div>
        <div><input type="radio" name="space" id="space4" value="1"><label for="space4">une maison avec jardin</label></div>
    </div>
    <div>
        <h2>2. Votre espace de vie est-il sécurisé <br> (balcons, fenêtres etc..) ?</h2>
        <div><input type="radio" name="secure" id="secure1" value="1"><label for="secure1">oui</label><br></div>
        <div><input type="radio" name="secure" id="secure2" value="0"><label for="secure2">non</label></div>
    </div>
    <div>
        <h2>3. Votre futur animal de compagnie devra-il cohabiter avec des enfants ?</h2>
        <div><input type="radio" name="children" id="cohabite1" value="1"><label for="cohabite1">oui</label><br></div>
        <div><input type="radio" name="children" id="cohabite2" value="0"><label for="cohabite2">non</label></div>
    </div>
    <div>
        <h2>4. A quelle fréquence voyagez-vous ?</h2>
        <div><input type="radio" name="travel" id="trip1" value="1"><label for="trip1">régulièrement, à chaque occasion</label><br></div>
        <div><input type="radio" name="travel" id="trip2" value="0"><label for="trip2">rarement, une fois par an et encore...</label><br></div>
        <div><input type="radio" name="travel" id="trip3" value="0"><label for="trip3">jamais</label></div>
    </div>
    <div>
        <h2>5. Quelle est la chose la plus importante selon vous dans un animal de compagnie ?
        </h2>
        <div><input type="radio" name="personality" id="important1" value="1"><label for="important1">un animal joueur</label><br></div>
        <div><input type="radio" name="personality" id="important2" value="2"><label for="important2">un animal tendre et affectueux </label><br></div>
        <div><input type="radio" name="personality" id="important3" value="3"><label for="important3">un animal indépendant </label><br></div>
        <div><input type="radio" name="personality" id="important4" value="4"><label for="important4">un animal calme</label></div>
    </div>
    <div>
        <h2>6. Votre futur animal de compagnie vivra-t-il avec d’autres animaux au sein de votre foyer ?
        </h2>
        <div><input type="radio" name="animals" id="foyer1" value="1"><label for="foyer1">oui</label><br></div>
        <div><input type="radio" name="animals" id="foyer2" value="0"><label for="foyer2">non</label></div>
    </div>
    <div>
        <h2>7. Le meilleur moyen de vous détendre ?</h2>
        <div><input type="radio" name="walk" id="detente1" value="1"><label for="detente1">une longue balade en forêt</label><br></div>
        <div><input type="radio" name="walk" id="detente2" value="0"><label for="detente2">une séance de sport</label><br></div>
        <div><input type="radio" name="walk" id="detente3" value="0"><label for="detente3">rejoindre mes amis</label></div>
    </div>

    <div>
        <h2>8. Votre animal préféré : </h2>

        <?php
        $categorie = $types_animaux->fetchAll();
        for ($i = 0; $i < 1; $i++) {
        ?>
            <br>
            <select name="idtype<?= $i + 1 ?>" id="idtype<?= $i + 1 ?>">
                <option value=""></option>
                <?php
                foreach ($categorie as $c) {
                ?>
                    <option value="<?= htmlspecialchars($c['id']) ?>"><?= htmlspecialchars($c['nom']) ?></option>
                <?php
                }
                ?>
            </select> <br>
        <?php
        }
        ?>
    </div>

    <input type="submit" id="submitQuizz" value="Envoyer">
</form>
<span id="confirmationMessage"></span>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_quizz.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/quizz.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

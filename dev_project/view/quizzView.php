<?php 
$pageTitle = 'Qui sommes-nous ?';
ob_start();
?>
<h1>QUIZZ</h1>
<p class="quizzDescription">Avant de parcourir notre page adoption, ZOEY vous permet de trouver plus efficacement l’animal de compagnie qui vous
    correspond ! Il suffit de répondre aux 7 questions de ce quizz. </p>
<form>
    <div>
        <h2>1. De quel espace de vie disposez-vous ?</h2>
        <div><input type="radio" name="space" id="" value="0"><label>un studio</label><br></div>
        <div><input type="radio" name="space" id="" value="0"><label>un appartement spacieux</label><br></div>
        <div><input type="radio" name="space" id="" value="0"><label>une maison sans jardin</label><br></div>
        <div><input type="radio" name="space" id="" value="1"><label>une maison avec jardin</label></div>
    </div>
    <div>
        <h2>2. Votre espace de vie est-il sécurisé (balcons, fenêtres etc..) ?</h2>
        <div><input type="radio" name="secure" id="" value="1"><label>oui</label><br></div>
        <div><input type="radio" name="secure" id="" value="0"><label>non</label></div>
    </div>
    <div>
        <h2>Votre futur animal de compagnie devra-il cohabiter avec des enfants ?</h2>
        <div><input type="radio" name="children" id="" value="1"><label>oui</label><br></div>
        <div><input type="radio" name="children" id="" value="0"><label>non</label></div>
    </div>
    <div>
        <h2>3. A quelle fréquence voyagez-vous ?</h2>
        <div><input type="radio" name="travel" id="" value="1" s><label>régulièrement, à chaque occasion</label><br></div>
        <div><input type="radio" name="travel" id="" value="0"><label>rarement</label><br></div>
        <div><input type="radio" name="travel" id="" value="0"><label>jamais, une fois par mois et encore...</label></div>
    </div>
    <div>
        <h2>4. Quelle est la chose la plus importante selon vous dans un animal de compagnie ?
        </h2>
        <div><input type="radio" name="personality" id="" value="1"><label>un animal joueur</label><br></div>
        <div><input type="radio" name="personality" id="" value="2"><label>un animal tendre et affectueux </label><br></div>
        <div><input type="radio" name="personality" id="" value="3"><label>un animal indépendant </label><br></div>
        <div><input type="radio" name="personality" id="" value="4"><label>un animal calme</label></div>
    </div>
    <div>
        <h2>5. Votre futur animal de compagnie vivra-t-il avec d’autres animaux au sein de votre foyer ?
        </h2>
        <div><input type="radio" name="animals" id="" value="1"><label>oui</label><br></div>
        <div><input type="radio" name="animals" id="" value="0"><label>non</label></div>
    </div>
    <div>
        <h2>6. Le meilleur moyen de vous détendre ?</h2>
        <div><input type="radio" name="walk" id="" value="1"><label>une longue balade en forêt</label><br></div>
        <div><input type="radio" name="walk" id="" value="0"><label>une séance de sport</label><br></div>
        <div><input type="radio" name="walk" id="" value="0"><label>rejoindre mes amis</label></div>
    </div>

    <div>
        <h2>7. Vos trois animaux préférés : </h2>

        <?php
            $categorie = $types_animaux -> fetchAll();
            for ($i=0; $i < 3; $i++) {
                ?>
        <label class="labelForType" for="idtype<?= $i+1 ?>">Votre animal <?= $i+1 ?> :</label>
        <select name="idtype<?= $i+1 ?>" id="idtype<?= $i+1 ?>">
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

    <input type="submit" id="submitQuizz">
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
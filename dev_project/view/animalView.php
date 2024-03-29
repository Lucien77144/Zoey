<?php 
$animal = $animal->fetch();
ob_start();
?>

<h1><?= htmlspecialchars($animal['nom_animal']) ?></h1>

<img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['photo_animal']) ?>" alt="">

<p>Je m'appelle <?= htmlspecialchars($animal['nom_animal']) ?>. <br>
<div class="defaultBlock">
    <?= nl2br(htmlspecialchars($animal['description_animal'])) ?>
</div>
</p>

<?php
if(isset($_SESSION['idUser'])){
    if($animal['iduser'] == $_SESSION['idUser'] && verifyToken()){
?>
        <a href="index.php?action=modifyAnimal&id=<?= htmlspecialchars($animal['idanimal']) ?>">modifier son profil</a>
<?php
    }
}
?>

<h2>Mes posts</h2>

<?php
if (!$animalFeed){ // renvoie vaut false si aucun animal lié à ce compte n'a été trouvé en bdd
    ?>
    <p>Je n'ai encore jamais posté !</p>    
    <?php
} else {
    while ($post = $animalFeed->fetch()) {
        ?>
            <article class="defaultBlock">
                <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
                <a href="index.php?action=animal&id=<?= htmlspecialchars($post['idanimal']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
                    <h1>
                        <?= htmlspecialchars($post['nom']) ?>
                    </h1>
                </a>
                
                <p>
                    <?= nl2br(htmlspecialchars($post['description'])) ?>
                </p>
                <a href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">voir le post</a>
            </article>
            
        <?php
    }
    $animalFeed->closeCursor();
}

$animalView = ob_get_clean();
<?php 
$account = $account->fetch();

$pageTitle = htmlspecialchars($account['pseudo_user']);
ob_start();
?>

<h1><?= htmlspecialchars($account['pseudo_user']) ?></h1>

<img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($account['photo_user']) ?>" alt="">

<p><?= htmlspecialchars($account['description']) ?></p>

<?php
if(isset($_SESSION['idUser'])){
    if($account['iduser'] == $_SESSION['idUser'] && verifyToken()){
?>
        <a href="index.php?action=modifyAccount">modifier mon profil</a>
        <br>
        <a href="index.php?action=addAnimal">ajouter un nouvel animal à mon panier</a>
<?php
    } else if ($account['iduser'] == $_SESSION['idUser']) {
        ?>
        <a href="index.php?action=connect">Vous avez été déconnecté (inactif depuis plus de 15 minutes). Reconnectez-vous pour pouvoir modifier votre profil.</a>
        <?php
    }
}

?>
    <h2>Mon panier</h2>
<?php

if (!$accountAnimals){ // renvoie vaut false si aucun animal lié à ce compte n'a été trouvé en bdd
    ?>
    <p>Mon panier est vide pour le moment... Je n'ai pas encore d'animaux de compagnie !</p>    
    <?php
} else {
    while ($animal = $accountAnimals->fetch()) {
        ?>
        <a href="index.php?action=animal&id=<?= htmlspecialchars($animal['idanimal']) ?>">
            <p><?= htmlspecialchars($animal['nom_animal']) ?></p>
            <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo_animal']) ?>" alt="">
        </a>
        <?php
    }
}

    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
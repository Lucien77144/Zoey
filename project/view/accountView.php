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

        <h2>Mon panier</h2>

        <a href="index.php?action=addAnimal">ajouter un nouvel animal à mon panier</a>
<?php
    } else if ($account['iduser'] == $_SESSION['idUser']) {
        ?>
        <a href="index.php?action=connect">Vous avez été déconnecté. Reconnectez-vous pour pouvoir modifier votre profil.</a>
        <?php
    }
}
?>



<?php
if (isset($account['nom_animal']) && isset($account['idanimal']) && isset($account['photo_animal'])){ // rajouter une boucle pour plusieurs animaux
?>
<a href="index.php?action=animal&id=<?= htmlspecialchars($account['idanimal']) ?>">
    <p><?= htmlspecialchars($account['nom_animal']) ?></p>
    <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($account['photo_animal']) ?>" alt="">
</a>
<?php    
} else {
    ?>
    <p>Mon panier est vide pour le moment... Je n'ai pas encore d'animaux de compagnie !</p>    
    <?php
}
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
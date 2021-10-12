<?php 
$animal = $animal->fetch();
$pageTitle = "Profil de " . htmlspecialchars($animal['nom_animal']);
ob_start();
?>

<h1><?= htmlspecialchars($animal['nom_animal']) ?></h1>

<img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo_animal']) ?>" alt="">

<p>Je m'appelle <?= htmlspecialchars($animal['nom_animal']) ?></p>

<?php
if(isset($_SESSION['idUser'])){
    if($animal['iduser'] == $_SESSION['idUser'] && verifyToken()){
?>
        <a href="index.php?action=modifyAnimal">modifier son profil</a>
<?php
    }
}
?>

<h2>Mon maître</h2>

<a href="index.php?action=account&id=<?= htmlspecialchars($animal['iduser']) ?>">
    <p><?= htmlspecialchars($animal['pseudo_user']) ?></p>
    <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo_user']) ?>" alt="">
</a>

<?php 
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
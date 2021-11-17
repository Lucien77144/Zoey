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
    } else if (!verifyToken() && isset($_SESSION['idUser'])) {
        ?>
        <a href="index.php?action=connect">Vous avez été déconnecté (inactif depuis plus de 15 minutes). Reconnectez-vous pour pouvoir ajouter <?= htmlspecialchars($account['pseudo_user']) ?> en ami.</a>
        <?php
    } else if (isFriend($account['iduser']) == 2){ // 2 : ami
        ?>
        <button id="removeFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Enlever de mes amis</button>
        <?php
    } else if (!isFriend($account['iduser'])){
        ?>
        <button id="addFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Ajouter en ami</button>
        <span id="confirmationMessage"></span>
        <?php
    } else if (isFriend($account['iduser']) == 11){ // 11 : en attente, utilisateur demandeur
        ?>
        <p>Votre demande d'ami est en attente</p>
        <?php
    } else if (isFriend($account['iduser']) == 12){ // 12 : en attente, utilisateur receveur
        ?>
        <button id="acceptFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Accepter la demande d'ami</button>
        <span id="confirmationMessage"></span>
        <?php
    } else {
        throw new Exception("Nous n'avons pas trouvé cet utilisateur");
    }
}

?>
    <h2>Mon panier</h2>
<?php

if (!$accountAnimals){ // renvoie false si aucun animal lié à ce compte n'a été trouvé en bdd
    ?>
    <p>Mon panier est vide pour le moment... Je n'ai pas encore d'animaux de compagnie !</p>
    <?php
} else {
    ?>
        <nav id="nav_animal">
            <ul>
                <?php
                    $i = 0;
                    while ($accountAnimal = $accountAnimals->fetch()) {
                        $animalId[$i] = htmlspecialchars($accountAnimal['idanimal']);
                        ?>
                        <li><a href="" data-animalId="<?= htmlspecialchars($animalId[$i]) ?>"><?= htmlspecialchars($accountAnimal['nom']) ?></a></li>
                        <?php
                        $i++;
                    }
                    $_SESSION['printAnimal'] = $animalId;
                ?>
            </ul>
        </nav>
        <div id="animalViewContainer">
            <?php
            require('print.php');
            printAnimal($animalId[0]);
            ?>
        </div> 
        <!-- <span id="confirmationMessage"></span> -->
    <?php
    
}

    $viewContent = ob_get_clean();
    
    // SCRIPT BLOCK
    ob_start(); ?>
    <script src="public/js/print.js"></script>
<?php
    $scriptsBlock = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
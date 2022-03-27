<?php
// profile of an animal in the adoption part

$animal = $adoptionAnimal->fetch();
$adoptionAnimalBadges = getAdoptionAnimalBadges($animal['idaa']);

// convertir anniversaire en âge
$date1 = new DateTime(date('Y-m-d', time()));
$date2 = new DateTime($animal['anniversaire']);
$interval = $date1->diff($date2);
$ageAA = $interval->y;

$pageTitle = htmlspecialchars($animal['nom']);
ob_start();
?>
<a class="back" href="index.php?action=adoption&slider=prevent">
    <svg viewBox="0 0 21 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0.292893 7.29289C-0.0976311 7.68342 -0.0976311 8.31658 0.292893 8.70711L6.65685 15.0711C7.04738 15.4616 7.68054 15.4616 8.07107 15.0711C8.46159 14.6805 8.46159 14.0474 8.07107 13.6569L2.41421 8L8.07107 2.34315C8.46159 1.95262 8.46159 1.31946 8.07107 0.928932C7.68054 0.538408 7.04738 0.538408 6.65685 0.928932L0.292893 7.29289ZM21 7L1 7V9L21 9V7Z" fill="#F3811C" />
    </svg>
</a>


<h1 class="nom"><?= htmlspecialchars($animal['nom']) ?></h1>
<a href="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['photo']) ?>" class="image" style="background-image: url('<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['photo']) ?>');"></a>

<div class="infosG">
    <div class="age">
        <?php
        $date1 = new DateTime(date('Y-m-d', time()));
        $date2 = new DateTime($animal['anniversaire']);
        $interval = $date1->diff($date2);
        $ageAA = $interval->y;
        if ($ageAA < 200 && $ageAA >= 1) {
        ?>
            <strong>Âge : </strong><?= $ageAA ?> ans
        <?php
        } else if ($ageAA < 1) {
        ?>
            <strong>Âge : </strong>moins d'un an
        <?php
        } else { ?>
            Âge inconnu<br>
        <?php }
        ?>
    </div>
    <div class="sexe">
        <strong>Sexe : </strong>
        <?php
        switch ($animal['sexe']) {
            case 0:
                echo 'Mâle';
                break;
            case 1:
                echo 'Femelle';
                break;
            case 2:
                echo 'Autre ou inconnu';
                break;
        }
        ?>
    </div>
</div>

<h1 class="underline">Qui suis-je ?</h1>
<p class="descAnimal">
    <?= nl2br(htmlspecialchars($animal['description'])) ?>
</p>
<div class="WrapBadge">
    <?php

    if ($animal['sexe'] == 0) {
        $pronom1 = 'Il';
        $pronom2 = 'le';
        $pronom3 = 'il';
        $terminaison1 = '';
        $terminaison2 = 'x';
        $terminaison3 = 'x';
        $terminaison4 = 'f';
    } else {
        $pronom1 = 'Elle';
        $pronom2 = 'la';
        $pronom3 = 'elle';
        $terminaison1 = 'e';
        $terminaison2 = 'ce';
        $terminaison3 = 'se';
        $terminaison4 = 've';
    }

    $badge1_titre = 'Jouer';
    $badge1_desc = htmlspecialchars($animal['nom']) . ' est très acti' . $terminaison4 . ' et ne demande qu’à jouer. ' . $pronom1 . ' a besoin de faire beaucoup d’exercice pour évacuer son énergie et fait un' . $terminaison1 . ' partenaire de jeu idéal.';

    $badge2_titre = 'S’entend bien avec enfants';
    $badge2_desc = htmlspecialchars($animal['nom']) . ' est sociable, dou' . $terminaison2 . ', fidèle et attachant' . $terminaison1 . '. ' . $pronom1 . ' deviendra vite ' . $pronom2 . ' meilleur' . $terminaison1 . ' ami' . $terminaison1 . ' de vos enfants.';

    $badge3_titre = 'Extérieur';
    $badge3_desc = htmlspecialchars($animal['nom']) . ' a besoin de se dépenser à l’air libre. Un espace extérieur vaste serait idéal.';

    $badge4_titre = 'Hibernation';
    $badge4_desc = 'Quand les températures chutent, ' . htmlspecialchars($animal['nom']) . ' a besoin d’hiberner pour survivre à la saison froide.';

    $badge5_titre = 'Caresses';
    $badge5_desc = htmlspecialchars($animal['nom']) . ' est affectueu' . $terminaison3 . ', ' . $pronom3 . ' aime les contacts physiques avec son maître. Des caresses et des gratouilles ' . $pronom2 . ' comblera.';

    $badge6_titre = 'Balades et promenades';
    $badge6_desc = 'Les promenades et les balades sont essentielles pour ' . htmlspecialchars($animal['nom']) . '. En forêt, dans un bois ou dans un parc.';

    $badge7_titre = 'Autonomie';
    $badge7_desc = 'La solitude de temps à autre ne lui pose pas de problème. ' . htmlspecialchars($animal['nom']) . ' est autonome mais pas ermite !';

    $badge8_titre = 'Calme';
    $badge8_desc = htmlspecialchars($animal['nom']) . ' est avant tout un animal calme qui a besoin d’un environnement apaisé.';

    $badge9_titre = 'Contact avec d’autres';
    $badge9_desc = htmlspecialchars($animal['nom']) . ' a besoin de contact avec d’autres animaux dans son futur foyer.';

    $badge10_titre = 'Environnement sécurisé';
    $badge10_desc = htmlspecialchars($animal['nom']) . ' a besoin d’un logement sécurisé (sécurisation des  fenêtres, des balcons et des jardins).';

    $i = 0;
    while ($badge = $adoptionAnimalBadges->fetch()) {
        switch ($badge['idbadge']) {
            case 1:
                $badgeTitle = $badge1_titre;
                $badgeDesc = $badge1_desc;
                break;
            case 2:
                $badgeTitle = $badge2_titre;
                $badgeDesc = $badge2_desc;
                break;
            case 3:
                $badgeTitle = $badge3_titre;
                $badgeDesc = $badge3_desc;
                break;
            case 4:
                $badgeTitle = $badge4_titre;
                $badgeDesc = $badge4_desc;
                break;
            case 5:
                $badgeTitle = $badge5_titre;
                $badgeDesc = $badge5_desc;
                break;
            case 6:
                $badgeTitle = $badge6_titre;
                $badgeDesc = $badge6_desc;
                break;
            case 7:
                $badgeTitle = $badge7_titre;
                $badgeDesc = $badge7_desc;
                break;
            case 8:
                $badgeTitle = $badge8_titre;
                $badgeDesc = $badge8_desc;
                break;
            case 9:
                $badgeTitle = $badge9_titre;
                $badgeDesc = $badge9_desc;
                break;
            case 10:
                $badgeTitle = $badge10_titre;
                $badgeDesc = $badge10_desc;
                break;
        }

        if ($i >= 3)
            break;
        $i++;
    ?>
        <div class="badgeDesc <?= $i == 1 ? '' : 'close' ?>">
            <div class="illus">
                <img src="public/images/badges/<?= $badge['url_icone'] ?>" alt="">
                <h2>
                    <?= $badgeTitle ?>
                </h2>
            </div>
            <div class="descWrap">
                <p>
                    <?= $badgeDesc ?>
                </p>
            </div>
        </div>
    <?php
    }
    ?>
</div>
<h1 class="underline">Où me trouver ?</h1>
<iframe src="<?= htmlspecialchars($animal['maps']) ?>" allowfullscreen="" loading="lazy"></iframe>
<a class="btn refuge" id="popUpLauncher">Contacter le refuge</a>

<!-- popUp Refuge : hidden by default -->
<div class="wrapperPopUp" id="popUpContainer">
    <div class="popUp">
        <div class="croix" id="popUpClose"><img src="<?= BASE_URL . 'public/images/icons/popUp/croix.svg' ?>" alt=""></div>
        <h1 class="contact"><?= htmlspecialchars($animal['refuge_nom']) ?></h1>

        <?php if (isset($animal['refuge_logo'])) {
        ?>
            <img src="public/images/upload/<?= htmlspecialchars($animal['refuge_logo']) ?>" alt="" class="logoRefuge">

        <?php } ?>

        <?php if (isset($animal['refuge_mail'])) {
        ?>
            <div class="contactContainer mail">
                <img src="<?= BASE_URL . 'public/images/icons/popUp/mail.svg' ?>" class="icon" alt="">
                <div class="popUpTextContainer">
                    <p class="popUpText">Mail : <?= htmlspecialchars($animal['refuge_mail']) ?></p>
                </div>
            </div>
            <a href="mailto:<?= htmlspecialchars($animal['refuge_mail']) ?>" class="btn">Contacter par mail</a>

        <?php } ?>

        <div class="contactContainer web">
            <img src="<?= BASE_URL . 'public/images/icons/popUp/web.svg' ?>" class="icon" alt="">
            <div class="popUpTextContainer">
                <p class="popUpText">Site web : <?= htmlspecialchars($animal['refuge_lien']) ?></p>
            </div>
        </div>
        <a href="<?= htmlspecialchars($animal['refuge_lien']) ?>" target="_blank" class="btn">Voir le site web</a>

        <?php if (isset($animal['refuge_adresse'])) {
        ?>
            <div class="contactContainer location">
                <img src="<?= BASE_URL . 'public/images/icons/popUp/location.svg' ?>" class="icon" alt="">
                <div class="popUpTextContainer">
                    <p class="popUpText">Adresse : <?= htmlspecialchars($animal['refuge_adresse']) ?></p>
                </div>
            </div>

        <?php } ?>
    </div>
</div>

<?php
$adoptionAnimal->closeCursor();
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_adoption.css" />
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_popUp.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/adoption-animation-badge.js"></script>
<script src="public/js/script.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

<?php
$pageTitle = 'Animaux à adopter';
ob_start();

?>
<div class="quizzBubble">
    <p>Découvrez les animaux à adopter les plus adaptés à vos préférences ! Vous pouvez mettre à jour ces préférences en envoyant <a href="index.php?action=quizz">de nouvelles réponses au quizz</a>.</p>
</div>

<nav class="filterAnimal">
    <div class="filterInner">
        <ul class="filterWrapper">
            <?php
            while ($categorie = $types_animaux->fetch()) {
            ?>
                <li class="animalBreed" id="filterType0<?= $categorie['id'] ?>"><?= ucfirst(($categorie['nom'])) ?></li>
            <?php
            }
            ?>
        </ul>
    </div>
</nav>

<main>
    <?php
    foreach ($feedAdoption as $animal) {
        $adoptionAnimalBadges = getAdoptionAnimalBadges($animal['idaa']);
        // convertir anniversaire en âge
        $date1 = new DateTime(date('Y-m-d', time()));
        $date2 = new DateTime($animal['anniversaire']);
        $interval = $date1->diff($date2);
        $ageAA = $interval->y;
    ?>

        <article class="card">
            <a class="imgWrap" href="index.php?action=adoption&id=<?= htmlspecialchars($animal['idaa']) ?>">
                <div class="img" style="background-image: url('<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($animal['photo']) ?>');"></div>
            </a>
            <div class="desc">
                <h2 class="title2"><?= htmlspecialchars($animal['nom']) ?></h2>
                <div class="badges">
                    <?php
                    $i = 0;
                    while ($badge = $adoptionAnimalBadges->fetch()) {
                        if ($i >= 3)
                            break;
                        $i++;
                    ?>
                        <img class="badge" src="public/images/badges/<?= $badge['url_icone'] ?>" alt="">
                    <?php
                    }
                    ?>
                </div>
                <p>
                    <strong>Catégorie : </strong><?= htmlspecialchars($animal['type_nom']) ?><br>
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
                    ?><br>
                    <?php
                    if ($ageAA < 200 && $ageAA >= 1) {
                    ?>
                        <strong>Âge : </strong><?= $ageAA ?> ans<br>
                    <?php
                    } else if ($ageAA < 1) {
                    ?>
                        <strong>Âge : </strong>moins d'un an<br>
                    <?php
                    }
                    ?>
                </p>
                <a href="index.php?action=adoption&id=<?= htmlspecialchars($animal['idaa']) ?>" class="btn">En savoir plus</a>
            </div>
        </article>

    <?php
    }
    ?>
</main>
<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_adoption.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/filter.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

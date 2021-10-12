<?php 
$animal = $adoptionAnimal->fetch();

// convertir anniversaire en âge
$date1 = new DateTime(date('Y-m-d', time()));
$date2 = new DateTime($animal['anniversaire']);
$interval = $date1->diff($date2);
$ageAA = $interval->y;

$pageTitle = htmlspecialchars($animal['nom']);
ob_start();
?>
    <article class="defaultBlock">
        <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo']) ?>" alt="">
        <h1>
            <?= htmlspecialchars($animal['nom']) ?>
        </h1>

        <h2>
            <?= $ageAA?> ans
        </h2>
        
        <p>
            <?= nl2br(htmlspecialchars($animal['description'])) ?>
        </p>
        <p>Je vis dans le refuge <a href="index.php?action=refuge&id=<?= htmlspecialchars($animal['refuge_idrefuge']) ?>"><?= htmlspecialchars($animal['refuge_nom']) ?></a> :  <a href="<?= htmlspecialchars($animal['refuge_lien']) ?>"><?= htmlspecialchars($animal['refuge_lien']) ?></a></p>
    </article>
    
<?php
    $adoptionAnimal->closeCursor();
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
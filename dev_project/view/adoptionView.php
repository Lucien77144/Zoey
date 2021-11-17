<?php 
$pageTitle = 'Animaux à adopter';
ob_start();

while ($animal = $feedAdoption->fetch())
{
    // convertir anniversaire en âge
    $date1 = new DateTime(date('Y-m-d', time()));
    $date2 = new DateTime($animal['anniversaire']);
    $interval = $date1->diff($date2);
    $ageAA = $interval->y;
?>
    <article class="defaultBlock">
        <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo']) ?>" alt="">
        <a href="index.php?action=adoption&id=<?= htmlspecialchars($animal['idaa']) ?>" title="voir le profil de <?= htmlspecialchars($animal['nom']) ?>">
            <h1>
                <?= htmlspecialchars($animal['nom']) ?>
            </h1>
        </a>
        
        <p>J'ai <?= $ageAA?> ans et je vis dans le refuge <a href="index.php?action=refuge&id=<?= htmlspecialchars($animal['refuge_idrefuge']) ?>"><?= htmlspecialchars($animal['refuge_nom']) ?></a> :  <a href="<?= htmlspecialchars($animal['refuge_lien']) ?>"><?= htmlspecialchars($animal['refuge_lien']) ?></a></p>
        <p>
            <?= substr(nl2br(htmlspecialchars($animal['description'])), 0, 250) . " ..." ?>
        </p>
        <a href="index.php?action=adoption&id=<?= htmlspecialchars($animal['idaa']) ?>">Voir son profil détaillé</a>
    </article>
    
<?php
}
$feedAdoption->closeCursor();
    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
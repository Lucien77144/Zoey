<?php
require("model.php");

$feed = getFeed(htmlspecialchars($_POST['posts']));

while ($post = $feed->fetch()) {
?>
    <article class="defaultBlock">
        <img class="blockIllus" src="<?='public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
        <div class="textContent">
            <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
                <h1>
                    <?= htmlspecialchars($post['nom']) ?>
                </h1>
            </a>

            <p>
                <?= nl2br(htmlspecialchars($post['description'])) ?>
            </p>
            <a class="seeMore" href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">voir le post</a>
        </div>
    </article>
<?php
}

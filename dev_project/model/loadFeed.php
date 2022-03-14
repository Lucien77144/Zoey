<?php
require("model.php");

$feed = getFeed(htmlspecialchars($_POST['posts']));


while ($post = $feed->fetch()) {
    $desc = htmlspecialchars($post['description']);
    $descClass = "";
    $descEnd = "";
    if (strlen($desc) > 200) {
        $descClass = " class='descMore'";
        $s = substr($post['description'], 0, 200);
        $desc =
        htmlspecialchars(substr($post['description'], 0, 200)) .
        "<span class='dot'>Voir plus</span>";
        $descEnd = "<div class='endDesc'><span>" .
            htmlspecialchars(substr($post['description'], 200)) .
        "</span></div>";
    }
?>
    <article class="defaultBlock">
        <img class="blockIllus" src="<?= '/public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
        <div class="textContent">
            <div class="headMsg">
                <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>&animal=<?= $post['idanimal']?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
                    <h1>
                        <?= htmlspecialchars($post['nom']) ?>
                    </h1>
                </a>
                <?php
                $currentTime = new DateTime(date('Y-m-d', time()));
                $currentTime->setTimezone(new DateTimeZone('Europe/Paris'));
                $currentDay = $currentTime->format('d');
                $sendTime = new DateTime($post["date_publication"]);
                $sendTime->setTimezone(new DateTimeZone('Europe/Paris'));
                $sendDay = $sendTime->format('d');
                if ($sendDay == $currentDay - 1) {
                    $time = "Hier à " . $sendTime->format('G') . "h" . $sendTime->format('i'); ?>
                    <div class="date"><?= $time ?></div>
                <?php
                } else if ($sendDay == $currentDay) {
                    $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i'); ?>
                    <div class="date"><?= $time ?></div>
                <?php
                } else {
                    $time = "Le " . $sendTime->format('d/m/Y'); ?>
                    <div class="date"><?= $time ?></div>
                <?php
                }
                ?>
            </div>

            <div class="descWrapper">
                <p <?= $descClass ?> >
                    <?= nl2br($desc) ?>
                </p>
                <?= $descEnd ?>
            </div>
        </div>
    </article>

<?php
}
?>

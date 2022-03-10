<?php
$pageTitle = 'Feed';
$printNewsletter = false;
ob_start();

$hiddenAfter = "";
if($feed->rowCount() < 5){
    $hiddenAfter = "class='hiddenAfter'";
}

?>
<main <?= $hiddenAfter ?>>

    <?php
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
            <img class="blockIllus" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
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
                            <span><?=$time?></span>
                            <?php
                        } else if ($sendDay == $currentDay) {
                            $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i'); ?>
                            <span><?=$time?></span>
                            <?php
                        } else {
                            $time = "Le " . $sendTime->format('d/m/Y'); ?>
                            <span><?=$time?></span>
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

</main>

<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_feed.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="<?= BASE_URL ?>public/js/feed.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

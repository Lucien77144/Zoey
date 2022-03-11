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
    $flag = 0;
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

        if(isset($_GET["id"]) && $flag == 0){
            $flag = 1;
            ?>
            <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>&animal=<?= $post['idanimal']?>" class="return">
                <svg viewBox="0 0 32 26">
                    <path d="M5.04177 9.89315L9.72409 14.6098L7.60674 16.7617C7.55839 16.653 7.49743 16.5505 7.42515 16.4564C5.14437 14.1445 2.86358 11.8351 0.5828 9.52806C-0.191686 8.74364 -0.19441 7.93622 0.575536 7.15547C2.86116 4.83867 5.1486 2.52249 7.43786 0.206912C7.51776 0.126906 7.60039 0.0505785 7.65395 0L9.72409 2.08015L4.96459 6.87223H5.4567C11.0978 6.87223 16.7399 6.84556 22.381 6.88143C26.4477 6.90718 29.4322 8.81721 31.1446 12.5398C33.7468 18.1945 30.1358 24.9058 24.048 25.8631C23.51 25.9478 22.9663 25.9908 22.4218 25.9918C15.0777 26.0004 7.73355 26.0022 0.389405 25.9973H0.0262231V23.0481H0.46295C7.762 23.0481 15.0611 23.0261 22.3592 23.0592C25.3682 23.0721 27.8487 21.1721 28.7221 18.5595C30.1685 14.2374 27.0197 9.82326 22.4573 9.80762C18.5067 9.79107 14.558 9.80762 10.6066 9.80762H5.0681L5.04177 9.89315Z" fill="#FF9900"/>
                </svg>
            </a>
        <?php } ?>
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

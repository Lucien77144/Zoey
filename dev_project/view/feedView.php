<?php
$printNewsletter = false;
ob_start();

$res = $feed->fetchAll(PDO::FETCH_ASSOC);

$low = "";
if (count($res) < 10) {
    $low = "class='hiddenAfter'";
}
?>
<main <?= $low ?>>

    <?php
    $flag = 0;
    foreach ($res as $post) {

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

        if (isset($_GET["id"]) && $flag == 0) {
            $flag = 1;
    ?>
            <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>&animal=<?= $post['idanimal'] ?>" class="return">
                <svg viewBox="0 0 32 26">
                    <path d="M5.04177 9.89315L9.72409 14.6098L7.60674 16.7617C7.55839 16.653 7.49743 16.5505 7.42515 16.4564C5.14437 14.1445 2.86358 11.8351 0.5828 9.52806C-0.191686 8.74364 -0.19441 7.93622 0.575536 7.15547C2.86116 4.83867 5.1486 2.52249 7.43786 0.206912C7.51776 0.126906 7.60039 0.0505785 7.65395 0L9.72409 2.08015L4.96459 6.87223H5.4567C11.0978 6.87223 16.7399 6.84556 22.381 6.88143C26.4477 6.90718 29.4322 8.81721 31.1446 12.5398C33.7468 18.1945 30.1358 24.9058 24.048 25.8631C23.51 25.9478 22.9663 25.9908 22.4218 25.9918C15.0777 26.0004 7.73355 26.0022 0.389405 25.9973H0.0262231V23.0481H0.46295C7.762 23.0481 15.0611 23.0261 22.3592 23.0592C25.3682 23.0721 27.8487 21.1721 28.7221 18.5595C30.1685 14.2374 27.0197 9.82326 22.4573 9.80762C18.5067 9.79107 14.558 9.80762 10.6066 9.80762H5.0681L5.04177 9.89315Z" fill="#FF9900" />
                </svg>
            </a>
        <?php } ?>
        <article class="defaultBlock">
            <img class="blockIllus" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($post['media']) ?>" alt="">
            <div class="textContent">
                <div class="headMsg">
                    <div>
                        <a href="index.php?action=account&id=<?= htmlspecialchars($post['idutilisateur']) ?>&animal=<?= $post['idanimal'] ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
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
                    <?php if (verifyToken() && $post['idutilisateur'] == $_SESSION['idUser']) { ?>
                        <svg id="popUpLauncherRm" data-post="<?= $post['idpost'] ?>" class="postButtonSvg" viewBox="0 0 24 31" fill="none">
                            <path d="M15.9913 0C16.1118 0.0401701 16.2338 0.0773655 16.3543 0.120511C16.7458 0.256557 17.0865 0.509004 17.3306 0.844039C17.5747 1.17907 17.7106 1.5807 17.7201 1.99512C17.732 2.65718 17.7201 3.32073 17.7201 4.03189H22.4616C23.4406 4.03189 23.994 4.5794 24 5.55687C24 6.31068 24 7.06449 24 7.8183C24 8.81065 23.4436 9.35369 22.4438 9.35816H21.8204C21.813 9.50694 21.8011 9.64827 21.8011 9.78217C21.8011 15.9396 21.8011 22.098 21.8011 28.2575C21.8082 28.5071 21.7862 28.7568 21.7356 29.0014C21.6375 29.4208 21.4003 29.7947 21.0626 30.0621C20.7249 30.3296 20.3066 30.4748 19.8759 30.4743C14.6289 30.4802 9.38203 30.4802 4.13512 30.4743C3.65311 30.4736 3.18902 30.2915 2.83508 29.9643C2.48115 29.6371 2.26329 29.1887 2.2248 28.7083C2.20844 28.5416 2.20695 28.372 2.20695 28.2039C2.20695 22.0762 2.20695 15.9475 2.20695 9.81788V9.35816C1.94361 9.35816 1.70854 9.35816 1.47347 9.35816C0.580803 9.34328 0.0228829 8.7928 0.00949281 7.90757C-0.00240946 7.09524 -0.00389724 6.28142 0.00949281 5.4676C0.0243706 4.58535 0.597167 4.03487 1.48537 4.03338C2.96423 4.03338 4.4421 4.03338 5.91897 4.03338H6.28347V3.18683C6.28347 2.80001 6.28347 2.41318 6.28347 2.02636C6.28932 1.57642 6.44293 1.14088 6.72064 0.786817C6.99835 0.432757 7.38476 0.179816 7.82035 0.0669509C7.88582 0.0490975 7.94979 0.0223171 8.01377 0.0014881L15.9913 0ZM20.1303 9.35964H19.7509C14.5833 9.35964 9.41625 9.35667 4.24967 9.35072C3.94022 9.35072 3.87327 9.43701 3.87476 9.73159C3.88269 15.9099 3.88269 22.0876 3.87476 28.2649C3.87476 28.7648 3.91641 28.805 4.4178 28.805H19.5649C20.0916 28.805 20.1273 28.7707 20.1273 28.2545V9.35964H20.1303ZM1.69218 7.66506H22.3039V5.72202H1.69218V7.66506ZM7.95277 4.00958H16.0552V2.26441C16.0552 1.7779 15.9466 1.66929 15.4601 1.66929H8.53598C8.46662 1.66482 8.39705 1.66482 8.32769 1.66929C8.27768 1.66987 8.22828 1.68037 8.18236 1.70018C8.13644 1.71999 8.09491 1.74872 8.06017 1.7847C8.02543 1.82068 7.99819 1.8632 7.98 1.90979C7.96182 1.95638 7.95307 2.00612 7.95426 2.05612C7.94682 2.7033 7.95277 3.34602 7.95277 4.00958V4.00958Z" fill="#FF9900" />
                            <path d="M6.28036 19.2223C6.28036 17.12 6.28036 15.0193 6.28036 12.9185C6.28036 12.2743 6.83679 11.8681 7.40215 12.0854C7.54783 12.1376 7.67559 12.2303 7.77045 12.3525C7.86532 12.4748 7.92335 12.6216 7.93776 12.7757C7.94744 12.8746 7.95042 12.974 7.94668 13.0732V25.3847C7.95271 25.4837 7.95271 25.5831 7.94668 25.6822C7.92734 25.8972 7.82471 26.0961 7.6607 26.2365C7.4967 26.3769 7.28431 26.4476 7.06889 26.4335C6.85827 26.4254 6.65909 26.3356 6.51356 26.1831C6.36803 26.0307 6.28759 25.8275 6.28929 25.6167C6.27888 24.983 6.28929 24.3477 6.28929 23.7139L6.28036 19.2223Z" fill="#FF9900" />
                            <path d="M17.7244 19.22C17.7244 21.282 17.7244 23.3441 17.7244 25.4062C17.7307 25.5442 17.7212 25.6824 17.6961 25.8183C17.648 26.0076 17.5335 26.1735 17.3736 26.2856C17.2136 26.3978 17.0187 26.449 16.8243 26.4298C16.6351 26.4147 16.4568 26.3351 16.3192 26.2043C16.1816 26.0735 16.0931 25.8994 16.0685 25.7112C16.0563 25.5926 16.0524 25.4733 16.0566 25.3541V13.1037C16.0566 13.0144 16.0566 12.9237 16.0566 12.8359C16.0655 12.6153 16.1606 12.407 16.3213 12.2557C16.4821 12.1043 16.6958 12.0221 16.9165 12.0265C17.1317 12.0346 17.3354 12.1255 17.4851 12.2802C17.6348 12.4349 17.7189 12.6414 17.7199 12.8567C17.7199 12.9549 17.7199 13.0546 17.7199 13.1543L17.7244 19.22Z" fill="#FF9900" />
                            <path d="M11.1677 19.2211C11.1677 17.1293 11.1677 15.0375 11.1677 12.9457C11.1677 12.2806 11.7197 11.8626 12.294 12.0843C12.4396 12.1364 12.5672 12.2291 12.6619 12.3514C12.7565 12.4737 12.8142 12.6206 12.8281 12.7746C12.8326 12.834 12.8326 12.8937 12.8281 12.9531C12.8281 17.1368 12.8281 21.3199 12.8281 25.5026C12.8281 26.0099 12.5514 26.367 12.1244 26.425C11.5903 26.4994 11.1662 26.1274 11.1633 25.5546C11.1633 24.3748 11.1633 23.195 11.1633 22.0152L11.1677 19.2211Z" fill="#FF9900" />
                        </svg>
                    <?php } else {
                    ?>
                        <svg id="popUpLauncherReport" data-post="<?= $post['idpost'] ?>" class="postButtonSvg" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 447.514 447.514" style="enable-background:new 0 0 447.514 447.514;" xml:space="preserve">
                            <path d="M389.183,10.118c-3.536-2.215-7.963-2.455-11.718-0.634l-50.653,24.559c-35.906,17.409-77.917,16.884-113.377-1.418 c-38.094-19.662-83.542-18.72-120.789,2.487V20c0-11.046-8.954-20-20-20s-20,8.954-20,20v407.514c0,11.046,8.954,20,20,20 s20-8.954,20-20V220.861c37.246-21.207,82.694-22.148,120.789-2.487c35.46,18.302,77.47,18.827,113.377,1.418l56.059-27.18 c7.336-3.557,11.995-10.993,11.995-19.146V20.385C394.866,16.212,392.719,12.333,389.183,10.118z" fill="#FF9900" />
                        </svg>
                    <?php
                    } ?>
                </div>

                <div class="descWrapper">
                    <p <?= $descClass ?>>
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

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_old.css">

    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_header.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_commun.css"> -->

    <?php if (isset($stylesBlock)) echo $stylesBlock ?>

    <script src="vendor/jquery-3.6.0.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>

<body>
    <!-- Header / Footer -->
    <header>
        <h1><a href="index.php">ZOEY</a></h1>
        <!-- <div class="navbar"><a href="index.php?action=messages"><img src="<?= BASE_URL ?>public/images/icons/msg.svg" alt=""></a><a href="index.php?action=addpost"><img src="<?= BASE_URL ?>public/images/icons/upload.svg" alt=""></a></div> -->
        <div class="navbar">
            <a href="index.php?action=messages">
                <svg width="33" height="34" viewBox="0 0 33 34" fill="none">
                    <path d="M30.2155 1.18609C29.5333 0.941907 28.7912 0.941906 28.1091 1.18609L2.70107 10.2909C1.02665 10.89 0.140751 12.7742 0.722236 14.4993C1.01854 15.3783 1.66057 16.088 2.4908 16.4542L12.9103 21.0541L17.3757 31.7901C18.0794 33.4708 19.9724 34.2455 21.6037 33.5204C21.9725 33.3565 22.3083 33.1227 22.5937 32.8314C22.9374 32.4773 23.1991 32.0478 23.3592 31.575L32.1939 5.3948C32.7756 3.66969 31.8899 1.78538 30.2155 1.18609ZM21.3365 30.8487C21.1424 31.4236 20.5328 31.7277 19.9747 31.5279C19.6904 31.4261 19.4608 31.2055 19.3424 30.9203L14.9935 20.4665L30.0932 4.90922L21.3365 30.8487ZM13.4806 18.9077L3.33424 14.427C2.92469 14.2536 2.66597 13.8327 2.68897 13.3772C2.69473 12.9192 2.98319 12.516 3.40609 12.3749L28.5803 3.35047L13.4806 18.9077Z" fill="#FFA319" />
                </svg>
            </a>
            <a href="index.php?action=addpost">
                <svg width="34" height="34" viewBox="0 0 34 34" fill="none">
                    <g class="cross">
                        <rect x="15.814" y="7.11627" width="2.37209" height="19.7674" fill="#FFA319" />
                        <rect x="7.11633" y="15.8139" width="19.7674" height="2.37209" fill="#FFA319" />
                    </g>
                    <rect x="1.25" y="1.25" width="31.5" height="31.5" rx="3.75" stroke="#FFA319" stroke-width="2.5" />
                </svg>
            </a>
        </div>
    </header>
    <nav class="menu">
        <div class="menuInner">
            <a href="index.php?action=blog"><img src="<?= BASE_URL ?>public/images/icons/actus.svg" alt="Page actus">
                <h2>Actus</h2>
            </a>
            <a href="index.php?action=presentation"><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Présentation de Zoey">
                <h2>À propos</h2>
            </a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Page actualitées">
                <h2>Forum</h2>
            </a> -->
        </div>
        <svg width="115" height="100" viewBox="0 0 115 100" fill="none">
            <path d="M114.999 100V0H112.998C112.998 0 101.401 47.3435 55.998 47.3435C10.5947 47.3435 1.99911 0 1.99911 0H0V100H114.999Z" fill="white" />
        </svg>
        <div class="menuInner">
            <!-- <a href="index.php?action=presentation"><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page qui sommes-nous ?"><h2>Qui sommes-nous ?</h2></a> -->
            <a href="index.php?action=adoption"><img src="<?= BASE_URL ?>public/images/icons/adoption.svg" alt="Page adoption">
                <h2>Adoption</h2>
            </a>
            <a href="index.php?action=account"><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page profil">
                <h2>Profil</h2>
            </a>
        </div>
    </nav>
    <a class="feed" href="index.php"><img src="<?= BASE_URL ?>public/images/icons/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z" />
        </svg>
    </nav>

    <!-- CONTENT -->
    <?= $viewContent ?>

    <?php

    if (isset($printNewsletter) && !$printNewsletter) {
        $printNewsletter = true;
    } else if (isset($_SESSION['idUser'])) {
        $printNewsletter = true;
    } else {
    ?>
        <form class="newsletter" id="newsletterForm">
            <h1>Rejoignez notre Newsletter !</h1>
            <input type="text" name="prenom" id="newsletterName" placeholder="Votre prénom">
            <input type="email" name="email" id="newsletterMail" placeholder="Votre e-mail *" required>
            <input type="submit" value="S'abonner" id="submitNewsletter">
            <p>*: Champs obligatoires</p>
            <span id="confirmationMessageNewsletter"></span>
        </form>
    <?php
    }

    if (isset($printLegal) && $printLegal) { ?>
        <div class="legalLink">
            <a href="index.php?action=legal">Mentions légales</a>
        </div>
    <?php
    }
    ?>

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
    <?php if (isset($scriptsBlock)) echo $scriptsBlock ?>
</body>

</html>
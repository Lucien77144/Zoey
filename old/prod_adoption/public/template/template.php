<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_old.css">

    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <link rel="shortcut icon" href="<?= BASE_URL ?>public/images/icons/favicon.svg" type="image/x-icon">

    <?php if (isset($stylesBlock)) echo $stylesBlock ?>
    
    <script src="vendor/jquery-3.6.0.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>
<body>
    
    <!-- Header / Footer -->
    <header><h1><a href="index.php?action=blog">ZOEY</a></h1>
        <!-- <div class="navbar"><a href=""><img src="msg.svg" alt=""></a><a href=""><img src="upload.svg" alt=""></a></div> -->
    </header>
    <nav class="menu">
        <div class="menuInner">
            <a href="index.php?action=blog"><img src="<?= BASE_URL ?>public/images/icons/actus.svg" alt="Page actus"><h2>Actus</h2></a>
            <a href="index.php?action=adoption"><img src="<?= BASE_URL ?>public/images/icons/adoption.svg" alt="Page adoption"><h2>Adoption</h2></a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Page actualitées"><h2>Forum</h2></a> -->
        </div>
        <svg width="115" height="100" viewBox="0 0 115 100">
            <path fill="white" d="M115 100V0H113C113 0 101.403 47 56 47C10.5967 47 2 0 2 0H0V100H115Z"/>
        </svg>
        <div class="menuInner"> 
            <a href="index.php?action=presentation"><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page qui sommes-nous ?"><h2>À propos</h2></a>
            <a href="index.php?action=newsletter"><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Réseau social zoey"><h2>Réseau</h2></a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/adoption.svg" alt="Page profil"><h2>Adoption</h2></a> -->
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page profil"><h2>Profil</h2></a> -->
        </div>                           
    </nav>
    <a class="feed" href=""><img src="<?= BASE_URL ?>public/images/icons/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="115" height="100" viewBox="0 0 115 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M115 100V0H113C113 0 101.403 47 56 47C10.5967 47 2 0 2 0H0V100H115Z"/>
        </svg>                     
    </nav>

    <!-- CONTENT -->
    <?= $viewContent ?>

    <?php
    
    if (isset($printNewsletter) && !$printNewsletter){
        $printNewsletter = true;
    } else {
        ?>
            <form class="newsletter" id="newsletterForm">
                <h1>Rejoignez notre Newsletter !</h1>
                <input type="text" name="prenom" id="newsletterName" placeholder="Votre prénom">
                <input type="email" name="email" id="newsletterMail" placeholder="Votre e-mail *" required>
                <input type="submit" value="S'abonner" id="submitNewsletter">
                <p>*: Champs obligatoires</p>
                <span id="confirmationMessage"></span>
            </form>
        <?php
    }
    ?>

    <div class="legalLink">
        <a href="index.php?action=legal">Mentions légales</a>
    </div>

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
    <?php if (isset($scriptsBlock)) echo $scriptsBlock ?>
</body>
</html>
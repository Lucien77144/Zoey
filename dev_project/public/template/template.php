<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_old.css">

    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_header.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_commun.css">

    <?php if (isset($stylesBlock)) echo $stylesBlock ?>
    
    <script src="vendor/jquery-3.6.0.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>
<body>
    <!-- PAGES EN CONSTRUCTION
        <header>
        <a href="index.php?action=connect">connexion</a>
        <a href="index.php?action=disconnect">déconnexion</a>
        <a href="index.php?action=subscribe">inscription</a>
        <a href="index.php?action=blog">blog</a>
        <a href="index.php?action=forum">forum</a>
        <a href="index.php?action=feed">feed</a>
        <a href="index.php?action=adoption">adoption</a>
        <a href="index.php?action=account">mon compte</a>
        <a href="index.php?action=addpost">poster</a>

        <a href="index.php?action=messages">messages</a>
    </header> -->

    <!-- Header / Footer -->
    <header><h1><a href="index.php">ZOEY</a></h1>
        <!-- <div class="navbar"><a href=""><img src="msg.svg" alt=""></a><a href=""><img src="upload.svg" alt=""></a></div> -->
    </header>
    <nav class="menu">
        <div class="menuInner">
            <a href="index.php?action=blog"><img src="<?= BASE_URL ?>public/images/icons/actus.svg" alt="Page actus"><h2>Actus</h2></a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Page actualitées"><h2>Forum</h2></a> -->
        </div>
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="white" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
        </svg>
        <div class="menuInner"> 
            <a href="index.php?action=presentation"><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page qui sommes-nous ?"><h2>Qui sommes-nous ?</h2></a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/adoption.svg" alt="Page profil"><h2>Adoption</h2></a>
            <a href=""><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page profil"><h2>Profil</h2></a> -->
        </div>                           
    </nav>
    <a class="feed" href=""><img src="<?= BASE_URL ?>public/images/icons/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
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

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
    <?php if (isset($scriptsBlock)) echo $scriptsBlock ?>
</body>
</html>
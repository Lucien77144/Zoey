<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_old.css">

    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css" />
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_header.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_commun.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_article.css" />
    
    <script src="vendor/jquery-3.6.0.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>
<body>
    <!-- <header>
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
    <header><h1>ZOEY</h1><div class="navbar"><a href=""><img src="assets/img/msg.svg" alt=""></a><a href=""><img src="assets/img/upload.svg" alt=""></a></div></header>
    <nav class="menu">
        <div class="menuInner">
            <!-- <a href=""><img src="assets/img/actus.svg" alt="Page actualitées"><h2>Actus</h2></a> -->
            <a href=""><img src="index.php?action=blog" alt="Page blog"><h2>Actus</h2></a>
        </div>
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="white" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
        </svg>
        <div class="menuInner">
            <a href=""><img src="index.php?action=presentation" alt="Page qui sommes-nous ?"><h2>Qui sommes-nous ?</h2></a>
            <!-- <a href=""><img src="assets/img/profil.svg" alt="Page profil"><h2>Profil</h2></a> -->
        </div>                           
    </nav>
    <!-- <a class="feed" href=""><img src="assets/img/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
        </svg>                          
    </nav> -->

    <!-- CONTENT -->
    <?= $viewContent ?>

    <form class="newsletter">
        <h1>Rejoignez notre Newsletter !</h1>
        <input type="text" name="prenom" placeholder="Votre prénom">
        <input type="email" name="email" placeholder="Votre e-mail *" required>
        <input type="submit" value="S'abonner">
        <p>*: Champs obligatoires</p>
    </form>

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
    <?php if (isset($scriptsBlock)) echo $scriptsBlock ?>
</body>
</html>
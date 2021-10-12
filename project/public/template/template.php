<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>
<body>
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
    </header>
    <?= $viewContent ?>

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <title><?= $pageTitle ?></title>
</head>
<body>

<?php
    $blogPost = "";
    while ($blogPost = $blog->fetch())
    {
    ?>
        <article class="blogPost">
            <h1>
                <?= htmlspecialchars($blogPost['titre']) ?>
            </h1>
            
            <p>
                <?= nl2br(htmlspecialchars($blogPost['resume'])) ?>
            </p>
        </article>
    <?php
    }
    // $blogPost->closeCursor();
?>

</body>
</html>
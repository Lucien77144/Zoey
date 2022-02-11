<?php 
$account = $account->fetch();

$pageTitle = htmlspecialchars($account['pseudo_user']);
ob_start();
?>

<section class="profil">
    <div class="wrapProfil">
        <div class="avatar">
            <img src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($account['photo_user']) ?>" alt="">
        </div>
        <div class="username">
            <div class="innerUsername">
                <h1><?= htmlspecialchars($account['pseudo_user']) ?></h1>
                <?php if(isset($_SESSION['idUser']) && $account['iduser'] == $_SESSION['idUser'] && verifyToken()){ ?>
                <svg id="<?=$account["iduser"] ?>" viewBox="0 0 32 32" class="iconModif">
                    <path
                        d="M4.74219 31.9776C4.52142 31.9301 4.29968 31.8885 4.08085 31.8323C1.6214 31.2107 0.0140402 29.1792 0.00726216 26.6423C-0.00242072 22.041 -0.00242072 17.44 0.00726216 12.8394C0.0130719 10.2744 1.65335 8.21387 4.15444 7.63192C4.56594 7.54191 4.98619 7.49806 5.40741 7.5012C8.69958 7.49023 11.9918 7.48829 15.2839 7.4954C16.1167 7.4954 16.6463 8.01246 16.596 8.76095C16.5749 9.02544 16.462 9.27424 16.2769 9.46432C16.0918 9.6544 15.846 9.77379 15.5822 9.80185C15.4515 9.81347 15.3188 9.81444 15.1881 9.81444C11.9295 9.81444 8.67183 9.81444 5.41515 9.81444C4.02566 9.81444 2.90535 10.5687 2.49576 11.8072C2.38477 12.149 2.32856 12.5062 2.32922 12.8655C2.3176 17.4487 2.31566 22.032 2.32341 26.6152C2.32341 28.3746 3.60832 29.6547 5.36867 29.6566C9.98611 29.6566 14.6042 29.6566 19.2229 29.6566C20.9997 29.6566 22.2789 28.3775 22.2798 26.6007C22.2837 23.3957 22.2837 20.1909 22.2798 16.9866C22.2798 16.5324 22.4183 16.1577 22.8008 15.9001C22.966 15.7899 23.1569 15.7241 23.3549 15.7093C23.553 15.6944 23.7515 15.7309 23.9314 15.8152C24.1112 15.8995 24.2663 16.0288 24.3815 16.1906C24.4967 16.3524 24.5683 16.5411 24.5892 16.7387C24.5994 16.8351 24.6033 16.9322 24.6008 17.0292C24.6008 20.2168 24.6192 23.4044 24.595 26.591C24.5776 28.8539 23.5299 30.5145 21.4878 31.4973C21.0452 31.7094 20.5369 31.7878 20.0586 31.9224L19.8649 31.9776H4.74219Z" />
                    <path
                        d="M23.5527 5C24.8667 5.06488 25.9299 5.6962 26.5292 6.96466C27.1286 8.23311 26.9863 9.47543 26.0722 10.5347C24.8134 11.9872 23.4946 13.3873 22.199 14.8068C19.513 17.7498 16.8238 20.6905 14.1313 23.6289C13.9168 23.8575 13.66 24.0424 13.375 24.1731C12.123 24.7434 10.8575 25.2866 9.59871 25.8337C8.83279 26.1648 8.12304 26.0206 7.62147 25.426C7.22447 24.9554 7.16153 24.4084 7.34647 23.8409C7.79834 22.4582 8.26021 21.0787 8.73209 19.7025C8.80486 19.5056 8.91575 19.3249 9.05841 19.1709C13.0148 14.831 16.9745 10.4944 20.9374 6.16098C21.6142 5.41637 22.4566 5.02905 23.5527 5ZM14.0635 20.2728C14.1729 20.1556 14.2678 20.0549 14.3617 19.9523C16.581 17.5232 18.8007 15.0934 21.0206 12.663C22.0858 11.4959 23.1509 10.3291 24.216 9.16267C24.6701 8.66304 24.6575 8.0443 24.1957 7.61341C23.7338 7.18252 23.1189 7.23094 22.6532 7.71798C22.5805 7.79448 22.5108 7.87291 22.4392 7.95134L12.6595 18.6625C12.6091 18.7177 12.5626 18.7778 12.5065 18.8455L14.0635 20.2728ZM10.8972 20.5246C10.6067 21.4057 10.3288 22.2297 10.0325 23.1157L12.5317 22.0186L10.8972 20.5246Z"
                        class="pen" />
                </svg>
                <?php } ?>
            </div>
        </div>
        <div class="desc">
            <p><?= htmlspecialchars($account['description']) ?></p>
        </div>
        <a class="btn disconnect" href="index.php?action=disconnect">se déconnecter</a>
        <?php // if(($account['iduser'] != $_SESSION['idUser'] && isset($_SESSION['idUser'])) || !isset($_SESSION['idUser'])){ ?>
        <div class="controls">
            <?php
            if(isset($_SESSION['idUser'])){
                if (!verifyToken() && $account['iduser'] == $_SESSION['idUser']) {
                    ?>
                <a href="index.php?action=connect">Vous avez été déconnecté (inactif depuis plus de 1 heure). Reconnectez-vous pour pouvoir modifier votre profil.</a>
                <?php
                } else if (!verifyToken()) {
                    ?>
                <a href="index.php?action=connect">Vous avez été déconnecté (inactif depuis plus de 1 heure). Reconnectez-vous pour pouvoir ajouter <?= htmlspecialchars($account['pseudo_user']) ?> en ami.</a>
                <?php
                } else if (isFriend($account['iduser']) == 2){ // 2 : ami
                    ?>
                <button class="controlBtn" id="removeFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Enlever de mes amis</button>
                <?php
                } else if (!isFriend($account['iduser']) && $account['iduser'] != $_SESSION['idUser']){
                    ?>
                <button class="controlBtn" id="addFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Ajouter en ami</button>
                <span id="confirmationMessage"></span>
                <?php
                } else if (isFriend($account['iduser']) == 11){ // 11 : en attente, utilisateur demandeur
                    ?>
                <p>Votre demande d'ami est en attente</p>
                <?php
                } else if (isFriend($account['iduser']) == 12){ // 12 : en attente, utilisateur receveur
                    ?>
                <button class="controlBtn" id="acceptFriend" value="<?= htmlspecialchars($account['iduser']) ?>">Accepter la demande d'ami</button>
                <span id="confirmationMessage"></span>
                <?php
                } else if (isset($account['idUser'])){
                    throw new Exception("Nous n'avons pas trouvé cet utilisateur");
                }

                if(isFriend($account['iduser']) == 2 && $account['iduser'] != $_SESSION['idUser']){
                    $conv = getDirectConversation($account['iduser'])->fetch();
                    ?>
                    <a href="index.php?action=messages&id=<?= $conv["idconversation"] ?>"><li class="controlBtn">Contacter</li></a>
                <?php }

            }else{
                ?>
                <a href="index.php?action=connect"><li class="controlBtn">Ajouter en ami</li></a>
                <a href="index.php?action=connect"><li class="controlBtn">Contacter</li></a>
                <?php
            }
            ?>
        </div>
        <?php // } ?>
    </div>
</section>
<nav class="menuAnimaux">
    <div class="menuAnimauxInner">
        <ul class="menuAnimauxWrapper">
            <?php
                if (!$accountAnimals){ // renvoie false si aucun animal lié à ce compte n'a été trouvé en bdd
                    ?>
                        <li class="empty">Mon panier est vide pour le moment...</li>
                        <?php
                } else {
                    $i = 0;
                    while ($accountAnimal = $accountAnimals->fetch()) {
                        $animalId[$i] = htmlspecialchars($accountAnimal['idanimal']);
                        ?>
                    <li data-animalId="<?= htmlspecialchars($animalId[$i]) ?>">
                        <?= htmlspecialchars($accountAnimal['nom']) ?>
                    </li>
                        <?php
                        $i++;
                    }
                    $_SESSION['printAnimal'] = $animalId;
                }

                if(isset($_SESSION['idUser']) && verifyToken() && $account['iduser'] == $_SESSION['idUser']){
            ?>
            <a href="index.php?action=addAnimal">
                <svg class="addAnimal" viewBox="0 0 20 20">
                        <rect x="8.5" width="3" height="20" rx="1.5" fill="white" />
                        <rect y="8.5" width="20" height="3" rx="1.5" fill="white" />
                </svg>
            </a>
            <?php
                }
            ?>
            
        </ul>
    </div>
</nav>

<?php
if ($accountAnimals){ // renvoie false si aucun animal lié à ce compte n'a été trouvé en bdd
    require('print.php');
    ?>
    <section class="profilAnimal">
    <?php
    printAnimal($animalId[0]);
    ?>
    </section>
    <?php
}




    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_profil.css" />
    <?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <script src="public/js/print.js"></script>
    <script src="public/js/profil.js"></script>
    <?php
    $scriptsBlock = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
<?php
function printAnimal($animalId){
        // $idUser = $_SESSION['idUser'];
    
        // if (isFriend($acceptFriendId) != 12){ // l'animal appartient bien à ce compte
        //     return false;
        // }

        // $animalId = safeEntry($_POST['animalId']);

        $animal = getAnimal($animalId);
        $animalFeed = getAnimalFeed($animalId);
        $animal = $animal->fetch();

        ?>

        <h2><?= htmlspecialchars($animal['nom_animal']) ?></h2>
        
        <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($animal['photo_animal']) ?>" alt="">
        
        <p>Je m'appelle <?= htmlspecialchars($animal['nom_animal']) ?>. <br>
        <div class="defaultBlock">
            <?= nl2br(htmlspecialchars($animal['description_animal'])) ?>
        </div>
        </p>
        
        <?php
        if(isset($_SESSION['idUser'])){
            if($animal['iduser'] == $_SESSION['idUser'] && verifyToken()){
        ?>
                <a href="index.php?action=modifyAnimal&id=<?= htmlspecialchars($animal['idanimal']) ?>">modifier son profil</a>
        <?php
            }
        }
        ?>
        
        <h2>Ses posts</h2>
        
        <?php
        if (!$animalFeed){ // renvoie vaut false si aucun animal lié à ce compte n'a été trouvé en bdd
            ?>
            <p><?= htmlspecialchars($animal['nom_animal']) ?> n'a encore jamais posté !</p>
            <?php
        } else {
            while ($post = $animalFeed->fetch()) {
                ?>
                    <article class="defaultBlock">
                        <img src="<?= BASE_URL . 'public/images/' . htmlspecialchars($post['media']) ?>" alt="">
                        <a href="index.php?action=animal&id=<?= htmlspecialchars($post['idanimal']) ?>" title="voir le profil de <?= htmlspecialchars($post['nom']) ?>">
                            <h1>
                                <?= htmlspecialchars($post['nom']) ?>
                            </h1>
                        </a>
                        
                        <p>
                            <?= nl2br(htmlspecialchars($post['description'])) ?>
                        </p>
                        <a href="index.php?action=feed&id=<?= htmlspecialchars($post['idpost']) ?>">voir le post</a>
                    </article>
                    
                <?php
            }
            $animalFeed->closeCursor();
        }
    }
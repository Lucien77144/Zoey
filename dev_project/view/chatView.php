<?php
$pageTitle = 'Conversation';
// CONTENT BLOCK
ob_start();
?>

<div class="convName">

    <a href="index.php?action=messages">
        <img src="<?= BASE_URL ?>public/images/icons/arrowback.svg" alt="">
    </a>

    <h1>
        <?php
        if (isset($convUsers[0]['titre'])) {
            echo htmlspecialchars($convUsers[0]['titre']);
        } else {
            for ($i = 0; $i < count($convUsers); $i++) {
                echo htmlspecialchars($convUsers[$i]['pseudo']);
                if ($i < count($convUsers) - 1) {
                    echo ", ";
                }
            }
        }
        ?>
    </h1>
</div>

<!-- <button class="btn" id="loadMoreMessages">Charger plus</button> -->

<main>
    <div class="moreMsg">
        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" id="loadMoreMessages">
            <rect x="7" width="2" height="16" rx="1" fill="#F3811C" />
            <rect x="16" y="7" width="2" height="16" rx="1" transform="rotate(90 16 7)" fill="#F3811C" />
        </svg>
        <span id="confirmationMessage"></span>
    </div>

    <div id="chatContainer">

        <?php

        if ($chat) {
            while ($message = $chat->fetch()) {
                $idMessage = $message['idmessage'];
                $idConv = $message['idConv'];

                $currentTime = new DateTime(date('Y-m-d', time()));
                $currentTime->setTimezone(new DateTimeZone('Europe/Paris'));
                $currentDay = $currentTime->format('d');

                $sendTime = new DateTime($message["date_envoi_msg"]);
                $sendTime->setTimezone(new DateTimeZone('Europe/Paris'));
                $sendDay = $sendTime->format('d');

                if ($sendDay == $currentDay - 1) {
                    $time = "Hier à " . $sendTime->format('G') . "h" . $sendTime->format('i');
                } else if ($sendDay == $currentDay) {
                    $time = "Aujourd'hui à " . $sendTime->format('G') . "h" . $sendTime->format('i');
                } else {
                    $time = "Le " . $sendTime->format('d/m/Y') . " à " . $sendTime->format('G') . "h" . $sendTime->format('i');
                }

                if ($message['authorId'] == $_SESSION['idUser']) { ?>
                    <article class="myMessages">
                    <?php } else { ?>
                        <article>
                        <?php } ?>

                        <div class="chatMsgContainer">
                            <?php
                            if (!empty($message['msg'])) {
                            ?>
                                <p>
                                    <?= htmlspecialchars($message['msg']) ?>
                                </p>
                            <?php
                            }
                            ?>
                            <?php
                            if (!empty($message['media'])) {
                            ?>
                                <div class="imgChat" style='background-image: url("<?= BASE_URL ?>public/images/upload/<?= htmlspecialchars($message['media']) ?>")'>
                                </div>
                            <?php
                            }
                            ?>

                            <p>
                                <?php
                                if (!empty($message['authorPic'])) {
                                ?>
                                    <img class="authorPic" src="<?= BASE_URL . 'public/images/upload/' . htmlspecialchars($message['authorPic']) ?>" alt="">

                                <?php
                                }
                                ?>
                                <a class="username" href="index.php?action=account&id=<?= htmlspecialchars($message['authorId']) ?>"><?= htmlspecialchars($message['authorPseudo']) ?></a>
                                <?= $time ?>.
                            </p>
                        </div>
                        </article>
                    <?php
                }

                $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage); // store last message's id in SESSION
                $chat->closeCursor();
            } else {
                    ?>
                    <p id="noMessagesYet">Vous n'avez pas encore échangé de messages !</p>
                <?php
                $idMessage = 0;
                $idConv = safeEntry($_GET['id']);
                $_SESSION['chatLastId'] = array('idConv' => $idConv, 'lastId' => $idMessage);
            }

                ?>
    </div>
</main>

<div class="inputMessage">
    <div class="inputMsgWrapper">
        <form id="addMessageForm">
            <div class="mediaContainer">
                <label for="media">
                    <img src="public/images/icons/addPost.svg" class="currentPicture">
                    <input type="file" id="media" name="media" accept="image/png, image/jpeg">
                </label>
            </div>
            <textarea placeholder="Envoyer un message..." id="msg" name="description" type="text" rows="5" cols="33"></textarea>
            <input type="submit" id="submitAddMessage" value="Envoyer">
        </form>
        <span id="ConfirmationMessage"></span>
    </div>
</div>


<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_chat.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<script src="public/js/chat.js"></script>
<script src="public/js/addAnimal.js"></script>
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

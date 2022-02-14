<?php 
$printNewsletter = false;
$pageTitle = "Se connecter";
ob_start();
?>
<div class="connexion">
<h1>Connectez vous !</h1>
<?php
    if (isset($_GET["src"]) && $_GET["src"]="quizz"){
        ?>
        <h2>Pour sauvegarder vos résultats du quizz et découvrir votre compagnon idéal.</h2>
        <?php
    }
?>
<div>
    <div id="googleAuthButton"></div>
</div>
<form class="connectForm">

    <div class="inputContainer">
        <div class="pseudoContainer">
            <label for="pseudo">pseudonyme *</label>
            <input type="text" name="pseudo" id="pseudo" placeholder="pseudo">
        </div>
        <div class="passwordContainer">
             <label for="password">mot de passe *</label>
            <input type="password" name="password" id="password">
        </div>
    </div>
        
 
        <div class="linksContainer">
            <input type="submit" id="submitConnect" value="se connecter">
            <a href="index.php?action=subscribe">Pas encore inscrit ?</a>
        </div>

        <p>*: Champs obligatoires</p>
</form>
</div>

<span id="ConfirmationMessage"></span>


<?php 
    $viewContent = ob_get_clean();

    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_connexion.css">
<?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>
        function handleCredentialResponse(response) {
          console.log("Encoded JWT ID token: " + response.credential);

        fetch('model/googleAuth.php', {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify(response.credential),
        }).then(response => { 
            response.json().then(function(data){ 
                console.log('d ',data);
                return response;
            })
        })
        }
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "866214768583-13jeokh10iam9q1chmeiphgok3gbkr1i.apps.googleusercontent.com",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("googleAuthButton"),
            { theme: "outline", size: "large" }  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>
<?php
    $scriptsBlock = ob_get_clean();

    require(BASE_URL . 'public/template/template.php');
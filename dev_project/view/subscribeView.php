<?php 
$pageTitle = "S'inscrire";
ob_start();
?>

<div class="subscribe">
        <h1>Bienvenue sur Zoey !</h1>
        <form class="subscribeForm" action="">
            
        
           <div class="accountContainer">
               <div class="pseudoContainer">
                    <label for="pseudo">Pseudonyme *</label>
                    <input type="text" name="pseudo" id="pseudoSubscribe" placeholder="pseudo" required='required'> 
               </div>
                <div class="pictureContainer">
                    <label for="media">Photo de profil </label>
                    <input type="file" id="media" name="media" accept="image/png, image/jpeg" >
                </div>
           </div>
        
           
            <label for="nom">Nom et prénom *</label>
            <div class="name">
            <input type="text" name="nom" id="nom" placeholder="nom" required='required'> 
            <input type="text" name="prenom" id="prenom" placeholder="prenom" required='required'>   
            </div>
           
            <div class="localisationContainer">
                <div class="cityContainer">
                    <label for="ville">Localisation *</label>
                    <input type="text" name="ville" id="ville" placeholder="ville" required='required'>
                </div>
                <div class="codePostalContainer">
                    <label for="codePostal">Code postal *</label>
                    <input type="number" name="codePostal" id="codePostal" pattern="[0-9]{5}" placeholder="00000" required='required'>
                </div>
            </div>
                
            <div class="mailAndBirthContainer">
                <div class="mailContainer">
                    <label for="mail">Adresse e-mail *</label>
                    <input type="email" name="mail" id="mail" placeholder="example@zoey.fr" required='required'>  
                </div>
                <div class="dateOfBirthContainer">
                    <label for="date_naissance">date de naissance *</label>
                    <input type="date" name="date_naissance" id="date_naissance" required='required'> 
                </div>
            </div>
            

            <label for="password">mot de passe</label>
            <input type="password" name="password" id="password" required='required'> 
        
            <div class="checkboxContainer">
                <input type="checkbox" name="checkbox" required='required'>
                <label for="checkbox">Je certifie être majeur, ou dans le cas contraire, j’utilise ZOEY sous la supervision d’un responsable légale.</label>
            </div>
            
            <div class="linksContainer">
                <input type="submit" id="submitSubscribe" value="s'inscrire">
                <a href="">Déjà inscrit ?</a>
            </div>

            <p>*: Champs obligatoires</p>
            
        </form>
    </div>
<span id="ConfirmationMessage"></span>

<?php 
    // styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_subscription.css">
<?php
$stylesBlock = ob_get_clean();

    $viewContent = ob_get_clean();
    require(BASE_URL . 'public/template/template.php');
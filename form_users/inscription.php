<?php 
  session_start();
  if(isset($_SESSION['unique_id'])){
    $reponse = $bdd->query("SELECT * FROM restaurants WHERE Numero='{$x}'");
    while ($donnees = $reponse->fetch()){
      header('location: ../../restaurants.php?user_id='.$row['unique_id'].'>');
    }
    $reponse->closeCursor();

  }
?>

<?php include_once "header_form.php"; ?>
<body>
  <div class="wrapper">
    <section class="form signup">
      <header>Inscription Reserv'App</header>
      <form action="#" method="POST" enctype="multipart/form-data" autocomplete="off">
        <div class="error-text"></div>
        <div class="name-details">
          <div class="field input">
            <label>Prénom</label>
            <input type="text" name="nom" placeholder="Prénom" required>
          </div>
          <div class="field input">
            <label>Nom</label>
            <input type="text" name="lname" placeholder="Nom" required>
          </div>
        </div>
        <div class="field input">
          <label>Adresse mail</label>
          <input type="text" name="email" placeholder="Entez votre email" required>
        </div>
        <div class="field input">
          <label>Password</label>
          <input type="password" name="password" placeholder="Entez un password" required>
          <i class="fas fa-eye"></i>
        </div>
        <div class="field button">
          <input type="submit" name="submit" value="Continuer">
        </div>
      </form>
      <div class="link">Déjà enregistré ? <a href="../index.php">Se connecter</a></div>
      <div class="link">Inscription restaurateur <a href="../form_restaurants/inscription.php">S'inscrire</a></div>
    </section>
  </div>

  <script src="javascript/pass-show-hide.js"></script>
  <script src="javascript/signup.js"></script>

</body>
</html>

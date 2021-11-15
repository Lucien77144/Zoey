<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blog de Zoey 🐱</title>
  <link rel="stylesheet" href="assets/style.css" />
  <link rel="stylesheet" href="assets/style_header.css">
  <link rel="stylesheet" href="assets/style_commun.css">
</head>

<body>
  
  <!-- Header / Footer -->
  <header><h1>ZOEY</h1><div class="navbar"><a href=""><img src="assets/img/msg.svg" alt=""></a><a href=""><img src="assets/img/upload.svg" alt=""></a></div></header>
    <nav class="menu">
        <div class="menuInner">
            <a href=""><img src="assets/img/actus.svg" alt="Page actualitées"><h2>Actus</h2></a>
            <a href=""><img src="assets/img/forum.svg" alt="Page forum"><h2>Forum</h2></a>
        </div>
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="white" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
        </svg>
        <div class="menuInner">
            <a href=""><img src="assets/img/adoption.svg" alt="Page adoption"><h2>Adoption</h2></a>
            <a href=""><img src="assets/img/profil.svg" alt="Page profil"><h2>Profil</h2></a>
        </div>                           
    </nav>
    <a class="feed" href=""><img src="assets/img/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z"/>
        </svg>                          
    </nav>
    <!--  -->

  <section>

    <article>
      <h1>titre</h1>
      <!-- Les images sont placées sous forme de div afin de mieux les redimentionner et optimiser l'affichage -->
      <div class="img" style='background-image: url("medias/article_1.png")'></div>
      <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus eligendi quod aspernatur officiis alias, quidem veritatis ut ea optio earum accusamus dignissimos quisquam exercitationem corporis molestias velit. Culpa, mollitia asperiores!
      </p>
      <a href="____VARIABLEPHP_lien_de_larticle____">Lire la suite</a>
    </article>
  
  </section>
  
    <form>
      <label for="name">Ne loupez aucune actualité de notre plateforme en vous inscrivant à notre newsletter !</label>
      <input type="text" name="prenom" id="prenom" placeholder="Votre prénom">
      <input type="email" name="email" id="email" placeholder="Votre e-mail" required>
      <input type="submit" value="S'abonner">
    </form>
</body>

</html>
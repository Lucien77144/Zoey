<?php
$pageTitle = 'Qui sommes-nous ?';
$printLegal = true;
$metaDesc = "Nous apportons notre aide aux 100 000 animaux abandonnés chaque année en France en créant un site web 100% gratuit qui aide et incite les Français à adopter dans des refuges.";
ob_start();
?>

<div class="bgContainer">
  <h1 class="underline title">Qui sommes nous?</h1>
</div>
<h2 class="title2">Le projet étudiant</h2>
<p class="intro">
  Apporter notre aide aux 100 000 animaux abandonnés chaque année en France en créant un site web 100% gratuit qui aide et incite les Français à adopter dans des refuges.
  <br><br>
  Zoey s’articule autour de 3 axes :
  <br><br>
  > Actualités : Flash info sur l’actualité animalière.
  <br><br>
  > Adoption : Découvrir des animaux présents en refuges qui vous correspondent et n’attendent qu’une seule chose : être adoptés.
  <br><br>
  > Réseaux : Partager du contenu en lien avec vos animaux de compagnie.
</p>

<div class="btn" id="installPWAbtn"><a href="index.php?action=pwa">Installer l'appli Zoey</a></div>

<div class="mockupContainer">
  <div class="imgWrap mockupImg">
    <img src="<?= BASE_URL ?>public/images/presentation/mockupZoey.jpg" alt="">
  </div>
</div>
<!-- <img src="<?= BASE_URL ?>public/images/presentation/mockupZoey.jpg" alt="" > -->

<h2 class="title2">Notre équipe</h2>

<main>
  <section>
    <div>
      <h2 class="title2">Clémentine Gilama</h2>
      <p class="poste">Scrum Master & Community Manager</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/clementine.jpg" alt="">
    </div>
    <p class="desc">
      Elle anime les réseaux sociaux Zoey en créant et en réalisant des contenus visuels ou textuels. Elle analyse les posts et communique avec les internautes régulièrement. Elle veille au bon déroulement du projet et organise les réunions d’équipe.
    </p>
    <a class="btn" target="_blank" href="https://www.linkedin.com/in/clementine-gilama/">Mieux me connaître</a>
  </section>

  <section>
    <div>
      <h2 class="title2">Marin Bouanchaud</h2>
      <p class="poste">Product Owner & Développeur Back-end</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/marin.jpg" alt="">
    </div>
    <p class="desc">
      Il crée l’architecture du site web. Il développe toute la partie “back” du site web, afin de définir toutes les fonctionnalités de la plateforme.
    </p>
    <a class="btn" target="_blank" href="https://www.linkedin.com/in/marin-bouanchaud/">Mieux me connaître</a>
  </section>

  <section>
    <div>
      <h2 class="title2">Lucien Boisseau Sablé</h2>
      <p class="poste">Développeur Full Stack & Lead Developer</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/lucien.jpg" alt="">
    </div>
    <p class="desc">
      Il est chargé de développer le site web dans son ensemble. Il réfléchit à l’optimisation de la plateforme
      pour tout type d’utilisateurs, afin que le site soit accessible sur un ordinateur aussi bien que sur un
      mobile.
    </p>
    <a class="btn" target="_blank" href="https://www.linkedin.com/in/lucien-boisseau-sable/">Mieux me connaître</a>
  </section>

  <section>
    <div>
      <h2 class="title2">Matthis Rousselle</h2>
      <p class="poste">UX/UI Designer & Développeur Front-End</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/matthis.jpg" alt="">
    </div>
    <p class="desc">
      Il imagine et crée l’interface visuelle du site web. Il cherche une identité graphique pouvant mettre en avant les valeurs du site, tout en proposant un parcours utilisateur intuitif.
    </p>
    <a class="btn" target="_blank" href="https://matthisrousselle.fr/">Mieux me connaître</a>
  </section>

  <section>
    <div>
      <h2 class="title2">Amélie Rubiales</h2>
      <p class="poste">Chargée de communication & marketing</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/amelie.jpg" alt="">
    </div>
    <p class="desc">
      Elle crée du contenu textuel pour le site web et contacte les refuges. Elle s’occupe de la newsletter Zoey, rédige les différents aspects marketing et juridique du projet.
    </p>
    <a class="btn" target="_blank" href="https://www.linkedin.com/in/am%C3%A9lie-rubiales/">Mieux me connaître</a>
  </section>

  <section>
    <div>
      <h2 class="title2">Zoé la tortue</h2>
      <p class="poste">Mascotte</p>
    </div>
    <div class="imgWrap">
      <img src="<?= BASE_URL ?>public/images/presentation/zoe.jpg" alt="">
    </div>
    <p class="desc">
      Notre mascotte préférée, Zoé, est une inspiration quotidienne pour notre projet. Vous l'avez peut-être compris, <strong>Zoey</strong> vient directement de <strong>Zoé</strong>, elle travaille toujours avec nous. (sauf quand elle hiberne !)
    </p>
    <a class="btn" target="_blank" href="https://www.instagram.com/zoelatortue_/">Mieux me connaître</a>
  </section>

  <section class="partenaires">
    <h2>Nos partenaires</h2>
    <p class="firstText">Zoey est en partenariat et en étroite collaboration avec 9 refuges pour animaux en Île de France :</p>
    <div class="partenairesContainer">
      <div class="refugeContainer">
        <p>Sos p'tites bêtes</p>
        <img src="./public/images/refuges/sosptitesbetes.png" alt="logo de l'asssociation sos ptites bêtes">
      </div>
      <div class="refugeContainer">
        <p>pattes en rond </p>
        <img src="./public/images/refuges/pattesenrond.png" alt="logo de l'asssociation pattes en rond">
      </div>
      <div class="refugeContainer">
        <p>pitbull sans toit</p>
        <img src="./public/images/refuges/pitbullsanstoit.png" alt="logo de l'asssociation pitbullsanstoit">
      </div>
      <div class="refugeContainer">
        <p>APAC94</p>
        <img src="./public/images/refuges/APAC.png" alt="logo de l'asssociation APAC">
      </div>
      <div class="refugeContainer">
        <p>l’arche de bagheera</p>
        <img src="./public/images/refuges/larchedebagheera.png" alt="logo de l'asssociation l'arche de bagheera">
      </div>
      <div class="refugeContainer">
        <p>Les patounes de bezons</p>
        <img src="./public/images/refuges/lespatounesdebezons.png" alt="logo de l'asssociation les patounes de bezons">
      </div>
      <div class="refugeContainer">
        <p>adopte un matou</p>
        <img src="./public/images/refuges/adopteunmatou.png" alt="logo de l'asssociation adopte un matou">
      </div>
      <div class="refugeContainer">
        <p>association emâ</p>
        <img src="./public/images/refuges/ema.png" alt="logo de l'asssociation ema">
      </div>
      <div class="refugeContainer">
        <p>association louna</p>
        <img src="./public/images/icons/favicon.svg" alt="">
      </div>
    </div>
  </section>
  <section class="resFooter">
    <h2 class="title2">Nos Réseaux</h2>
    <div class="reseaux">
      <a target="_blank" href="https://www.facebook.com/appli.zoey">
        <img src="<?= BASE_URL ?>public/images/presentation/facebook.svg" alt="">
        Appli.zoey
      </a>
      <a target="_blank" href="https://www.instagram.com/zoey.app/">
        <img src="<?= BASE_URL ?>public/images/presentation/instagram.svg" alt="">
        Zoey.app
      </a>
      <a target="_blank" href="https://www.tiktok.com/@zoey.app">
        <img src="<?= BASE_URL ?>public/images/presentation/tiktok.svg" alt="">
        Zoey.app
      </a>
      <!-- <a href="https://twitter.com/App_Zoey">
          <img src="<?= BASE_URL ?>public/images/presentation/twitter.svg" alt="">
          App_Zoey
        </a> -->
      <a target="_blank" href="https://www.linkedin.com/company/zoeyapp/about/">
        <img src="<?= BASE_URL ?>public/images/presentation/linkedin.svg" alt="">
        Zoey
      </a>
    </div>
  </section>
</main>



<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_presentation.css" />
<?php
$stylesBlock = ob_get_clean();

// SCRIPT BLOCK
ob_start(); ?>
<!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
$scriptsBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

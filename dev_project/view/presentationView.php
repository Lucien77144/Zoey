<?php
// presentation of the Zoey project

$pageTitle = 'Qui sommes-nous ?';
$printLegal = true;
$metaDesc = "Nous apportons notre aide aux 100 000 animaux abandonnés chaque année en France en créant un site web 100% gratuit qui aide et incite les Français à adopter dans des refuges.";
ob_start();
?>

<section class="introduction">
  <h1 class="titleZoey">Bienvenue sur <span class="importantColor">ZOEY</span></h1>
  <div class="introWrapper">
    <div class="introContainer">
      <p class="intro">
        Chaque année, <span class="importantColor">100 000 animaux</span> sont abandonnés en France. La solution la plus simple pour lutter contre l'abandon, c'est <span class="importantColor">l'adoption</span>.
      </p>
      <div class="wrapperCTA">
        <a href="/?action=adoption"><div>Adopter</div></a>
        <a href="/?action=feed"><div>Partager</div></a>
        <a href="/?action=blog"><div>S'informer</div></a>
      </div>
    </div>
  </div>
  <div class="download" id="installPWAbtn">
    <svg class="dl-icon" viewBox="0 0 330 330" fill="none">
      <path d="M165 10C79.3959 10 10 79.3959 10 165C10 250.604 79.3959 320 165 320C250.604 320 320 250.604 320 165C320 79.3959 250.604 10 165 10ZM165 300C90.561 300 30 239.439 30 165C30 90.561 90.561 30 165 30C239.439 30 300 90.561 300 165C300 239.439 239.439 300 165 300Z" fill="#FFC800"/>
      <path d="M195 244H135C126.716 244 120 246.715 120 255C120 263.283 126.716 266 135 266H195C203.284 266 210 263.283 210 255C210 246.715 203.284 244 195 244Z" fill="#FF9900"/>
      <path d="M222.145 132.751C226.523 129.472 231.653 129.129 235.28 132.751C238.907 136.372 238.907 142.242 235.28 145.864L173.24 207.799C168.965 212.067 162.035 212.067 157.76 207.799L95.7203 145.864C92.0932 142.242 92.0932 136.372 95.7203 132.751C99.3475 129.129 104.477 129.472 108.855 132.751L155.375 168.265V141.884V75.1079C155.375 69.5255 159.908 65 165.5 65C171.092 65 175.625 69.5255 175.625 75.1079V152.811C175.625 157.573 175.625 168.265 175.625 168.265L222.145 132.751Z" fill="#FF9900"/>
    </svg>
    <p>Installez l'application Zoey !</p>
  </div>
  <img class="img-presentation" src="<?= BASE_URL ?>public/images/presentation/dog_presentation.png" alt="">
  <!-- <p class="introList">
    Retrouvez des flash info sur l'actualité animalière,
  </p>
  <p class="introList">
    Partagez la vie de vos animaux de compagnie,
  </p>
  <p class="introList">
    Et si vous cherchez un nouveau compagnon, pensez à adopter !
  </p> -->

  <!-- <h2 class="title2 titleMargin">Sur Zoey, plus de 150 animaux attendent d'être adoptés dans des refuges partenaires.</h2> -->
</section>

<section class="partenaires">
  <div class="presView">
    <h2 class="titleUnderline">Qui sommes-nous ?</h2>
    <p class="blockPres">
      ZOEY est un projet regroupant cinq étudiants sensibles à la cause animale. Nous avons décidé de concevoir une plateforme entièrement gratuite, permettant la mise en relation entre futurs adoptants et refuges certifiés pour animaux en Île de France.
      Notre site web dispose de différentes sections, permettant de fidéliser une communauté passionnée d’animaux, et sensible face à l’abandon en France.<br><br>

      Il y a tout d’abord la page adoption, mettant en avant de nombreux animaux (plus d’une centaine provenant de refuges ou d’associations certifiées au Répertoire National des Associations d’Île de France). Nous démarchons l’ensemble des refuges d'île-de-France afin de pouvoir mettre en avant le maximum d’animaux abandonnés dans le but de leur offrir une seconde chance. Nous promouvons la diversité d’animaux, en effet, de nombreux NAC (Nouveaux Animaux de Compagnie) sont présents sur notre page adoption et cherchent à trouver une famille d'accueil. Afin de pouvoir adapter une sélection d’animaux à adopter précise pour chaque utilisateur, ZOEY a conçu un Quiz permettant en quelques questions de proposer à l’utilisateur des animaux qui lui correspondent au mieux, en prenant en compte les envies et l’environnement de l’utilisateur en question.<br><br>  

      Notre page Actus permet à notre communauté de pouvoir se tenir informée de l’actualité animalière, de par nos articles originaux et nos interviews de différents professionnels du domaine animalier. Cette page permet aussi de donner un rendez-vous hebdomadaire aux utilisateurs de ZOEY, nous postons chaque jeudi et mardi des articles permettant de fidéliser notre communauté.<br><br>

      ZOEY dispose aussi d’un réseau social qui lui est entièrement propre. Chaque utilisateur peut s’inscrire sur la plateforme afin d’ajouter ses animaux de compagnie sur son profil. Il peut poster autant de photos qu’il le souhaite de son animal, celles-ci seront mises en avant sur un feed permettant de créer des liens sociaux entre les différents utilisateurs de ZOEY. Il peut aussi ajouter en amis d’autres utilisateurs de ZOEY, avec qui il peut échanger photos et messages dans la partie Chat de ZOEY.
    </p>
  </div>
  <div>
    <h2 class="titleUnderline">Nos partenaires</h2>
    <p class="firstText">Zoey est en partenariat et en étroite collaboration avec 9 refuges pour animaux en Île de France :</p>
    <div class="partenairesContainer">
      <a target="blank" href="https://sosptitesbetes.wixsite.com/sosptitesbetes" class="refugeContainer">
        <p>Sos P'tites Bêtes</p>
        <img src="./public/images/refuges/sosptitesbetes.png" alt="logo de l'asssociation sos ptites bêtes">
      </a>
      <a target="blank" href="https://pattesenrond.fr/" class="refugeContainer">
        <p>Pattes En Rond </p>
        <img src="./public/images/refuges/pattesenrond.png" alt="logo de l'asssociation pattes en rond">
      </a>
      <a target="blank" href="https://www.facebook.com/apibullssanstoit/" class="refugeContainer">
        <p>Pitbull Sans Toit</p>
        <img src="./public/images/refuges/pitbullsanstoit.png" alt="logo de l'asssociation pitbullsanstoit">
      </a>
      <a target="blank" href="https://www.facebook.com/APAC94ASSO/" class="refugeContainer">
        <p>APAC94</p>
        <img src="./public/images/refuges/APAC.png" alt="logo de l'asssociation APAC">
      </a>
      <a target="blank" href="http://refuge-larche-de-bagheera.weebly.com/" class="refugeContainer">
        <p>L’arche De Bagheera</p>
        <img src="./public/images/refuges/larchedebagheera.png" alt="logo de l'asssociation l'arche de bagheera">
      </a>
      <a target="blank" href="http://les-patounes-de-bezons.fr/" class="refugeContainer">
        <p>Les Patounes De Bezons</p>
        <img src="./public/images/refuges/lespatounesdebezons.png" alt="logo de l'asssociation les patounes de bezons">
      </a>
      <a target="blank" href="https://adopteunmatou.com/" class="refugeContainer">
        <p>Adopte Un Matou</p>
        <img src="./public/images/refuges/adopteunmatou.png" alt="logo de l'asssociation adopte un matou">
      </a>
      <a target="blank" href="https://associationema.wixsite.com/associationema" class="refugeContainer">
        <p>Association Emâ</p>
        <img src="./public/images/refuges/ema.png" alt="logo de l'asssociation ema">
      </a>
      <a target="blank" href="https://www.facebook.com/associationlouna/" class="refugeContainer">
        <p>Association Louna</p>
        <img src="./public/images/icons/favicon.svg" alt="">
      </a>
    </div>
  </div>
</section>

<section>
  <h2 class="titleUnderline">L'équipe Zoey</h2>
  <main>
    <section>
      <div>
        <h2 class="title2 titleFirst">Clémentine Gilama</h2>
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
  </main>

</section>
<section class="resFooter">
  <h2>Abonnez-vous pour nous soutenir</h2>
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
    <a target="_blank" href="https://www.linkedin.com/company/zoeyapp/about/">
      <img src="<?= BASE_URL ?>public/images/presentation/linkedin.svg" alt="">
      Zoey
    </a>
  </div>
</section>


<?php
$viewContent = ob_get_clean();

// styles BLOCK
ob_start(); ?>
<link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_presentation.css" />
<?php
$stylesBlock = ob_get_clean();

require(BASE_URL . 'public/template/template.php');

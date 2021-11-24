<?php 
$pageTitle = 'Mentions légales';
ob_start();
?>

<section class="mentionslegalpage">
    <h1>Mentions légales de ZOEY</h1>
    <h2>Informations éditeur </h2>
    <ul>
        <li>Zoey</li>
        <li>2 rue Albert Einstein</li>
        <li>77420 Champs-sur-Marne</li>
        <li>France</li>
        <li>Tél : +33(0)7 81 21 63 94</li>
        <li>email : app.zoey@gmail.com</li>
    </ul>
    <h2>Informations hébergeur</h2>
    <ul>
        <li>1&1 Ionos</li>
        <li>Elgender Str 57</li>
        <li>56410 Montabaur</li>
        <li>Allemagne</li>
        <li>Tél : +49(0)970 808 911</li>
        <li>email : info@ionos.fr</li>
    </ul>
    <h2>Utilisation des données et Copyright</h2>
    <p>
        Toute utilisation des données ou des informations provenant du site
        Internet Zoey doit être obligatoirement mentionnée en tant que source de
        l'information.
    </p>
    <p>
        Le logo doit alors être utilisé dans son intégralité et sans aucune
        modification.
    </p>
    <h2>Lien vers d’autres sites </h2>
    <p>
        Zoey est susceptible de proposer sur le site des liens simples vers
        d’autres sites web tiers notamment des refuges. Ces liens ne sont
        fournis qu’à titre de courtoisie.</p>
    <p> Zoey n’étant pas en mesure de procéder
        à un contrôle du contenu de ces sites web tiers, tout accès à ces sites
        s’effectue sous la seule responsabilité de l’utilisateur du site et à
        ses propres risques. Zoey décline toute responsabilité quant au contenu
        ou à la disponibilité des sites tiers.
    </p>
    <h2>Protection des données à caractère personnel et politique de confidentialité</h2>
    <p>
        La collecte de données à caractère personnel à partir du site Internet
        est réalisée dans le cadre des demandes d’inscription à notre Newsletter
        ou à la création d’un profil.
    </p>

    <p>
        L’accès et le traitement de vos données est réservé aux seuls
        destinataires suivants : Lucien Boisseau-Sablé, Marin Bouanchaud,
        Clémentine Gilama,Matthis Rousselle et Amélie Rubiales.
    </p>
    <p>
        Vous disposez pendant toute la durée du traitement d’un droit d’accès,
        de rectification, de portabilité et d’effacement de vos données. Si vous
        estimez, après nous avoir contactés, que vos droits sur vos données ne
        sont pas respectés, vous pouvez adresser une réclamation à la CNIL.
    </p>
    <h2>Propriété intellectuelle</h2>
    <p>
        L'accès au site web Zoey vous confère un droit d’usage privé et non
        exclusif de ce site. L’ensemble des éléments édités sur ce site,
        incluant notamment les textes, photographies, vidéos et logos,
        constituent des œuvres de l’esprit au sens du Code de la Propriété
        Intellectuelle.</p>
    <p>Par conséquent, toute utilisation sous forme de
        représentation, modification, reproduction, intégrale ou partielle, qui
        pourrait être faite sans le consentement de leurs auteurs ou de leurs
        ayants-droit, est illicite.
    </p>
</section>
<?php
    $viewContent = ob_get_clean();
    
    // styles BLOCK
    ob_start(); ?>
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_mentions.css" />
<?php
    $stylesBlock = ob_get_clean();

    // SCRIPT BLOCK
    ob_start(); ?>
    <!-- <script src="public/js/ YOUR SCRIPT GOES HERE "></script> -->
<?php
    $scriptsBlock = ob_get_clean();

    require(BASE_URL . 'public/template/template.php');
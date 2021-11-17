-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 16 oct. 2021 à 23:12
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoey_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal_a_adopter`
--

CREATE TABLE `animal_a_adopter` (
  `idanimal_a_adopter` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_anniversaire` date DEFAULT NULL,
  `refuge_idrefuge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `animal_a_adopter`
--

INSERT INTO `animal_a_adopter` (`idanimal_a_adopter`, `nom`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`) VALUES
(3, 'Titou', 'titou.jpg', 'Titou est un chat affectueux et proche de son maître. Il réclame des caresses (surtout des grosses gratouilles derrière les oreilles, il saura vous montrer).\r\n \r\nIl n’aime pas etre pris dans les bras et ne vient pas sur les genoux mais vous accompagne volontiers dans la salle de bains ou reste a vos côtés sur le canapé. \r\n \r\nIl accourt très facilement quand on l’appelle. Il ADORE être brossé.\r\n \r\nC’est un grand gourmand qui devrait pouvoir apprendre des petits tours pour obtenir une croquette. Il faudra progressivement lui apporter une nourriture de bonne qualité car habitué aux bonbons et autres friandises il peut faire le difficile devant des marques pourtant mieux adaptées à sa santé. \r\n \r\nTitou est un vrai chasseur ! Il a besoin de beaucoup jouer et de personnes présentes à la maison.\r\n \r\nIl a besoin d’être stimulé, sinon ce seront vos orteils ou vos plantes vertes qui l’amuseront beaucoup. \r\n \r\nTitou n’a pas été testé avec d’autres chats mais peut-être qu’un compagnon aussi actif que lui pourrait être bénéfique.', '2019-10-01', 1),
(4, 'Pee-wee', 'peewee.jpg', 'Histoire : \r\n\r\nPee-wee est né en mars 2019. Il a été trouvé dans un entrepôt en Bretagne. Non réclamé.\r\nPee-wee est FIV+ et fait un peu d’asthme.\r\nCaractère : \r\n\r\nCe petit loulou de 2 ans est très attachant. Il se laisse caresser sans problème et il est extrêmement sociable !\r\nIl se pavane et aime venir dire bonjour à tout le monde !\r\n \r\nPee-wee est joueur. Il a besoin d’être stimulé et que l’on s’occupe de lui. Pee-wee est sociable avec les autres chats et il peut sans problème être adopté avec un copain négatif au FIV car il ne ferait pas de mal à une mouche ! \r\n(Quoi que, pour la mouche…).\r\n \r\nPee-wee apprécie sortir. Un espace extérieur bien sécurisé (terrasse, jardin) est important pour son bien être et pour qu’il se dore la pilule au soleil.\r\n \r\nPee-wee est aussi indépendant. Au gré de ses humeurs il aime changer régulièrement de couchage, une nuit sur le lit, ou l’autre sur le canapé.\r\n \r\nC‘est un compagnon de vie adorable qui vous attend !', '2019-03-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `animal_a_adopter_has_badge`
--

CREATE TABLE `animal_a_adopter_has_badge` (
  `animal_a_adopter_idanimal_a_adopter` int(11) NOT NULL,
  `animal_a_adopter_refuge_idrefuge` int(11) NOT NULL,
  `badge_idbadge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `badge`
--

CREATE TABLE `badge` (
  `idbadge` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `url_icone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `resume` varchar(255) NOT NULL,
  `url_contenu_article` varchar(45) DEFAULT NULL,
  `date_publication` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `url_contenu_article`, `date_publication`) VALUES
(1, 'Les animaux c\'est génial', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', 'public/blog/blogTemplate.php', '2021-10-01 09:56:30'),
(3, 'Nourrir son chien', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '2021-10-03 12:45:23'),
(4, 'Caresser une tortue', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '2021-10-03 12:45:23'),
(5, 'Sauver les animaux', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '2021-10-03 12:45:28'),
(6, 'Adopter une chèvre', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '2021-10-03 12:45:28');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_forum`
--

CREATE TABLE `categorie_forum` (
  `idcategories_forum` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `url_icone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `centres_interet`
--

CREATE TABLE `centres_interet` (
  `idcentres_interet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `centres_interet_has_types_animaux`
--

CREATE TABLE `centres_interet_has_types_animaux` (
  `centres_interet_idcentres_interet` int(11) NOT NULL,
  `types_animaux_idtypes_animaux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire_post`
--

CREATE TABLE `commentaire_post` (
  `idcommentaire_post` int(11) NOT NULL,
  `texte_commentaire` mediumtext DEFAULT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `post_idpost` int(11) NOT NULL,
  `post_profil_animal_de_compagnie_idprofil_animal_de_compagnie` int(11) NOT NULL,
  `post_profil_animal_de_compagnie_utilisateur_idutilisateur1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `idconversation` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `url_photo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `conversation_has_utilisateur`
--

CREATE TABLE `conversation_has_utilisateur` (
  `conversation_idconversation` int(11) NOT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `liste_amis`
--

CREATE TABLE `liste_amis` (
  `idliste_amis` int(11) NOT NULL,
  `id_demandeur` int(11) DEFAULT NULL,
  `id_receveur` int(11) DEFAULT NULL,
  `date_demande` datetime DEFAULT current_timestamp(),
  `id_bloqueur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idmessage` int(11) NOT NULL,
  `texte_message` tinytext DEFAULT NULL,
  `url_media` varchar(45) DEFAULT NULL,
  `date_envoi_msg` datetime DEFAULT current_timestamp(),
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `conversation_idconversation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `idpost` int(11) NOT NULL,
  `media` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `id_likes_utilisateurs` int(11) DEFAULT NULL,
  `profil_animal_de_compagnie_idprofil_animal_de_compagnie` int(11) NOT NULL,
  `profil_animal_de_compagnie_utilisateur_idutilisateur1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idpost`, `media`, `description`, `date_publication`, `id_likes_utilisateurs`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`) VALUES
(2, 'poule.jpg', 'Photo de ma poule en train de manger', '2021-10-12 19:47:48', NULL, 2, 54),
(3, 'poule.jpg', 'Véro se balade', '2021-10-12 22:07:03', NULL, 2, 54),
(4, 'poule.jpg', 'Je pars chercher à manger', '2021-10-12 22:11:07', NULL, 2, 54);

-- --------------------------------------------------------

--
-- Structure de la table `profil_animal_de_compagnie`
--

CREATE TABLE `profil_animal_de_compagnie` (
  `idprofil_animal_de_compagnie` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `utilisateur_idutilisateur1` int(11) NOT NULL,
  `types_animaux_idtypes_animaux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `profil_animal_de_compagnie`
--

INSERT INTO `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `nom`, `url_photo`, `description`, `date_naissance`, `utilisateur_idutilisateur1`, `types_animaux_idtypes_animaux`) VALUES
(2, 'Véro', 'poule.jpg', 'Poule craintive mais gentille, aime bien les asticots, vit à thorigny sur marne', NULL, 54, 1),
(3, 'a', 'a', 'a', '2021-10-20', 54, 1);

-- --------------------------------------------------------

--
-- Structure de la table `refuge`
--

CREATE TABLE `refuge` (
  `idrefuge` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `lien` varchar(45) DEFAULT NULL,
  `adresse_mail` varchar(45) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `url_logo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `refuge`
--

INSERT INTO `refuge` (`idrefuge`, `nom`, `description`, `lien`, `adresse_mail`, `telephone`, `adresse`, `url_logo`) VALUES
(1, 'Association Nine Lives Paris', 'ADOPTION D\'ANIMAUX DE COMPAGNIE A PARIS ET EN ILE-DE-FRANCE', 'https://ninelives.fr/', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reinitialisation_mot_de_passe`
--

CREATE TABLE `reinitialisation_mot_de_passe` (
  `idreinitialisation_mot_de_passe` int(11) NOT NULL,
  `id_demandeur` int(11) DEFAULT NULL,
  `token_reinitialisation` varchar(45) DEFAULT NULL,
  `date_demande_reinitialisation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_forum`
--

CREATE TABLE `reponse_forum` (
  `idreponse_forum` int(11) NOT NULL,
  `texte_reponse` mediumtext DEFAULT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `id_likes_utilisateurs` int(11) DEFAULT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `signalement`
--

CREATE TABLE `signalement` (
  `idsignalement` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `date_signalement` datetime DEFAULT current_timestamp(),
  `statut` tinyint(4) DEFAULT 0,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum`
--

CREATE TABLE `sujet_forum` (
  `idsujet_forum` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `id_reponse_epinglee` int(11) DEFAULT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `categorie_forum_idcategories_forum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum_favoris`
--

CREATE TABLE `sujet_forum_favoris` (
  `idsujet_forum_favoris` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_sujet_favoris` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum_has_reponse_forum`
--

CREATE TABLE `sujet_forum_has_reponse_forum` (
  `sujet_forum_idsujet_forum` int(11) NOT NULL,
  `sujet_forum_utilisateur_idutilisateur` int(11) NOT NULL,
  `reponse_forum_idreponse_forum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `types_animaux`
--

CREATE TABLE `types_animaux` (
  `idtypes_animaux` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `url_icone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_animaux`
--

INSERT INTO `types_animaux` (`idtypes_animaux`, `nom`, `url_icone`) VALUES
(1, 'poule', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int(11) NOT NULL,
  `pseudo` varchar(45) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adresse_mail` varchar(45) DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_derniere_connexion` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`) VALUES
(2, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:15:24', NULL, NULL),
(3, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:15:26', NULL, NULL),
(4, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:16:39', NULL, NULL),
(5, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:16:53', NULL, NULL),
(6, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:01', NULL, NULL),
(7, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:01', NULL, NULL),
(8, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:21', NULL, NULL),
(9, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:31', NULL, NULL),
(10, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:26:05', NULL, NULL),
(11, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:26:46', NULL, NULL),
(12, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:27:12', NULL, NULL),
(13, NULL, '$argon2i$v=19$m=2048,t=4,p=3$dUtXa29hVEt2eDhJbjJ0eQ$/+I4XqKPjjHkQf+h9SRMDGDQ9CEx2MUn2fNcoOW6NzU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:27:50', '2021-10-11 21:27:45', NULL),
(14, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:29', NULL, NULL),
(15, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:35', NULL, NULL),
(16, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:36', NULL, NULL),
(17, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:34', NULL, NULL),
(18, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:52', NULL, NULL),
(19, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:06', NULL, NULL),
(20, NULL, '=19=2048,t=4,p=3+BRptAhGziq2I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:36', NULL, NULL),
(21, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:33:57', NULL, NULL),
(22, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:34:24', NULL, NULL),
(23, NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:37:05', NULL, NULL),
(24, NULL, '=19=2048,t=4,p=3$39MWwuk1lt2sITkfayWCnivyQXgGcX89ojPzoucmkAU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:47:59', NULL, NULL),
(25, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:10', NULL, NULL),
(26, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:36', NULL, NULL),
(27, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:43', NULL, NULL),
(28, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:02', NULL, NULL),
(29, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:33', NULL, NULL),
(30, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:15', NULL, NULL),
(31, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:26', NULL, NULL),
(32, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:52:55', NULL, NULL),
(33, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:09', NULL, NULL),
(34, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:18', NULL, NULL),
(35, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:54:52', NULL, NULL),
(36, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:46', NULL, NULL),
(37, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:57', NULL, NULL),
(38, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:56:09', NULL, NULL),
(39, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:14', NULL, NULL),
(40, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:25', NULL, NULL),
(41, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:48', NULL, NULL),
(42, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:58:45', NULL, '424242'),
(43, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:42', NULL, NULL),
(44, NULL, 'aaaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:56', NULL, NULL),
(45, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:16', NULL, NULL),
(46, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:31', NULL, NULL),
(47, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:53', NULL, NULL),
(48, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:25', NULL, NULL),
(49, NULL, '$argon2i$v=19$m=2048,t=4,p=3$WlExaVRCU3BHTUFKTDFWSQ$lyDHyXkg+aKauZHinbxkLHSgWaDBXHlt3dHjzHnRh+U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:40', NULL, NULL),
(50, 'Marin', '$argon2i$v=19$m=2048,t=4,p=3$Q05uSXFmV05TMjNPWmhRSw$qlG7lkcoKmy5KyGNorKpwZroT/kJzaE+Qjg6ExNhIRc', 'az', 'az', 'az', NULL, '2021-10-11', NULL, NULL, '2021-10-11 22:02:43', NULL, NULL),
(51, 'Marin', '$argon2i$v=19$m=2048,t=4,p=3$aU9JN1lueXN0MmJ0NC5lcQ$hWN2HUNE5EGfDiAvjUWXxc8JDe8b/r1KBNTirnS5/Kg', 'az', 'az', 'az', NULL, '2021-10-11', NULL, NULL, '2021-10-11 22:03:10', NULL, NULL),
(52, 'pseudo', '$argon2i$v=19$m=2048,t=4,p=3$aXNMYVZUalBKVXBrZWpodA$iJVVOSyeYIXQMl9tjmcEkVTCRqf+nTlQMgeiaJEmd58', 'pseudo', 'pseudo', 'pseudo', NULL, '2021-10-11', NULL, NULL, '2021-10-11 23:03:55', NULL, '12a343c3aedd2568abebad71d65391ab18f1c5ea14e78974bc66b9fc01145b0dd8ab18-52-1634068665'),
(54, 'matthis', '$argon2i$v=19$m=2048,t=4,p=3$aXNMYVZUalBKVXBrZWpodA$iJVVOSyeYIXQMl9tjmcEkVTCRqf+nTlQMgeiaJEmd58', 'matthis', 'rourou', 'm@r', 'profil.jpg', '0000-00-00', NULL, 'Jeune propriétaire de poules du 77', '2021-10-12 10:20:36', NULL, 'b258f69a3c059a626e928ac0a4c071b5ec54ee28cb99a9a445d1f8e97858606f40b5bf-54-1634405463'),
(55, 'maaa', '$argon2i$v=19$m=2048,t=4,p=3$b0VnREI0TUxkSG50TDVjZA$90IKf0fK9U0FRJciVPv+nobhL6cjOe+FJ6M4jfPXJCg', 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:43:40', NULL, NULL),
(56, 'msqdlksqkhdsqd', '$argon2i$v=19$m=2048,t=4,p=3$VFRhMTlmTlBsUlJsRXkzMA$iBQSxxmYWcBQuOyB4oUYgwjmYqxDgnAqUhjYZPbKGjs', 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:44:10', NULL, NULL),
(58, 'testt', '$argon2i$v=19$m=2048,t=4,p=3$RU5jV1hYN3laQWFqdWNPQg$X9MRs3KIP/NUCnj5TcOQ1xbqT+ui5SkmoPbJSS7x1D0', 'test', 'test', 'test', NULL, '2021-10-04', NULL, NULL, '2021-10-12 15:06:47', NULL, '5ec4d4b64a26edbc179bf0e544fa66b1188e1972a71aeae694dc12a0d3ef9dc1c73b14-58-1634044036'),
(59, 'test', '$argon2i$v=19$m=2048,t=4,p=3$OVIxSmFPZXBjaVNKQWVjSA$adFKdFpM4UoPPrm1FL4PEJ1jG5EcCgc8isxc3tVga+A', 'testttt', 'testttt', 'test@psqodskdml', NULL, '0001-01-01', NULL, NULL, '2021-10-12 15:19:52', NULL, '92fa14bc9ef41cd1a496a114714163f0247d1f070778aca9b6180b1a1da260353201af-59-1634044798'),
(60, 'testhash', '$2y$10$qxTOsJZWW507dhLOZT/SEOLT8.IJXZ/vvwxDgBkwqiRrwXUoih3zm', 'testhash', 'testhash', 'testhash', NULL, '2021-10-21', NULL, NULL, '2021-10-13 01:58:22', NULL, '330ea81dce81d8275da9dd3ce0e97d900ae7e774f02d42624ee0141f7d79a013bae4a9-60-1634083112');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_animal_a_adopter`
--

CREATE TABLE `utilisateur_has_animal_a_adopter` (
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `animal_a_adopter_idanimal_a_adopter` int(11) NOT NULL,
  `animal_a_adopter_refuge_idrefuge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_centres_interet`
--

CREATE TABLE `utilisateur_has_centres_interet` (
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `centres_interet_idcentres_interet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  ADD PRIMARY KEY (`idanimal_a_adopter`,`refuge_idrefuge`),
  ADD KEY `fk_animal_a_adopter_refuge1_idx` (`refuge_idrefuge`);

--
-- Index pour la table `animal_a_adopter_has_badge`
--
ALTER TABLE `animal_a_adopter_has_badge`
  ADD PRIMARY KEY (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`,`badge_idbadge`),
  ADD KEY `fk_animal_a_adopter_has_badge_badge1_idx` (`badge_idbadge`),
  ADD KEY `fk_animal_a_adopter_has_badge_animal_a_adopter1_idx` (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`);

--
-- Index pour la table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`idbadge`);

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie_forum`
--
ALTER TABLE `categorie_forum`
  ADD PRIMARY KEY (`idcategories_forum`);

--
-- Index pour la table `centres_interet`
--
ALTER TABLE `centres_interet`
  ADD PRIMARY KEY (`idcentres_interet`);

--
-- Index pour la table `centres_interet_has_types_animaux`
--
ALTER TABLE `centres_interet_has_types_animaux`
  ADD PRIMARY KEY (`centres_interet_idcentres_interet`,`types_animaux_idtypes_animaux`),
  ADD KEY `fk_centres_interet_has_types_animaux_types_animaux1_idx` (`types_animaux_idtypes_animaux`),
  ADD KEY `fk_centres_interet_has_types_animaux_centres_interet1_idx` (`centres_interet_idcentres_interet`);

--
-- Index pour la table `commentaire_post`
--
ALTER TABLE `commentaire_post`
  ADD PRIMARY KEY (`idcommentaire_post`,`utilisateur_idutilisateur`,`post_idpost`,`post_profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`post_profil_animal_de_compagnie_utilisateur_idutilisateur1`),
  ADD KEY `fk_commentaire_post_utilisateur1_idx` (`utilisateur_idutilisateur`),
  ADD KEY `fk_commentaire_post_post1_idx` (`post_idpost`,`post_profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`post_profil_animal_de_compagnie_utilisateur_idutilisateur1`);

--
-- Index pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`idconversation`);

--
-- Index pour la table `conversation_has_utilisateur`
--
ALTER TABLE `conversation_has_utilisateur`
  ADD PRIMARY KEY (`conversation_idconversation`,`utilisateur_idutilisateur`),
  ADD KEY `fk_conversation_has_utilisateur_utilisateur1_idx` (`utilisateur_idutilisateur`),
  ADD KEY `fk_conversation_has_utilisateur_conversation1_idx` (`conversation_idconversation`);

--
-- Index pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  ADD PRIMARY KEY (`idliste_amis`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idmessage`,`utilisateur_idutilisateur`,`conversation_idconversation`),
  ADD KEY `fk_message_utilisateur1_idx` (`utilisateur_idutilisateur`),
  ADD KEY `fk_message_conversation1_idx` (`conversation_idconversation`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`,`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`),
  ADD KEY `fk_post_profil_animal_de_compagnie1_idx` (`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`);

--
-- Index pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  ADD PRIMARY KEY (`idprofil_animal_de_compagnie`,`utilisateur_idutilisateur1`,`types_animaux_idtypes_animaux`),
  ADD KEY `fk_profil_animal_de_compagnie_utilisateur2_idx` (`utilisateur_idutilisateur1`),
  ADD KEY `fk_profil_animal_de_compagnie_types_animaux1_idx` (`types_animaux_idtypes_animaux`);

--
-- Index pour la table `refuge`
--
ALTER TABLE `refuge`
  ADD PRIMARY KEY (`idrefuge`);

--
-- Index pour la table `reinitialisation_mot_de_passe`
--
ALTER TABLE `reinitialisation_mot_de_passe`
  ADD PRIMARY KEY (`idreinitialisation_mot_de_passe`);

--
-- Index pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  ADD PRIMARY KEY (`idreponse_forum`,`utilisateur_idutilisateur`),
  ADD KEY `fk_reponse_forum_utilisateur1_idx` (`utilisateur_idutilisateur`);

--
-- Index pour la table `signalement`
--
ALTER TABLE `signalement`
  ADD PRIMARY KEY (`idsignalement`,`utilisateur_idutilisateur`),
  ADD KEY `fk_signalement_utilisateur1_idx` (`utilisateur_idutilisateur`);

--
-- Index pour la table `sujet_forum`
--
ALTER TABLE `sujet_forum`
  ADD PRIMARY KEY (`idsujet_forum`,`utilisateur_idutilisateur`,`categorie_forum_idcategories_forum`),
  ADD KEY `fk_sujet_forum_utilisateur1_idx` (`utilisateur_idutilisateur`),
  ADD KEY `fk_sujet_forum_categorie_forum1_idx` (`categorie_forum_idcategories_forum`);

--
-- Index pour la table `sujet_forum_favoris`
--
ALTER TABLE `sujet_forum_favoris`
  ADD PRIMARY KEY (`idsujet_forum_favoris`);

--
-- Index pour la table `sujet_forum_has_reponse_forum`
--
ALTER TABLE `sujet_forum_has_reponse_forum`
  ADD PRIMARY KEY (`sujet_forum_idsujet_forum`,`sujet_forum_utilisateur_idutilisateur`,`reponse_forum_idreponse_forum`),
  ADD KEY `fk_sujet_forum_has_reponse_forum_reponse_forum1_idx` (`reponse_forum_idreponse_forum`),
  ADD KEY `fk_sujet_forum_has_reponse_forum_sujet_forum1_idx` (`sujet_forum_idsujet_forum`,`sujet_forum_utilisateur_idutilisateur`);

--
-- Index pour la table `types_animaux`
--
ALTER TABLE `types_animaux`
  ADD PRIMARY KEY (`idtypes_animaux`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idutilisateur`);

--
-- Index pour la table `utilisateur_has_animal_a_adopter`
--
ALTER TABLE `utilisateur_has_animal_a_adopter`
  ADD PRIMARY KEY (`utilisateur_idutilisateur`,`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`),
  ADD KEY `fk_utilisateur_has_animal_a_adopter_animal_a_adopter1_idx` (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`),
  ADD KEY `fk_utilisateur_has_animal_a_adopter_utilisateur1_idx` (`utilisateur_idutilisateur`);

--
-- Index pour la table `utilisateur_has_centres_interet`
--
ALTER TABLE `utilisateur_has_centres_interet`
  ADD PRIMARY KEY (`utilisateur_idutilisateur`,`centres_interet_idcentres_interet`),
  ADD KEY `fk_utilisateur_has_centres_interet_centres_interet1_idx` (`centres_interet_idcentres_interet`),
  ADD KEY `fk_utilisateur_has_centres_interet_utilisateur1_idx` (`utilisateur_idutilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  MODIFY `idanimal_a_adopter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categorie_forum`
--
ALTER TABLE `categorie_forum`
  MODIFY `idcategories_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `centres_interet`
--
ALTER TABLE `centres_interet`
  MODIFY `idcentres_interet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire_post`
--
ALTER TABLE `commentaire_post`
  MODIFY `idcommentaire_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `idconversation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  MODIFY `idliste_amis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idmessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reinitialisation_mot_de_passe`
--
ALTER TABLE `reinitialisation_mot_de_passe`
  MODIFY `idreinitialisation_mot_de_passe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  MODIFY `idreponse_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `signalement`
--
ALTER TABLE `signalement`
  MODIFY `idsignalement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet_forum`
--
ALTER TABLE `sujet_forum`
  MODIFY `idsujet_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet_forum_favoris`
--
ALTER TABLE `sujet_forum_favoris`
  MODIFY `idsujet_forum_favoris` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `types_animaux`
--
ALTER TABLE `types_animaux`
  MODIFY `idtypes_animaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  ADD CONSTRAINT `fk_animal_a_adopter_refuge1` FOREIGN KEY (`refuge_idrefuge`) REFERENCES `refuge` (`idrefuge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `animal_a_adopter_has_badge`
--
ALTER TABLE `animal_a_adopter_has_badge`
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_animal_a_adopter1` FOREIGN KEY (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`) REFERENCES `animal_a_adopter` (`idanimal_a_adopter`, `refuge_idrefuge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_badge1` FOREIGN KEY (`badge_idbadge`) REFERENCES `badge` (`idbadge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `centres_interet_has_types_animaux`
--
ALTER TABLE `centres_interet_has_types_animaux`
  ADD CONSTRAINT `fk_centres_interet_has_types_animaux_centres_interet1` FOREIGN KEY (`centres_interet_idcentres_interet`) REFERENCES `centres_interet` (`idcentres_interet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_centres_interet_has_types_animaux_types_animaux1` FOREIGN KEY (`types_animaux_idtypes_animaux`) REFERENCES `types_animaux` (`idtypes_animaux`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commentaire_post`
--
ALTER TABLE `commentaire_post`
  ADD CONSTRAINT `fk_commentaire_post_post1` FOREIGN KEY (`post_idpost`,`post_profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`post_profil_animal_de_compagnie_utilisateur_idutilisateur1`) REFERENCES `post` (`idpost`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commentaire_post_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `conversation_has_utilisateur`
--
ALTER TABLE `conversation_has_utilisateur`
  ADD CONSTRAINT `fk_conversation_has_utilisateur_conversation1` FOREIGN KEY (`conversation_idconversation`) REFERENCES `conversation` (`idconversation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conversation_has_utilisateur_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_conversation1` FOREIGN KEY (`conversation_idconversation`) REFERENCES `conversation` (`idconversation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_profil_animal_de_compagnie1` FOREIGN KEY (`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`) REFERENCES `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `utilisateur_idutilisateur1`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  ADD CONSTRAINT `fk_profil_animal_de_compagnie_types_animaux1` FOREIGN KEY (`types_animaux_idtypes_animaux`) REFERENCES `types_animaux` (`idtypes_animaux`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profil_animal_de_compagnie_utilisateur2` FOREIGN KEY (`utilisateur_idutilisateur1`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  ADD CONSTRAINT `fk_reponse_forum_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `signalement`
--
ALTER TABLE `signalement`
  ADD CONSTRAINT `fk_signalement_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sujet_forum`
--
ALTER TABLE `sujet_forum`
  ADD CONSTRAINT `fk_sujet_forum_categorie_forum1` FOREIGN KEY (`categorie_forum_idcategories_forum`) REFERENCES `categorie_forum` (`idcategories_forum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sujet_forum_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sujet_forum_has_reponse_forum`
--
ALTER TABLE `sujet_forum_has_reponse_forum`
  ADD CONSTRAINT `fk_sujet_forum_has_reponse_forum_reponse_forum1` FOREIGN KEY (`reponse_forum_idreponse_forum`) REFERENCES `reponse_forum` (`idreponse_forum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sujet_forum_has_reponse_forum_sujet_forum1` FOREIGN KEY (`sujet_forum_idsujet_forum`,`sujet_forum_utilisateur_idutilisateur`) REFERENCES `sujet_forum` (`idsujet_forum`, `utilisateur_idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur_has_animal_a_adopter`
--
ALTER TABLE `utilisateur_has_animal_a_adopter`
  ADD CONSTRAINT `fk_utilisateur_has_animal_a_adopter_animal_a_adopter1` FOREIGN KEY (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`) REFERENCES `animal_a_adopter` (`idanimal_a_adopter`, `refuge_idrefuge`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateur_has_animal_a_adopter_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur_has_centres_interet`
--
ALTER TABLE `utilisateur_has_centres_interet`
  ADD CONSTRAINT `fk_utilisateur_has_centres_interet_centres_interet1` FOREIGN KEY (`centres_interet_idcentres_interet`) REFERENCES `centres_interet` (`idcentres_interet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateur_has_centres_interet_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 06 mars 2022 à 15:49
-- Version du serveur : 8.0.28
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoey_database_dev`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal_a_adopter`
--

CREATE TABLE `animal_a_adopter` (
  `idanimal_a_adopter` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sexe` tinyint(1) NOT NULL,
  `photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_general_ci,
  `date_anniversaire` date DEFAULT NULL,
  `refuge_idrefuge` int NOT NULL,
  `idtype` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `animal_a_adopter`
--

INSERT INTO `animal_a_adopter` (`idanimal_a_adopter`, `nom`, `sexe`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`, `idtype`) VALUES
(3, 'Titou', 0, 'chat.jpg', 'Titou est un chat affectueux et proche de son maître. Il réclame des caresses (surtout des grosses gratouilles derrière les oreilles, il saura vous montrer).\r\n \r\nIl n’aime pas etre pris dans les bras et ne vient pas sur les genoux mais vous accompagne volontiers dans la salle de bains ou reste a vos côtés sur le canapé. \r\n \r\nIl accourt très facilement quand on l’appelle. Il ADORE être brossé.\r\n \r\nC’est un grand gourmand qui devrait pouvoir apprendre des petits tours pour obtenir une croquette. Il faudra progressivement lui apporter une nourriture de bonne qualité car habitué aux bonbons et autres friandises il peut faire le difficile devant des marques pourtant mieux adaptées à sa santé. \r\n \r\nTitou est un vrai chasseur ! Il a besoin de beaucoup jouer et de personnes présentes à la maison.\r\n \r\nIl a besoin d’être stimulé, sinon ce seront vos orteils ou vos plantes vertes qui l’amuseront beaucoup. \r\n \r\nTitou n’a pas été testé avec d’autres chats mais peut-être qu’un compagnon aussi actif que lui pourrait être bénéfique.', '2022-02-01', 1, 2),
(4, 'Pee-wee', 0, 'chat.jpg', 'Histoire : \r\n\r\nPee-wee est né en mars 2019. Il a été trouvé dans un entrepôt en Bretagne. Non réclamé.\r\nPee-wee est FIV+ et fait un peu d’asthme.\r\nCaractère : \r\n\r\nCe petit loulou de 2 ans est très attachant. Il se laisse caresser sans problème et il est extrêmement sociable !\r\nIl se pavane et aime venir dire bonjour à tout le monde !\r\n \r\nPee-wee est joueur. Il a besoin d’être stimulé et que l’on s’occupe de lui. Pee-wee est sociable avec les autres chats et il peut sans problème être adopté avec un copain négatif au FIV car il ne ferait pas de mal à une mouche ! \r\n(Quoi que, pour la mouche…).\r\n \r\nPee-wee apprécie sortir. Un espace extérieur bien sécurisé (terrasse, jardin) est important pour son bien être et pour qu’il se dore la pilule au soleil.\r\n \r\nPee-wee est aussi indépendant. Au gré de ses humeurs il aime changer régulièrement de couchage, une nuit sur le lit, ou l’autre sur le canapé.\r\n \r\nC‘est un compagnon de vie adorable qui vous attend !', '2019-03-01', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `animal_a_adopter_has_badge`
--

CREATE TABLE `animal_a_adopter_has_badge` (
  `animal_a_adopter_idanimal_a_adopter` int NOT NULL,
  `badge_idbadge` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `animal_a_adopter_has_badge`
--

INSERT INTO `animal_a_adopter_has_badge` (`animal_a_adopter_idanimal_a_adopter`, `badge_idbadge`) VALUES
(4, 1),
(3, 2),
(4, 2),
(3, 3),
(3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `badge`
--

CREATE TABLE `badge` (
  `idbadge` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_icone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `badge`
--

INSERT INTO `badge` (`idbadge`, `nom`, `url_icone`, `titre`, `description`) VALUES
(1, 'Jouer', 'jouer.svg', '', ''),
(2, 'Enfant(s)', 'enfants.svg', '', ''),
(3, 'Extérieur', 'exterieur.svg', '', ''),
(4, 'hiberner', 'hiberner.svg', '', ''),
(5, 'caresser', 'caresser.svg', '', ''),
(6, 'balade', 'balade.svg', '', ''),
(7, 'autonomie', 'autonomie.svg', '', ''),
(8, 'calme', 'calme.svg', '', ''),
(9, 'contact', 'contact.svg', '', ''),
(10, 'securise', 'securise.svg', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `titre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `texte1` text COLLATE utf8mb4_general_ci,
  `url_image` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description_photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `texte2` text COLLATE utf8mb4_general_ci NOT NULL,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `fk_idcategorie` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `description_photo`, `texte2`, `date_publication`, `fk_idcategorie`) VALUES
(1, 'Les animaux c\'est génial', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', 'public/blog/blogTemplate.php', '', '', 'texte 2', '2021-10-01 09:56:30', 3),
(3, 'Nourrir son chien', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:23', 2),
(4, 'Caresser une tortue', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:23', 2),
(5, 'Sauver les animaux', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:28', 2),
(6, 'Adopter une chèvre', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:28', 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_blog`
--

CREATE TABLE `categorie_blog` (
  `id` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_blog`
--

INSERT INTO `categorie_blog` (`id`, `nom`) VALUES
(2, 'defaut'),
(3, 'evenement');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_forum`
--

CREATE TABLE `categorie_forum` (
  `idcategories_forum` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_icone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `centres_interet`
--

CREATE TABLE `centres_interet` (
  `idcentres_interet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `centres_interet_has_types_animaux`
--

CREATE TABLE `centres_interet_has_types_animaux` (
  `centres_interet_idcentres_interet` int NOT NULL,
  `types_animaux_idtypes_animaux` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire_post`
--

CREATE TABLE `commentaire_post` (
  `idcommentaire_post` int NOT NULL,
  `texte_commentaire` mediumtext COLLATE utf8mb4_general_ci,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `utilisateur_idutilisateur` int NOT NULL,
  `post_idpost` int NOT NULL,
  `post_profil_animal_de_compagnie_idprofil_animal_de_compagnie` int NOT NULL,
  `post_profil_animal_de_compagnie_utilisateur_idutilisateur1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `idconversation` int NOT NULL,
  `titre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `url_photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`idconversation`, `titre`, `date_creation`, `url_photo`) VALUES
(1, 'test', '2021-10-21 11:43:31', NULL),
(2, 'test2', '2021-10-21 11:51:59', NULL),
(3, 'test3', '2021-10-21 11:51:59', NULL),
(4, NULL, '2021-10-31 23:09:48', NULL),
(5, NULL, '2021-10-31 23:12:44', NULL),
(6, NULL, '2021-10-31 23:22:23', NULL),
(7, NULL, '2021-10-31 23:22:59', NULL),
(8, NULL, '2021-10-31 23:23:02', NULL),
(9, NULL, '2021-10-31 23:53:05', NULL),
(10, NULL, '2021-10-31 23:53:07', NULL),
(11, NULL, '2021-10-31 23:54:33', NULL),
(12, NULL, '2021-10-31 23:56:16', NULL),
(13, NULL, '2021-10-31 23:56:17', NULL),
(14, NULL, '2021-10-31 23:56:18', NULL),
(15, NULL, '2021-10-31 23:56:18', NULL),
(16, NULL, '2021-10-31 23:56:19', NULL),
(17, NULL, '2021-10-31 23:56:20', NULL),
(18, NULL, '2021-10-31 23:56:21', NULL),
(19, NULL, '2021-10-31 23:56:21', NULL),
(20, NULL, '2021-11-01 00:10:04', NULL),
(21, NULL, '2021-11-01 00:28:44', NULL),
(22, NULL, '2021-11-01 00:29:02', NULL),
(23, NULL, '2021-11-01 00:29:03', NULL),
(24, NULL, '2021-11-01 00:29:37', NULL),
(25, NULL, '2021-11-01 00:30:14', NULL),
(26, NULL, '2021-11-01 00:33:10', NULL),
(27, NULL, '2021-11-01 00:33:28', NULL),
(28, NULL, '2021-11-01 00:34:28', NULL),
(29, NULL, '2021-11-01 00:34:34', NULL),
(30, NULL, '2021-11-01 00:35:23', NULL),
(31, NULL, '2021-11-01 00:39:16', NULL),
(32, NULL, '2021-11-01 00:40:31', NULL),
(33, NULL, '2021-11-01 00:41:21', NULL),
(34, NULL, '2021-11-01 00:43:31', NULL),
(35, NULL, '2021-11-04 22:22:41', NULL),
(36, NULL, '2021-11-04 22:23:27', NULL),
(37, NULL, '2022-02-15 11:55:31', NULL),
(38, NULL, '2022-02-15 15:53:11', NULL),
(39, NULL, '2022-03-02 17:07:08', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `conversation_has_utilisateur`
--

CREATE TABLE `conversation_has_utilisateur` (
  `conversation_idconversation` int NOT NULL,
  `utilisateur_idutilisateur` int NOT NULL,
  `readstate` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `conversation_has_utilisateur`
--

INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`, `readstate`) VALUES
(1, 54, 1),
(1, 62, 1),
(2, 2, 2),
(2, 54, 1),
(3, 35, 1),
(20, 54, 1),
(20, 60, 1),
(33, 54, 1),
(33, 61, 1),
(34, 54, 1),
(34, 59, 1),
(34, 61, 1),
(35, 54, 1),
(35, 63, 1),
(36, 61, 1),
(36, 63, 1),
(37, 54, 1),
(37, 68, 1),
(38, 54, 1),
(39, 80, 2),
(39, 83, 2);

-- --------------------------------------------------------

--
-- Structure de la table `liste_amis`
--

CREATE TABLE `liste_amis` (
  `idliste_amis` int NOT NULL,
  `id_demandeur` int DEFAULT NULL,
  `id_receveur` int DEFAULT NULL,
  `date_demande` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` tinyint(1) DEFAULT '1',
  `id_bloqueur` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `liste_amis`
--

INSERT INTO `liste_amis` (`idliste_amis`, `id_demandeur`, `id_receveur`, `date_demande`, `statut`, `id_bloqueur`) VALUES
(35, 54, 44, '2021-11-01 00:02:06', 2, 0),
(37, 54, 62, '2021-11-01 00:06:10', 2, 0),
(58, 54, 60, '2021-11-01 00:43:24', 2, 0),
(59, 54, 59, '2021-11-01 00:43:31', 2, 0),
(67, 54, 61, '2021-11-04 22:18:14', 1, 0),
(68, 54, 63, '2021-11-04 22:22:41', 2, 0),
(69, 63, 61, '2021-11-04 22:23:27', 2, 0),
(70, 68, 54, '2022-02-15 11:55:31', 1, 0),
(71, 77, 54, '2022-02-15 15:53:11', 1, 0),
(72, 83, 80, '2022-03-02 17:07:08', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idmessage` int NOT NULL,
  `texte_message` varbinary(255) DEFAULT NULL,
  `url_media` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_envoi_msg` datetime DEFAULT CURRENT_TIMESTAMP,
  `utilisateur_idutilisateur` int NOT NULL,
  `conversation_idconversation` int NOT NULL,
  `tag` varbinary(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idmessage`, `texte_message`, `url_media`, `date_envoi_msg`, `utilisateur_idutilisateur`, `conversation_idconversation`, `tag`) VALUES
(176, 0x38773d3d, NULL, '2022-03-06 14:48:12', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(177, 0x345446616a375330, NULL, '2022-03-06 14:49:32', 80, 39, 0x2f7b51ef1e254ca5a58db0218298227b),
(178, 0x345446616d4b4f30, NULL, '2022-03-06 14:56:11', 80, 39, 0xd1e12477e3f349c20b033178f7ff516e),
(179, 0x3454464e6d413d3d, NULL, '2022-03-06 14:56:50', 80, 39, 0xf0458cbe8e81e26876b63a6b3c7d85d2),
(180, 0x34513d3d, NULL, '2022-03-06 14:57:18', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(181, 0x39695a616a375330, NULL, '2022-03-06 14:57:21', 80, 39, 0xd18687ea798bc224fcf8d752970a07e8),
(182, 0x39673d3d, NULL, '2022-03-06 14:57:25', 80, 39, 0xff92c8bd455c99e18cc68043af1ae354),
(183, 0x34544e596d4b453d, NULL, '2022-03-06 14:57:27', 80, 39, 0x3c7bd373c0a56f152a7164142247a708),
(184, 0x34513d3d, NULL, '2022-03-06 14:57:31', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(185, 0x34513d3d, NULL, '2022-03-06 14:57:35', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(186, 0x34513d3d, NULL, '2022-03-06 14:57:41', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(187, 0x5973716b6165583143464e68556b5543373078646f702b5350674e58, NULL, '2022-03-06 14:58:24', 80, 39, 0x986e0e3060970d78035a7636f44490d5),
(188, NULL, '801646580398.jpeg', '2022-03-06 15:26:38', 80, 39, NULL),
(189, NULL, '801646581027.jpg', '2022-03-06 15:37:43', 80, 39, NULL),
(190, NULL, '801646581102.png', '2022-03-06 15:38:23', 80, 39, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `idpost` int NOT NULL,
  `media` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_general_ci,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_likes_utilisateurs` int DEFAULT NULL,
  `profil_animal_de_compagnie_idprofil_animal_de_compagnie` int NOT NULL,
  `profil_animal_de_compagnie_utilisateur_idutilisateur1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idpost`, `media`, `description`, `date_publication`, `id_likes_utilisateurs`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`) VALUES
(62, '801646062553.png', '', '2022-02-28 15:35:53', NULL, 23, 80),
(63, '801646062584.png', '', '2022-02-28 15:36:24', NULL, 23, 80),
(65, '801646062606.png', 'Miaou', '2022-02-28 15:36:46', NULL, 23, 80),
(76, '801646488010.png', '', '2022-03-05 13:46:51', NULL, 23, 80);

-- --------------------------------------------------------

--
-- Structure de la table `post_likes`
--

CREATE TABLE `post_likes` (
  `id_post` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profil_animal_de_compagnie`
--

CREATE TABLE `profil_animal_de_compagnie` (
  `idprofil_animal_de_compagnie` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_general_ci,
  `date_naissance` date DEFAULT NULL,
  `utilisateur_idutilisateur1` int NOT NULL,
  `types_animaux_idtypes_animaux` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `profil_animal_de_compagnie`
--

INSERT INTO `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `nom`, `url_photo`, `description`, `date_naissance`, `utilisateur_idutilisateur1`, `types_animaux_idtypes_animaux`) VALUES
(2, 'Véro', 'poule.jpg', 'Poule craintive mais gentille, aime bien les asticots, vit à thorigny sur marne', NULL, 54, 1),
(3, 'Anatole', 'uploadedOn1634808175_by_54_profil.jpg', 'Dog', '0005-05-05', 54, 3),
(4, 'Caro', 'poule.jpg', 'Coucou moi c\'est caro la poule', '2018-07-19', 54, 1),
(14, 'bb', NULL, 'bb', '0005-05-05', 54, 1),
(15, 'dédé', 'uploadedOn1634684035_by_54_peewee.jpg', 'coucou moi c\'est dédé le chat', '0006-05-31', 54, 2),
(16, 'Shiba', NULL, 'stonkssss!!!!', '0033-03-13', 62, 1),
(17, 'animaltest', 'déconnecté', 'animaltest', '0678-05-04', 64, 1),
(18, 'animaltest', 'uploadedOn1634667613_by_64_peewee.jpg', 'animaltest', '0067-05-04', 64, 1),
(19, '', '', '', '0000-00-00', 64, 3),
(21, 'médor', 'uploadedOn1634670653_by_64_profil.jpg', 'mon toutou', '2021-09-30', 64, 3),
(22, 'test22', 'uploadedOn1634670760_by_64_uploadedOn16345557', 'test22desc', '2021-10-10', 64, 4),
(23, 'Médor II', '801646062119.png', 'médor II mon chien wouaf 😄', '0022-01-01', 80, 4),
(24, 'Véro II', '801646062433.png', 'Véro la poule de matthis je lui ai volé aedsqd', '2022-01-12', 80, 1),
(25, 'test', '801646495555.jpg', '', '2022-03-24', 80, 1),
(26, 'aa', '801646498662.jpeg', '', '0888-08-09', 80, 7),
(27, 'a', '881646565457.png', '', '0069-05-04', 88, 7),
(28, 'doggydog', '801646581585.png', '', NULL, 80, 3),
(29, 'a', '801646581613.png', 'd', NULL, 80, 2);

-- --------------------------------------------------------

--
-- Structure de la table `refuge`
--

CREATE TABLE `refuge` (
  `idrefuge` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_general_ci,
  `lien` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse_mail` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `lien_maps` text COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_logo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `refuge`
--

INSERT INTO `refuge` (`idrefuge`, `nom`, `description`, `lien`, `adresse_mail`, `telephone`, `lien_maps`, `adresse`, `url_logo`) VALUES
(1, 'Association Nine Lives Paris', 'ADOPTION D\'ANIMAUX DE COMPAGNIE A PARIS ET EN ILE-DE-FRANCE', 'https://ninelives.fr/', 'asso@ninelives.fr', 111111111, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d674378.907713388!2d2.5026636!3d48.68077!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xfe7df6a0dd3e8e74!2sNine%20Lives%20Paris!5e0!3m2!1sfr!2sfr!4v1638873872859!5m2!1sfr!2sfr', '11 rue lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem 11111 paris', '651640199401.png');

-- --------------------------------------------------------

--
-- Structure de la table `reinitialisation_mot_de_passe`
--

CREATE TABLE `reinitialisation_mot_de_passe` (
  `idreinitialisation_mot_de_passe` int NOT NULL,
  `id_demandeur` int DEFAULT NULL,
  `token_reinitialisation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_demande_reinitialisation` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reinitialisation_mot_de_passe`
--

INSERT INTO `reinitialisation_mot_de_passe` (`idreinitialisation_mot_de_passe`, `id_demandeur`, `token_reinitialisation`, `date_demande_reinitialisation`) VALUES
(6, 2, '$2y$10$SBdOgCxulYxyC.38RpRheOEDQYSZ2w2x/CXsHHur4GlCI0sylrVFO', '2022-02-27 19:31:17'),
(7, 2, '$2y$10$5Ym1d.BD4VKQrC5IpU6n2OBt46h9tppEkpO1OBctEQu11p2fszX8i', '2022-02-27 20:03:22');

-- --------------------------------------------------------

--
-- Structure de la table `reponse_forum`
--

CREATE TABLE `reponse_forum` (
  `idreponse_forum` int NOT NULL,
  `texte_reponse` mediumtext COLLATE utf8mb4_general_ci,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_likes_utilisateurs` int DEFAULT NULL,
  `utilisateur_idutilisateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `signalement`
--

CREATE TABLE `signalement` (
  `idsignalement` int NOT NULL,
  `titre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_general_ci,
  `url_photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_signalement` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` tinyint DEFAULT '0',
  `utilisateur_idutilisateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum`
--

CREATE TABLE `sujet_forum` (
  `idsujet_forum` int NOT NULL,
  `titre` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_reponse_epinglee` int DEFAULT NULL,
  `utilisateur_idutilisateur` int NOT NULL,
  `categorie_forum_idcategories_forum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum_favoris`
--

CREATE TABLE `sujet_forum_favoris` (
  `idsujet_forum_favoris` int NOT NULL,
  `id_utilisateur` int DEFAULT NULL,
  `id_sujet_favoris` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sujet_forum_has_reponse_forum`
--

CREATE TABLE `sujet_forum_has_reponse_forum` (
  `sujet_forum_idsujet_forum` int NOT NULL,
  `sujet_forum_utilisateur_idutilisateur` int NOT NULL,
  `reponse_forum_idreponse_forum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `types_animaux`
--

CREATE TABLE `types_animaux` (
  `idtypes_animaux` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_icone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `typeOrder` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `types_animaux`
--

INSERT INTO `types_animaux` (`idtypes_animaux`, `nom`, `url_icone`, `typeOrder`) VALUES
(1, 'Poule', NULL, 9),
(2, 'Chat', NULL, 1),
(3, 'Chien', NULL, 2),
(4, 'Autre', NULL, 10),
(5, 'Rongeur', NULL, 3),
(6, 'Reptile', NULL, 4),
(7, 'Poisson', NULL, 5),
(8, 'Crustacé', NULL, 6),
(9, 'Insecte', NULL, 8),
(10, 'Amphibien', NULL, 7);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int NOT NULL,
  `pseudo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google_sub` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse_mail` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_general_ci,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_derniere_connexion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `statut` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `google_sub`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `statut`) VALUES
(2, '1', '', NULL, 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, 'test', '2021-10-11 21:15:24', NULL, NULL, NULL),
(13, NULL, '$argon2i$v=19$m=2048,t=4,p=3$dUtXa29hVEt2eDhJbjJ0eQ$/+I4XqKPjjHkQf+h9SRMDGDQ9CEx2MUn2fNcoOW6NzU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:27:50', '2021-10-11 21:27:45', NULL, NULL),
(17, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:34', NULL, NULL, NULL),
(18, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:52', NULL, NULL, NULL),
(19, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:06', NULL, NULL, NULL),
(20, NULL, '=19=2048,t=4,p=3+BRptAhGziq2I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:36', NULL, NULL, NULL),
(21, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:33:57', NULL, NULL, NULL),
(22, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:34:24', NULL, NULL, NULL),
(23, NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:37:05', NULL, NULL, NULL),
(24, NULL, '=19=2048,t=4,p=3$39MWwuk1lt2sITkfayWCnivyQXgGcX89ojPzoucmkAU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:47:59', NULL, NULL, NULL),
(25, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:10', NULL, NULL, NULL),
(26, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:36', NULL, NULL, NULL),
(27, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:43', NULL, NULL, NULL),
(28, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:02', NULL, NULL, NULL),
(29, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:33', NULL, NULL, NULL),
(30, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:15', NULL, NULL, NULL),
(31, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:26', NULL, NULL, NULL),
(32, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:52:55', NULL, NULL, NULL),
(33, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:09', NULL, NULL, NULL),
(34, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:18', NULL, NULL, NULL),
(35, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:54:52', NULL, NULL, NULL),
(36, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:46', NULL, NULL, NULL),
(37, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:57', NULL, NULL, NULL),
(38, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:56:09', NULL, NULL, NULL),
(39, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:14', NULL, NULL, NULL),
(40, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:25', NULL, NULL, NULL),
(41, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:48', NULL, NULL, NULL),
(42, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:58:45', NULL, '424242', NULL),
(43, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:42', NULL, NULL, NULL),
(44, NULL, 'aaaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:56', NULL, NULL, NULL),
(45, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:16', NULL, NULL, NULL),
(46, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:31', NULL, NULL, NULL),
(47, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:53', NULL, NULL, NULL),
(48, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:25', NULL, NULL, NULL),
(49, NULL, '$argon2i$v=19$m=2048,t=4,p=3$WlExaVRCU3BHTUFKTDFWSQ$lyDHyXkg+aKauZHinbxkLHSgWaDBXHlt3dHjzHnRh+U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:40', NULL, NULL, NULL),
(52, 'pseudo', '$argon2i$v=19$m=2048,t=4,p=3$aXNMYVZUalBKVXBrZWpodA$iJVVOSyeYIXQMl9tjmcEkVTCRqf+nTlQMgeiaJEmd58', NULL, 'pseudo', 'pseudo', 'pseudo', NULL, '2021-10-11', NULL, NULL, '2021-10-11 23:03:55', NULL, '12a343c3aedd2568abebad71d65391ab18f1c5ea14e78974bc66b9fc01145b0dd8ab18-52-1634068665', NULL),
(54, 'matthis', '$argon2i$v=19$m=2048,t=4,p=3$N3FYT1lqcFRudU4wanoxMw$n/t1XIvr5VvbjXCqlTNq/7awPHS1YT/mITckS4BIXo8', NULL, 'matthis', 'matthis', 'matthis', 'profil.jpg', '0005-04-05', NULL, 'Jeune propriétaire de poules du 77', '2021-10-12 10:20:36', NULL, '335f2520da38fc1bb22ab612e618424abe60bb3667a1848e550de77969174eefc30bb7-54-1636455708', 1),
(55, 'maaa', '$argon2i$v=19$m=2048,t=4,p=3$b0VnREI0TUxkSG50TDVjZA$90IKf0fK9U0FRJciVPv+nobhL6cjOe+FJ6M4jfPXJCg', NULL, 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:43:40', NULL, NULL, NULL),
(56, 'msqdlksqkhdsqd', '$argon2i$v=19$m=2048,t=4,p=3$VFRhMTlmTlBsUlJsRXkzMA$iBQSxxmYWcBQuOyB4oUYgwjmYqxDgnAqUhjYZPbKGjs', NULL, 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:44:10', NULL, NULL, NULL),
(58, 'testt', '$argon2i$v=19$m=2048,t=4,p=3$RU5jV1hYN3laQWFqdWNPQg$X9MRs3KIP/NUCnj5TcOQ1xbqT+ui5SkmoPbJSS7x1D0', NULL, 'test', 'test', 'test', NULL, '2021-10-04', NULL, NULL, '2021-10-12 15:06:47', NULL, '5ec4d4b64a26edbc179bf0e544fa66b1188e1972a71aeae694dc12a0d3ef9dc1c73b14-58-1634044036', NULL),
(59, 'test', '$argon2i$v=19$m=2048,t=4,p=3$OVIxSmFPZXBjaVNKQWVjSA$adFKdFpM4UoPPrm1FL4PEJ1jG5EcCgc8isxc3tVga+A', NULL, 'testttt', 'testttt', 'test@psqodskdml', NULL, '0001-01-01', NULL, NULL, '2021-10-12 15:19:52', NULL, '92fa14bc9ef41cd1a496a114714163f0247d1f070778aca9b6180b1a1da260353201af-59-1634044798', NULL),
(60, 'testhash', '$2y$10$qxTOsJZWW507dhLOZT/SEOLT8.IJXZ/vvwxDgBkwqiRrwXUoih3zm', NULL, 'testhash', 'testhash', 'testhash', NULL, '2021-10-21', NULL, NULL, '2021-10-13 01:58:22', NULL, '330ea81dce81d8275da9dd3ce0e97d900ae7e774f02d42624ee0141f7d79a013bae4a9-60-1634083112', NULL),
(61, 'lucien', '$2y$10$dmkRoSdUp2xZ/QLS1MAEmeUKoJKmrrQzFRu8cGwkUwwpUStX0PLJO', NULL, 'lucien', 'lucien', 'lucien', NULL, '2222-12-21', NULL, NULL, '2021-10-18 09:21:30', NULL, 'f1def9ce20bd17f72ec9823b398b42a318687b7c4f871ff5d42e57f2a7306d7282c460-61-1636455693', NULL),
(62, 'Elon', '$2y$10$PgpcUxsz5xhy/pQlWd0AYu1Rhh8vcQKWJDJfVCYfy9Qoz/6zX36Ui', NULL, 'elon', 'elon', 'elon', NULL, '0001-11-11', NULL, NULL, '2021-10-19 19:06:13', NULL, '8577a2bc96ce89ab224c503927b6019f9ceb755341e0a0240c1ee541c6c721691ed60b-62-1634663770', NULL),
(63, 'testtest', '$2y$10$hzIy1WSrfXHfLORkZKu7Ke91dsCipr45bRVEkPzQGWS394eMshBIe', NULL, 'testtest', 'testtest', 'testtest', 'déconnecté', '2022-02-01', NULL, NULL, '2021-10-19 20:07:10', NULL, 'b498b38682a6d01eb5ae0fd03fa9c663d920954a76e3eb565b6a46cfad71e8345bbf56-63-1636061066', NULL),
(64, 'a', '$argon2i$v=19$m=2048,t=4,p=3$T0UzbXVJOWozY3hSSmg4Lw$YOmfB0jUVNJqUjoL8YclXQHxtjG4Wzir1PqqCZ1Rgj8', NULL, 'testtesttest', 'testtesttest', 'testtesttest', 'uploadedOn1634667264_by_64_peewee.jpg', '0008-08-08', NULL, NULL, '2021-10-19 20:07:48', NULL, '903c970b017c3109170fe39e89bb64fa5f0fcad5e00a157313d3a63a12554e3be6ff4b-64-1634670563', NULL),
(65, 'admin', '$2y$10$zZTUX6mXg0b0rDwcYGHWjeHIrPzU/LZ64.uUiQajUsrrYaDS1rwZa', NULL, 'admin', 'admin', 'admin', 'déconnecté', '0001-01-01', NULL, NULL, '2021-12-22 19:05:11', NULL, '68dc3ad39752338eac1c105071d0cdbcf385f0285b358e9925a8c3794e18442276d0fa-65-1640821926', 1),
(66, 'Zoey', '$2y$10$jhRHP68VNZ/1snIW9TL07uk78ZhiUxu5J2HUbRAtrLOt2F6BaJH9q', NULL, 'zoey', 'zoey', 'zoey', '', '0001-01-01', NULL, NULL, '2022-01-19 01:22:55', NULL, NULL, NULL),
(67, 'zozo', '$2y$10$3sfZi36PiXoxIFEQAir8GeXixLSkCYVgrGx0/ZTQEidtpQ7IYzD3q', NULL, 'zozo', 'zozo', 'zozo', '', '0007-06-05', NULL, NULL, '2022-01-19 01:28:38', NULL, 'f66ffc919df28b85487b6923765cd4f22cb7032d0cba81b3369de70f56170a5f670124-67-1642554479', 1),
(68, 'aa', '$argon2i$v=19$m=2048,t=4,p=3$N1REbTJlMDNady4ycUVTWQ$wn3ctMk8Nh8jhn/zrEYJ10n/Q+VrbsqOjiZEkdnUSrE', NULL, 'aa', 'aa', 'a@mail.fr', '681645876715.png', '4567-03-01', NULL, 'Bienvenue sur mon profil ! Test coucou', '2022-01-20 17:51:48', '2022-03-05 15:34:23', '3b90e3fbc831e581de5279ac409296f38cf16444342d0c9ca4897634fbebc2d02f2f54-68-1646494463', NULL),
(74, NULL, NULL, '105790575614120714764222222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-15 00:39:29', NULL, NULL, NULL),
(78, 'dd', '$2y$10$fi/HNVljsOwMqNM9WXc/GeswEVDd3iZOaafQbBVK1qzJCJBJqBcvC', NULL, NULL, NULL, 'exemple@zoey.fr', '', NULL, NULL, NULL, '2022-02-15 00:50:44', NULL, 'aadfdaa6f2d54ee18ea0d7c7fe62c09a578bbc586d7f0d92dd523c2cfa61bd85fc6f84-78-1644884289', NULL),
(80, 'Marin', NULL, '105790575614120714764', NULL, NULL, 'marin.bouanchaud@gmail.com', '801646240917.jpg', NULL, NULL, 'azeazaz😉', '2022-02-26 17:55:04', '2022-03-06 15:46:25', '3f815e8bce714972fb7db61c3ac48bb76cc315e78fdfe51cda0f671da114e82897b215-80-1646581585', NULL),
(83, 'Zoey_5291', NULL, '105601581997729776049', NULL, NULL, 'app.zoey@gmail.com', 'gdl-1646239535.jpg', NULL, NULL, NULL, '2022-03-02 16:45:35', NULL, 'f0974830bd18db0a4d655425d1afac04f454d8afc1f1bc4f00d18757ed078dabc6b202-83-1646273862', NULL),
(87, 'Marin_', NULL, '116179095823259577328', NULL, NULL, 'contact@marinb.com', '871646240192.png', NULL, NULL, 'Bienvenue sur mon profil ! Je peux le modifier facilement !', '2022-03-02 16:53:01', NULL, '0b6afeef19108b5e35f8d067c3cdae1165475ee3df494bda905ce37647dc899254b1af-87-1646239981', NULL),
(88, 'Tt', '$2y$10$8mcr38U9o.bSuIBS.5RR3.c3kPnNw7kcx9wECVASmUbDyiKwOuQ1.', NULL, NULL, NULL, 'tt@mail.fr', 'defaultProfile.jpg', NULL, NULL, NULL, '2022-03-05 15:40:38', '2022-03-06 11:40:57', 'e06cf3dc92671f21c8d74dcd049dac88c50a74a3ba1756df098803cde2c770a14715f6-88-1646566857', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_animal_a_adopter`
--

CREATE TABLE `utilisateur_has_animal_a_adopter` (
  `utilisateur_idutilisateur` int NOT NULL,
  `animal_a_adopter_idanimal_a_adopter` int NOT NULL,
  `animal_a_adopter_refuge_idrefuge` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_badges`
--

CREATE TABLE `utilisateur_has_badges` (
  `id_user` int DEFAULT NULL,
  `id_badge` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur_has_badges`
--

INSERT INTO `utilisateur_has_badges` (`id_user`, `id_badge`) VALUES
(68, 2),
(68, 3),
(68, 4),
(68, 9),
(68, 8),
(80, 2),
(80, 3),
(80, 4),
(80, 5),
(80, 8),
(80, 9),
(88, 4),
(88, 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_favorite_animals`
--

CREATE TABLE `utilisateur_has_favorite_animals` (
  `id_user` int DEFAULT NULL,
  `id_favoriteAnimal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur_has_favorite_animals`
--

INSERT INTO `utilisateur_has_favorite_animals` (`id_user`, `id_favoriteAnimal`) VALUES
(68, 1),
(68, 3),
(68, 4),
(68, 2),
(68, 9),
(68, 5),
(80, 4),
(80, 1),
(80, 10),
(88, 1),
(88, 5),
(88, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  ADD PRIMARY KEY (`idanimal_a_adopter`,`refuge_idrefuge`),
  ADD KEY `idtype` (`idtype`);

--
-- Index pour la table `animal_a_adopter_has_badge`
--
ALTER TABLE `animal_a_adopter_has_badge`
  ADD PRIMARY KEY (`animal_a_adopter_idanimal_a_adopter`,`badge_idbadge`),
  ADD KEY `fk_animal_a_adopter_has_badge_badge1_idx` (`badge_idbadge`),
  ADD KEY `fk_animal_a_adopter_has_badge_animal_a_adopter1_idx` (`animal_a_adopter_idanimal_a_adopter`);

--
-- Index pour la table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`idbadge`);

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idcategorie` (`fk_idcategorie`);

--
-- Index pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
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
-- Index pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`,`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`),
  ADD KEY `fk_post_profil_animal_de_compagnie1_idx` (`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`);

--
-- Index pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_post` (`id_post`);

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
-- Index pour la table `utilisateur_has_badges`
--
ALTER TABLE `utilisateur_has_badges`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_badge` (`id_badge`);

--
-- Index pour la table `utilisateur_has_favorite_animals`
--
ALTER TABLE `utilisateur_has_favorite_animals`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_favoriteAnimal` (`id_favoriteAnimal`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  MODIFY `idanimal_a_adopter` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `categorie_forum`
--
ALTER TABLE `categorie_forum`
  MODIFY `idcategories_forum` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `centres_interet`
--
ALTER TABLE `centres_interet`
  MODIFY `idcentres_interet` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire_post`
--
ALTER TABLE `commentaire_post`
  MODIFY `idcommentaire_post` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `idconversation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  MODIFY `idliste_amis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idmessage` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reinitialisation_mot_de_passe`
--
ALTER TABLE `reinitialisation_mot_de_passe`
  MODIFY `idreinitialisation_mot_de_passe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  MODIFY `idreponse_forum` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `signalement`
--
ALTER TABLE `signalement`
  MODIFY `idsignalement` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet_forum`
--
ALTER TABLE `sujet_forum`
  MODIFY `idsujet_forum` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sujet_forum_favoris`
--
ALTER TABLE `sujet_forum_favoris`
  MODIFY `idsujet_forum_favoris` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `types_animaux`
--
ALTER TABLE `types_animaux`
  MODIFY `idtypes_animaux` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  ADD CONSTRAINT `animal_a_adopter_ibfk_1` FOREIGN KEY (`idtype`) REFERENCES `types_animaux` (`idtypes_animaux`);

--
-- Contraintes pour la table `animal_a_adopter_has_badge`
--
ALTER TABLE `animal_a_adopter_has_badge`
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_animal_a_adopter1` FOREIGN KEY (`animal_a_adopter_idanimal_a_adopter`) REFERENCES `animal_a_adopter` (`idanimal_a_adopter`),
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_badge1` FOREIGN KEY (`badge_idbadge`) REFERENCES `badge` (`idbadge`);

--
-- Contraintes pour la table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`fk_idcategorie`) REFERENCES `categorie_blog` (`id`);

--
-- Contraintes pour la table `centres_interet_has_types_animaux`
--
ALTER TABLE `centres_interet_has_types_animaux`
  ADD CONSTRAINT `fk_centres_interet_has_types_animaux_centres_interet1` FOREIGN KEY (`centres_interet_idcentres_interet`) REFERENCES `centres_interet` (`idcentres_interet`),
  ADD CONSTRAINT `fk_centres_interet_has_types_animaux_types_animaux1` FOREIGN KEY (`types_animaux_idtypes_animaux`) REFERENCES `types_animaux` (`idtypes_animaux`);

--
-- Contraintes pour la table `commentaire_post`
--
ALTER TABLE `commentaire_post`
  ADD CONSTRAINT `fk_commentaire_post_post1` FOREIGN KEY (`post_idpost`,`post_profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`post_profil_animal_de_compagnie_utilisateur_idutilisateur1`) REFERENCES `post` (`idpost`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`),
  ADD CONSTRAINT `fk_commentaire_post_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `conversation_has_utilisateur`
--
ALTER TABLE `conversation_has_utilisateur`
  ADD CONSTRAINT `fk_conversation_has_utilisateur_conversation1` FOREIGN KEY (`conversation_idconversation`) REFERENCES `conversation` (`idconversation`),
  ADD CONSTRAINT `fk_conversation_has_utilisateur_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_conversation1` FOREIGN KEY (`conversation_idconversation`) REFERENCES `conversation` (`idconversation`),
  ADD CONSTRAINT `fk_message_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_profil_animal_de_compagnie1` FOREIGN KEY (`profil_animal_de_compagnie_idprofil_animal_de_compagnie`,`profil_animal_de_compagnie_utilisateur_idutilisateur1`) REFERENCES `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `utilisateur_idutilisateur1`);

--
-- Contraintes pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`),
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`idpost`);

--
-- Contraintes pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  ADD CONSTRAINT `fk_profil_animal_de_compagnie_types_animaux1` FOREIGN KEY (`types_animaux_idtypes_animaux`) REFERENCES `types_animaux` (`idtypes_animaux`),
  ADD CONSTRAINT `fk_profil_animal_de_compagnie_utilisateur2` FOREIGN KEY (`utilisateur_idutilisateur1`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `reponse_forum`
--
ALTER TABLE `reponse_forum`
  ADD CONSTRAINT `fk_reponse_forum_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `signalement`
--
ALTER TABLE `signalement`
  ADD CONSTRAINT `fk_signalement_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `sujet_forum`
--
ALTER TABLE `sujet_forum`
  ADD CONSTRAINT `fk_sujet_forum_categorie_forum1` FOREIGN KEY (`categorie_forum_idcategories_forum`) REFERENCES `categorie_forum` (`idcategories_forum`),
  ADD CONSTRAINT `fk_sujet_forum_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `sujet_forum_has_reponse_forum`
--
ALTER TABLE `sujet_forum_has_reponse_forum`
  ADD CONSTRAINT `fk_sujet_forum_has_reponse_forum_reponse_forum1` FOREIGN KEY (`reponse_forum_idreponse_forum`) REFERENCES `reponse_forum` (`idreponse_forum`),
  ADD CONSTRAINT `fk_sujet_forum_has_reponse_forum_sujet_forum1` FOREIGN KEY (`sujet_forum_idsujet_forum`,`sujet_forum_utilisateur_idutilisateur`) REFERENCES `sujet_forum` (`idsujet_forum`, `utilisateur_idutilisateur`);

--
-- Contraintes pour la table `utilisateur_has_animal_a_adopter`
--
ALTER TABLE `utilisateur_has_animal_a_adopter`
  ADD CONSTRAINT `fk_utilisateur_has_animal_a_adopter_animal_a_adopter1` FOREIGN KEY (`animal_a_adopter_idanimal_a_adopter`,`animal_a_adopter_refuge_idrefuge`) REFERENCES `animal_a_adopter` (`idanimal_a_adopter`, `refuge_idrefuge`),
  ADD CONSTRAINT `fk_utilisateur_has_animal_a_adopter_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `utilisateur_has_badges`
--
ALTER TABLE `utilisateur_has_badges`
  ADD CONSTRAINT `utilisateur_has_badges_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`),
  ADD CONSTRAINT `utilisateur_has_badges_ibfk_2` FOREIGN KEY (`id_badge`) REFERENCES `badge` (`idbadge`);

--
-- Contraintes pour la table `utilisateur_has_favorite_animals`
--
ALTER TABLE `utilisateur_has_favorite_animals`
  ADD CONSTRAINT `utilisateur_has_favorite_animals_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`),
  ADD CONSTRAINT `utilisateur_has_favorite_animals_ibfk_2` FOREIGN KEY (`id_favoriteAnimal`) REFERENCES `types_animaux` (`idtypes_animaux`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

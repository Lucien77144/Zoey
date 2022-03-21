-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 15 mars 2022 à 10:37
-- Version du serveur : 8.0.28
-- Version de PHP : 8.1.3

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
(3, 'Titou', 0, 'chat.jpg', 'Titou est un chat affectueux et proche de son maître. Il réclame des caresses (surtout des grosses gratouilles derrière les oreilles, il saura vous montrer).\r\n \' \" & é @ #\r\nIl n’aime pas etre pris dans les bras et ne vient pas sur les genoux mais vous accompagne volontiers dans la salle de bains ou reste a vos côtés sur le canapé. \r\n \r\nIl accourt très facilement quand on l’appelle. Il ADORE être brossé.\r\n \r\nC’est un grand gourmand qui devrait pouvoir apprendre des petits tours pour obtenir une croquette. Il faudra progressivement lui apporter une nourriture de bonne qualité car habitué aux bonbons et autres friandises il peut faire le difficile devant des marques pourtant mieux adaptées à sa santé. \r\n \r\nTitou est un vrai chasseur ! Il a besoin de beaucoup jouer et de personnes présentes à la maison.\r\n \r\nIl a besoin d’être stimulé, sinon ce seront vos orteils ou vos plantes vertes qui l’amuseront beaucoup. \r\n \r\nTitou n’a pas été testé avec d’autres chats mais peut-être qu’un compagnon aussi actif que lui pourrait être bénéfique.', '2022-02-01', 1, 2),
(4, 'Pee-wee', 0, 'chat.jpg', 'Histoire : \r\n\r\nPee-wee est né en mars 2019. Il a été trouvé dans un entrepôt en Bretagne. Non réclamé.\r\nPee-wee est FIV+ et fait un peu d’asthme.\r\nCaractère : \r\n\r\nCe petit loulou de 2 ans est très attachant. Il se laisse caresser sans problème et il est extrêmement sociable !\r\nIl se pavane et aime venir dire bonjour à tout le monde !\r\n \r\nPee-wee est joueur. Il a besoin d’être stimulé et que l’on s’occupe de lui. Pee-wee est sociable avec les autres chats et il peut sans problème être adopté avec un copain négatif au FIV car il ne ferait pas de mal à une mouche ! \r\n(Quoi que, pour la mouche…).\r\n \r\nPee-wee apprécie sortir. Un espace extérieur bien sécurisé (terrasse, jardin) est important pour son bien être et pour qu’il se dore la pilule au soleil.\r\n \r\nPee-wee est aussi indépendant. Au gré de ses humeurs il aime changer régulièrement de couchage, une nuit sur le lit, ou l’autre sur le canapé.\r\n \r\nC‘est un compagnon de vie adorable qui vous attend !', '2019-03-01', 1, 2),
(24, 'a', 0, '651646584024.png', 'a', '0008-07-06', 1, 5),
(25, 'b', 0, '651646584061.png', 'a\'3&é\nkhflkdsfj\n\n\" ( § \" é\"\'(§è!çà\n=/÷$* \' \"', '0008-07-06', 1, 5),
(26, 'b', 0, '651646585863.png', 'a\'3&é\nkhflkdsfj\n\n\" ( § \" é\"\'(§è!çà\n=/÷$* \' \"😂 &#039', '0008-07-06', 1, 5),
(27, 'b', 0, '651646585878.png', 'a\'3&é\nkhflkdsfj\n\n\" ( § \" é\"\'(§è!çà\n=/÷$* \' \"😂 &#039;', '0008-07-06', 1, 5),
(28, 'a', 0, 'Erreur', 'a', '0067-05-04', 1, 3),
(29, 'a', 0, 'string(0) \"\"\nbool(false)\narray(0) {\n}\nErreur', 'a', '0067-05-04', 1, 3),
(30, 'a', 0, 'string(0) \"\"\nbool(false)\nErreur', 'a', '0067-05-04', 1, 3),
(31, 'a', 0, 'string(0) \"\"\nbool(false)\nErreur', 'a', '0067-05-04', 1, 3),
(32, 'a', 0, '651647282289.png', 'a', '0067-05-04', 1, 3),
(33, 'a', 0, 'string(0) \"\"\nbool(false)\nErreur', 'a', '0067-05-04', 1, 3),
(34, 'a', 0, '651647283798.jpg', 'a', '0067-05-04', 1, 3),
(35, 'a', 0, '651647283866.png', 'a', '0067-05-04', 1, 3),
(36, 'a', 0, '651647283968.png', 'a', '0067-05-04', 1, 3),
(37, 'a', 0, '651647283983.png', 'a', '0067-05-04', 1, 3);

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
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(3, 2),
(4, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(3, 3),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
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
(1, 'Jouer', 'jouer.svg', '', 'partenaire de jeu idéal'),
(2, 'Enfant(s)', 'enfants.svg', '', 'à l’aise avec les enfants'),
(3, 'Extérieur', 'exterieur.svg', '', 'besoin d’un espace extérieur'),
(4, 'hiberner', 'hiberner.svg', '', 'besoin d’hiberner'),
(5, 'caresser', 'caresser.svg', '', 'aime les contact avec son maître'),
(6, 'balade', 'balade.svg', '', 'les promenades et balades sont essentielles'),
(7, 'autonomie', 'autonomie.svg', '', 'autonome mais pas ermite'),
(8, 'calme', 'calme.svg', '', 'besoin d’un environnement calme'),
(9, 'contact', 'contact.svg', '', 'besoin de contact avec d’autres animaux'),
(10, 'securise', 'securise.svg', '', 'besoin d’un logement sécurisé');

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
  `date_dernier_message` datetime DEFAULT CURRENT_TIMESTAMP,
  `url_photo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`idconversation`, `titre`, `date_creation`, `date_dernier_message`, `url_photo`) VALUES
(1, 'test', '2021-10-21 11:43:31', '2022-03-08 09:31:56', NULL),
(2, 'test2', '2021-10-21 11:51:59', '2022-03-14 09:31:56', NULL),
(3, 'test3', '2021-10-21 11:51:59', '2022-03-14 09:31:56', NULL),
(4, NULL, '2021-10-31 23:09:48', '2022-03-14 09:31:56', NULL),
(5, NULL, '2021-10-31 23:12:44', '2022-03-14 09:31:56', NULL),
(6, NULL, '2021-10-31 23:22:23', '2022-03-14 09:31:56', NULL),
(7, NULL, '2021-10-31 23:22:59', '2022-03-14 09:31:56', NULL),
(8, NULL, '2021-10-31 23:23:02', '2022-03-14 09:31:56', NULL),
(9, NULL, '2021-10-31 23:53:05', '2022-03-14 09:31:56', NULL),
(10, NULL, '2021-10-31 23:53:07', '2022-03-14 09:31:56', NULL),
(11, NULL, '2021-10-31 23:54:33', '2022-03-14 09:31:56', NULL),
(12, NULL, '2021-10-31 23:56:16', '2022-03-14 09:31:56', NULL),
(13, NULL, '2021-10-31 23:56:17', '2022-03-14 09:31:56', NULL),
(14, NULL, '2021-10-31 23:56:18', '2022-03-14 09:31:56', NULL),
(15, NULL, '2021-10-31 23:56:18', '2022-03-14 09:31:56', NULL),
(16, NULL, '2021-10-31 23:56:19', '2022-03-14 09:31:56', NULL),
(17, NULL, '2021-10-31 23:56:20', '2022-03-14 09:31:56', NULL),
(18, NULL, '2021-10-31 23:56:21', '2022-03-14 09:31:56', NULL),
(19, NULL, '2021-10-31 23:56:21', '2022-03-14 09:31:56', NULL),
(20, NULL, '2021-11-01 00:10:04', '2022-03-14 09:31:56', NULL),
(21, NULL, '2021-11-01 00:28:44', '2022-03-14 09:31:56', NULL),
(22, NULL, '2021-11-01 00:29:02', '2022-03-14 09:31:56', NULL),
(23, NULL, '2021-11-01 00:29:03', '2022-03-14 09:31:56', NULL),
(24, NULL, '2021-11-01 00:29:37', '2022-03-14 09:31:56', NULL),
(25, NULL, '2021-11-01 00:30:14', '2022-03-14 09:31:56', NULL),
(26, NULL, '2021-11-01 00:33:10', '2022-03-14 09:31:56', NULL),
(27, NULL, '2021-11-01 00:33:28', '2022-03-14 09:31:56', NULL),
(28, NULL, '2021-11-01 00:34:28', '2022-03-14 09:31:56', NULL),
(29, NULL, '2021-11-01 00:34:34', '2022-03-14 09:31:56', NULL),
(30, NULL, '2021-11-01 00:35:23', '2022-03-14 09:31:56', NULL),
(31, NULL, '2021-11-01 00:39:16', '2022-03-14 09:31:56', NULL),
(32, NULL, '2021-11-01 00:40:31', '2022-03-14 09:31:56', NULL),
(33, NULL, '2021-11-01 00:41:21', '2022-03-14 09:31:56', NULL),
(34, NULL, '2021-11-01 00:43:31', '2022-03-14 09:31:56', NULL),
(35, NULL, '2021-11-04 22:22:41', '2022-03-14 09:31:56', NULL),
(36, NULL, '2021-11-04 22:23:27', '2022-03-14 09:31:56', NULL),
(37, NULL, '2022-02-15 11:55:31', '2022-03-14 09:31:56', NULL),
(38, NULL, '2022-02-15 15:53:11', '2022-03-14 09:31:56', NULL),
(39, NULL, '2022-03-02 17:07:08', '2022-03-15 09:08:35', NULL),
(40, NULL, '2022-03-12 18:02:50', '2022-03-14 09:46:17', NULL),
(41, NULL, '2022-03-12 18:20:19', '2022-03-14 09:46:25', NULL);

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
(39, 80, 1),
(39, 83, 2),
(40, 54, 2),
(40, 80, 1),
(41, 65, 2),
(41, 80, 1);

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
(73, 80, 83, '2022-03-10 15:51:05', 2, 0),
(74, 80, 54, '2022-03-12 18:02:50', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idmessage` int NOT NULL,
  `texte_message` text COLLATE utf8mb4_general_ci,
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
(176, '8w==', NULL, '2022-03-06 14:48:12', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(177, '4TFaj7S0', NULL, '2022-03-06 14:49:32', 80, 39, 0x2f7b51ef1e254ca5a58db0218298227b),
(178, '4TFamKO0', NULL, '2022-03-06 14:56:11', 80, 39, 0xd1e12477e3f349c20b033178f7ff516e),
(179, '4TFNmA==', NULL, '2022-03-06 14:56:50', 80, 39, 0xf0458cbe8e81e26876b63a6b3c7d85d2),
(180, '4Q==', NULL, '2022-03-06 14:57:18', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(181, '9iZaj7S0', NULL, '2022-03-06 14:57:21', 80, 39, 0xd18687ea798bc224fcf8d752970a07e8),
(182, '9g==', NULL, '2022-03-06 14:57:25', 80, 39, 0xff92c8bd455c99e18cc68043af1ae354),
(183, '4TNYmKE=', NULL, '2022-03-06 14:57:27', 80, 39, 0x3c7bd373c0a56f152a7164142247a708),
(184, '4Q==', NULL, '2022-03-06 14:57:31', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(185, '4Q==', NULL, '2022-03-06 14:57:35', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(186, '4Q==', NULL, '2022-03-06 14:57:41', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(187, 'YsqkaeX1CFNhUkUC70xdop+SPgNX', NULL, '2022-03-06 14:58:24', 80, 39, 0x986e0e3060970d78035a7636f44490d5),
(188, NULL, '801646580398.jpeg', '2022-03-06 15:26:38', 80, 39, NULL),
(189, NULL, '801646581027.jpg', '2022-03-06 15:37:43', 80, 39, NULL),
(190, NULL, '801646581102.png', '2022-03-06 15:38:23', 80, 39, NULL),
(191, '6A==', NULL, '2022-03-06 15:53:01', 80, 39, 0x1012d702d78671466e2adcc7aba01e58),
(192, '8w==', NULL, '2022-03-06 15:58:57', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(193, '8w==', NULL, '2022-03-06 15:59:01', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(194, '9g==', NULL, '2022-03-06 15:59:39', 80, 39, 0xff92c8bd455c99e18cc68043af1ae354),
(195, '9T0=', NULL, '2022-03-06 15:59:41', 80, 39, 0xcdc204c6922dbfa51dcc8e7d598c3ab7),
(196, '5idajA==', NULL, '2022-03-06 15:59:43', 80, 39, 0x5ee4eb573e819f884ee9a4c5a01a43e2),
(197, '8w==', NULL, '2022-03-07 11:00:03', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(198, '8w==', NULL, '2022-03-07 11:00:32', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(199, '8w==', NULL, '2022-03-07 11:06:09', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(200, '8w==', NULL, '2022-03-07 11:07:14', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(201, '8w==', NULL, '2022-03-07 11:14:11', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(202, '8w==', NULL, '2022-03-07 11:14:29', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(203, '8w==', NULL, '2022-03-07 11:14:43', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(204, '8w==', NULL, '2022-03-07 11:21:09', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(205, '8w==', NULL, '2022-03-07 11:21:27', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(206, '8w==', NULL, '2022-03-07 13:12:34', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(207, '8w==', NULL, '2022-03-10 08:35:27', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(208, '8yY=', NULL, '2022-03-10 08:35:31', 80, 39, 0xc4e33d50b79589bfebe2a3efe2fb78c9),
(209, '8yY=', '801646897735.png', '2022-03-10 08:35:35', 80, 39, 0xc4e33d50b79589bfebe2a3efe2fb78c9),
(210, '8w==', NULL, '2022-03-10 08:53:32', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(211, '8yY=', NULL, '2022-03-10 08:53:36', 80, 39, 0xc4e33d50b79589bfebe2a3efe2fb78c9),
(212, '8A==', NULL, '2022-03-10 08:53:49', 80, 39, 0xa3ed313195ceae3fec5a9397ae68d0fd),
(213, '8A==', NULL, '2022-03-10 08:55:10', 80, 39, 0xa3ed313195ceae3fec5a9397ae68d0fd),
(214, '3jpOjqrySQzRkFICpnzzfcuRjsMBI+RpbIYUAHOy93Eo1DPPuvujiMdu+z5Gi68k8xSVLBR8PsZuMgCkONPbeJR/KBm06qU8u8WHyxe7fxIJh7zFjn1vzPG5XeoQWfwxevuAWwEkEWIJQEqp3WbVnztwss/wHp0=', NULL, '2022-03-10 09:43:38', 80, 39, 0x764f897ded790e017350326036e32e11),
(215, '4Q==', NULL, '2022-03-10 09:45:23', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(216, '4Q==', NULL, '2022-03-10 09:50:22', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(217, '8w==', NULL, '2022-03-10 09:52:22', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(218, '8w==', NULL, '2022-03-10 09:53:55', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(219, '4Q==', NULL, '2022-03-10 09:53:58', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(220, '9A==', NULL, '2022-03-10 09:54:01', 80, 39, 0x75b860390ad28b54534d710fafcb0dcc),
(221, '3jpOjqrySQzRkFICpnzzfcuRjsMBI+RpbIYUAHOy93Eo1DPPuvujiMdu+z5Gi68k8xSVLBR8PsZuMgCkONPbeJR/KBm06qU8u8WHyxe7fxIJh7zFjn1vzPG5XeoQWfwxevuAWwEkEWIJQEqp3WbVnztwss/wHp0272MghwbOyk78Wl+2C41QXNzKLKMj6XRt46wnQgFH5SA=', NULL, '2022-03-10 09:56:33', 80, 39, 0x2c410a74ddad006db4bc102841ea15ec),
(222, '9g==', NULL, '2022-03-10 15:51:15', 80, 39, 0xff92c8bd455c99e18cc68043af1ae354),
(223, '/A==', NULL, '2022-03-12 17:43:46', 80, 39, 0x1b12c22834eac1832d62b43fac8cb7af),
(224, '9w==', NULL, '2022-03-12 17:43:56', 80, 39, 0xba879cff629b90bb630378e5af721418),
(225, '8w==', NULL, '2022-03-12 17:47:11', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(226, '9TI=', NULL, '2022-03-12 17:51:19', 80, 39, 0x2839c4c94de4d2d14e3df8531b8e67c9),
(227, '8w==', NULL, '2022-03-14 09:21:51', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(228, '819d4abYQXbD', NULL, '2022-03-14 09:21:57', 80, 39, 0x081a2f1c62c49da56564519d1cda4873),
(229, '3jpOjqrySQzRkFICpnzzfcuRjsMBL6VlZJdMAHOy93Eo1DPPuvujiMdu+z5Gi68k8xSVLBR8PsZuMgqoJ8/NeJVxZASj5qskq87D0gHlLAsUhaTRnzR/g/6mUeoQUexkeLSdTQdrVXsAQVGh0jPC0Dt+osngHoM6om4ggxveylvwE0r3HotQQN+eKK9m5zsn', NULL, '2022-03-14 09:23:40', 80, 39, 0x449f9c2ff0377c6443d9d046a0f8c5f3),
(230, '3jpOjqrySQzRkFICpnzzfcuRjsMBL6VlZJdMAHOy93Eo1DPPuvujiMdu+z5Gi68k8xSVLBR8PsZuMgqoJ8/NeJVxZASj5qskq87D0gHlLAsUhaTRnzR/g/6mUeoQUexkeLSdTQdrVXsAQVGh0jPC0Dt+osngHoM6om4ggxveylvwE0r3HotQQN+eKK9m5zt3/703WkBa9HLU+GJ+HSCV397eJ5P6OBOey5lP0/6V8Q/Egde5wXs815ROVju6fbBa7EGRW30L6oCwMlSJ96l3n5b9JqOjWJtG/c0/4kwVuzuEadA=', NULL, '2022-03-14 09:26:01', 80, 39, 0x47ce8ee4304be10521451e8f5e97d675),
(231, '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', NULL, '2022-03-14 09:26:05', 80, 39, 0xe878a6c1cd3ef484eaebd9fdbcef2757),
(232, '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', NULL, '2022-03-14 09:26:14', 80, 39, 0x9882272a79bf0fa3936e9541cc2edf43),
(233, NULL, '801647246465.png', '2022-03-14 09:27:45', 80, 39, NULL),
(234, '4Q==', NULL, '2022-03-14 09:27:47', 80, 39, 0x3bad2151ce7932cbffc0e151a88f5377),
(235, '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', '801647246474.png', '2022-03-14 09:27:54', 80, 39, 0xc29ae979cfb637895783b3dac2f5311d),
(236, '6C8=', NULL, '2022-03-14 09:36:19', 80, 39, 0x8b169853ce8db26ad44d0f68718980f5),
(237, '8w==', NULL, '2022-03-14 09:39:07', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(238, '8w==', NULL, '2022-03-14 09:40:29', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(239, '8w==', NULL, '2022-03-14 09:40:45', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(240, '8w==', NULL, '2022-03-14 09:41:26', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(241, '9yBU', NULL, '2022-03-14 09:45:41', 80, 39, 0xef66ef46dfec169c00ce992141c381cc),
(242, '+jhRhg==', NULL, '2022-03-14 09:46:17', 80, 40, 0x696557e0c0bdbb7b69e30c69ee9bfd81),
(243, '/SBMmA==', NULL, '2022-03-14 09:46:25', 80, 41, 0xc934a68067cc8821b698e21406b671ad),
(244, '/SBMmA==', NULL, '2022-03-14 09:46:31', 80, 39, 0xc934a68067cc8821b698e21406b671ad),
(245, '8w==', NULL, '2022-03-14 23:34:23', 80, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(246, NULL, '801647297270.png', '2022-03-14 23:34:30', 80, 39, NULL),
(247, NULL, '801647297617.png', '2022-03-14 23:40:17', 80, 39, NULL),
(248, NULL, '801647297770.png', '2022-03-14 23:42:50', 80, 39, NULL),
(249, NULL, '801647297853.jpg', '2022-03-14 23:44:13', 80, 39, NULL),
(250, NULL, '801647297890.jpg', '2022-03-14 23:44:50', 80, 39, NULL),
(251, NULL, '801647298103.jpg', '2022-03-14 23:48:23', 80, 39, NULL),
(252, NULL, '801647298403.jpg', '2022-03-14 23:53:23', 80, 39, NULL),
(253, NULL, '801647298522.jpg', '2022-03-14 23:55:22', 80, 39, NULL),
(254, NULL, '801647298657.jpg', '2022-03-14 23:57:37', 80, 39, NULL),
(255, '6A==', NULL, '2022-03-14 23:59:04', 80, 39, 0x1012d702d78671466e2adcc7aba01e58),
(256, NULL, '801647298754.jpg', '2022-03-14 23:59:14', 80, 39, NULL),
(257, NULL, '801647298776.jpg', '2022-03-14 23:59:36', 80, 39, NULL),
(258, NULL, '801647298877.jpg', '2022-03-15 00:01:17', 80, 39, NULL),
(259, NULL, '801647298903.jpg', '2022-03-15 00:01:43', 80, 39, NULL),
(260, NULL, '801647298960.jpg', '2022-03-15 00:02:40', 80, 39, NULL),
(261, NULL, '801647298994.jpg', '2022-03-15 00:03:14', 80, 39, NULL),
(262, NULL, '801647299022.jpg', '2022-03-15 00:03:42', 80, 39, NULL),
(263, NULL, '801647299031.jpg', '2022-03-15 00:03:51', 80, 39, NULL),
(264, NULL, '801647299088.jpg', '2022-03-15 00:04:48', 80, 39, NULL),
(265, NULL, '801647299102.jpg', '2022-03-15 00:05:02', 80, 39, NULL),
(266, NULL, '801647299138.jpg', '2022-03-15 00:05:38', 80, 39, NULL),
(267, NULL, '801647299240.jpg', '2022-03-15 00:07:20', 80, 39, NULL),
(268, '8w==', NULL, '2022-03-15 09:08:33', 83, 39, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(269, '4Q==', NULL, '2022-03-15 09:08:35', 83, 39, 0x3bad2151ce7932cbffc0e151a88f5377);

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
(63, '801646062584.png', '', '2022-02-28 15:36:24', NULL, 23, 80),
(65, '801646062606.png', 'Miaou', '2022-02-28 15:36:46', NULL, 23, 80),
(76, '801646488010.png', '', '2022-03-05 13:46:51', NULL, 23, 80),
(77, '801646606073.png', '', '2022-03-06 22:34:34', NULL, 23, 80),
(78, '801646606140.png', '', '2022-03-06 22:35:40', NULL, 23, 80),
(79, '801646607335.png', '', '2022-03-06 22:55:35', NULL, 25, 80),
(80, '801646609516.png', '', '2022-03-06 23:31:56', NULL, 30, 80),
(81, '801646665790.png', '', '2022-03-07 15:09:51', NULL, 23, 80),
(82, '801646665814.png', '', '2022-03-07 15:10:15', NULL, 23, 80),
(83, '801646736665.png', '', '2022-03-08 10:51:08', NULL, 24, 80),
(84, '801646745196.png', '', '2022-03-08 13:13:17', NULL, 24, 80),
(85, '801646745218.png', '', '2022-03-08 13:13:39', NULL, 24, 80),
(86, '801646746974.png', '', '2022-03-08 13:42:57', NULL, 24, 80),
(87, '801646747756.png', '', '2022-03-08 13:55:57', NULL, 23, 80),
(88, '801646747867.png', '', '2022-03-08 13:57:48', NULL, 25, 80),
(89, '801646748055.png', '', '2022-03-08 14:00:57', NULL, 24, 80),
(90, '801646748353.png', '', '2022-03-08 14:05:54', NULL, 24, 80),
(91, '801646748510.png', '', '2022-03-08 14:08:31', NULL, 24, 80),
(92, '801646748562.png', '', '2022-03-08 14:09:23', NULL, 24, 80),
(93, '', '', '2022-03-08 14:11:56', NULL, 24, 80),
(94, '', '', '2022-03-08 14:22:12', NULL, 24, 80),
(95, '', '', '2022-03-08 14:22:54', NULL, 24, 80),
(96, '801646749406.png', '', '2022-03-08 14:23:27', NULL, 24, 80),
(97, '', '', '2022-03-10 08:32:57', NULL, 24, 80),
(98, '', '', '2022-03-10 08:33:42', NULL, 24, 80),
(99, '', 'deezdsdff', '2022-03-14 01:19:50', NULL, 28, 80),
(100, '', '', '2022-03-14 01:23:45', NULL, 29, 80),
(101, '801647217923.png', 'sdfdsfdsf', '2022-03-14 01:32:03', NULL, 23, 80),
(102, '831647331395.png', '', '2022-03-15 09:03:15', NULL, 38, 83);

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
(23, 'Médor II', '801646897748.png', 'médor II mon chien wouaf 😄', '0022-01-01', 80, 4),
(24, 'Véro II', '801646062433.png', 'Véro la poule de matthis je lui ai volé aedsqd', '2022-01-12', 80, 1),
(25, 'test', '801646495555.jpg', '', '2022-03-24', 80, 1),
(26, 'aa', '801646498662.jpeg', '', '0888-08-09', 80, 7),
(27, 'a', '881646565457.png', '', '0069-05-04', 88, 7),
(28, 'doggydog', '801646581585.png', '', NULL, 80, 3),
(29, 'a', '801646581613.png', 'd', NULL, 80, 2),
(30, 'a', '', '', NULL, 80, 5),
(31, 'a', '681646609716.png', '', NULL, 68, 2),
(32, 'a', '801646666064.png', '', NULL, 80, 2),
(33, 'd', '801646666078.png', '', NULL, 80, 10),
(34, 'hit', '801646666098.png', '', NULL, 80, 8),
(35, 'test', '801646897767.png', '', NULL, 80, 10),
(37, 'ye', '831647242522.png', 'Bienvenue sur mon profil !', NULL, 83, 9),
(38, 'e', '831647331419.png', '', NULL, 83, 6);

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
(1, 'Oiseaux', NULL, 7),
(2, 'Chats', NULL, 1),
(3, 'Chiens', NULL, 2),
(4, 'Autres', NULL, 12),
(5, 'Rongeurs', NULL, 3),
(6, 'Reptiles', NULL, 4),
(7, 'Poissons', NULL, 5),
(8, 'Crustacés', NULL, 10),
(9, 'Insectes', NULL, 11),
(10, 'Amphibiens', NULL, 9),
(12, 'Furets', NULL, 8),
(13, 'Lapins', NULL, 6);

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
  `readstate` tinyint DEFAULT '1',
  `statut` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `google_sub`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `readstate`, `statut`) VALUES
(2, '1', '', NULL, 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, 'test', '2021-10-11 21:15:24', NULL, NULL, NULL, NULL),
(13, NULL, '$argon2i$v=19$m=2048,t=4,p=3$dUtXa29hVEt2eDhJbjJ0eQ$/+I4XqKPjjHkQf+h9SRMDGDQ9CEx2MUn2fNcoOW6NzU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:27:50', '2021-10-11 21:27:45', NULL, NULL, NULL),
(17, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:34', NULL, NULL, NULL, NULL),
(18, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:52', NULL, NULL, NULL, NULL),
(19, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:06', NULL, NULL, NULL, NULL),
(20, NULL, '=19=2048,t=4,p=3+BRptAhGziq2I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:36', NULL, NULL, NULL, NULL),
(21, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:33:57', NULL, NULL, NULL, NULL),
(22, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:34:24', NULL, NULL, NULL, NULL),
(23, NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:37:05', NULL, NULL, NULL, NULL),
(24, NULL, '=19=2048,t=4,p=3$39MWwuk1lt2sITkfayWCnivyQXgGcX89ojPzoucmkAU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:47:59', NULL, NULL, NULL, NULL),
(25, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:10', NULL, NULL, NULL, NULL),
(26, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:36', NULL, NULL, NULL, NULL),
(27, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:43', NULL, NULL, NULL, NULL),
(28, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:02', NULL, NULL, NULL, NULL),
(29, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:33', NULL, NULL, NULL, NULL),
(30, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:15', NULL, NULL, NULL, NULL),
(31, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:26', NULL, NULL, NULL, NULL),
(32, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:52:55', NULL, NULL, NULL, NULL),
(33, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:09', NULL, NULL, NULL, NULL),
(34, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:18', NULL, NULL, NULL, NULL),
(35, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:54:52', NULL, NULL, NULL, NULL),
(36, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:46', NULL, NULL, NULL, NULL),
(37, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:57', NULL, NULL, NULL, NULL),
(38, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:56:09', NULL, NULL, NULL, NULL),
(39, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:14', NULL, NULL, NULL, NULL),
(40, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:25', NULL, NULL, NULL, NULL),
(41, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:48', NULL, NULL, NULL, NULL),
(42, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:58:45', NULL, '424242', NULL, NULL),
(43, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:42', NULL, NULL, NULL, NULL),
(44, NULL, 'aaaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:56', NULL, NULL, NULL, NULL),
(45, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:16', NULL, NULL, NULL, NULL),
(46, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:31', NULL, NULL, NULL, NULL),
(47, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:53', NULL, NULL, NULL, NULL),
(48, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:25', NULL, NULL, NULL, NULL),
(49, NULL, '$argon2i$v=19$m=2048,t=4,p=3$WlExaVRCU3BHTUFKTDFWSQ$lyDHyXkg+aKauZHinbxkLHSgWaDBXHlt3dHjzHnRh+U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:40', NULL, NULL, NULL, NULL),
(52, 'pseudo', '$argon2i$v=19$m=2048,t=4,p=3$aXNMYVZUalBKVXBrZWpodA$iJVVOSyeYIXQMl9tjmcEkVTCRqf+nTlQMgeiaJEmd58', NULL, 'pseudo', 'pseudo', 'pseudo', NULL, '2021-10-11', NULL, NULL, '2021-10-11 23:03:55', NULL, '12a343c3aedd2568abebad71d65391ab18f1c5ea14e78974bc66b9fc01145b0dd8ab18-52-1634068665', NULL, NULL),
(54, 'matthis', '$argon2i$v=19$m=2048,t=4,p=3$N3FYT1lqcFRudU4wanoxMw$n/t1XIvr5VvbjXCqlTNq/7awPHS1YT/mITckS4BIXo8', NULL, 'matthis', 'matthis', 'matthis', 'profil.jpg', '0005-04-05', NULL, 'Jeune propriétaire de poules du 77', '2021-10-12 10:20:36', NULL, '335f2520da38fc1bb22ab612e618424abe60bb3667a1848e550de77969174eefc30bb7-54-1636455708', NULL, 1),
(55, 'maaa', '$argon2i$v=19$m=2048,t=4,p=3$b0VnREI0TUxkSG50TDVjZA$90IKf0fK9U0FRJciVPv+nobhL6cjOe+FJ6M4jfPXJCg', NULL, 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:43:40', NULL, NULL, NULL, NULL),
(56, 'msqdlksqkhdsqd', '$argon2i$v=19$m=2048,t=4,p=3$VFRhMTlmTlBsUlJsRXkzMA$iBQSxxmYWcBQuOyB4oUYgwjmYqxDgnAqUhjYZPbKGjs', NULL, 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:44:10', NULL, NULL, NULL, NULL),
(58, 'testt', '$argon2i$v=19$m=2048,t=4,p=3$RU5jV1hYN3laQWFqdWNPQg$X9MRs3KIP/NUCnj5TcOQ1xbqT+ui5SkmoPbJSS7x1D0', NULL, 'test', 'test', 'test', NULL, '2021-10-04', NULL, NULL, '2021-10-12 15:06:47', NULL, '5ec4d4b64a26edbc179bf0e544fa66b1188e1972a71aeae694dc12a0d3ef9dc1c73b14-58-1634044036', NULL, NULL),
(59, 'test', '$argon2i$v=19$m=2048,t=4,p=3$OVIxSmFPZXBjaVNKQWVjSA$adFKdFpM4UoPPrm1FL4PEJ1jG5EcCgc8isxc3tVga+A', NULL, 'testttt', 'testttt', 'test@psqodskdml', NULL, '0001-01-01', NULL, NULL, '2021-10-12 15:19:52', NULL, '92fa14bc9ef41cd1a496a114714163f0247d1f070778aca9b6180b1a1da260353201af-59-1634044798', NULL, NULL),
(60, 'testhash', '$2y$10$qxTOsJZWW507dhLOZT/SEOLT8.IJXZ/vvwxDgBkwqiRrwXUoih3zm', NULL, 'testhash', 'testhash', 'testhash', NULL, '2021-10-21', NULL, NULL, '2021-10-13 01:58:22', NULL, '330ea81dce81d8275da9dd3ce0e97d900ae7e774f02d42624ee0141f7d79a013bae4a9-60-1634083112', NULL, NULL),
(61, 'lucien', '$2y$10$dmkRoSdUp2xZ/QLS1MAEmeUKoJKmrrQzFRu8cGwkUwwpUStX0PLJO', NULL, 'lucien', 'lucien', 'lucien', NULL, '2222-12-21', NULL, NULL, '2021-10-18 09:21:30', NULL, 'f1def9ce20bd17f72ec9823b398b42a318687b7c4f871ff5d42e57f2a7306d7282c460-61-1636455693', NULL, NULL),
(62, 'Elon', '$2y$10$PgpcUxsz5xhy/pQlWd0AYu1Rhh8vcQKWJDJfVCYfy9Qoz/6zX36Ui', NULL, 'elon', 'elon', 'elon', NULL, '0001-11-11', NULL, NULL, '2021-10-19 19:06:13', NULL, '8577a2bc96ce89ab224c503927b6019f9ceb755341e0a0240c1ee541c6c721691ed60b-62-1634663770', NULL, NULL),
(63, 'testtest', '$2y$10$hzIy1WSrfXHfLORkZKu7Ke91dsCipr45bRVEkPzQGWS394eMshBIe', NULL, 'testtest', 'testtest', 'testtest', 'déconnecté', '2022-02-01', NULL, NULL, '2021-10-19 20:07:10', NULL, 'b498b38682a6d01eb5ae0fd03fa9c663d920954a76e3eb565b6a46cfad71e8345bbf56-63-1636061066', NULL, NULL),
(64, 'a', '$argon2i$v=19$m=2048,t=4,p=3$T0UzbXVJOWozY3hSSmg4Lw$YOmfB0jUVNJqUjoL8YclXQHxtjG4Wzir1PqqCZ1Rgj8', NULL, 'testtesttest', 'testtesttest', 'testtesttest', 'uploadedOn1634667264_by_64_peewee.jpg', '0008-08-08', NULL, NULL, '2021-10-19 20:07:48', NULL, '903c970b017c3109170fe39e89bb64fa5f0fcad5e00a157313d3a63a12554e3be6ff4b-64-1634670563', NULL, NULL),
(65, 'admin', '$2y$10$zZTUX6mXg0b0rDwcYGHWjeHIrPzU/LZ64.uUiQajUsrrYaDS1rwZa', NULL, 'admin', 'admin', 'admin', 'déconnecté', '0001-01-01', NULL, NULL, '2021-12-22 19:05:11', '2022-03-14 20:16:34', '0eaba20085826476b6ef3b19ac3623019299bfa185a69b516853544cc90da28b2f25bb-65-1647285394', NULL, 1),
(66, 'Zoey', '$2y$10$jhRHP68VNZ/1snIW9TL07uk78ZhiUxu5J2HUbRAtrLOt2F6BaJH9q', NULL, 'zoey', 'zoey', 'zoey', '', '0001-01-01', NULL, NULL, '2022-01-19 01:22:55', NULL, NULL, NULL, NULL),
(67, 'zozo', '$2y$10$3sfZi36PiXoxIFEQAir8GeXixLSkCYVgrGx0/ZTQEidtpQ7IYzD3q', NULL, 'zozo', 'zozo', 'zozo', '', '0007-06-05', NULL, NULL, '2022-01-19 01:28:38', NULL, 'f66ffc919df28b85487b6923765cd4f22cb7032d0cba81b3369de70f56170a5f670124-67-1642554479', NULL, 1),
(68, 'aa', '$argon2i$v=19$m=2048,t=4,p=3$N1REbTJlMDNady4ycUVTWQ$wn3ctMk8Nh8jhn/zrEYJ10n/Q+VrbsqOjiZEkdnUSrE', NULL, 'aa', 'aa', 'a@mail.fr', '681645876715.png', '4567-03-01', NULL, 'Bienvenue sur mon profil ! Test coucou', '2022-01-20 17:51:48', '2022-03-15 09:38:01', '341a427180a7463897dfa4fa699e4b2caf30554b12229c27515eb7d0045c49b7b4c7da-68-1647333481', NULL, NULL),
(74, NULL, NULL, '105790575614120714764222222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-15 00:39:29', NULL, NULL, NULL, NULL),
(78, 'dd', '$2y$10$fi/HNVljsOwMqNM9WXc/GeswEVDd3iZOaafQbBVK1qzJCJBJqBcvC', NULL, NULL, NULL, 'exemple@zoey.fr', '', NULL, NULL, NULL, '2022-02-15 00:50:44', '2022-03-15 09:38:22', '6f6040e7f863ba58dad1885edef028ed7cdcb403d8eaa5f46a0cc042f1bdd748eb0484-78-1647333502', NULL, NULL),
(80, 'Marin', NULL, '105790575614120714764', NULL, NULL, 'marin.bouanchaud@gmail.com', '801646897743.png', NULL, NULL, 'azeazaz😉<br>a', '2022-02-26 17:55:04', '2022-03-15 09:57:19', '146e03cceb1555a4107422b76efafba84e5e2533b7d32665e7ab28357481c166d6bf0d-80-1647334639', 2, NULL),
(83, 'Zoey_5291', NULL, '105601581997729776049', NULL, NULL, 'app.zoey@gmail.com', 'gdl-1646239535.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-02 16:45:35', '2022-03-15 09:37:42', 'c775de74200341d835bacbdeb48229fa1deb130a6c7a86a825938016b5b189c957ac54-83-1647333462', 2, NULL),
(87, 'Marin_', NULL, '116179095823259577328', NULL, NULL, 'contact@marinb.com', '871646240192.png', NULL, NULL, 'Bienvenue sur mon profil ! Je peux le modifier facilement !', '2022-03-02 16:53:01', NULL, '0b6afeef19108b5e35f8d067c3cdae1165475ee3df494bda905ce37647dc899254b1af-87-1646239981', NULL, NULL),
(88, 'Tt', '$2y$10$8mcr38U9o.bSuIBS.5RR3.c3kPnNw7kcx9wECVASmUbDyiKwOuQ1.', NULL, NULL, NULL, 'tt@mail.fr', 'defaultProfile.jpg', NULL, NULL, NULL, '2022-03-05 15:40:38', '2022-03-06 11:40:57', 'e06cf3dc92671f21c8d74dcd049dac88c50a74a3ba1756df098803cde2c770a14715f6-88-1646566857', NULL, NULL),
(89, 'b', '$2y$10$4wT7QNEXALB8.ApOy8U8x.t3P4CtbBfBEShyWid/NdIrXnd9WfV8q', NULL, NULL, NULL, 'b@b.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-13 17:48:57', '2022-03-13 17:49:01', 'c1da7668add6f6d0e800652f5af515f44a6e119b82c361fad39a09ecb90d4855951929-89-1647190141', NULL, NULL),
(90, 'c', '$2y$10$O2M5xyABE9fMe7q9dg5ISemcC16sjnRIbarjqxnibLIqQebOBzLAO', NULL, NULL, NULL, 'c@ypmail.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-13 17:49:40', '2022-03-13 17:49:44', 'b7939f502c0068215dfb4c5ab8cf659da08c0eab4a1520800b5ea80cdffbb7e998d422-90-1647190184', NULL, NULL),
(91, 'd', '$2y$10$.iNQnw4AlzOIV5YtP4lr7.MDK9FC3eyofsxsjaMtgYMZMaOI660.y', NULL, NULL, NULL, 'd@d.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-13 22:17:38', NULL, NULL, NULL, NULL);

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
  MODIFY `idanimal_a_adopter` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `idconversation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  MODIFY `idliste_amis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idmessage` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `idtypes_animaux` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

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

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 05 fév. 2022 à 18:19
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

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
  `idanimal_a_adopter` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `sexe` tinyint(1) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_anniversaire` date DEFAULT NULL,
  `refuge_idrefuge` int(11) NOT NULL,
  `idtype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `animal_a_adopter`
--

INSERT INTO `animal_a_adopter` (`idanimal_a_adopter`, `nom`, `sexe`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`, `idtype`) VALUES
(3, 'Titou', 0, 'chat.jpg', 'Titou est un chat affectueux et proche de son maître. Il réclame des caresses (surtout des grosses gratouilles derrière les oreilles, il saura vous montrer).\r\n \r\nIl n’aime pas etre pris dans les bras et ne vient pas sur les genoux mais vous accompagne volontiers dans la salle de bains ou reste a vos côtés sur le canapé. \r\n \r\nIl accourt très facilement quand on l’appelle. Il ADORE être brossé.\r\n \r\nC’est un grand gourmand qui devrait pouvoir apprendre des petits tours pour obtenir une croquette. Il faudra progressivement lui apporter une nourriture de bonne qualité car habitué aux bonbons et autres friandises il peut faire le difficile devant des marques pourtant mieux adaptées à sa santé. \r\n \r\nTitou est un vrai chasseur ! Il a besoin de beaucoup jouer et de personnes présentes à la maison.\r\n \r\nIl a besoin d’être stimulé, sinon ce seront vos orteils ou vos plantes vertes qui l’amuseront beaucoup. \r\n \r\nTitou n’a pas été testé avec d’autres chats mais peut-être qu’un compagnon aussi actif que lui pourrait être bénéfique.', '2019-10-01', 1, 2),
(4, 'Pee-wee', 0, 'chat.jpg', 'Histoire : \r\n\r\nPee-wee est né en mars 2019. Il a été trouvé dans un entrepôt en Bretagne. Non réclamé.\r\nPee-wee est FIV+ et fait un peu d’asthme.\r\nCaractère : \r\n\r\nCe petit loulou de 2 ans est très attachant. Il se laisse caresser sans problème et il est extrêmement sociable !\r\nIl se pavane et aime venir dire bonjour à tout le monde !\r\n \r\nPee-wee est joueur. Il a besoin d’être stimulé et que l’on s’occupe de lui. Pee-wee est sociable avec les autres chats et il peut sans problème être adopté avec un copain négatif au FIV car il ne ferait pas de mal à une mouche ! \r\n(Quoi que, pour la mouche…).\r\n \r\nPee-wee apprécie sortir. Un espace extérieur bien sécurisé (terrasse, jardin) est important pour son bien être et pour qu’il se dore la pilule au soleil.\r\n \r\nPee-wee est aussi indépendant. Au gré de ses humeurs il aime changer régulièrement de couchage, une nuit sur le lit, ou l’autre sur le canapé.\r\n \r\nC‘est un compagnon de vie adorable qui vous attend !', '2019-03-01', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `animal_a_adopter_has_badge`
--

CREATE TABLE `animal_a_adopter_has_badge` (
  `animal_a_adopter_idanimal_a_adopter` int(11) NOT NULL,
  `badge_idbadge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `animal_a_adopter_has_badge`
--

INSERT INTO `animal_a_adopter_has_badge` (`animal_a_adopter_idanimal_a_adopter`, `badge_idbadge`) VALUES
(3, 2),
(3, 3),
(3, 8),
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `badge`
--

CREATE TABLE `badge` (
  `idbadge` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `url_icone` varchar(45) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `resume` varchar(255) NOT NULL,
  `texte1` text DEFAULT NULL,
  `url_image` varchar(45) NOT NULL,
  `description_photo` varchar(255) NOT NULL,
  `texte2` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `fk_idcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `description_photo`, `texte2`, `date_publication`, `fk_idcategorie`) VALUES
(1, 'Les animaux c\'est génial', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', 'public/blog/blogTemplate.php', '', '', '', '2021-10-01 09:56:30', 3),
(3, 'Nourrir son chien', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:23', 2),
(4, 'Caresser une tortue', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:23', 2),
(5, 'Sauver les animaux', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:28', 2),
(6, 'Adopter une chèvre', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ea nostrum qui, libero at officia beatae harum ipsa esse quis vitae dolorem quaerat quas iste distinctio quos quidem praesentium. Dolorum, cupiditate.', NULL, '', '', '', '2021-10-03 12:45:28', 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_blog`
--

CREATE TABLE `categorie_blog` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(36, NULL, '2021-11-04 22:23:27', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `conversation_has_utilisateur`
--

CREATE TABLE `conversation_has_utilisateur` (
  `conversation_idconversation` int(11) NOT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conversation_has_utilisateur`
--

INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`) VALUES
(1, 54),
(1, 62),
(2, 2),
(2, 54),
(3, 35),
(20, 54),
(20, 60),
(33, 54),
(33, 61),
(34, 54),
(34, 59),
(34, 61),
(35, 54),
(35, 63),
(36, 61),
(36, 63);

-- --------------------------------------------------------

--
-- Structure de la table `liste_amis`
--

CREATE TABLE `liste_amis` (
  `idliste_amis` int(11) NOT NULL,
  `id_demandeur` int(11) DEFAULT NULL,
  `id_receveur` int(11) DEFAULT NULL,
  `date_demande` datetime DEFAULT current_timestamp(),
  `statut` tinyint(1) DEFAULT 1,
  `id_bloqueur` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(69, 63, 61, '2021-11-04 22:23:27', 2, 0);

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

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idmessage`, `texte_message`, `url_media`, `date_envoi_msg`, `utilisateur_idutilisateur`, `conversation_idconversation`) VALUES
(3, 'message test envoyé par matthis', NULL, '2021-10-21 12:02:44', 54, 1),
(4, 'je vends des bitcoins', NULL, '2021-10-21 12:02:44', 62, 1),
(5, 'message pour la conv test2', NULL, '2021-10-21 12:06:37', 54, 2),
(6, 'message', NULL, '2021-10-30 14:24:37', 54, 1),
(7, 'message', NULL, '2021-10-30 14:25:32', 54, 1),
(8, '', 'déconnecté', '2021-10-30 14:30:13', 54, 1),
(9, '', '', '2021-10-30 14:31:56', 54, 1),
(10, '', '', '2021-10-30 14:31:57', 54, 1),
(11, '', '', '2021-10-30 14:33:22', 54, 1),
(12, 'a', NULL, '2021-10-30 14:47:48', 54, 1),
(13, NULL, 'uploadedOn1635598087_by_54_peewee.jpg', '2021-10-30 14:48:07', 54, 1),
(14, 'img+msg', 'déconnecté', '2021-10-30 14:52:58', 54, 1),
(15, 'img+msg', 'uploadedOn1635598380_by_54_peewee.jpg', '2021-10-30 14:53:00', 54, 1),
(16, 'b', NULL, '2021-10-30 15:06:33', 54, 1),
(17, 'b', NULL, '2021-10-30 15:08:10', 54, 1),
(18, 'b', NULL, '2021-10-30 15:08:19', 54, 1),
(19, 'c', 'uploadedOn1635599308_by_54_poule.jpg', '2021-10-30 15:08:28', 54, 1),
(20, 'd', NULL, '2021-10-30 21:09:54', 54, 1),
(21, 'e', NULL, '2021-10-30 22:55:39', 54, 1),
(22, 'f', NULL, '2021-10-30 22:56:41', 54, 1),
(23, 'g', NULL, '2021-10-30 22:57:34', 54, 1),
(24, 'h', NULL, '2021-10-30 22:57:40', 54, 1),
(25, NULL, 'uploadedOn1635627536_by_54_titou.jpg', '2021-10-30 22:58:57', 54, 1),
(26, 'q', NULL, '2021-10-30 23:32:10', 54, 1),
(27, NULL, 'uploadedOn1635629981_by_54_profil.jpg', '2021-10-30 23:39:41', 54, 1),
(28, NULL, 'uploadedOn1635629987_by_54_uploadedOn16345557', '2021-10-30 23:39:47', 54, 1),
(29, NULL, 'uploadedOn1635630090_by_54_uploadedOn16345557', '2021-10-30 23:41:30', 54, 1),
(30, NULL, 'uploadedOn1635630100_by_54_titou.jpg', '2021-10-30 23:41:40', 54, 1),
(31, NULL, 'uploadedOn1635630109_by_54_profil.jpg', '2021-10-30 23:41:49', 54, 1),
(32, 'h', NULL, '2021-10-30 23:42:04', 54, 1),
(33, 'i', 'uploadedOn1635630159_by_54_peewee.jpg', '2021-10-30 23:42:39', 54, 1),
(34, NULL, 'uploadedOn1635630238_by_54_uploadedOn16346707', '2021-10-30 23:43:59', 54, 1),
(35, NULL, '&lt;br /&gt;\n&lt;b&gt;Warning&lt;/b&gt;:  mov', '2021-10-30 23:48:53', 54, 1),
(36, NULL, '541635630577.jpg', '2021-10-30 23:49:37', 54, 1),
(37, NULL, '541635630816jpg', '2021-10-30 23:53:36', 54, 1),
(38, NULL, '541635630870.jpg', '2021-10-30 23:54:30', 54, 1),
(39, NULL, '541635631091.jpg', '2021-10-30 23:58:11', 54, 1),
(40, 'coucou', NULL, '2021-10-31 22:20:41', 54, 2),
(41, 'test', NULL, '2021-10-31 22:20:53', 54, 2),
(43, 'premier message !', NULL, '2021-10-31 22:32:52', 54, 3),
(44, 'test', '541635721824.jpg', '2021-11-01 00:10:24', 54, 20),
(45, 'a', NULL, '2021-11-04 20:37:24', 54, 1),
(46, 'eheh', '611636061047.jpg', '2021-11-04 22:24:07', 61, 36),
(47, 'bonjour', '541636455676.jpg', '2021-11-09 12:01:16', 54, 33),
(48, 'coucou', NULL, '2021-11-09 12:01:22', 54, 33),
(49, 'salut matthis', NULL, '2021-11-09 12:01:42', 61, 33);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
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
(4, 'poule.jpg', 'Je pars chercher à manger', '2021-10-12 22:11:07', NULL, 2, 54),
(30, 'poule.jpg', 'testdesc', '2021-10-18 23:34:34', NULL, 4, 54),
(31, 'test.jpg', 'test1', '2021-10-18 23:35:00', NULL, 4, 54),
(32, 'test.jpg', 'Caro la poule', '2021-10-18 23:35:56', NULL, 4, 54),
(37, 'test.jpg', 'TESTESTEST', '2021-10-19 14:05:38', NULL, 2, 54),
(38, 'test.jpg', 'Je me balade', '2021-10-19 14:07:29', NULL, 2, 54),
(39, 'coucou.jpg', 'azert', '2021-10-19 14:12:48', NULL, 4, 54),
(40, '', '555555555', '2021-10-19 14:13:17', NULL, 14, 54),
(41, '', 'qsdsqd', '2021-10-19 14:13:51', NULL, 3, 54),
(42, '', 'a', '2021-10-19 14:19:12', NULL, 4, 54),
(43, '', 'q', '2021-10-19 14:19:51', NULL, 3, 54),
(44, '', 'asd', '2021-10-19 14:34:45', NULL, 14, 54),
(45, '', 'aa', '2021-10-19 14:35:52', NULL, 3, 54),
(46, '', 'a', '2021-10-19 14:36:53', NULL, 3, 54),
(47, '', 'sqdsq', '2021-10-19 14:46:27', NULL, 3, 54),
(48, '12345.jpg', 'ssdsqd', '2021-10-19 14:49:30', NULL, 2, 54),
(49, '12345.jpg', 'test 2', '2021-10-19 18:39:24', NULL, 14, 54),
(50, '12345.jpg', 'test 2', '2021-10-19 18:39:26', NULL, 14, 54),
(51, '12345.jpg', 'test 2', '2021-10-19 18:39:27', NULL, 14, 54),
(52, '', 'test 3', '2021-10-19 18:42:25', NULL, 14, 54),
(53, '', 'a', '2021-10-19 18:43:16', NULL, 14, 54),
(54, 'uploadedOn1634661875_by_54_poule.jpg', 'test 4', '2021-10-19 18:44:35', NULL, 14, 54),
(55, '', 'test 4', '2021-10-19 18:45:43', NULL, 14, 54),
(56, '', 'test 4', '2021-10-19 18:45:59', NULL, 14, 54),
(57, 'uploadedOn1634662149_by_54_peewee.jpg', 'Bonjour je suis bambou le chat de matthis', '2021-10-19 18:49:09', NULL, 3, 54),
(58, 'uploadedOn1634663238_by_62_titou.jpg', 'Je grimpe en flèche', '2021-10-19 19:07:18', NULL, 16, 62),
(59, 'uploadedOn1635174345_by_54_profil.jpg', 'coucouu', '2021-10-25 17:05:45', NULL, 3, 54),
(60, 'uploadedOn1635174348_by_54_profil.jpg', 'coucouu', '2021-10-25 17:05:48', NULL, 3, 54);

-- --------------------------------------------------------

--
-- Structure de la table `post_likes`
--

CREATE TABLE `post_likes` (
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'Anatole', 'uploadedOn1634808175_by_54_profil.jpg', 'Dog', '0005-05-05', 54, 3),
(4, 'Caro', 'poule.jpg', 'Coucou moi c\'est caro la poule', '2018-07-19', 54, 1),
(14, 'bb', NULL, 'bb', '0005-05-05', 54, 1),
(15, 'dédé', 'uploadedOn1634684035_by_54_peewee.jpg', 'coucou moi c\'est dédé le chat', '0006-05-31', 54, 2),
(16, 'Shiba', NULL, 'stonkssss!!!!', '0033-03-13', 62, 1),
(17, 'animaltest', 'déconnecté', 'animaltest', '0678-05-04', 64, 1),
(18, 'animaltest', 'uploadedOn1634667613_by_64_peewee.jpg', 'animaltest', '0067-05-04', 64, 1),
(19, '', '', '', '0000-00-00', 64, 3),
(21, 'médor', 'uploadedOn1634670653_by_64_profil.jpg', 'mon toutou', '2021-09-30', 64, 3),
(22, 'a', 'uploadedOn1634670760_by_64_uploadedOn16345557', 'a', '2021-10-10', 64, 4);

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
  `lien_maps` text NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `url_logo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'poule', NULL),
(2, 'chat', NULL),
(3, 'chien', NULL),
(4, 'autre', NULL),
(5, 'Rongeurs', NULL),
(6, 'Reptiles', NULL),
(7, 'Poissons', NULL),
(8, 'Crustacés', NULL),
(9, 'Insectes', NULL),
(10, 'Amphibiens', NULL);

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
  `token` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `statut`) VALUES
(2, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:15:24', NULL, NULL, NULL),
(3, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:15:26', NULL, NULL, NULL),
(4, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:16:39', NULL, NULL, NULL),
(5, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:16:53', NULL, NULL, NULL),
(6, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:01', NULL, NULL, NULL),
(7, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:01', NULL, NULL, NULL),
(8, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:21', NULL, NULL, NULL),
(9, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:17:31', NULL, NULL, NULL),
(10, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:26:05', NULL, NULL, NULL),
(11, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:26:46', NULL, NULL, NULL),
(12, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:27:12', NULL, NULL, NULL),
(13, NULL, '$argon2i$v=19$m=2048,t=4,p=3$dUtXa29hVEt2eDhJbjJ0eQ$/+I4XqKPjjHkQf+h9SRMDGDQ9CEx2MUn2fNcoOW6NzU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:27:50', '2021-10-11 21:27:45', NULL, NULL),
(14, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:29', NULL, NULL, NULL),
(15, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:35', NULL, NULL, NULL),
(16, 'Marin', '', 'Marin', 'BOUANCHAUD', 'marin@zoey-app.fr', NULL, '2021-10-11', NULL, NULL, '2021-10-11 21:29:36', NULL, NULL, NULL),
(17, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:34', NULL, NULL, NULL),
(18, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:31:52', NULL, NULL, NULL),
(19, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:06', NULL, NULL, NULL),
(20, NULL, '=19=2048,t=4,p=3+BRptAhGziq2I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:32:36', NULL, NULL, NULL),
(21, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:33:57', NULL, NULL, NULL),
(22, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:34:24', NULL, NULL, NULL),
(23, NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:37:05', NULL, NULL, NULL),
(24, NULL, '=19=2048,t=4,p=3$39MWwuk1lt2sITkfayWCnivyQXgGcX89ojPzoucmkAU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:47:59', NULL, NULL, NULL),
(25, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:10', NULL, NULL, NULL),
(26, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:36', NULL, NULL, NULL),
(27, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:49:43', NULL, NULL, NULL),
(28, NULL, ':mot_de_passe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:02', NULL, NULL, NULL),
(29, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:50:33', NULL, NULL, NULL),
(30, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:15', NULL, NULL, NULL),
(31, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:51:26', NULL, NULL, NULL),
(32, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:52:55', NULL, NULL, NULL),
(33, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:09', NULL, NULL, NULL),
(34, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:53:18', NULL, NULL, NULL),
(35, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:54:52', NULL, NULL, NULL),
(36, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:46', NULL, NULL, NULL),
(37, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:55:57', NULL, NULL, NULL),
(38, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:56:09', NULL, NULL, NULL),
(39, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:14', NULL, NULL, NULL),
(40, NULL, 'pass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:25', NULL, NULL, NULL),
(41, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:57:48', NULL, NULL, NULL),
(42, NULL, 'passwordddhere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:58:45', NULL, '424242', NULL),
(43, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:42', NULL, NULL, NULL),
(44, NULL, 'aaaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 21:59:56', NULL, NULL, NULL),
(45, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:16', NULL, NULL, NULL),
(46, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:31', NULL, NULL, NULL),
(47, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:00:53', NULL, NULL, NULL),
(48, NULL, '42ksdfhzçepoikriughzeojufoihfiudhfn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:25', NULL, NULL, NULL),
(49, NULL, '$argon2i$v=19$m=2048,t=4,p=3$WlExaVRCU3BHTUFKTDFWSQ$lyDHyXkg+aKauZHinbxkLHSgWaDBXHlt3dHjzHnRh+U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-11 22:01:40', NULL, NULL, NULL),
(50, 'Marin', '$argon2i$v=19$m=2048,t=4,p=3$Q05uSXFmV05TMjNPWmhRSw$qlG7lkcoKmy5KyGNorKpwZroT/kJzaE+Qjg6ExNhIRc', 'az', 'az', 'az', NULL, '2021-10-11', NULL, NULL, '2021-10-11 22:02:43', NULL, NULL, NULL),
(51, 'Marin', '$argon2i$v=19$m=2048,t=4,p=3$aU9JN1lueXN0MmJ0NC5lcQ$hWN2HUNE5EGfDiAvjUWXxc8JDe8b/r1KBNTirnS5/Kg', 'az', 'az', 'az', NULL, '2021-10-11', NULL, NULL, '2021-10-11 22:03:10', NULL, NULL, NULL),
(52, 'pseudo', '$argon2i$v=19$m=2048,t=4,p=3$aXNMYVZUalBKVXBrZWpodA$iJVVOSyeYIXQMl9tjmcEkVTCRqf+nTlQMgeiaJEmd58', 'pseudo', 'pseudo', 'pseudo', NULL, '2021-10-11', NULL, NULL, '2021-10-11 23:03:55', NULL, '12a343c3aedd2568abebad71d65391ab18f1c5ea14e78974bc66b9fc01145b0dd8ab18-52-1634068665', NULL),
(54, 'matthis', '$argon2i$v=19$m=2048,t=4,p=3$N3FYT1lqcFRudU4wanoxMw$n/t1XIvr5VvbjXCqlTNq/7awPHS1YT/mITckS4BIXo8', 'matthis', 'matthis', 'matthis', 'profil.jpg', '0005-04-05', NULL, 'Jeune propriétaire de poules du 77', '2021-10-12 10:20:36', NULL, '335f2520da38fc1bb22ab612e618424abe60bb3667a1848e550de77969174eefc30bb7-54-1636455708', 1),
(55, 'maaa', '$argon2i$v=19$m=2048,t=4,p=3$b0VnREI0TUxkSG50TDVjZA$90IKf0fK9U0FRJciVPv+nobhL6cjOe+FJ6M4jfPXJCg', 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:43:40', NULL, NULL, NULL),
(56, 'msqdlksqkhdsqd', '$argon2i$v=19$m=2048,t=4,p=3$VFRhMTlmTlBsUlJsRXkzMA$iBQSxxmYWcBQuOyB4oUYgwjmYqxDgnAqUhjYZPbKGjs', 'a', 'a', 'a', NULL, '2021-10-12', NULL, NULL, '2021-10-12 12:44:10', NULL, NULL, NULL),
(58, 'testt', '$argon2i$v=19$m=2048,t=4,p=3$RU5jV1hYN3laQWFqdWNPQg$X9MRs3KIP/NUCnj5TcOQ1xbqT+ui5SkmoPbJSS7x1D0', 'test', 'test', 'test', NULL, '2021-10-04', NULL, NULL, '2021-10-12 15:06:47', NULL, '5ec4d4b64a26edbc179bf0e544fa66b1188e1972a71aeae694dc12a0d3ef9dc1c73b14-58-1634044036', NULL),
(59, 'test', '$argon2i$v=19$m=2048,t=4,p=3$OVIxSmFPZXBjaVNKQWVjSA$adFKdFpM4UoPPrm1FL4PEJ1jG5EcCgc8isxc3tVga+A', 'testttt', 'testttt', 'test@psqodskdml', NULL, '0001-01-01', NULL, NULL, '2021-10-12 15:19:52', NULL, '92fa14bc9ef41cd1a496a114714163f0247d1f070778aca9b6180b1a1da260353201af-59-1634044798', NULL),
(60, 'testhash', '$2y$10$qxTOsJZWW507dhLOZT/SEOLT8.IJXZ/vvwxDgBkwqiRrwXUoih3zm', 'testhash', 'testhash', 'testhash', NULL, '2021-10-21', NULL, NULL, '2021-10-13 01:58:22', NULL, '330ea81dce81d8275da9dd3ce0e97d900ae7e774f02d42624ee0141f7d79a013bae4a9-60-1634083112', NULL),
(61, 'lucien', '$2y$10$dmkRoSdUp2xZ/QLS1MAEmeUKoJKmrrQzFRu8cGwkUwwpUStX0PLJO', 'lucien', 'lucien', 'lucien', NULL, '2222-12-21', NULL, NULL, '2021-10-18 09:21:30', NULL, 'f1def9ce20bd17f72ec9823b398b42a318687b7c4f871ff5d42e57f2a7306d7282c460-61-1636455693', NULL),
(62, 'Elon', '$2y$10$PgpcUxsz5xhy/pQlWd0AYu1Rhh8vcQKWJDJfVCYfy9Qoz/6zX36Ui', 'elon', 'elon', 'elon', NULL, '0001-11-11', NULL, NULL, '2021-10-19 19:06:13', NULL, '8577a2bc96ce89ab224c503927b6019f9ceb755341e0a0240c1ee541c6c721691ed60b-62-1634663770', NULL),
(63, 'testtest', '$2y$10$hzIy1WSrfXHfLORkZKu7Ke91dsCipr45bRVEkPzQGWS394eMshBIe', 'testtest', 'testtest', 'testtest', 'déconnecté', '0000-00-00', NULL, NULL, '2021-10-19 20:07:10', NULL, 'b498b38682a6d01eb5ae0fd03fa9c663d920954a76e3eb565b6a46cfad71e8345bbf56-63-1636061066', NULL),
(64, 'a', '$argon2i$v=19$m=2048,t=4,p=3$T0UzbXVJOWozY3hSSmg4Lw$YOmfB0jUVNJqUjoL8YclXQHxtjG4Wzir1PqqCZ1Rgj8', 'testtesttest', 'testtesttest', 'testtesttest', 'uploadedOn1634667264_by_64_peewee.jpg', '0008-08-08', NULL, NULL, '2021-10-19 20:07:48', NULL, '903c970b017c3109170fe39e89bb64fa5f0fcad5e00a157313d3a63a12554e3be6ff4b-64-1634670563', NULL),
(65, 'admin', '$2y$10$zZTUX6mXg0b0rDwcYGHWjeHIrPzU/LZ64.uUiQajUsrrYaDS1rwZa', 'admin', 'admin', 'admin', 'déconnecté', '0001-01-01', NULL, NULL, '2021-12-22 19:05:11', NULL, '68dc3ad39752338eac1c105071d0cdbcf385f0285b358e9925a8c3794e18442276d0fa-65-1640821926', 1),
(66, 'Zoey', '$2y$10$jhRHP68VNZ/1snIW9TL07uk78ZhiUxu5J2HUbRAtrLOt2F6BaJH9q', 'zoey', 'zoey', 'zoey', '', '0001-01-01', NULL, NULL, '2022-01-19 01:22:55', NULL, NULL, NULL),
(67, 'zozo', '$2y$10$3sfZi36PiXoxIFEQAir8GeXixLSkCYVgrGx0/ZTQEidtpQ7IYzD3q', 'zozo', 'zozo', 'zozo', '', '0007-06-05', NULL, NULL, '2022-01-19 01:28:38', NULL, 'f66ffc919df28b85487b6923765cd4f22cb7032d0cba81b3369de70f56170a5f670124-67-1642554479', 1),
(68, 'aa', '$2y$10$57y61d0jtqkiGmBDFZ/rSunC2HrCcetvPt4Eba45.6OBroIutxqUu', 'aa', 'aa', '', '', '4567-03-01', NULL, NULL, '2022-01-20 17:51:48', NULL, '2befff07f6be99744c263afd90b9954c79823a607dd9c4065e4da726a66c3278202aab-68-1644081453', NULL);

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
-- Structure de la table `utilisateur_has_badges`
--

CREATE TABLE `utilisateur_has_badges` (
  `id_user` int(11) DEFAULT NULL,
  `id_badge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur_has_badges`
--

INSERT INTO `utilisateur_has_badges` (`id_user`, `id_badge`) VALUES
(68, 2),
(68, 3),
(68, 4),
(68, 9),
(68, 8);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_has_favorite_animals`
--

CREATE TABLE `utilisateur_has_favorite_animals` (
  `id_user` int(11) DEFAULT NULL,
  `id_favoriteAnimal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur_has_favorite_animals`
--

INSERT INTO `utilisateur_has_favorite_animals` (`id_user`, `id_favoriteAnimal`) VALUES
(68, 1),
(68, 3),
(68, 4),
(68, 2),
(68, 9),
(68, 5);

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
  MODIFY `idanimal_a_adopter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idconversation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  MODIFY `idliste_amis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idmessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `idtypes_animaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  ADD CONSTRAINT `animal_a_adopter_ibfk_1` FOREIGN KEY (`idtype`) REFERENCES `types_animaux` (`idtypes_animaux`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `animal_a_adopter_has_badge`
--
ALTER TABLE `animal_a_adopter_has_badge`
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_animal_a_adopter1` FOREIGN KEY (`animal_a_adopter_idanimal_a_adopter`) REFERENCES `animal_a_adopter` (`idanimal_a_adopter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_animal_a_adopter_has_badge_badge1` FOREIGN KEY (`badge_idbadge`) REFERENCES `badge` (`idbadge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`fk_idcategorie`) REFERENCES `categorie_blog` (`id`);

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
-- Contraintes pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`idpost`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Contraintes pour la table `utilisateur_has_badges`
--
ALTER TABLE `utilisateur_has_badges`
  ADD CONSTRAINT `utilisateur_has_badges_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilisateur_has_badges_ibfk_2` FOREIGN KEY (`id_badge`) REFERENCES `badge` (`idbadge`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur_has_favorite_animals`
--
ALTER TABLE `utilisateur_has_favorite_animals`
  ADD CONSTRAINT `utilisateur_has_favorite_animals_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `utilisateur_has_favorite_animals_ibfk_2` FOREIGN KEY (`id_favoriteAnimal`) REFERENCES `types_animaux` (`idtypes_animaux`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

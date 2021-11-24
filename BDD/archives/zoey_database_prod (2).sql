-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 16 nov. 2021 à 22:19
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoey_database_prod`
--

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
(1, 'Pas de salon du cheval !', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire. \r\n\r\n', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire.\r\n', 'article_1.png', '', 'Dans un communiqué rendu public, l’équipe du salon du cheval de Paris explique et justifie sa décision : \r\n\r\n“Si le vaccin permet aujourd\'hui une amélioration, bien des doutes subsistent quant aux conditions sanitaires permettant l\'organisation d\'un tel événement. C’est pourquoi, la mort dans l’âme, nous décidons, à l’instar d’autres événements, de renoncer à l’édition 2021. [...] Nous pensons inutile de faire prendre des risques aux exposants, aux éleveurs, aux visiteurs et à tous les passionnés. Parce qu’il faut rebondir et penser à l’avenir, nous réfléchissons à un autre événement dans les mois à venir permettant de réunir la grande famille du cheval. Sport, ruralité, bien-être animal seront au rendez-vous.”\r\n\r\nRendez-vous en 2022 au Parc des Expositions de Paris Nord Villepinte pour vibrer au rythme des compétitions, des spectacles et des animations 100% cheval.', '2021-11-15 09:32:16', NULL),
(2, 'UN SAMU POUR CHIENS & CHATS', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie...', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence, le centre d’appel est ouvert 7 jours sur 7 et 24 heures sur 24.', 'article_2.png', '', 'En cas d’urgence vitale un professionnel se déplace sur les lieux pour effectuer les premier soins avec une ambulance équipée de matériels (médicaments, pharmacie d’urgence, masque à oxygène...) et adaptée au transport de l’animal. En moyenne, l’ambulance intervient une fois par jour depuis sa mise en service dans un rayon de 30km. \r\n\r\nA ce jour, l’intervention n’est pas remboursée intégralement car les animaux de compagnie ne possèdent pas de carte mutuelle ou de sécurité sociale. Le prix total d’une intervention est de 400 euros mais heureusement le propriétaire débourse 10 à 20% de cette somme et le reste est pris en charge par la fondation et la clinique vétérinaire de Münchenstein.\r\n', '2021-11-15 09:37:36', NULL),
(3, 'Ce Panda roux est super mignon !', 'In urna ipsum, euism od in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor In urna ipsum, ', 'In urna ipsum, euism od in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros.', 'article_3.png', '', 'In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros.', '2021-11-15 09:37:36', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_blog`
--

CREATE TABLE `categorie_blog` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Déchargement des données de la table `newsletter`
--

INSERT INTO `newsletter` (`id`, `mail`, `prenom`, `date`) VALUES
(19, 'a@a.fr', 'a', '2021-11-16 22:03:13'),
(20, 'b@b.fr', 'b', '2021-11-16 22:04:06'),
(21, 'a@dsdfsd.fr', 'aaaa', '2021-11-16 22:18:24');

--
-- Index pour les tables déchargées
--

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
-- Index pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`fk_idcategorie`) REFERENCES `categorie_blog` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

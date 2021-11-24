-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  sqletud.u-pem.fr
-- Généré le :  Mer 24 Novembre 2021 à 13:26
-- Version du serveur :  5.7.30-log
-- Version de PHP :  7.0.33-0+deb9u7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `boisseausable_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `resume` varchar(255) NOT NULL,
  `texte1` text,
  `url_image` varchar(45) NOT NULL,
  `description_photo` varchar(255) NOT NULL,
  `texte2` text NOT NULL,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `auteur` varchar(100) NOT NULL,
  `fk_idcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `description_photo`, `texte2`, `date_publication`, `auteur`, `fk_idcategorie`) VALUES
(1, 'Pas de salon du cheval !', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire. \r\n\r\n', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire.\r\n', 'article_1.jpg', 'Photo de Jean van der Meulen provenant de Pexels', 'Dans un communiqué rendu public, l’équipe du salon du cheval de Paris explique et justifie sa décision : \r\n\r\n“Si le vaccin permet aujourd\'hui une amélioration, bien des doutes subsistent quant aux conditions sanitaires permettant l\'organisation d\'un tel événement. C’est pourquoi, la mort dans l’âme, nous décidons, à l’instar d’autres événements, de renoncer à l’édition 2021. [...] Nous pensons inutile de faire prendre des risques aux exposants, aux éleveurs, aux visiteurs et à tous les passionnés. Parce qu’il faut rebondir et penser à l’avenir, nous réfléchissons à un autre événement dans les mois à venir permettant de réunir la grande famille du cheval. Sport, ruralité, bien-être animal seront au rendez-vous.”\r\n\r\nRendez-vous en 2022 au Parc des Expositions de Paris Nord Villepinte pour vibrer au rythme des compétitions, des spectacles et des animations 100% cheval.', '2021-11-15 09:32:16', '', NULL),
(2, 'Un samu pour chiens et chats', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie...', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence, le centre d’appel est ouvert 7 jours sur 7 et 24 heures sur 24.', 'article_2.jpg', 'Photo de Tima Miroshnichenko provenant de Pexels', 'En cas d’urgence vitale un professionnel se déplace sur les lieux pour effectuer les premier soins avec une ambulance équipée de matériels (médicaments, pharmacie d’urgence, masque à oxygène...) et adaptée au transport de l’animal. En moyenne, l’ambulance intervient une fois par jour depuis sa mise en service dans un rayon de 30km. \r\n\r\nA ce jour, l’intervention n’est pas remboursée intégralement car les animaux de compagnie ne possèdent pas de carte mutuelle ou de sécurité sociale. Le prix total d’une intervention est de 400 euros mais heureusement le propriétaire débourse 10 à 20% de cette somme et le reste est pris en charge par la fondation et la clinique vétérinaire de Münchenstein.\r\n', '2021-11-15 09:37:36', '', NULL),
(4, '5 choses à savoir avant d’adopter un animal', 'L’adoption d’un animal, quel qu’il soit, ne doit pas se faire sur un coup de tête. Voici les (bonnes) questions à se poser avant d’accueillir un animal chez soi.', '<li> Pourquoi j’en ai envie ? </li>\r\nLa première question à se poser avant d’adopter un animal est la <strong> motivation réelle </strong> : est-ce de l’ennui passager, une envie soudaine parce qu’un reportage est passé à la télévision, ou encore pour se remettre d’un chagrin d’amour ou pour combler la solitude ? <br>\r\nSi la réponse à la question correspond au souhait d’une véritable relation avec un animal, s’il y a un désir de partage et une notion de respect, si la relation n’est pas envisagée uniquement à sens unique (l’animal donne de l’affection), le pas peut alors être franchi. \r\n<br> <br>\r\n\r\n<li>Ai-je suffisamment de temps ?</li>\r\nLorsqu’on souhaite adopter un animal, on voit souvent beaucoup plus les satisfactions qu’il peut apporter que les contraintes qu\'il peut imposer et qui sont pourtant bien réelles. <br>Si vos journées sont déjà bien remplies, que vous ne voyez pas passer vos soirées et que vos nuits sont trop courtes, le rythme est sans doute trop effréné pour accueillir un animal chez vous.\r\n <br>\r\n <br>\r\n <li>Ai-je suffisamment d’argent ?</li>\r\nL’envie est là, le temps aussi mais ce n’est pas tout : adopter un animal représente un certain coût. Des dépenses ponctuelles sont à prévoir lors de l’acquisition de l’animal : lieu d’habitation ou couchage, gamelles, jouet, cage de transport, frais liés à la santé (vaccins, vermifuge, etc) et éventuellement à l’éducation  (école du chiot).<br>\r\nDes dépenses mensuelles, surtout concernant l’alimentation, seront également à inclure dans le budget tout au long de la vie de l’animal. En cas d’accident, il faut savoir par ailleurs que les frais vétérinaires coûtent cher… \r\n\r\n', 'article_3.jpg', 'Photo de cottonbro provenant de Pexels', 'Tous les animaux de compagnie ne demandent pas autant d’attention et de temps qu’un chien mais chacun a des besoins bien précis et demande un minimum de temps à leur consacrer. \nMon entourage est-il d’accord ?<br>\nVouloir un animal et avoir pensé à tout pour l’accueillir convenablement est une bonne chose. Seulement, si vous n’êtes pas la seule personne du foyer et que les autres membres ne sont pas d’accord pour avoir un animal à la maison, cela peut être un point de discorde récurrent… et un motif d’abandon qui revient malheureusement trop régulièrement.<br>\nToute la famille (ou les colocataires) doivent être d’accord pour accueillir un nouveau venu, même si vous êtes la(le) seul(e) à vous en occuper. \n Suis-je prêt(e) à réorganiser mon quotidien ?<br>\nAccueillir un animal sans rien changer dans son organisation et son mode de vie est utopique, à moins d’adopter un poisson rouge, et encore : si on voyage beaucoup et qu’on aime les week-ends prolongés, le poisson rouge dépérira vite s’il n’est pas nourri tous les jours…<br>\n<br>\n<br> \nTous droits réservés  à Audrey Dulieux, journaliste spécialiste des animaux.\n', '2021-11-24 10:06:25', '', NULL);

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
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `newsletter`
--

INSERT INTO `newsletter` (`id`, `mail`, `prenom`, `date`) VALUES
(19, 'a@a.fr', 'a', '2021-11-16 22:03:13'),
(20, 'b@b.fr', 'b', '2021-11-16 22:04:06'),
(21, 'a@dsdfsd.fr', 'aaaa', '2021-11-16 22:18:24'),
(22, 'sb.lucien77144@gmail.com', 'Lucien', '2021-11-24 11:31:58');

--
-- Index pour les tables exportées
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
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`fk_idcategorie`) REFERENCES `categorie_blog` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

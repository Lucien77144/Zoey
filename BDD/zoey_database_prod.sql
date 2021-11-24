-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 nov. 2021 à 09:37
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

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
  `texte1` text DEFAULT NULL,
  `url_image` varchar(45) NOT NULL,
  `texte2` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `fk_idcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `texte2`, `date_publication`, `fk_idcategorie`) VALUES
(1, 'Pas de salon du cheval !', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire. \r\n\r\n', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois du au condition sanitaire.\r\n', 'article_1.png', 'Dans un communiqué rendu public, l’équipe du salon du cheval de Paris explique et justifie sa décision : \r\n\r\n“Si le vaccin permet aujourd\'hui une amélioration, bien des doutes subsistent quant aux conditions sanitaires permettant l\'organisation d\'un tel événement. C’est pourquoi, la mort dans l’âme, nous décidons, à l’instar d’autres événements, de renoncer à l’édition 2021. [...] Nous pensons inutile de faire prendre des risques aux exposants, aux éleveurs, aux visiteurs et à tous les passionnés. Parce qu’il faut rebondir et penser à l’avenir, nous réfléchissons à un autre événement dans les mois à venir permettant de réunir la grande famille du cheval. Sport, ruralité, bien-être animal seront au rendez-vous.”\r\n\r\nRendez-vous en 2022 au Parc des Expositions de Paris Nord Villepinte pour vibrer au rythme des compétitions, des spectacles et des animations 100% cheval.', '2021-11-15 09:32:16', NULL),
(2, 'Un samu pour chiens et chats', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie...', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence, le centre d’appel est ouvert 7 jours sur 7 et 24 heures sur 24.', 'article_3.png', 'En cas d’urgence vitale un professionnel se déplace sur les lieux pour effectuer les premier soins avec une ambulance équipée de matériels (médicaments, pharmacie d’urgence, masque à oxygène...) et adaptée au transport de l’animal. En moyenne, l’ambulance intervient une fois par jour depuis sa mise en service dans un rayon de 30km. \r\n\r\nA ce jour, l’intervention n’est pas remboursée intégralement car les animaux de compagnie ne possèdent pas de carte mutuelle ou de sécurité sociale. Le prix total d’une intervention est de 400 euros mais heureusement le propriétaire débourse 10 à 20% de cette somme et le reste est pris en charge par la fondation et la clinique vétérinaire de Münchenstein.\r\n', '2021-11-15 09:37:36', NULL),
(3, 'Ce Panda roux est super mignon !', 'In urna ipsum, euism od in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat.', 'In urna ipsum, euism od in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros.', 'article_2.png', 'In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor In urna ipsum, euismod in eros a, laoreet feugiat tortor. Aenean tempor cursus velit nec accumsan. Curabitur vitae dui volutpat lacus elementum sagittis. Duis a diam. In urna ipsum, euismod in eros.', '2021-11-15 09:37:36', NULL);

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
  `statut` tinyint(1) DEFAULT 1,
  `id_bloqueur` int(11) NOT NULL DEFAULT 0
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
  MODIFY `idanimal_a_adopter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idtypes_animaux` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT;

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

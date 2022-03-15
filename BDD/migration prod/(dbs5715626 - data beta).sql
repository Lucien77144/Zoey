-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Hôte : db5006923170.hosting-data.io
-- Généré le : mar. 15 mars 2022 à 07:33
-- Version du serveur : 5.7.36-log
-- Version de PHP : 7.0.33-0+deb9u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbs5715626`
--

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`idconversation`, `titre`, `date_creation`, `url_photo`) VALUES
(1, NULL, '2022-03-14 09:42:22', NULL),
(2, NULL, '2022-03-14 11:07:11', NULL),
(3, NULL, '2022-03-14 13:25:40', NULL);

--
-- Déchargement des données de la table `conversation_has_utilisateur`
--

INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`, `readstate`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(2, 5, 1),
(3, 1, 1),
(3, 3, 1);

--
-- Déchargement des données de la table `liste_amis`
--

INSERT INTO `liste_amis` (`idliste_amis`, `id_demandeur`, `id_receveur`, `date_demande`, `statut`, `id_bloqueur`) VALUES
(1, 2, 1, '2022-03-14 08:25:34', 2, 0),
(2, 2, 4, '2022-03-14 10:28:48', 1, 0),
(3, 2, 3, '2022-03-14 10:28:59', 1, 0),
(4, 5, 3, '2022-03-14 10:59:55', 1, 0),
(5, 5, 1, '2022-03-14 11:00:10', 2, 0),
(6, 1, 3, '2022-03-14 11:01:38', 2, 0);

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idmessage`, `texte_message`, `url_media`, `date_envoi_msg`, `utilisateur_idutilisateur`, `conversation_idconversation`, `tag`) VALUES
(1, 0x786a42506e773d3d, NULL, '2022-03-14 09:42:33', 1, 1, 0x5ad52159013bb1c11c345b253edeb29d),
(2, 0x304470536d4b6937556c7a427855704d346d66365963303d, NULL, '2022-03-14 10:14:53', 2, 1, 0xc4af2c24c727eb8d0c35e99d7bf95d24),
(3, 0x797a7054684f652f51524c4d, NULL, '2022-03-14 10:19:33', 1, 1, 0x2579ad4742245e3fc958332b25d14b7d),
(4, 0x3054705268714b3856467a55684239507258322f597462466d49704b, NULL, '2022-03-14 10:20:27', 2, 1, 0x335e65a9ef9194e89cf94e96e6a907c4),
(5, 0x315364546d4f657854784c4d68453147, NULL, '2022-03-14 10:22:28', 2, 1, 0x0cfefd76616d0408411548eb32f95d33),
(6, 0x334442626d61673d, NULL, '2022-03-14 10:22:39', 2, 1, 0xb9645139d89222262a45429f9ca2886b),
(7, 0x3344705368513d3d, NULL, '2022-03-14 10:23:49', 1, 1, 0x67d313d8afbb87cb16eb5ff2e9141cf2),
(8, 0x326a424a6d614b6e55786e5067464657346e4c7164356e53327338526436566e65347449564e4e30, NULL, '2022-03-14 10:23:54', 1, 1, 0x4b233ccb4c31c62cbfe29d2c89fab04b),
(9, 0x786a42506e773d3d, NULL, '2022-03-14 10:29:35', 1, 1, 0x5ad52159013bb1c11c345b253edeb29d),
(10, 0x7854704c, NULL, '2022-03-14 22:27:57', 1, 1, 0xe1d4747fe803c90af605005af2a4efed);

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idpost`, `media`, `description`, `date_publication`, `id_likes_utilisateurs`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`) VALUES
(3, '11647218183.jpg', 'First', '2022-03-14 01:36:29', NULL, 1, 1),
(4, '11647241941.jpg', '', '2022-03-14 08:12:43', NULL, 1, 1),
(5, '21647242991.jpg', '', '2022-03-14 08:29:53', NULL, 3, 2),
(6, '21647243006.jpg', '', '2022-03-14 08:30:09', NULL, 3, 2),
(7, '21647243070.jpg', '', '2022-03-14 08:31:13', NULL, 3, 2),
(8, '21647243087.jpg', '', '2022-03-14 08:31:30', NULL, 3, 2),
(9, '21647243223.jpg', '', '2022-03-14 08:33:46', NULL, 3, 2),
(10, '21647243254.jpg', '', '2022-03-14 08:34:16', NULL, 3, 2),
(13, '31647249735.jpeg', 'Sortie du matin', '2022-03-14 10:22:20', NULL, 4, 3),
(14, '41647249819.jpg', 'Patron au boulot', '2022-03-14 10:23:40', NULL, 5, 4),
(16, '21647249956.jpg', '', '2022-03-14 10:26:02', NULL, 3, 2),
(18, '51647251875.jpg', '', '2022-03-14 10:58:13', NULL, 8, 5),
(19, '11647251872.jpg', '', '2022-03-14 10:58:13', NULL, 2, 1),
(20, '31647260679.jpeg', 'Priu', '2022-03-14 13:24:40', NULL, 6, 3),
(21, '41647273696.jpg', 'zehtozethz\'o', '2022-03-14 17:01:59', NULL, 5, 4),
(22, '51647291776.jpeg', 'Onice adore la rivière 🌊', '2022-03-14 22:02:59', NULL, 10, 5),
(23, '51647292016.jpeg', 'Ma première photo avec Onice.', '2022-03-14 22:06:58', NULL, 10, 5),
(26, '11647293930.jpeg', '', '2022-03-14 22:38:51', NULL, 1, 1);

--
-- Déchargement des données de la table `profil_animal_de_compagnie`
--

INSERT INTO `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `nom`, `url_photo`, `description`, `date_naissance`, `utilisateur_idutilisateur1`, `types_animaux_idtypes_animaux`) VALUES
(1, 'Mathis avec un seul T', '11647293913.jpeg', 'Je suis un clébard', NULL, 1, 3),
(2, 'Test', '11647242132.jpg', '', NULL, 1, 1),
(3, 'chat de matthis', '21647242955.jpg', 'Je me définit en tant que chat, et vous devez le respecter...', NULL, 2, 2),
(4, 'Roxane', '31647249693.jpeg', 'Roxane', NULL, 3, 3),
(5, 'Matthis', '41647249749.jpg', 'Le patron au travail', NULL, 4, 3),
(6, 'Zoe', '31647249804.jpeg', 'Djaldizbzbcozn elacjabd', NULL, 3, 6),
(7, 'Bambou', '21647249944.jpg', 'Rkenfndn', NULL, 2, 1),
(8, 'Lovely', '', 'Je suis un gros chien', NULL, 5, 3),
(9, 'test', '41647264214.jpg', 'seges', NULL, 4, 5),
(10, 'Onice', 'false', '', NULL, 5, 3),
(11, 'A', '11647293192.jpeg', 'A', NULL, 1, 6);

--
-- Déchargement des données de la table `refuge`
--

INSERT INTO `refuge` (`idrefuge`, `nom`, `description`, `lien`, `adresse_mail`, `telephone`, `lien_maps`, `adresse`, `url_logo`) VALUES
(11, 'Pattes-En-Rond', NULL, 'https://pattesenrond.fr/', '', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10570.063486753616!2d2.6515515!3d48.5233447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x96f150f440dd7223!2sPattes-En-Rond!5e0!3m2!1sfr!2sfr!4v1642451409618!5m2!1sfr!2sfr', '164 Rue Rousseau Vaudran, 77190 Dammarie-les-Lys', 'pattesenrond.jpg'),
(12, 'SOS P\'tites Bêtes', NULL, 'https://sosptitesbetes.wixsite.com/sosptitesb', '​contactsosptitesbetes@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2647.222111388748!2d2.1701492148712256!3d48.433076738513634!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5c96c08eccd57%3A0xc43ac93d681cd826!2s7%20Imp.%20du%20Moulin%20Fouleret%2C%2091150%20%C3%89tampes!5e0!3m2!1sfr!2sfr!4v1642455442418!5m2!1sfr!2sfr', '7 imp du Moulin Fouleret  91150 Etampes', 'déconnecté'),
(13, 'Adopte Un Matou', NULL, 'https://adopteunmatou.com/', 'laurence.br3@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10470.686291203052!2d2.0593742!3d48.9978072!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3f256eeb61743650!2sAdopte%20Un%20Matou!5e0!3m2!1sfr!2sfr!4v1644957546309!5m2!1sfr!2sfr', '14 Ter Sente des Basses Vignes, 78780 Maurecourt', '31644957634.png'),
(14, 'Les Patounes de Bezons', NULL, 'https://les-patounes-de-bezons.fr/', 'contact@les-patounes-de-bezons.fr', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10484.74051705359!2d2.2096524!3d48.9309156!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x153d8c8ccf6bcfaa!2sAssociation%20Les%20Patounes%20de%20Bezons!5e0!3m2!1sfr!2sfr!4v1645288679063!5m2!1sfr!2sfr', '80 Rue des Frères Bonneff, 95870 Bezons', '31645288861.jpg'),
(15, 'L\'Arche de Bagheera', NULL, 'http://refuge-larche-de-bagheera.weebly.com/', 'adb.refuge@yahoo.Fr', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2651.9326140773064!2d2.101994314830455!3d48.34260054483929!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5b5aa60d4ab53%3A0xa55dc150b586124b!2s70%20Chem.%20de%20Bossenval%2C%2091660%20M%C3%A9r%C3%A9ville!5e0!3m2!1sfr!2sfr!4v1646174047468!5m2!1sfr!2sfr', '70 Chem. de Bossenval 91660 Le Mérévillois', '31646170159.png'),
(16, 'Association Luna', NULL, 'https://www.facebook.com/associationlouna/', 'associationlouna@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d167994.54899336927!2d2.3953256104577556!3d48.85983450856045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e6120f9d0743c3%3A0x16582c071d6d5819!2s2%20All.%20Moli%C3%A8re%2C%2093330%20Neuilly-sur-Marne!5e0!3m2!1sfr!2sfr!4v1646418011814!5m2!1sfr!2sfr', '2 ALL Molière, 93330 Neuilly-sur-Marne', '');

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `google_sub`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `statut`) VALUES
(1, 'Marin', NULL, '105790575614120714764', NULL, NULL, 'marin.bouanchaud@gmail.com', 'gdl-1647216196.jpg', NULL, NULL, 'Bienvenue sur mon profil ! Zoey forever', '2022-03-14 01:03:17', '2022-03-14 22:44:40', 'bb23ad91878d56d2a38b8e3a785e3ec864661a8fe82ad182b7f33dddcddb575cc4fd20-1-1647294280', NULL),
(2, 'Matthis le plus beau', NULL, '105770305331469864059', NULL, NULL, 'matthis.rousselle@gmail.com', 'gdl-1647242640.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-14 08:24:00', '2022-03-14 15:21:32', 'bc5f749b6336998a2f3e29b7d3adacc053c8cddc689c6e5fd02d00c736849c4cde5992-2-1647267692', NULL),
(3, 'clementine', NULL, '113223585551837117563', NULL, NULL, 'clementine.gilama@gmail.com', 'gdl-1647249597.jpg', NULL, NULL, NULL, '2022-03-14 10:19:58', '2022-03-14 15:16:48', '9a22eee33e8d5d0f299217319eae8df3bbbdd820659f5585b9ab63b6fa662a0d52af4f-3-1647267408', NULL),
(4, 'Lucien', NULL, '110806837894745176208', NULL, NULL, 'sb.lucien77144@gmail.com', 'gdl-1647249688.jpg', NULL, NULL, NULL, '2022-03-14 10:21:28', '2022-03-14 17:00:58', '5045b628dca23dc52ae4f7ca0a5b7f18c9b29f0933a1a405d1e234f45782a3088a29ad-4-1647273658', NULL),
(5, 'Amélie', NULL, '102196286606102807594', NULL, NULL, 'amelie.rubiales@gmail.com', 'gdl-1647251811.jpg', NULL, NULL, NULL, '2022-03-14 10:56:52', '2022-03-14 22:06:56', '52b8f3a94c3d5267ed9905e7e5817fad20d5033742ec66f50d710a79375d34e0576f9b-5-1647292016', NULL);

--
-- Déchargement des données de la table `utilisateur_has_badges`
--

INSERT INTO `utilisateur_has_badges` (`id_user`, `id_badge`) VALUES
(1, 1),
(1, 6),
(1, 8),
(2, 2),
(2, 6),
(2, 8),
(2, 9),
(3, 3),
(3, 4),
(3, 6),
(3, 8);

--
-- Déchargement des données de la table `utilisateur_has_favorite_animals`
--

INSERT INTO `utilisateur_has_favorite_animals` (`id_user`, `id_favoriteAnimal`) VALUES
(1, 3),
(2, 12),
(3, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : db5006335318.hosting-data.io
-- Généré le : jeu. 20 jan. 2022 à 15:02
-- Version du serveur :  5.7.36-log
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
-- Base de données : `dbs5282415`
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
  `description` mediumtext,
  `date_anniversaire` date DEFAULT NULL,
  `refuge_idrefuge` int(11) NOT NULL,
  `idtype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `animal_a_adopter`
--

INSERT INTO `animal_a_adopter` (`idanimal_a_adopter`, `nom`, `sexe`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`, `idtype`) VALUES
(42, 'Yuki', 1, '11642452446.jpg', 'À mon arrivée au refuge, je n’étais pas proche de l’humain et j\'étais féroce. Après une sociabilisation de plusieurs mois, je me suis transformée. Aujourd\'hui j\'ai besoin d’être liée avec mon humain. Je sais me faire entendre par mes petits « miaous » quand je vous vois rentrer dans la pièce où je me trouve, je viens me frotter à vos jambes pour dire bonjour. Mon moment préféré c\'est le soir quand je réclame des caresses au lit avec beaucoup d’enthousiasme, je ronronne au moindre frôlement. Je suis une chatte très câline une fois en confiance !', '2020-06-01', 11, 2),
(45, 'Charly', 0, '11642454483.jpg', 'J’ai été retrouvé à l\'âge de 2 mois derrière un buisson, à côté d’un arrêt de bus, en bon état mais couvert de poux. Le refuge m’a accueilli et m\'a permis de rejoindre une famille d’accueil avec d’autres chats et un chien. Finies les griffures et les morsures j’ai appris à devenir un chaton adorable. Très joueur, je m’amuse d’un rien comme par exemple les ombres (qui peuvent m’occuper un certain temps !). J\'adore les câlins que je réclame avec beaucoup de ronrons. Je suis fin prêt pour débuter une nouvelle vie et je n’attends plus que vous !', '2021-04-19', 11, 2),
(51, 'Pitou', 0, '11642455208.jpg', 'Je vivais sur un parking et j’étais nourri par les habitants de mon quartier. À mon arrivée au refuge j’étais très maigre et mon poil était sale. J’ai rejoint une famille d’accueil où je me suis montré sociable avec chats, chiens et enfants. Pas spécialement gourmand, je ne suis pas un chat que l’on peut amadouer par l’estomac. Mais j\'aime les câlins et particulièrement les caresses. Je rêve de trouver un foyer qui prendra soin de moi jusqu\'à la fin de ma vie.', '2015-04-01', 11, 2),
(54, 'Popi', 0, '11642456142.jpg', 'J’ai vécu dans la rue, mon maître m’a sans doute abandonné ou perdu mais je suis en bonne santé. J\'adore les caresses et je suis très sociable même avec les inconnus vers qui je vais avec facilité. Actuellement en famille d’accueil, je recherche une famille d’adoption pour me couvrir d’amour. J\'aime les autres chats avec qui j\'adore jouer volontiers et sauter dans tous les sens pour attraper le plumeau, je serais super heureux d’avoir un congénère pour m’amuser !', '2018-01-01', 11, 2),
(59, 'Rouky', 0, '11642458436.jpg', 'Dans mon ancien foyer, un membre de la famille a déclenché une allergie. Un peu chamboulé par mon arrivée au refuge, j\'ai néanmoins apprécié la présence d’un autre chat pour me réconforter. Je suis sociable avec l’humain et j\'aime me prélasser dans des positions aussi adorables les unes que les autres. Très joueur et plein d’énergie j\'ai besoin de me dépenser. La présence d’un jardin sécurisé dans ma famille d’adoption serait un grand bonheur pour moi. Je passe aussi beaucoup de temps à observer par la fenêtre ! Avec le temps, j\'apprécie davantage les câlins, bien que ce ne soit toujours pas ce que je préfère.', '2018-07-01', 11, 2),
(63, 'Rango', 0, '31642508121.jpg', 'Je suis un dragon barbu, j’ai été retrouvé dehors puis gardé sans UV pendant plusieurs mois. J’ai donc des problèmes pour me déplacer.', '2015-01-01', 12, 6),
(64, 'Joyeux', 0, '31642522586.jpg', 'Je suis une tortue des Balkans, je mesure environ 6 cm et mon espérance de vie est de 100 ans. Je suis végétarien, je me nourris principalement de plantes sauvages.', '2020-08-01', 12, 6),
(66, 'Deux', 1, '31642537192.jpg', 'Je suis un python royal et je mesure 1m20. J\'ai un régime particulier, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2015-01-01', 12, 6),
(67, 'Guimauve', 0, '31642537528.jpeg', 'Je n’ai pas eu une vie facile, j’ai été abandonné.  À mon arrivée au refuge, j’étais craintif, j’avais peur des mains et il m’arrivait de mordre. Mon corps était couvert de griffures et de morsures, j’ai été testé positif au FIV (sida du chat) et au calicivirus. Néanmoins, je n’ai fait qu’une crise en deux ans et, après une extraction dentaire et une antibiothérapie, j\'ai repris le cours de ma vie. Je ne pourrais pas être au contact d’autres chats au risque de les contaminer, mais peu importe car ma passion suprême, c’est l’humain ! Peu à peu, j’ai compris que j’aimais les caresses de ma famille d’accueil en qui j’ai confiance.  Je n’aime pas la solitude. Je suis indépendant mais j\'aime avoir la présence réconfortante de mon humain à la maison, j\'aime le suivre partout comme un chien et s’intéresser à tout ce qu’il fait.', '2015-08-01', 11, 2),
(68, 'Sept', 1, '31642537848.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2017-01-01', 12, 6),
(69, 'Oréo', 0, '31642538106.jpeg', 'Je suis né dans la rue mais je suis un petit chaton adorable. Ma maman Rubis est aussi au refuge, elle a fait une portée de 6 chatons mais seulement 4 ont été retrouvé.', '2020-07-10', 11, 2),
(71, 'Neha', 0, '31642538415.jpg', 'J’errais dans la rue suite aux décès de mon propriétaire, le refuge m\'a recueilli et j’ai été placée en famille d’accueil qui gagne ma confiance petit à petit.', '2019-03-01', 11, 2),
(74, 'Croquette', 0, '31642539463.jpg', 'J’ai vécu dans la rue, j’ai déjà été pris en charge par une première association puis l’association Pattes-En-Rond m’a placée dans une famille d’accueil qui correspond à mes besoins. Je ne suis pas très proche des humains, une cohabitation bienveillante me suffit.', '2016-08-09', 11, 2),
(76, 'Noushka', 0, '31642539819.jpg', 'Mes anciens propriétaires m’ont mis dans une cage de transport puis ils m’ont déposé dehors sur un trottoir, avec la porte de la cage ouverte. J’étais terrorisée, je ne me suis pas enfuie, quelqu’un m’a trouvé et m’a emmené chez le vétérinaire. Un des bénévoles de Pattes-En-Rond  se trouvait à la clinique et il a décidé de me prendre sous son aile.', '2017-01-01', 11, 2),
(79, 'Krokmou', 1, '31642540329.jpg', 'J’ai été prise en charge à l\'âge de 2 mois par l’association avec ma sœur. Un mois plus tard, elle a été adoptée et j’ai été testée positive au calicivirus. Moi, je suis toujours là à attendre ma famille qui saura m’offrir une vie pleine de bonheur.', '2017-04-01', 11, 2),
(80, 'Black', 0, '31642541404.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2013-01-01', 12, 6),
(82, 'Cardi', 0, '31642590650.jpg', 'Je suis un crabe tricolore et je suis omnivore, j’adore particulièrement les insectes et les végétaux. On me surnomme le “bulldozer” car j’aime retourner la terre pour me créer des nouvelles cachettes.', '0001-01-01', 12, 7),
(84, 'Peruphasma', 1, '31642591104.jpg', 'Je suis un phasme du Pérou et je mesure de 1 à 8 cm selon l\'âge. Je suis herbivore le lilas, le troène, le chèvrefeuille ou le lierre j’adore ca.', '0001-01-01', 12, 9),
(85, 'Marsu', 1, '31642614023.jpg', 'Je suis une tortue mauresque, je mesure environ 18 cm et mon espérance de vie est de 100 ans. Je suis végétarien, je me nourris principalement de plantes sauvages.', '2010-01-01', 12, 6),
(86, 'Sushi', 1, '31642614182.jpg', 'Je suis une tortue aquatique qui mesure environ 20 cm, je suis carnivore. J’ai besoin d’un grand aquarium pour me sentir bien.', '2017-01-01', 12, 6),
(87, 'Dolly', 1, '31642614342.jpg', 'Mes anciens maîtres ont déménagé et ils ne m’avaient pas habitué à ce nouvel environnement, je me suis donc perdue, j’étais sale et maigre quand l’association m’a trouvée. Durant 4 ans, j’ai vécu la vie d’une chatte errante car mes anciens maîtres ne voulaient pas me récupérer et refusaient de me céder à l’association. Je suis revenu devant les portes de l’association et ils m’ont pris sous leurs ailes. Je recherche une famille où je pourrais pleinement m’épanouir.', '2012-05-25', 11, 2),
(88, 'Onyx', 0, '31642614590.jpg', 'J’ai été sorti de fourrière par l’association Pattenrond. J’aime autant jouer et courir partout que me reposer quand il le faut.', '2018-01-01', 11, 2),
(89, 'Skull', 2, '31642614790.jpg', 'Je suis un iguane vert et je mesure 1m50. Je suis herbivore. Je ne suis pas habitué à côtoyer les humains, il me faudra un temps d\'adaptation et d’éducation. Je vis dans un terrarium humide.', '0001-01-01', 12, 6),
(90, 'Sungaya', 2, '31642614914.jpg', 'Je suis un phasme épineux, je suis herbivore, j’aime particulièrement les ronces, le lierre et le chêne. Je vis dans un petit terrarium ou flexarium au choix.', '0001-01-01', 12, 9),
(91, 'Namour', 1, '31642615066.jpg', 'Je cherche une famille qui prendra le temps de gagner ma confiance, avec de la patience et beaucoup d’amour.', '2017-04-01', 11, 2),
(92, 'Rapido', 0, '31642615208.jpg', 'Je suis une tortue aquatique qui mesure environ 20cm, je suis carnivore. J’ai besoin d’un grand aquarium pour me sentir bien.', '2010-01-01', 12, 6),
(93, 'Rango2', 0, '31642615531.jpg', 'Je suis un dragon d’eau, ma taille est de 80 cm. Je suis omnivore, les insectes, les végétaux j’en réclame ! De nature timide, je vis dans un terrarium humide.', '2018-01-01', 12, 6),
(94, 'Drago', 0, '31642615604.jpg', 'Je suis un dragon d’eau, ma taille est de 40 cm. Je suis omnivore, les insectes, les végétaux j’en réclame ! De nature timide, je vis dans un terrarium humide', '2016-01-01', 12, 6),
(95, 'Toca', 0, '31642615732.jpg', 'Je suis une tortue mauresque, je mesure environ 20 cm et mon espérance de vie est de 100 ans. Je suis végétarien, je me nourris principalement de plantes sauvages. Je vis dans un jardin.', '1990-01-01', 12, 6),
(96, 'Kacchan', 1, '31642615958.jpg', 'Je suis un lézard ou plus précisément un Gecko tokay. Je mesure 20 cm et je suis insectivore. Je suis timide et je vis dans un terrarium arbiricole.', '2018-01-01', 12, 6),
(97, 'Huit', 2, '31642616095.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2015-01-01', 12, 6),
(98, 'Ninja', 0, '31642616217.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2019-01-01', 12, 6),
(99, 'Potiron', 0, '31642616325.jpg', 'J’ai été pris en charge alors que j’errais dans les rues de Dammarie les lys. Atteint de la teigne, j’ai été soigné et je recherche maintenant une famille prête à m’adopter et qui prendra soin de moi.', '2020-11-11', 11, 2),
(102, 'Kiara', 1, '31642623943.jpg', 'Je suis un boa constrictor. Je suis carnivore, je mange un rat de 150g tous les 15 jours. Je suis méfiante. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2013-01-01', 12, 6),
(103, 'Bagui', 0, '31642624364.jpg', 'Je suis un pogona vitticeps, je suis omnivore et très gourmand les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2013-01-01', 12, 6),
(104, 'Domino', 2, '31642625223.jpg', 'Je suis un lampropeltis californiae, je mesure environ 90cm. Je suis carnivore, je mange une souris adulte une fois toutes les deux semaines. Je vis dans un terrarium terrestre.', '2018-01-01', 12, 6),
(107, 'Skoll', 0, '31642625731.jpg', 'Je suis un pantherophis guttatus, je mesure environ 100cm, j’ai une scoliose sur la moitié de mon corps mais cela ne me gêne pas dans mes déplacements et mon nourrissage. Je suis carnivore, je mange une souris adulte une fois toutes les deux semaines. Je vis dans un terrarium semi arboricole.', '2013-01-01', 12, 6),
(108, 'Vitti', 1, '31642625990.jpg', 'Je suis un pogona vitticeps, je suis omnivore et très gourmande, les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2018-01-01', 12, 6),
(109, 'Pei', 1, '31642626136.jpg', 'Je suis un pogona vitticeps, je suis omnivore les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2015-01-01', 12, 6),
(110, 'Akan', 0, '31642626347.jpg', 'Je suis un boa constrictor, je mesure 1,3 m. Je suis carnivore, je mange un rat de 150g tous les 15 jours. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2016-01-01', 12, 6);

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
(45, 1),
(63, 1),
(67, 1),
(71, 1),
(74, 1),
(76, 1),
(79, 1),
(82, 1),
(87, 1),
(88, 1),
(94, 1),
(99, 1),
(54, 2),
(103, 2),
(108, 2),
(109, 2),
(59, 3),
(76, 3),
(79, 3),
(85, 3),
(91, 3),
(95, 3),
(64, 4),
(85, 4),
(86, 4),
(92, 4),
(95, 4),
(42, 5),
(51, 5),
(67, 5),
(69, 5),
(79, 5),
(88, 5),
(91, 5),
(66, 7),
(82, 7),
(84, 7),
(90, 7),
(97, 7),
(104, 7),
(110, 7),
(64, 8),
(66, 8),
(68, 8),
(71, 8),
(74, 8),
(80, 8),
(86, 8),
(87, 8),
(89, 8),
(90, 8),
(92, 8),
(93, 8),
(94, 8),
(96, 8),
(97, 8),
(98, 8),
(102, 8),
(107, 8),
(42, 9),
(45, 9),
(51, 9),
(54, 9),
(59, 9),
(69, 9),
(71, 9),
(74, 9),
(76, 9),
(88, 9),
(91, 9),
(99, 9),
(42, 10),
(45, 10),
(51, 10),
(54, 10),
(59, 10),
(64, 10),
(67, 10),
(69, 10),
(80, 10),
(85, 10),
(87, 10),
(95, 10),
(97, 10),
(99, 10);

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
  `texte1` text,
  `url_image` varchar(45) NOT NULL,
  `description_photo` varchar(255) NOT NULL,
  `texte2` text NOT NULL,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `auteur` varchar(100) NOT NULL,
  `fk_idcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `description_photo`, `texte2`, `date_publication`, `auteur`, `fk_idcategorie`) VALUES
(1, 'Pas de salon du cheval !', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois dû aux conditions sanitaires.', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois dû aux conditions sanitaires.\r\n', 'article_1.jpg', 'Photo de Jean van der Meulen provenant de Pexels', 'Dans un communiqué rendu public, l’équipe du salon du cheval de Paris explique et justifie sa décision : \r\n\r\n<em>“Si le vaccin permet aujourd\'hui une amélioration, bien des doutes subsistent quant aux conditions sanitaires permettant l\'organisation d\'un tel événement. C’est pourquoi, la mort dans l’âme, nous décidons, à l’instar d’autres événements, de renoncer à l’édition 2021. [...] Nous pensons inutile de faire prendre des risques aux exposants, aux éleveurs, aux visiteurs et à tous les passionnés. Parce qu’il faut rebondir et penser à l’avenir, nous réfléchissons à un autre événement dans les mois à venir permettant de réunir la grande famille du cheval. Sport, ruralité, bien-être animal seront au rendez-vous.”</em>\r\n\r\n<strong>Rendez-vous en 2022</strong> au Parc des Expositions de Paris Nord Villepinte pour vibrer au rythme des compétitions, des spectacles et des animations <strong>100% cheval</strong>.', '2021-11-15 09:32:16', '', NULL),
(2, 'Un samu pour chiens et chats', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie...', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence, le centre d’appel est ouvert <strong>7 jours sur 7 et 24 heures sur 24.</strong>', 'article_2.jpg', 'Photo de Tima Miroshnichenko provenant de Pexels', 'En cas <strong>d’urgence vitale</strong> un professionnel se déplace sur les lieux pour effectuer les premier soins avec une ambulance équipée de matériels (médicaments, pharmacie d’urgence, masque à oxygène...) et adaptée au transport de l’animal. En moyenne, l’ambulance intervient une fois par jour depuis sa mise en service dans un rayon de 30km. \r\n\r\nÀ ce jour, l’intervention n’est pas remboursée intégralement car les animaux de compagnie ne possèdent pas de carte mutuelle ou de sécurité sociale. Le prix total d’une intervention est de <strong>400 euros</strong> mais heureusement le propriétaire débourse 10 à 20% de cette somme et le reste est pris en charge par la fondation et la clinique vétérinaire de Münchenstein.\r\n', '2021-11-15 09:37:36', '', NULL),
(3, '8 choses à savoir avant d\'adopter un animal ', 'N\'adoptez pas, avant d\'avoir compris qu\'un animal de compagnie implique de nombreuses responsabilités et dépenses dont vous devez tenir compte.', 'N\'adoptez pas, avant d\'avoir compris qu\'un animal de compagnie implique de nombreuses responsabilités et dépenses dont vous devez tenir compte.', 'article_3.jpg', 'Photo de cottonbro provenant de Pexels', '<p><strong>Que devez-vous savoir avant de prendre une décision ?</strong>\r\n<br><br>\r\n<strong>Avoir un animal de compagnie est un énorme engagement</strong>\r\n<br>\r\nUn nouveau chat ou chien doit s\'acclimater à votre maison, vous devez lui apprendre à demander à sortir pour faire ses besoins, vous devez acheter de la nourriture, des jouets, payer les vaccinations, les visites chez le vétérinaire et prendre le temps nécessaire pour une adoption réussie.\r\n<br>\r\n<br>\r\n<strong>Vous devez faire des recherches </strong>\r\n<br>\r\nVous devez tout savoir sur le type d\'animal que vous allez adopter ; ce qu\'il mange, la taille qu\'il aura, les caractéristiques de sa race, s\'il souffre d\'allergies, où est le vétérinaire le plus proche…Tout cela vous aidera à trouver le meilleur candidat pour ce dont vous avez besoin.\r\n<br>\r\n<br>\r\n <strong>Adopter est moins cher, mais vous allez dépenser beaucoup d\'argent</strong> \r\n<br>\r\nPrendre soin de vos animaux de compagnie est une dépense supplémentaire dont vous devez tenir compte, vous allez acheter beaucoup de nourriture, ils vont détruire les jouets à la vitesse de la lumière, vous devez leur faire faire tous les vaccins, payer leur toilettage, les médicaments et bien d\'autres choses encore. C\'est vraiment comme avoir un bébé à la maison tout le temps, et votre budget annuel va en prendre un coup.\r\n<br> \r\n<br>\r\n<strong>C\'est un engagement à long terme</strong> \r\n<br>\r\nLes chats et les chiens ne vivent pas aussi longtemps que les humains, mais les chats peuvent vivre jusqu\'à 20 ans et les chiens peuvent vivre au-delà de 18 ans, alors soyez prêts à prendre soin de ce petit être poilu pendant de nombreuses années.\r\n<br> \r\n<br>\r\n<strong>Le coup de foudre ne compte pas</strong>\r\n<br>\r\nVous aimez peut-être un chien ou un chat, mais vous ne pouvez pas fonder votre décision uniquement sur ce critère. En particulier pour les animaux adoptés dans des refuges, vous devez prendre le temps de les mettre à l\'aise avec vous, vous devez apprendre à déchiffrer leur personnalité et leur niveau d\'activité, s\'ils sont bons avec les enfants et sont sociables, tout cela vous aidera à trouver celui qui correspond le mieux à votre mode de vie.\r\n<br>\r\n<br>\r\n<strong>Les animaux de compagnie adoptés ont également besoin de formation</strong>\r\n<br>\r\nMême s\'ils appartenaient à quelqu\'un avant, ce sont des animaux qui ne vous connaissent pas et qui n\'ont pas l\'habitude de vivre dans votre maison. Vous allez donc devoir leur apprendre à suivre vos ordres, les endroits où ils ne peuvent pas entrer, et même à rester près de vous lorsqu\'ils sortent se promener.\r\n<br>\r\n<br>\r\n<strong>Vous allez devoir adapter votre maison</strong>\r\n<br>\r\nVous n\'avez pas besoin de tout changer, mais vous devez déplacer certaines choses afin qu\'elles ne soient pas à la portée d\'un animal curieux. Vous devez également savoir que vos chaises seront recouvertes de poils, que votre lit deviendra le leur et que certains petits objets peuvent être dangereux pour votre chien ou votre chat.\r\n<br>\r\n<br>\r\n<strong>Vous devez être flexible</strong>\r\n<br>\r\nTout le monde pense que les chiens et les chats vont suivre toutes les règles à la lettre, mais ce n\'est jamais le cas. Vous devez être prêt à accepter le fait que votre animal ne dormira pas dans le coin où vous avez mis son lit, vous allez devoir faire face à certains problèmes de comportement en vous adaptant l\'un à l\'autre et en vous attendant à l\'inattendu. Et ne stressez pas, votre chien le ressent et cela peut aggraver son comportement.\r\n<br>\r\n<br>\r\n<br> \r\nTous droits réservés à www.gqmagazine.fr.\r\n</p>', '2021-11-24 10:06:25', '', NULL),
(4, 'Novembre, le mois des animaux âgés', 'Le vieillissement des animaux de compagnie s’accompagne de changements sur le plan physique, psychologique et comportemental.', '<p>Le <strong>vieillissement des animaux</strong> de compagnie s’accompagne de <strong>changements sur le plan physique, psychologique et comportemental</strong>. Plusieurs refuges rapportent que les animaux âgés sont souvent les derniers à être adoptés.</p>', 'article_4.jpg', 'Photo de Gabriela Neumeier provenant de Pexels', '<p>Pourtant de nombreuses raisons font que les animaux âgés sont une <strong>excellente option</strong> pour les familles qui souhaitent adopter un animal de compagnie. En voici quelques une décrite par Geneviève Lacombe passionnée par les animaux : <br><br>\r\n\r\n“• Les animaux plus âgés sont généralement <strong>plus calmes</strong> que les chiots et les chatons, se contentant souvent d\'une routine quotidienne plus tranquille. La nature souvent plus douce des animaux âgés en fait un excellent choix pour les familles avec enfants. Avant de se retrouver dans des refuges, les animaux seniors ont souvent vécu une sorte de vie de famille, ce qui rend l\'adaptation à un nouvel environnement familial beaucoup plus facile que pour les chiots ou les chatons.<br>\r\n• Les animaux de compagnie seniors sont souvent <strong>déjà propres </strong>et peuvent même être excellents pour exécuter des demandes de base.<br>\r\n• En raison de leur style de vie tranquille, les chiens âgés ne nécessitent pas le <strong>niveau d\'exercice</strong> des jeunes animaux de compagnie. Oui, ils aiment toujours jouer et se promener, mais ils ne nécessitent tout simplement pas autant de concentration et d\'énergie.<br>\r\n• What you see is what you get! Avec les animaux seniors, vous savez exactement ce que vous adoptez. La <strong>personnalité des animaux</strong> âgés est déjà développée et vous pouvez donc dire tout de suite s’ils conviendront à votre style de vie et votre famille.<br>\r\n• L\'amour! Plusieurs histoires racontent que les animaux âgés sont particulièrement<strong> reconnaissants pour leur deuxième chance</strong>. Ils semblent savoir qu’ils ont été sauvés. Les nouveaux parents remarquent souvent un sentiment d’amour et d’appréciation très spécial de la part de leur animal de compagnie senior.”\r\n<br><br>\r\nRetrouvez des animaux âgés à adopter sur notre compte Instagram :<br>\r\n<a href=https://www.instagram.com/p/CWv3mtxNDy4/ target=\"_blank\">Lobo, berger allemand</a><br> \r\n<a href=\"https://www.instagram.com/p/CWd5bGuNjWV/\"target=\"_blank\">Kenzo & Yuki</a>\r\n</p>\r\n', '2021-11-30 17:22:49', '', NULL),
(5, 'Les maladies de nos animaux de compagnie', '\r\nNos animaux de compagnie (chiens, chats, lapin, etc..) peuvent être porteurs de maladie. \r\n', 'Nos animaux de compagnie (chiens, chats, lapin, etc..) peuvent être porteurs de maladie. \r\nLe Dr Vétérinaire Frédéric Degorce, directrice générale du Laboratoire d’anatomie pathologique vétérinaire du Sud Ouest implanté à Toulouse, répond à nos questions et nous donne des conseils pour prévenir et guérir leurs maladies.', 'article_5.jpg', '', '<p>\r\n• Les animaux peuvent-ils nous transmettre des maladies ?\r\n<br>\r\n“Oui. Ces maladies s’appellent <strong> des zoonoses </strong>. Elles regroupent de nombreuses pathologies dont l’agent pathogène peut être une bactérie, un virus ou un champignon et dont la gravité pour l’Homme est très variable, les personnes immunodéprimées ou sous immunosuppresseurs, les personnes âgées, les jeunes enfants ou les femmes enceintes étant les plus à risque. On compte parmi les zoonoses : la teigne, la gale, la toxoplasmose, la toxocarose, la tuberculose, la rage…\r\nLa gravité de ces maladies chez l’Homme est très variable selon la maladie elle-même, l’agent pathogène responsable pouvant être plus ou moins virulent, mais également selon la personne infectée, qui peut présenter une sensibilité particulière à ces pathogènes. C’est souvent le cas des personnes au système immunitaire fragile telles que les immunodéprimés, les personnes sous traitement immunosuppresseur, les jeunes enfants, les personnes âgées, ou encore les femmes enceintes.”\r\n<br>\r\n• Existe-t-il des cas de rage en France ?\r\n<br>\r\n“Les rares cas de rages canines en France sont actuellement <strong>des cas rapportés</strong> : ce sont des animaux importés illégalement de pays où la rage des rues sévit encore (Par ex en Asie et en Afrique). Dans ces pays, les chiens sont le principal réservoir et la principale source de contamination de l’Homme. La France est officiellement indemne de rage depuis 2001. Des formes de rage touchant les chauves-souris existent cependant sur notre territoire.”\r\n<br>\r\n• Comment protéger notre animal de compagnie contre les tiques ?\r\n<br>\r\n“Il est conseillé de <strong>traiter son animal de compagnie préventivement</strong> avec un produit contre les tiques. Il existe de nombreux produits efficaces sur le marché pour lutter contre les parasites selon des présentations, des modes et des rythmes d’administration variés (comprimés, pipettes, spray, en application mensuelle, trimestrielle…). Demandez à votre vétérinaire de vous prescrire le produit le mieux adapté à votre animal. En outre, après chaque retour de promenade, il est conseillé d’examiner attentivement son animal et de lui retirer les éventuelles tiques fixées ou présentes sur le pelage.”\r\n<br>\r\n• Les animaux peuvent-ils avoir des allergies ?\r\n<br>\r\n“Oui. Certains chiens peuvent avoir <strong>une anomalie génétique de la barrière cutanée </strong>et développer une dermatite atopique qui peut les prédisposer à des allergies variées par exemple aux acariens des poussières de maison, à certains pollens... D’autres peuvent développer <strong>des intolérances ou des allergies alimentaires </strong>, des allergies aux piqûres de moustiques ou de puces. Le chat peut aussi être atteint de syndrome atopique.”\r\n<br>\r\n• Qu’est ce que le sida du chat et comment l’éviter ?\r\n<br>\r\n“Il est causé par <strong>le FIV ou virus de l’immunodéficience féline </strong>. Cette infection virale prédispose les chats aux autres infections (avec risque de développer des problèmes cutanés, buccaux, respiratoires, neurologiques, digestifs, rénaux…) et à certains cancers (par exemple les lymphomes). Les chats contractent le FIV lorsqu’ils se blessent entre eux au cours de combats. Le FIV peut aussi être transmis sexuellement et par le biais de transfusions sanguines. Il n’y a pas de vaccin contre le FIV. Pour l’éviter il faut donc <strong>éviter les combats entre individus </strong>et tous les problèmes de cohabitation difficile entre félins, stériliser son chat, le garder le plus possible à l’intérieur, ou prévoir des sorties surveillées ou en lieux sécurisés, ne pas introduire de nouveau chat chez vous sans test préalable, de façon à connaître le statut viral de tout individu nouvellement introduit et garder strictement à l’intérieur tout chat testé positif de façon à ce qu’il ne transmette pas le virus aux autres.”\r\n<br>\r\n<br>\r\n\r\n</p>', '2021-12-30 09:32:51', '', NULL),
(6, 'Les démarches pour adopter un animal', 'Il faut être majeur pour adopter un animal de compagnie.', '<p>\r\n\r\nIl faut être <strong>majeur</strong> pour adopter un animal de compagnie. Les enfants mineurs, sous la responsabilité de leurs parents, doivent être accompagnés.<br>\r\n\r\nDes <strong>pièces justificatives</strong> sont demandées pour officialiser l’adoption : <br>\r\n• Carte Nationale d’Identité (CNI), \r\n• Justificatif de domicile (facture EDF, téléphone, impôts),\r\n• Attestation d’assurance (responsabilité civile),\r\n• Justificatif de revenus (salaires, attestation URSSAF),\r\n• Frais d’adoption s’élevant jusqu’à 300 €, variables selon la catégorie d’animal (chien, chat, NAC, etc.).\r\n\r\n</p>', 'article_6.jpg', '', '<p>\r\nPour adopter un animal de compagnie, dans un refuge ou une association, vos <strong>motivations</strong> sont passées au peigne fin. Mais chaque association à ses habitudes, par exemple, l’association Pattes-en-Rond se déplacent dans les foyers pour vérifier le nouvel environnement de l’animal et l’association SOS P’tite Bêtes demande des photos post adoption de l’animal.<br><br>\r\nPour adopter chez <strong>Pattes-en-Rond</strong>, voici le processus :<br>\r\n1.Remplir le formulaire en ligne et nous le renvoyer à asso.pattenrond@gmail.com <br>\r\n2.Échange téléphonique avec une bénévole si le formulaire est validé.<br>\r\n3.Si l’échange téléphonique est positif, sécurisation de vos fenêtres (et extérieur) si ce n’est pas déjà fait. Voir nos critères de sécurisation.<br>\r\n4.Après sécurisation, une pré-visite de chez vous sur RDV avec un.e bénévole est organisée, notamment pour vous rencontrer et vérifier la sécurisation.<br>\r\n5.Rencontre avec le chat dans sa famille d’accueil, si pré-visite validée.<br>\r\n6.Signature du contrat et règlement des frais d’adoption.<br>\r\n7.Transfert du chat dans sa nouvelle maison.<br><br>\r\nPour adopter chez <strong>SOS P’tite Bêtes</strong>, voici le processus :<br>\r\nL\'adoption est gratuite en dehors des frais de puçage (50 euros) des animaux qui doivent être enregistrés sur i-fap (liste ici). L\'adoption doit être réfléchie et doit se faire après s\'être assuré des bonnes conditions d\'accueil de l\'animal. En adoptant, vous vous engagez à nous envoyer de temps en temps une photo de l\'animal pour nous assurer que l\'adoption est réelle. Nous n\'expédions pas les animaux, nous ne faisons pas de livraisons à domicile, nous n\'offrons pas de terrarium.<br>\r\nNous ne répondons à des questions sur le maintien de l\'espèce qu\'à condition que la personne ait pris la peine de rechercher par elle-même avant (livres, fiches d\'élevage...).Un don libre est bienvenu ;)\r\n\r\n\r\n</p>', '2022-01-06 12:08:50', '', NULL),
(7, 'IFOA nous ouvre ses portes !', 'L’IFOA, Institut de Formation d\'Ostéopathes Animaliers, est un établissement d’enseignement supérieur privé.', '<p>L’IFOA, <strong> Institut de Formation d\'Ostéopathes Animaliers </strong>, est un établissement d’enseignement supérieur privé. Il existe plusieurs centres de formation en France à Tarascon et Paris V, en Espagne à Barcelone, en Belgique à Loyers. Nous avons eu le plaisir de rencontrer des étudiantes de 2ème année à l\'IFOA Paris, qui ont répondu à nos questions sur le métier d’ostéopathe animalier. \r\nBon plan : IFOA Paris propose des consultations en ostéopathie animale pour vos animaux (chiens, chats et NAC) à 15 euros réalisés par des étudiants de 4ème année.\r\n</p>', 'article_7.jpg', '', '<p>• Pourquoi consulter un ostéopathe animalier ?\r\n<br>\r\nPauline LAFUGE, étudiante en 2ème année, nous répond :  “Il y a plusieurs raisons. Pour faire un bilan de votre animal de compagnie, si c’est un jeune animal sportif, ça peut être pour un bilan pré compétition. Pour <strong>des raisons pathologiques </strong>, par exemple pour une boiterie (incapacité à se déplacer normalement sur un ou plusieurs membres) ou pour <strong>des douleurs lombaires</strong>. Vous pouvez consulter un ostéopathe pour plusieurs raisons mais il faut avoir vu un vétérinaire auparavant.” \r\n<br>\r\n\r\n• À quelle fréquence dois-je consulter un ostéopathe animalier  ?\r\n<br>\r\nNolwenn PENFORNIS, étudiante en 2ème année, nous conseille : “Tout dépend de l’état de santé de l’animal, si c\'est un animal sportif ou qu’il n’y a pas de problème particulier, il est conseillé de faire <strong>deux séances par an</strong>, une tous les six mois, comme l’humain. Les chiots peuvent aussi être suivis pour un bilan de croissance. Si l’animal est suivi de près pour une pathologie qui est chronique ou autre, ce sera une séance par mois. “\r\n<br>\r\n• Comment gérer un animal stressé avant et pendant un rendez-vous chez un ostéopathe animalier  ?\r\n<br>\r\nLuna CAKMAK, étudiante en 2ème année, nous explique : “Il faudra faire <strong>découvrir l’environnement </strong> à l’animal. Par exemple, si c\'est un cheval, nous sommes souvent dans le manège ou dans son box. Si c’est un chien, il faut le laisser sentir les odeurs de la salle de consultation pour qu’il puisse s’y sentir bien. Puis il faudra s’approcher de l’animal doucement, en le caressant et lui montrant qu’il faut être calme. Le propriétaire doit adopter un<strong> comportement rassurant </strong>pour son animal, en ne parlant pas fort, sans faire de grands gestes et sans montrer de stress. L’animal sera alors dans des conditions idéales.\"\r\n<br>\r\n• Comment se déroule une consultation chez un ostéopathe animalier ?\r\n<br>\r\nMathilde RASSON, étudiante en 2ème année, nous répond : “ Au début, nous allons poser des questions au propriétaire pour connaître les <strong>habitudes de vie </strong> de l’animal, son identité et tous ses antécédents vétérinaires ou ostéopathiques. Ainsi, nous pouvons nous faire une idée de ce que l’animal pourrait avoir. Ensuite, nous faisons un <strong>examen d’exclusion vétérinaire</strong>, vérifier que l’animal se porte bien, si ce n’est pas le cas il est redirigé vers un vétérinaire. Sinon, nous allons<strong> évaluer l’animal en statique et en dynamique </strong>et palper l’animal. Puis nous allons traiter l’animal en fonction de ce que nous avons détecté. Soit avec <strong>des techniques structurelles</strong>, où l’articulation de l’animal va être travaillée ou avec <strong>des techniques tissulaires</strong>, où l’on vient travailler la détente des tissus de l’animal. Pour finir, nous donnons des conseils aux propriétaires et un repos de trois jours pour l’animal.”\r\n<br>\r\n• Quel animal préférez-vous ausculter ?\r\n<br>\r\nMathilde RASSON : “Je préfère <strong>les chevaux </strong>car j’ai plus d’affinités avec eux mais j’aime bien aussi les chiens et puis on verra par la suite.”\r\nNolwenn PENFORNIS : “Moi, ce serait plutôt <strong>les chiens</strong> car j’ai moins d’affinité avec les chevaux que je manipule depuis moins longtemps.”\r\nLuna CAKMAK : “Moi aussi je préfère <strong>les chiens</strong> parce que j’en ai un et donc je me familiarise plus rapidement avec.”\r\n<br>\r\n• Qu’est-ce qui vous plaît le plus à l’IFOA ? \r\n<br>\r\nMathilde RASSON : ”La <strong>diversité des partenaires</strong>. Il y a vraiment beaucoup de partenaires ce qui nous permet d’aller d’une écurie à une autre, donc d\'ausculter un grand nombre de  chevaux. C’est donc hyper intéressant sur les cas et les différentes pathologies.”\r\nNolwenn PENFORNIS : “La <strong>diversité des formateurs</strong>. Les formateurs sont eux-mêmes ostéopathe animalier donc si nous avons des questions sur l’aspect réel du métier et moins pédagogique, ils peuvent y répondre.”\r\nLuna CAKMAK : “Beaucoup de <strong>pratique sur le terrain</strong> ce qui nous permet d’acquérir des expériences qui nous serviront pour exercer notre métier. “\r\n</p>', '2022-01-14 11:18:53', '', NULL);

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
-- Déchargement des données de la table `newsletter`
--

INSERT INTO `newsletter` (`id`, `mail`, `prenom`, `date`) VALUES
(22, 'sb.lucien77144@gmail.com', 'Lucien', '2021-11-24 11:31:58'),
(25, 'marin.bouanchaud@gmail.com', 'marin', '2021-11-24 16:47:12'),
(26, 'matthis.rousselle@gmail.com', 'Matthis', '2021-11-24 16:49:34'),
(27, 'amelie.rubiales@yahoo.com', 'Amélie', '2021-11-24 16:49:41'),
(29, 'elodpan@gmail.com', 'Élodie', '2021-11-24 17:31:53'),
(33, 'hrvinc3@yahoo.fr', 'Rv', '2021-11-24 20:16:03'),
(34, 'ninondere@yahoo.fr', 'Ninon', '2021-11-24 21:20:53'),
(35, 'm.andriamiraho@gmail.com', 'mathieu', '2021-11-26 13:02:57'),
(36, 'mmi@opsone.net', 'Hervé', '2021-11-29 15:59:56'),
(37, 'eleaa.crt@gmail.com', 'Eléa', '2021-11-29 22:49:03'),
(38, 'clementine.gilama@gmail.com', 'clementine', '2021-11-30 11:03:43'),
(39, 'erinbeselga@gmail.com', 'R1', '2021-11-30 13:11:57'),
(40, 'anatole.babin@epitech.eu', 'Anatole', '2021-11-30 21:58:32'),
(41, 'anatole.babin@gmail.com', 'Anatole', '2021-11-30 22:03:17'),
(42, 'pascal.riquelme@yahoo.fr', 'Pascal', '2021-12-09 21:44:37'),
(43, 'doriane.rousselle@gmail.com', 'Doriane', '2021-12-09 21:48:12'),
(44, 'karinejurisic@gmail.com', 'Karine', '2022-01-05 19:17:27'),
(45, 'vatin.couchette@orange.fr', 'Christophe', '2022-01-05 20:20:05'),
(46, 'carole3410@hotmail.com', 'Carole', '2022-01-05 21:44:38'),
(47, 'elodie.chabot@free.fr', 'Elodie', '2022-01-05 21:53:52'),
(48, 'elisaaabrbb@gmail.com', 'Élisa', '2022-01-15 08:26:33'),
(50, 'chloemontoya93@gmail.com', 'Chloé', '2022-01-17 20:41:08');

-- --------------------------------------------------------

--
-- Structure de la table `refuge`
--

CREATE TABLE `refuge` (
  `idrefuge` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `lien` varchar(255) DEFAULT NULL,
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
(11, 'Pattes-En-Rond', NULL, 'https://pattesenrond.fr/', '', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10570.063486753616!2d2.6515515!3d48.5233447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x96f150f440dd7223!2sPattes-En-Rond!5e0!3m2!1sfr!2sfr!4v1642451409618!5m2!1sfr!2sfr', '164 Rue Rousseau Vaudran, 77190 Dammarie-les-Lys', 'pattesenrond.jpg'),
(12, 'SOS P\'tites Bêtes', NULL, 'https://sosptitesbetes.wixsite.com/sosptitesbetes', '​contactsosptitesbetes@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2647.222111388748!2d2.1701492148712256!3d48.433076738513634!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5c96c08eccd57%3A0xc43ac93d681cd826!2s7%20Imp.%20du%20Moulin%20Fouleret%2C%2091150%20%C3%89tampes!5e0!3m2!1sfr!2sfr!4v1642455442418!5m2!1sfr!2sfr', '7 imp du Moulin Fouleret  91150 Etampes', 'déconnecté');

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
  `description` mediumtext,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_derniere_connexion` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `statut`) VALUES
(1, 'Zoey', '$2y$10$4o48tqRZmFD3DM1bzLsJXuOxA/12Ptkt1rd27M6cmWFe2mFd7BZu2', 'admin', 'admin', 'zoey.app@gmail.com', 'déconnecté', '0001-01-01', NULL, NULL, '2022-01-14 19:58:24', NULL, 'd9e01c9af41911bef5fa7640df75f15c185c3b708763a1d8f7adafc2bf51e8c83d140f-1-1642554617', 1),
(3, 'amelie_rbls', '$2y$10$iQ9836duCciEi5hboVAQCu4ZCYkJkIguklq9pWYn/cZaE58umqTZu', 'Amélie', 'Rubiales', 'amelie.rubiales@gmail.com', 'déconnecté', '2002-04-07', NULL, NULL, '2022-01-18 12:59:03', NULL, '8a1fcd5711c23ca7d1dd4253842462e1ac240a4d1d7c530c39139419446227152aff84-3-1642626295', 1),
(4, 'clementine', '$2y$10$rubu/BuNIrkONMHC5usK7.j6asUrN0tXpnfHqO7rc9lWp/l0YL6/6', 'clementine', 'Gilama', 'clementine.gilama@gmail.com', 'déconnecté', '2002-05-03', NULL, NULL, '2022-01-18 12:59:18', NULL, '5230e93a9a843e5cc5d9a17db5916eec02b13d23d964c1279381d4d1013855617eee56-4-1642507232', 1);

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
-- Index pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `refuge`
--
ALTER TABLE `refuge`
  ADD PRIMARY KEY (`idrefuge`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal_a_adopter`
--
ALTER TABLE `animal_a_adopter`
  MODIFY `idanimal_a_adopter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie_blog`
--
ALTER TABLE `categorie_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `types_animaux`
--
ALTER TABLE `types_animaux`
  MODIFY `idtypes_animaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

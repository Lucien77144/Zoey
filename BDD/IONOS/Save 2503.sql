-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Hôte : db5006998425.hosting-data.io
-- Généré le : ven. 25 mars 2022 à 11:01
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
-- Base de données : `dbs5778053`
--
CREATE DATABASE IF NOT EXISTS `dbs5778053` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbs5778053`;

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
(69, 'Oréo', 0, '31642538106.jpeg', 'Je suis né dans la rue mais je suis un petit chaton adorable. Ma maman Rubis est aussi au refuge, elle a fait une portée de 6 chatons mais seulement 4 ont été retrouvé. J\'aime courir en crabe pour épater mes copains ou le chien de ma famille d’accueil. Bien que joueur et très proche des autres chatons, je suis un bébé au caractère tranquille. Je suis doux, je ne mets jamais les griffes et je ne fais pas de bêtises ! J\'aime me hisser sur les genoux de ma famille d’accueil pour avoir mon compte de papouilles.', '2020-07-10', 11, 2),
(74, 'Croquette', 0, '31642539463.jpg', 'J’ai vécu dans la rue, j’ai déjà été pris en charge par une première association qui m’a stérilisé et ma gardé un certain temps puis l’association Pattes-En-Rond m’a placée dans une famille d’accueil qui correspond à mes besoins. Je ne suis pas très proche des humains, une cohabitation bienveillante me suffit. J\'aime jouer et j’y prends beaucoup de plaisir, j\'aime la bonne nourriture et m’étaler partout. Je m’entends si bien avec les autres chats, je ferais le compagnon parfait. ', '2016-08-09', 11, 2),
(76, 'Noushka', 0, '31642539819.jpg', 'Mes anciens propriétaires m’ont mis dans une cage de transport puis ils m’ont déposé dehors sur un trottoir, avec la porte de la cage ouverte. J’étais terrorisée, je ne me suis pas enfuie, quelqu’un m’a trouvé et m’a emmené chez le vétérinaire. Un des bénévoles de Pattes-En-Rond  se trouvait à la clinique et il a décidé de me prendre sous son aile. Je ne suis pas une minette câline et douce que l’on peut papouiller des heures, je suis une tornade qui a besoin d’être occupée ! Adoratrice du moindre objet avec lequel jouer, je me jette sur les plumeaux, joue des heures avec une balle, saute après les ombres et cherche toujours quelque chose à faire ! ', '2017-01-01', 11, 2),
(79, 'Krokmou', 1, '31642540329.jpg', 'J’ai été prise en charge à l\'âge de 2 mois par l’association avec ma sœur. Un mois plus tard, elle a été adoptée et j’ai été testée positive au calicivirus. Je suis une petite timide qui a besoin d’observer avant de faire confiance. Moi, je suis toujours là à attendre ma famille qui saura m’offrir une vie pleine de bonheur. ', '2017-04-01', 11, 2),
(80, 'Black', 0, '31642541404.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2013-01-01', 12, 6),
(82, 'Cardi', 0, '31642590650.jpg', 'Je suis un crabe tricolore et je suis omnivore, j’adore particulièrement les insectes et les végétaux. On me surnomme le “bulldozer” car j’aime retourner la terre pour me créer des nouvelles cachettes.', '0001-01-01', 12, 8),
(84, 'Peruphasma', 1, '31642591104.jpg', 'Je suis un phasme du Pérou et je mesure de 1 à 8 cm selon l\'âge. Je suis herbivore le lilas, le troène, le chèvrefeuille ou le lierre j’adore ca.', '0001-01-01', 12, 9),
(85, 'Marsu', 1, '31642614023.jpg', 'Je suis une tortue mauresque, je mesure environ 18 cm et mon espérance de vie est de 100 ans. Je suis végétarien, je me nourris principalement de plantes sauvages.', '2010-01-01', 12, 6),
(86, 'Sushi', 1, '31642614182.jpg', 'Je suis une tortue aquatique qui mesure environ 20 cm, je suis carnivore. J’ai besoin d’un grand aquarium pour me sentir bien.', '2017-01-01', 12, 6),
(87, 'Dolly', 1, '31642614342.jpg', 'Mes anciens maîtres ont déménagé et ils ne m’avaient pas habitué à ce nouvel environnement, je me suis donc perdue, j’étais sale et maigre quand l’association m’a trouvée. Durant 4 ans, j’ai vécu la vie d’une chatte errante car mes anciens maîtres ne voulaient pas me récupérer et refusaient de me céder à l’association. Je suis revenu devant les portes de l’association et ils m’ont pris sous leurs ailes. Je suis une chatte sauvage qui n’est pas proche de l’humain. Mais je suis une adorable petite minette timide mais sociable, calme et goulue. Je recherche une famille où je pourrais pleinement m’épanouir.', '2012-05-25', 11, 2),
(88, 'Onyx', 0, '31642614590.jpg', 'J’ai été sorti de fourrière par l’association Pattes-En-Rond. J\'adore les câlins, c’est ma grande passion ! J\'aime bien jouer et j\'use beaucoup de temps à chasser les mouches ou tout autre petit insecte. Parfois, je me transforme en pile et court partout pour mon quart d’heure de folie. Mais je suis aussi un chat clown, pas agile pour deux sous, qui loupe régulièrement ses sauts, un peu patapouf au temps de réaction allongé !  J\'aime bien faire dodo dans des petits recoins au chaud. Et des siestes contre mes humains. ', '2018-01-01', 11, 2),
(89, 'Skull', 2, '31642614790.jpg', 'Je suis un iguane vert et je mesure 1m50. Je suis herbivore. Je ne suis pas habitué à côtoyer les humains, il me faudra un temps d\'adaptation et d’éducation. Je vis dans un terrarium humide.', '0001-01-01', 12, 6),
(90, 'Sungaya', 2, '31642614914.jpg', 'Je suis un phasme épineux, je suis herbivore, j’aime particulièrement les ronces, le lierre et le chêne. Je vis dans un petit terrarium ou flexarium au choix.', '0001-01-01', 12, 9),
(91, 'Namour', 1, '31642615066.jpg', 'Je cherche une famille qui prendra le temps de gagner ma confiance, avec de la patience et beaucoup d’amour. J\'adore les papouilles une fois que je me sens bien et j\'adore être dehors pour observer les oiseaux et y rester même sous la pluie ou dans la neige ! J\' aime quand même venir au chaud dormir sur le lit quand tout le monde dort et me laisser câliner le matin avec plaisir. Je cherche une famille qui prendra le temps de gagner ma confiance, avec de la patience et beaucoup d’amour.', '2017-04-01', 11, 2),
(92, 'Rapido', 0, '31642615208.jpg', 'Je suis une tortue aquatique qui mesure environ 20cm, je suis carnivore. J’ai besoin d’un grand aquarium pour me sentir bien.', '2010-01-01', 12, 6),
(93, 'Rango2', 0, '31642615531.jpg', 'Je suis un dragon d’eau, ma taille est de 80 cm. Je suis omnivore, les insectes, les végétaux j’en réclame ! De nature timide, je vis dans un terrarium humide.', '2018-01-01', 12, 6),
(94, 'Drago', 0, '31642615604.jpg', 'Je suis un dragon d’eau, ma taille est de 40 cm. Je suis omnivore, les insectes, les végétaux j’en réclame ! De nature timide, je vis dans un terrarium humide', '2016-01-01', 12, 6),
(95, 'Toca', 0, '31642615732.jpg', 'Je suis une tortue mauresque, je mesure environ 20 cm et mon espérance de vie est de 100 ans. Je suis végétarien, je me nourris principalement de plantes sauvages. Je vis dans un jardin.', '1990-01-01', 12, 6),
(96, 'Kacchan', 1, '31642615958.jpg', 'Je suis un lézard ou plus précisément un Gecko tokay. Je mesure 20 cm et je suis insectivore. Je suis timide et je vis dans un terrarium arbiricole.', '2018-01-01', 12, 6),
(97, 'Huit', 2, '31642616095.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2015-01-01', 12, 6),
(98, 'Ninja', 0, '31642616217.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2019-01-01', 12, 6),
(99, 'Potiron', 0, '31642616325.jpg', 'J’ai été pris en charge alors que j’errais dans les rues de Dammarie les lys. Atteint de la teigne, j’ai été soigné et je recherche maintenant une famille prête à m’adopter et qui prendra soin de moi. J\'aime m’étaler sur le dos pour qu’on me patouille tout le corps, il n\'y a pas un centimètre où je n’accepte pas les caresses. Le ventre ? J\'adore ! Je suis hyper sociable avec tous les animaux, humains et non-humains, et je sais être très doux avec les enfants. Je ne mets jamais les griffes, je n’ai jamais un brin d’agressivité même je suis stressé. Très très joueur j\'adore le plumeau. J\'aime tellement ça que je me jette quasiment sur les murs pour l’attraper tellement. ', '2020-11-11', 11, 2),
(102, 'Kiara', 1, '31642623943.jpg', 'Je suis un boa constrictor. Je suis carnivore, je mange un rat de 150g tous les 15 jours. Je suis méfiante. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2013-01-01', 12, 6),
(103, 'Bagui', 0, '31642624364.jpg', 'Je suis un pogona vitticeps, je suis omnivore et très gourmand les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2013-01-01', 12, 6),
(104, 'Domino', 2, '31642625223.jpg', 'Je suis un lampropeltis californiae, je mesure environ 90cm. Je suis carnivore, je mange une souris adulte une fois toutes les deux semaines. Je vis dans un terrarium terrestre.', '2018-01-01', 12, 6),
(108, 'Vitti', 1, '31642625990.jpg', 'Je suis un pogona vitticeps, je suis omnivore et très gourmande, les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2018-01-01', 12, 6),
(109, 'Pei', 1, '31642626136.jpg', 'Je suis un pogona vitticeps, je suis omnivore les insectes et les végétaux j’en réclame ! Je vis dans un terrarium désertique.', '2015-01-01', 12, 6),
(110, 'Akan', 0, '31642626347.jpg', 'Je suis un boa constrictor, je mesure 1,3 m. Je suis carnivore, je mange un rat de 150g tous les 15 jours. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2016-01-01', 12, 6),
(111, 'Nougat', 1, '31642695078.jpg', 'Je suis arrivée fin Juillet chez les pattenronds alors que je n’avais que 5 jours. J\'ai d’abord passé une première nuit à la clinique vétérinaire mais je refusais de s’alimenter. J\'ai donc été récupérée par la présidente de l’association qui a veillé jour et nuit pendant 1 mois, le temps que j\' apprenne à boire au biberon, à faire mes besoins seuls et finalement à manger une bonne petite pâtée toute seule. Une fois en pleine forme, j\'ai pu rejoindre une famille d’accueil dans laquelle les autres chats m\'ont appris à rentrer mes petites griffes et ne pas utiliser mes dents sans raison valable ! Pleine d’énergie mais aussi pleine de tendresse, j\'aime courir partout et jouer avec n’importe quoi autant que faire de gros câlins à son humain.', '2021-07-22', 11, 2),
(122, 'Venus', 1, '31644961773.jpg', 'Je suis une tortue mauresque, je mesure environ 18 cm et mon espérance de vie est de 100 ans. Je suis végétarienne, je me nourris principalement de plantes sauvages.', '2014-01-01', 12, 6),
(130, 'Obsucurus', 0, '31645026534.jpg', 'Je suis un serpent ratier gris et je mesure 1m20. Je suis carnivore, je mange des souris adultes ou petits rats une fois toutes les 2 semaines. Je suis un très bon mangeur ! Je vis dans un terrarium semi arboricole. J\'aime pouvoir me cacher et me balader dans le terrarium car je suis semi-arboricole.', '2016-01-01', 12, 6),
(135, 'Genos', 0, '31645449314.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec. J\'aime pouvoir me cacher et me balader dans le terrarium.', '2017-01-01', 12, 6),
(145, 'Moon', 0, '31645817993.jpg', 'Je suis un adorable feu follet. Je suis un jeune chat d’un an et demi qui est hyper facile à vivre. Bien dans ma tête, je suis très sociable, câlin, je m’entends avec les autres chats et je suis tout de suite à l’aise dans un nouvel environnement. Je suis aussi un matou très vif et dynamique qui a besoin de se dépenser. Je recherche un foyer avec impérativement un jardin/grande terrasse sécurisé. Pas d’appartement de petite surface', '2020-01-01', 13, 2),
(146, 'John François Albert 1er', 0, '31645818064.jpg', 'Je suis un boa constrictor, je mesure 2 m. Je suis carnivore, je mange un rat de 250g tous les 15 jours. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2010-01-01', 12, 6),
(147, 'Rocinante', 1, '31646057536.jpg', 'Avec mon miaulement adorable et ma petite frimousse à craquer.Je suis une minette de rêve. Extrêmement câline, je suis également une joueuse invétérée ! Je vous porte le plumeau pour qu’ensemble, nous fassions une partie de jeu endiablée. Une fois fatiguée, je pars me reposer dans mon coin de prédilection. Je suis affectueuse tout en étant indépendante (je ne suis pas un pot de colle). Âgée de 8 mois, je suis facile à vivre pour peu que je puisse me dépenser en jouant.', '2021-01-01', 13, 2),
(150, 'Buck', 0, '31646170452.jpg', '​Je suis une caille du Japon. On m\'a récupéré dans une clinique vétérinaire. Je suis un petit pépère timide et fuyant avec l\'homme, qui chante de plus en plus et se montre curieux.', '0001-01-01', 15, 11),
(151, 'Birdy', 0, '31646170636.jpg', 'Je suis une perruche du Pennant. Sortie de fourrière, j\'ai été trouvée en pleine rue. Je suis peureuse vis-à-vis de l\'homme mais je suis très attentive ! Je chante énormément et imite quelques sons.', '2020-01-01', 15, 11),
(152, 'Aku', 0, '31646170862.jpg', 'Je suis une ​perruche calopsitte. Sortie de fourrière. Je suis un pépère assez calme, très observateur et qui vient de plus en plus sur vos épaules, je suis moins peureux qu\'à mon arrivée au refuge.', '0001-01-01', 15, 11),
(153, 'Laki', 1, '31646170931.jpg', 'Je suis une perruche calopsitte trouvée blessée devant un portail. J\'avais une patte blessée lors de son arrivée au refuge, qui a bien cicatrisé. Je suis une vraie glu ! Toujours à chercher l\'attention, très gourmande, mais j\'ai mon petit caractère malgré tout !', '0001-01-01', 15, 11),
(154, 'Bruno', 0, '31646171025.jpg', 'Je suis une ​perruche ondulée.​ Avant d\'arriver au refuge, je vivais dans une cage minuscule avec ma copine Luna. Je suis très bavard, soumis avec les autres et sociable.', '0001-01-01', 15, 11),
(155, 'Luna', 1, '31646171089.jpg', 'Je suis une ​perruche ondulée.​ Avant d\'arriver au refuge, je vivais dans une cage minuscule avec mon copain Bruno. Très discrète dans la volière, je suis soumise avec les autres ondulée et je ne cherche pas beaucoup le contact avec vous.', '0001-01-01', 15, 11),
(156, 'Iggy', 0, '31646171637.jpg', 'Je suis comme tout bébé très joueur et curieux, je suis plus indépendant que mes frères et vient à votre contact surtout quand vous avez des peluches (avec lesquels j\'adore jouer !) ou de la nourriture, je suis un petit gourmand...\nJe suis un petit fureton très intelligent, qui est le premier à trouver les bêtises à faire, ou les petits espaces non sécurisés que vous auriez manqués.', '2021-01-01', 15, 12),
(157, 'Chickpea', 0, '31646171728.jpg', 'Je suis une petite crevette adorable, hyper curieux et pot de colle avec vous, les humains, je suis un vrai fan de chaussettes également ! Je suis très suiveur pour le moment, si mes frères ne passent pas avant je reste avec eux, je ne suis pas un grand aventurier, même si je prends petit à petit confiance. J\'ai eu une blessure (malformation ou fractures) à une patte avant mais c\'est maintenant à peine perceptible.', '2021-01-01', 15, 12),
(159, 'Aïka', 1, '31646227768.jpg', 'J\'ai été abandonnée devant le portail du refuge. Obèse à mon arrivée, j\'ai repris une forme normale. Je suis une lapine sensible aux changements alimentaires (diarrhée). Je suis une vraie madame ronchonne ! Je grogne beaucoup, en particulier au moment de mes granulés du soir ou quand on essaie de me manipuler. Je suis une lapine qui a eu du mal avec mon abandon, je n\'ai pas compris ce qu\'il se passait et j\'ai eu beaucoup de difficulté à m\'acclimater, après plusieurs semaines, je fais maintenant confiance aux bénévoles et j\'ai fait de gros progrès sur mon comportement vis-à-vis  de l\'humain. Il reste du travail, mais je suis une lapine vraiment attachante, j\'aurais simplement besoin d\'une famille douce et patiente, qui saura me comprendre et m\'accorder du temps.', '0001-01-01', 15, 13),
(160, 'Tempo', 0, '31646237686.jpg', 'Je suis un furet très vif, encore jeune donc foufou, j\'ai besoin d\'activité, et je sais me faire entendre si je n\'ai pas ma dose d\'activité quotidienne ou que je souhaite attirer votre attention (gratte les barreaux, mords son bac..) je fais très facilement de grandes balades en harnais, je marche très bien et en étant attentif on sait quand je veux se reposer (je viens au pied et grimpe sur vos jambes) je connais les chiens mais dois encore m\'habituer, je peux parfois les pincer. Je ne suis pas mordeur avec l\'homme, mais évidemment il faut faire attention, particulièrement dans les séances de jeu.', '0001-01-01', 15, 12),
(161, 'Bouli', 0, '31646237795.jpg', 'Je suis un hamster nain. Suite à l\'adoption d\'un couple en animalerie, un particulier s\'est laissé débordé par les portées. Il a donc fait appel au refuge afin de me prendre en charge ainsi que mes frères et sœurs.  Je suis sociable, gentil et actif !', '2020-09-10', 15, 5),
(162, 'Kora', 1, '31646237949.jpg', 'Je suis un hamster nain. Suite à l\'adoption d\'un couple en animalerie, un particulier s\'est laissé débordé par les portées. Il a donc fait appel au refuge afin de me prendre en charge ainsi que mes frères et sœurs . Je suis sociable, gentil et actif !', '2020-09-10', 15, 5),
(163, 'Réglisse', 0, '31646238535.jpg', 'Je vivais dans un clapier dans un jardin, je m\'acharnais sans cesse à vouloir partir, un jour où j\'ai encore réussi à m\'en échapper, j\'ai terminé mon escapade chez l\'une des bénévoles ! J\'ai attaqué le chien de la famille et également la maman... Je me montrais très agressif. Après discutions avec ma propriétaire, la bénévole a apprit qu\'elle souhaitait se séparer de moi car justement j\'étais trop agressif. Je suis donc arrivée au refuge. Petite sensibilité respiratoire, je ne pourrais pas vivre dans un milieu trop humide. Au vu de ma description, j\'ai été stérilisé en urgence au moment de mon arrivée. Depuis, je suis un véritable amour, pas une seule fois je me suis montré agressif avec les bénévoles ou même les visiteurs ! Alors quand on m\'embête dans mon espace, quand on prend ma gamelle ou qu\'on change mon clapier... Je suis un petit lapin très curieux qui vient même volontiers chercher quelques gratouilles.', '0001-01-01', 15, 13),
(164, 'Mélody', 1, '31646238707.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire a décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Je suis arrivée au refuge très maigre, apeurée, avec des griffes très longues et énormément de bourres de poils/nœuds, j\'étais dans un sale état, non entretenue depuis des mois... Je vais maintenant beaucoup mieux ! Je dois seulement reprendre un peu de poids. J\'ai mon petit caractère, je n\'aime pas beaucoup qu\'on touche à mes affaires, et je n\'ai pas eu beaucoup de contact avec l\'homme, j\'ai besoin de temps avant de vous faire confiance.', '0001-01-01', 15, 13),
(165, 'Igloo', 0, '31646239004.jpg', 'Je suis arrivé avec ma maman Neige, suite à une erreur de sexage mon adoptante s\'est retrouvée avec un couple, non stérilisé. Je suis donc née, la personne ne pouvant pas assumer mes frères et sœurs, elle nous a confiée au refuge. Je suis un petit bonhomme très curieux, je suis le plus grand de la bande.', '2021-03-09', 15, 13),
(166, 'Pépite', 0, '31646239070.jpg', 'Je suis arrivé avec ma maman Neige, suite à une erreur de sexage mon adoptante s\'est retrouvée avec un couple, non stérilisé. Je suis donc née, la personne ne pouvant pas assumer mes frères et sœurs, elle nous a confiée au refuge. Je suis hyper curieux et sociable.', '2021-03-09', 15, 13),
(169, '​Galopin', 0, '31646242757.jpg', 'Je viens d\'une portée de souris non désirée chez un particulier. Je suis un pépère adorable, qui sors au moindre bruit. Je suis un peu timide au premier abord, mais je me montre très très vite curieux et aventurier ! Je viens sentir les doigts mais n\'aime pas être attrapé. Je devrais vivre seul dans mon futur foyer. J\'aurais besoin d\'une cage spacieuse mais bien sécurisée (attention à l\'espace entre les barreaux !). J\'ai également besoin d\'avoir une bonne couche de litière pour creuser et faire mon nid. Je suis une petite souris extrêmement active, vive, et curieuse.', '2021-02-01', 15, 5),
(170, 'Venus', 1, '31646251152.jpg', 'J\'ai été confiée au refuge suite au décès de ma propriétaire. Je suis une petite lapine assez flipette au quotidien avec les gens, en raison de mes conditions de vie passée, mais j\'ai fait de gros progrès, je suis assez curieuse, mais j\'ai besoin de la présente de ma sœur Isis pour être rassurée pour le moment. Je suis malheureusement porteuse du parasite e-cuniculi et j\'ai parfois des &quot;crises&quot; qui nécessitent un traitement.', '0001-01-01', 15, 13),
(171, 'Isis', 1, '31646251193.jpg', 'J\'ai été confiée au refuge suite au décès de ma propriétaire. Je suis une lapine discrète, sociable, qui a besoin de temps avant d\'accorder sa confiance aux humains.  Je suis malheureusement porteuse du parasite e-cuniculi et j\'ai parfois des &quot;crises&quot; qui nécessitent un traitement.', '0001-01-01', 15, 13),
(172, 'Oxana', 1, '31646251547.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire est décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Le refuge m\'a accueilli, je suis une petite chinchilla très réservée, encore peureuse de la main de l\'homme, il reste encore du travail pour m\'apprivoiser, mes anciennes conditions de vie n\'ont pas du aider, je suis une puce vraiment méfiante. J\'espère trouver une nouvelle famille avec ma copine Oural.', '0001-01-01', 15, 5),
(173, 'Oural', 1, '31646251613.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire a décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Le refuge m\'a accueilli, je suis comme ma copine Oxana, plutôt réservé, mais je progresse rapidement, vous pourrez me toucher sans que je ne cherche à fuir et viens de plus en plus chercher les friandises dans nos mains.', '0001-01-01', 15, 5),
(174, 'Crispy', 1, '31646316806.jpg', 'J\'ai été capturée avec 13 autres lapins suite à un signalement, quelqu\'un nous avait simplement balancés tous en pleine nature...  Je suis une lapine plutôt discrète sauf quand il faut manger.. Là je sais me faire entendre et attaque les grilles. Je commence cependant à perdre ce comportement, mon séjour dehors avec peu de nourriture a dû avoir un impact. Je suis une lapine qui accepte assez bien le contact humain.', '0001-01-01', 15, 13),
(175, 'Takara', 1, '31646317016.jpg', 'Une personne qui aménageait son logement nous a trouvés dans sa grange, l\'ancien propriétaire n\'a pas jugé nécessaire de nous emmener avec lui.', '2021-01-01', 15, 13),
(176, 'Pompom', 0, '31646317105.jpg', 'J\'ai été trouvé dans un parc par une promeneuse. Je suis actuellement totalement sous le contrôle de mes hormones, je marque, monte tout ce que je peux et je me montre agressif sur mon territoire. Nul doute que je serais un petit amour après ma castration.', '0001-01-01', 15, 13),
(177, 'Pandora', 1, '31646317179.jpg', 'Mon ancienne famille ne pouvait plus s\'occuper de nous, je suis née d\'une portée non contrôlées, je m\'échappais avec mes copains du jardin pour aller sur le parking de la résidence.', '2021-04-10', 15, 13),
(179, 'Miko', 0, '31646317317.jpg', 'J\'ai été abandonné dans la rue par un monsieur, une voisine m\'a récupérée et m\'a déposée au refuge. J\'avais une malocclusion dentaire sur mes incisives, toutes ont donc été retirées, je ne peux donc plus couper mes aliments, mais je peux toujours manger normalement (granulés, petits brins de foins ou d\'herbe et légumes/fruits coupés en petits morceaux). Je suis un lapin très gentil, doux, propre dans son clapier, qui devient de plus en plus câlin avec l\'humain, un petit amour !', '2021-01-01', 15, 13),
(180, 'Lilo', 0, '31646317380.jpg', 'J\'ai été trouvé errant, mes propriétaires n\'ont pas été retrouvés. Je suis un petit mâle très calme, qui s\'est rapidement habitué au refuge, je suis plutôt propre et viens facilement au contact.', '0001-01-01', 15, 13),
(181, 'Fanta', 1, '31646317468.jpg', 'Je suis une vraie décoratrice d\'intérieure, curieuse et posée, j\'aime la tranquillité mais accepte volontiers les petites friandises qu\'on me donne.', '2018-01-01', 15, 13),
(182, 'Maddy', 1, '31646317579.jpg', 'J\'ai été trouvée errante par des particuliers fin janvier. Je suis là depuis peu au refuge. Pour le moment, je suis une lapine plutôt calme et curieuse.', '0001-01-01', 15, 13),
(183, 'Benny', 0, '31646317640.jpg', 'J\'ai été trouvé dans la rue. Fan incontesté de l\'humain, des câlins, de l\'attention ! Je suis une vraie crème pleine de poils. Je suis également très attiré par la nourriture, comme je suis arrivé un peu maigrichon... Je suis un grand lapin, très curieux et qui fait beaucoup de flops.', '0001-01-01', 15, 13),
(184, 'Noel', 0, '31646415576.jpg', 'Je suis un petit lion dans un corps de mini lapin ! J&#039;ai du caractère, je suis assez protecteur de mon espace et n&#039;aime pas vraiment être attrapé, je viens cependant facilement au contact, et dans un espace un peu plus spacieux, et moins stressant qu&#039;au refuge je serais un petit compagnon très à l&#039;aise dans mes pattes et curieux.', '0001-01-01', 15, 13),
(185, 'Blancheline', 1, '31646415688.jpg', 'Je viens de fourrière puis le refuge m\'a recueillie. Je suis une lapine adorable, très cool et curieuse, qui apprécie de plus en plus les câlins !', '0001-01-01', 15, 13),
(186, 'Opaline', 1, '31646415890.jpg', 'Je vivais dans une petite cage en compagnie d\'un cochon d\'inde. Je suis une lapine bien dans mes pattes, très curieuse et qui adore réaménager son clapier ! Je connais les chiens les chats et je suis de plus en plus curieuse.', '2020-01-01', 15, 13),
(188, 'Griffin', 0, '31646416091.jpg', 'J\';ai été capturé avec 13 autres lapins suite à un signalement, quelqu\'un nous avait simplement balancés en pleine nature...Un ventre sur patte, toujours à escalader, fouiller pour chercher la nourriture ! Je suis un petit lapin très intelligent et qui sera sans aucun doute très facilement apprivoisable, surtout si vous avez de la banane...', '2021-11-01', 15, 13),
(190, 'Mooky', 0, '31646416205.jpg', 'J\'ai été capturé avec 13 autres lapins suite à un signalement, quelqu\'un nous avait simplement balancés en pleine nature...Je suis très curieux, explorateur, pas du tout peureux ! Je suis toujours l\'un des premier à venir voir les bénévoles.', '2021-11-01', 15, 13),
(191, 'Merlot', 0, '31646416273.jpg', 'J\'ai été capturé avec 13 autres lapins suite à un signalement, quelqu\'un nous avait simplement balancés en pleine nature...Je suis le plus petit de la bande, aussi le plus farouche, je suis encore très réservé et je me cache beaucoup sous ma maman.', '2021-11-02', 15, 13),
(195, 'Piccola', 1, '31646417528.jpg', 'Je suis une minette d’1 an, très à l’aise socialement. J&#039;adore les papouilles, je suis très avenante, je viens vous réclamer des câlins.', '2021-01-01', 14, 2),
(197, 'OMalley', 0, '31646418561.jpg', 'Après avoir vécu dans la rue avec un sdf puis être passé par la fourrière, je suis maintenant dans une famille d\'accueil où je prouve chaque jour que je suis un chien (type staff) extraordinaire qui ne demande qu\'à être aimé. J\'adore apprendre, jouer avec des copains et faire de longues balades. Je suis castré et je suis très doux avec les enfants et adore leur compagnie.', '2019-01-01', 16, 3),
(198, 'Tagada', 1, '31646478840.jpg', 'Mes anciens maitres n\'avaient plus assez de temps pour s\'occuper de nous. Je suis encore un cochon d\'inde un peu timide comparé à mes copines Sofie et Nébulla, je viens moins facilement et j\'ai tendance à fuir la main de l\'homme (sauf si on me donne des friandises évidemment !)', '2018-01-01', 15, 5),
(199, 'Rize', 0, '31646478893.jpg', 'Mon ancien maitre n\'avait plus le temps de s\'occuper de moi et de mon frère Pépino. Je suis un cochon d\'inde un peu timide au début, mais je suis gourmand et paresseux.', '2021-02-01', 15, 5),
(201, 'Akira', 1, '31646486326.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Je suis assez discrète dans ma cage, je suis cependant de plus en plus curieuse et aventurière, je suis la première à avoir osé sortir de ma cage toute seule.', '2021-07-01', 15, 5),
(202, 'Vicky', 1, '31646486395.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-01-10', 15, 5),
(203, 'Tanie', 1, '31646486467.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-01-10', 15, 5),
(204, 'Pépine', 1, '31646486546.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-01-11', 15, 5),
(205, 'Riley', 1, '31646486611.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(206, 'Jilika', 1, '31646486796.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(207, 'Nalla', 0, '31646486852.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(210, 'Lovely', 1, '31646487296.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(211, 'Vanity', 1, '31646487382.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(212, 'Uzelle', 1, '31646487426.jpg', 'Suite à un signalement, des trappages ont été organisés afin de me mettre en sécurité, moi et mes copains avons sans doute été jetés par notre ancien propriétaire qui s&#039;est laissé débordé, nous étions 15 rats sur place, des mâles comme des femelles... Mon caractère est encore à définir, pour le moment je ne suis qu&#039;un bébé, je suis  donc très &quot;souples&quot;, un peu joueuse, très sociable avec mes congénères, curieuse mais timide au premier abord.', '2022-02-04', 15, 5),
(215, 'Louise', 1, '31646488651.jpg', 'Je suis une puce très à l\'aise dans mes pattes, sociable, joueuse et câline. Je suis habituée aux chiens et aux autres chats. Mes futurs adoptants ayant déjà un chat seront prioritaires.', '0001-01-01', 16, 2),
(216, 'Shirazi', 1, '31646666690.jpg', 'Je suis une minette persane de 2 ans, très câline, une joueuse adorable. Je recherche une nouvelle famille, suite au déménagement professionnel de ma maîtresse à l\'étranger.', '2020-01-01', 14, 2),
(217, 'Wendy', 1, '31646666860.jpg', 'J\'ai été abandonné par mon propriétaire, je n\'aime pas être attrapée, comme beaucoup de cochon d\'inde, mais je m\'adapte très rapidement au sein d\'un nouvel environnement. Je suis en cours de traitement contre la teigne.', '2021-06-01', 15, 5),
(218, 'Ayla', 1, '31646666938.jpg', 'Ma maman Wendy est arrivée gestante au refuge. Je suis une petite chipie très bavarde et gloutonne.', '2021-10-10', 15, 5),
(219, 'Scrat', 0, '31646682978.jpg', 'Je suis très câlin, avenant, j\'ai tendance à suivre mon maître partout dans la maison. J\'ai mes petits moments de folie, où je joue comme un fou. Mais j\'ai un tempérament général plutôt calme. J\'adore les séances télé dans le canapé.', '2022-01-01', 14, 2),
(220, 'Kichta', 0, '31647169888.jpg', 'Je suis un jeune chat de 10 mois. De nature plutôt cool, avenant, j\'apprécie les papouilles. Je sais ce que je veux, et je suis un gourmand. Je m\'entends bien avec les autres chats et les chiens.', '2021-07-01', 14, 2),
(221, 'Ficelle', 2, '31647170020.jpg', 'Je suis un serpent des blés et je mesure environ 30 cm. Je suis carnivore, je mange des souris une fois à deux fois par semaine. Je vis dans un terrarium semi arboricole. J\'aime pouvoir me cacher et me balader dans le terrarium car je suis semi-arboricole.', '2022-01-01', 12, 6),
(226, 'Ako', 0, '31647280085.jpg', 'Je suis un croisé terrier âgé de 4 mois. Je suis arrivé à l’association car ma famille ne pouvait plus s’occuper de moi.', '2022-01-01', 17, 3),
(227, 'Xena', 1, '31647280303.jpg', 'Je suis un croisé terrier âgé de 3 ans environ. Je suis une chienne très gentille mais timide. Il me faudra du temps avant de venir vers vous pour venir chercher de l’affection. Cependant une fois sur en confiance tout va très bien.', '2019-01-01', 17, 3),
(229, 'Bachus', 0, '31647280463.jpg', 'Je suis un jeune chien de 60kg, un berger des carpates, arrivé de Roumanie, j\'ai acquis ici les ordres de bases. J\'ai un très fort instinct de protection : il m\'est impossible d\'accepter la présence d\'un inconnu sur mon terrain. Je déborde d\'affection et d\'énergie avec les personnes que je connais, je sais me montrer obéissant et j\'aime les grands espaces. J\'aime être avec d\'autres chiens, mâles, femelles, chiots, et j\'aime aussi être seul. Je ne suis pas fugueur ni destructeur. Je suis habitué à vivre en maison, comme a l\'extérieur.', '2021-01-01', 17, 3),
(230, 'Lila', 1, '31647280549.jpg', 'Je suis une croisée terrier âgée d’un an, je suis une chienne gentille, attachante et affectueuse avec l’humain et les enfants. J\'aime les autres chiens et les autres chats qui viennent se présenter à moi. Je suis vaccinée et stérilisée.', '2021-03-01', 17, 3),
(232, 'Futé', 0, '11647285647.jpg', 'Je suis un gentil chien, croisé berger x labrador, plein d’amour qui ne demande que de l’attention. J\'aime les autres chiens mais je ne connais pas encore les chats. Cependant j\'ai encore un peu de travail au niveau de ma propreté et de mon éducation (rappel, marche en laisse)', '2021-01-01', 17, 3),
(233, 'Nessy', 1, '31647291198.jpg', 'Je suis un croisé braque âgée de 4 mois. Je suis une jeune chienne très gentille avec tout le monde. Je ne m\'entends cependant pas avec les poules. J\'aime les chiens, les chats et les humains.', '2022-01-01', 17, 3),
(234, 'Aria', 1, '11647425036.jpg', 'J\'ai eu l\'espoir d\'avoir trouvé ma famille, mais 2 jours avant de devenir me chercher la famille a annulé donc j\'attends toujours ma famille pour la vie. Je suis une chienne très gentille, j\'aime les enfants et je demande beaucoup d\'affection. Mon jouet préféré, ce sont les boules de pétanque ! Je peux passer des heures entières à jouer avec. Je peux cohabiter avec un chat !  Je suis à jour dans mes vaccins (stérilisée et décatégorisée).', '2019-01-01', 17, 3),
(235, 'Sweety et Margotte', 1, '11647425174.jpg', 'Nous sommes deux copines de misère, Sweety 10 mois (grise et blanche) et Margotte 6 mois (noire et blanche). Je joue la grande sœur rassurant la plus jeune. D’un naturel très sociable, je suis proche de l’humain : j\'aime aussi bien faire de grandes parties de jeux avec vous que venir me blottir tout contre vous dans le canapé. J\'aime également jouer avec les autres chats, en particulier avec Margotte. Quant à moi, je suis une petite puce timide. Cela ne m’empêche pas de venir vous réclamer des câlins et d’apprécier aussi les grandes parties de jeux. Nous nous entendons à merveille, nous partageons jeux et câlins tout au long de la journée.', '2022-01-01', 13, 2),
(236, 'Cachou et Tofu', 0, '11647425411.jpg', 'Après une bien mauvaise expérience dans une première famille d’accueil, nous avons rejoint une famille au grand cœur qui a pris soin de nous mettre en confiance.\nUne fois à l’aise, c’est avec plaisir que nous nous sommes mis à jouer comme de vrais chatons plein de vie ! Et les bêtises ont commencé : renverser les chaises, ouvrir le robinet, essayer de dévorer les chaussures… On peut dire qu’on en fait voir de toutes les couleurs à notre FA ! Mais avec nos petites bouilles d’amour, il est impossible de nous en vouloir.                                                                                             Moi, Cachou, grand intrépide, je n’ai pas froid aux yeux. J\'apprécie particulièrement les chiens pour jouer avec eux, même si je me méfie des gestes brusques. J\'apprécie beaucoup les câlins, je me laisse porter sans soucis.                                                                                                                                                                         Moi, Tofu : je me dévoile petit à petit… Je suis plus timide et sur la réserve que mon frère, sans forcément avoir réellement peur… je me contente au départ d’observer. Mais la présence de mon frère m\'apporte une confiance dont j\'ai besoin pour me révéler et avec un peu de temps, je me transforme moi aussi en chat très câlin.', '2020-03-10', 11, 2),
(237, 'Voldemort', 0, '11647425499.jpg', 'Je suis un python royal de phase pinstripe et je mesure 1m20. Je suis carnivore, je mange une souris tous les 15 jours. Mon caractère calme et craintif fait de moi un serpent facile à manipuler même si on n\'a pas beaucoup d\'expérience. J\'ai été mordu par un humain. J\'ai perdu une partie de ma mâchoire, je ne peux pas manger de proie trop grosse et je mue difficilement. Je proviens de milieu de savane (Afrique de l\'Ouest et Central) et j\'ai besoin d\'un environnement chaud. J\'aime pouvoir me cacher et me balader dans le terrarium.', '2017-01-01', 12, 6),
(238, 'Groots', 0, '11647425581.jpg', 'Je suis un jeune chat âgé de 2 ans, je suis très très joueur ! Si vous aimez les parties de jeux alors je suis le chat qu’il vous faut. Je suis habitué à sortir, il me faudra donc un accès jardin ou terrasse. Les jeunes enfants et moi ne font pas très bon ménage quand je joue je deviens un peu foufou. Je suis identifié par puce électronique, primo-vacciné, déparasité, vermifugé et castré.', '2020-01-01', 14, 2),
(240, 'Vaiana', 1, '11647425770.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(241, 'Belle', 1, '11647425812.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(242, 'Jasmine', 1, '11647425853.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(243, 'Merida', 0, '11647425898.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(244, 'Mulan', 1, '11647425940.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(245, 'Tiana', 1, '11647425980.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(246, 'Aurore', 1, '11647426295.jpg', 'Je suis une femelle croisés terrier, issue d\'une portée non voulue, j\'ai été confiés à l\'association avec mes neuf sœurs. Je suis identifiée, vaccinée et déparasitée. Il faudra prévoir de me faire stériliser.', '2022-01-01', 17, 3),
(247, 'Liza', 1, '11647694854.jpg', 'Je suis une jolie minette qui était chez une famille et comme je n\'étais pas stérilisée ce qui devait arriver, arriva, j\'ai mis au monde 5 chatons ! Mon maitre a donc appelé à la rescousse l\'association EMÂ et nous avons été placés chez une Familles d\'Accueil où mes chatons resteront avec moi jusqu\'à leurs 3 mois au minimum. Une fois ce délai passé, aux alentours de début avril, je pourrais à mon tour, rejoindre une famille pour la vie. Je suis une chatte \"extrêmement bavarde et qui adore roucouler\" selon les dires de ma Famille d\'Accueil et qui est, en plus de cela, très gourmande  !  J\'adore les caresses mais pour ce qui est d\'être portée, il faudra repasser... Je pourrais être accueillie dans un foyer avec un extérieur à condition qu\'une période d\'adaptation sérieuse soit bien respectée pour éviter que je fugue. La présence de chiens m\'est inconnue. Mais je m\'entends très bien avec les enfants. Je serais identifiée par puce électronique, stérilisée, testée FIV/FELV, vaccinée TC et déparasitée.', '2020-08-01', 18, 2),
(248, 'Moutarde', 1, '11647694999.jpg', 'Je suis très calme et douce tout l\'opposé de ma sœur Galette ! Encore craintive, j\'ai plus de mal à accorder ma confiance mais, je fais d\'énormes progrès depuis que je suis chez ma Famille d\'Accueil !\nDiscrète, j\'ai besoin pour mon bien-être, un foyer calme et sans jeunes enfants car je suis encore à l\'affût des bruits. \nPetit à petit, je réclame de plus en plus de caresses et me laisse porter mais jamais trop longtemps. \nJe porte bien mon nom car je suis une vraie gourmande, lorsque ma Famille d\'Accueil passe à table, j\'apparais et viens m\'asseoir à ma place habituelle au cas où, sur un malentendu, un petit bout de quelque chose venait à s\'échapper d\'une assiette ... \nJe pourrai être accueillie dans un foyer avec un extérieur à condition qu\'une période d\'adaptation sérieuse soit bien respectée pour éviter que je fugue.', '2021-05-25', 18, 2);
INSERT INTO `animal_a_adopter` (`idanimal_a_adopter`, `nom`, `sexe`, `photo`, `description`, `date_anniversaire`, `refuge_idrefuge`, `idtype`) VALUES
(249, 'Caprice', 1, '11647695095.jpg', 'Je suis une jeune chatte dont la propriétaire a été hospitalisée. Placées en Famille d\'Accueil avec ma sœur, nous avons toutes les deux développé un coryza très important. Après plusieurs jours d\'hospitalisation, Noisette n\'a pas survécu et moi, j\'ai perdu mes yeux à cause d\'un herpès oculaire ... \nAujourd\'hui, je suis prête à rejoindre une famille d\'adoption où couler de longs jours heureux ! \nJe suis très gentille et malgré mon handicap je me déplace bien et me laisse guider par le son de la voix. Je réponds même à mon nom et monte sur les meubles pour chaparder quelques croquettes ! \nJe pourrai être accueillie dans un appartement ou dans une maison mais sans accès à l\'extérieur.', '2020-01-01', 18, 2),
(251, 'Galette', 1, '11647695184.jpg', 'Je suis une jeune chatte très curieuse, active et qui m\'intéresse à tout ce que fait ma Famille d\'Accueil. Je suis la première à venir dire bonjour lorsqu\'on se lève, je monte la garde devant la porte de la douche et je suis bien sûr la première à regarder ce qui passe la porte lorsqu\'on rentre du travail. Mon péché mignon : regarder les oiseaux par la fenêtre et m\'allonger sur les jambes pour une petite sieste. \nJe réponds lorsqu\'on me parle et j\'aime être le centre de l\'attention. Et même si on parle à ma sœur, Moutarde, je viens pour écouter ce qui se dit. Ma Famille d\'Accueil a fait un travail incroyable de sociabilisation ! Mais il vous faudra tout de même être patient avec moi et ne rien forcer,  car c\'est qui décide. Je suis une chatte qui aura besoin d\'espace pour être totalement épanouie. Je pourrais être accueillie dans un foyer avec un extérieur à condition qu\'une période d\'adaptation sérieuse soit bien respectée pour éviter que je fugue. Je m\'entends bien avec les enfants calmes, mais je ne connais pas encore ma réaction en présence de chiens.', '2021-05-25', 18, 2),
(252, 'Pétula', 1, '11647713510.jpg', 'Je suis Pétula ! J\'ai rejoint l\'APAC le 16 octobre 2019, après avoir vécu trois ans dans la rue. L\'association a également pris en charge deux de mes portées. Je craignais l\'humain à mon arrivée, mais j\'ai réussi à surmonter ce handicap. J\'ai maintenant besoin qu\'on me montre que je peux avoir confiance.', '2016-11-26', 19, 2),
(253, 'Ramsès', 0, '11647713639.jpg', 'Moi c\'est Ramsès, j\'ai rejoint l\'APAC le 16 juin 2020 avec mon frère Rafi. Ce dernier ayant perdu une partie de la vue, Je lui ai servi de guide. Je suis donc à adopter avec lui ! Nous avons été attrapés par une autre association, puis ont a été accueillis par l\'APAC. Je suis un chat peureux, j\'aurai besoin de temps pour accorder ma confiance.', '2020-01-14', 19, 2),
(254, 'Beptie', 1, '11647713723.jpg', 'Je suis une adorable chienne de type Bichon Havanais, ayant déjà eu deux portées en un an. Je suis très douce, gentille, affectueuse, voire pot de colle, j\'aurais besoin de compagnie permanente, et de me sentir aimée et entourée. Depuis ma prise en charge par l\'association, j\'ai retrouvé une seconde jeunesse. Ainsi, j\'aime beaucoup les promenades et notamment courir avec mes congénères. Je suis néanmoins intimidée par les chiens de grande taille type Berger Allemand. Je suis en revanche habituée aux chats. Je suis une chienne très intelligente avec une sensibilité à fleur de peau.', '2016-08-23', 19, 3),
(255, 'Rafi', 0, '11647713796.jpg', 'J\'ai rejoint l\'APAC le 16 juin 2020 avec mon frère Ramsès. Suite à ma prise en charge, mon oeil droit a été sauvé in extremis, mais j\'ai tout de même perdu une partie de la vue. À mon arrivée, mon frère me servait de guide, je serais donc à adopter avec lui. Nous avons été attrapés par une autre association, puis nous avons a été accueillis par l\'APAC. Je suis un chat sociable, qui cherche le contact !', '2020-01-14', 19, 2),
(256, 'Jacky', 0, '11647713878.jpg', 'Moi c\'est Jacky, un caniche croisé Griffon, actuellement hébergé en famille d\'accueil longue durée. Je suis un gentil chien qui finira probablement ma vie au sein de ce foyer, étant donné mon âge avancé. Je commence d\'ailleurs à développer une cataracte. Au départ chien errant, Je suis devenu un véritable chien de famille !', '2007-01-01', 19, 3),
(257, 'Rajna', 0, '11647713941.jpg', 'J\'ai rejoint l\'APAC le 23 septembre 2020, accompagnée de mon frère Rio, nous avons été trouvés dans une cave complètement insalubre. Je suis un amour de chatte, très tendre, câline et joueuse. Je ne me sépare jamais de mon frère, nous sommes donc à adopter ensemble.', '2020-09-01', 19, 2),
(258, 'Nola', 1, '11647720228.jpg', 'Je suis une minette de 2 ans plutôt calme, j\'apprécie les câlins que je sais venir réclamer, que ce soit avec les adultes ou les enfants. J\'ai quand même mon petit quart d\'heure de folie où je suis contente de jouer à ce moment-là.  Je suis une gourmande également qui vient discrètement quémander lorsque l\'occasion se présente. Prête pour départ : identifiée par puce électronique, vaccinée, stérilisée.', '2020-03-01', 14, 2),
(259, 'Soly', 0, '11647721820.jpg', 'Moi c\'est Soly, je suis le petit Loulou de la belle Spinelle. Je suis né à l’association avec ma sœur Shira. Je suis un jeune mâle avec un bon caractère, je suis doux, assez câlin et joueur.', '2021-02-01', 19, 2),
(260, 'Seiko', 0, '11647721980.jpg', 'Je suis le fils de Saphyre, je suis né au refuge avec mes trois frères et sœurs, dont Sunny.\nJe suis un jeune chat très attachant, câlin et joueur.', '2021-03-29', 19, 2),
(261, 'Sunny', 0, '11647722036.jpg', 'Je suis Sunny  le fils de Saphyre, je suis né au refuge avec mes trois frères et sœurs, dont Seiko.\nJe suis un jeune chat très attachant, câlin et joueur.', '2021-03-29', 19, 2),
(262, 'Sanka', 0, '11647722124.jpg', 'J\'ai intégré l\'APAC accompagné de ma mère Strass et de mes 3 frères et sœurs Shanelle, Shana et Safran, alors que nous étions âgés que de quelques jours... Nous avons été trouvés dans la cave d\'un immeuble.\nJe suis un adorable chat, très câlin et joueur et j\'attends de trouver ma nouvelle famille !', '2021-05-15', 19, 2),
(263, 'Shana', 1, '11647722315.jpg', 'J\'ai intégré l\'APAC accompagnée de ma mère Strass et de mes 3 frères et sœurs Shanelle, Sanka et Safran, alors que nous étions âgés que de quelques jours... Nous avons été trouvés dans la cave d\'un immeuble.\nToute comme ma sœur, je suis encore timide et j\'aurai besoin d\'être mise en confiance avec vous, afin de dévoiler ma tendresse.', '2021-05-15', 19, 2),
(264, 'Oreo', 0, '11647787153.jpg', 'Je suis une Border Collie de 9 ans à la recherche d\'une nouvelle famille adoptive (sous contrat associatif). Suite au décès de mon maître je me suis retrouvé tout seul.\nJe suis un chien calme, je me dépense peu mais j\'ai tout de même besoin d’une maison avec extérieur. Je suis castré et m’entends parfaitement avec les enfants.\nIl est préférable pour moi d\'avoir une famille présente est disponible.', '2013-05-16', 19, 3),
(266, 'Twist', 0, '11647787330.jpg', 'J\'ai été récupéré en mars, car j\'« errais» sous l’escalier principal d’une maison achetée par de nouveaux acquéreurs. Après recherches, il s’avère que les anciens propriétaires ont déménagé mais n’ont pas daigné me prendre avec eux…\nJe suis maintenant castré, vacciné et vermifugé, cependant j\'ai été déclaré FIV positif. Ce n’est absolument pas dangereux et ne se transmet pas à l’humain. Je peux également être en présence d’autres chats si tous sont bien stérilisés et qu’ils ne sortent pas. Il n’y a pas de frais médicaux à prévoir car la maladie n’est à ce jour, pas déclarée.\nJe suis incroyablement doux et gentil, demandeur de câlins à chaque instant.', '2016-07-01', 19, 2),
(267, 'Spinelle', 1, '11647787396.jpg', 'J\'ai été retrouvé dans les caves d’un immeuble, grace au passage d’habitants qui contrôlaient les dégâts des eaux suite à des inondations du bâtiment. Ils m’ont retrouvé gestante et m’ont donc déposé chez le vétérinaire.\nL’APAC m’a prise en charge le 23 juin 2021 et après une petite quarantaine, J\'ai mis bas 2 chatons Shira et Soly, le 7 juillet 2021.\nJe suis une chatte indépendante, aimant les câlins en petite quantité et j\'ai besoin de calme (pas de jeunes enfants).', '2018-02-10', 19, 2),
(268, 'Rio', 0, '11647787884.jpg', 'J\'ai rejoint l\'APAC 20 jours après ma naissance accompagnée de ma sœur Rajna, après qu\'on ait été trouvés dans une cave complètement insalubre. Je suis un amour de chat, très tendre, câlin et joueur. Je suis inséparable de Rajna, nous sommes donc à adopter ensemble.', '2020-09-02', 19, 2),
(269, 'Riley', 1, '11647790189.jpg', 'J\'ai rejoint l\'APAC accompagnée de Rikita, ma maman, ainsi que de mes deux frères Rory et Robyn. Notre petite famille vivait auparavant dans la rue. J\'étais tout d\'abord très timide, mais je prends confiance en moi de jour en jour, et je me dévoilerais très câline et joueuse une fois au sein d\'un foyer rassurant.', '2020-09-02', 19, 2),
(270, 'Sullivan', 0, '11647790288.jpg', 'J\'ai été trouvé abandonné dans un sac de courses avec mes frères et sœurs Shelby, Swan et Stella, alors qu\'on venait d\'être arrachés à notre mère… Fortement perturbés par la perte de notre maman, nous avons d\'abord refusé de nous alimenter, et nous avons beaucoup inquiété les bénévoles. Néanmoins, avec de la patience et beaucoup d\'amour, nous avons finalement accepté de prendre le biberon, puis progressivement nous nous sommes alimenté seuls.\nAujourd\'hui, il est temps pour nous de trouver une famille pour la vie. Je suis un chaton très sociable, joueur et câlin.', '2021-05-10', 19, 2),
(271, 'Shelby', 1, '11647790404.jpg', 'J\'ai été trouvé abandonné dans un sac de courses avec mes frères et sœurs Sullivan,Swan et Stella, alors qu\'on venait d\'être arrachés à notre mère… Fortement perturbés par la perte de notre maman, nous avons d\'abord refusé de nous alimenter, et nous avons beaucoup inquiété les bénévoles. Néanmoins, avec de la patience et beaucoup d\'amour, nous avons finalement accepté de prendre le biberon, puis progressivement nous nous sommes alimenté seuls.\nAujourd\'hui, il est temps pour nous de trouver une famille pour la vie. Je suis un chaton très sociable, joueur et câlin.', '2021-05-10', 19, 2),
(272, 'Swan', 0, '11647790480.jpg', 'J\'ai été trouvé abandonné dans un sac de courses avec mes frères et sœurs Sullivan, Shelby et Stella, alors qu\'on venait d\'être arrachés à notre mère… Fortement perturbés par la perte de notre maman, nous avons d\'abord refusé de nous alimenter, et nous avons beaucoup inquiété les bénévoles. Néanmoins, avec de la patience et beaucoup d\'amour, nous avons finalement accepté de prendre le biberon, puis progressivement nous nous sommes alimenté seuls.\nAujourd\'hui, il est temps pour nous de trouver une famille pour la vie. Je suis un chaton très sociable, joueur et câlin.', '2021-05-10', 19, 2),
(273, 'Roussette', 1, '11647896115.jpg', 'J\'ai rejoint l\'APAC le 3 juin 2020, après avoir été trouvée à Champigny alors que je venais de donner naissance à 4 chatons. Un de mes petits était déjà décédé au moment de la prise en charge, puis deux autres nous ont quittés à notre arrivé au refuge. Roucky, le seul survivant, est un miraculé, et a été adopté en mai 2021.  A mon arrivé, je présentais de mauvaises constantes, et mon pronostic vital était engagé. Jeune chatte timide, j\'ai vécu un passé difficile, mais une fois en confiance, je deviens alors très affectueuse et câline.', '2018-06-06', 19, 2),
(274, 'Suzie', 1, '11647896314.jpg', 'J\'ai rejoint l\'APAC le 8 janvier 2021, après que mon frère ait été gardé par les personnes les ayant trouvés. Je suis une chatte très sociable, mais je suis également très malicieuse. Je sais ce que je veux, et j\'ai bien compris que la meilleure manière de parvenir à mes fins était en usant de câlins. Je suis joueuse, et très affectueuse.', '2020-07-15', 19, 2),
(275, 'Lana', 1, '11647896411.jpg', 'Je suis une jeune minette de 10 mois, très câline. J’adore ça et je ronronne très fort ! J’aime aussi jouer, surtout avec les jouets qui pendouillent ou quand on agite le plumeau. Un peu timide au premier abord quand je ne connais pas la personne, mais je m’adapte rapidement une fois en confiance. Je partirais identifiée par puce électronique, primo-vaccinée, déparasitée, vermifugée et stérilisée.', '2021-06-01', 14, 2),
(276, 'Soko', 0, '11648023031.jpg', 'J\'ai été retrouvé avec ma sœur  Shiva dans la rue alors que nous venions tout juste de naître. Dans la rue, nous n\'avions aucune chance de survivre. Heureusement, l\'association APAC nous a présentés  à une chatte du refuge, Saphyre, qui avait mis bas 36 jours auparavant. Malgré cet écart d\'âge significatif, la chatte nous a accepté, nous avons donc rejoint les chatons de la portée. Je suis un jeune chat très sociable, câlin et joueur.', '2021-05-05', 19, 2),
(277, 'Shiva', 1, '11648023090.jpg', 'J\'ai été retrouvée avec ma frère Soko dans la rue alors que nous venions tout juste de naître. Dans la rue, nous n\'avions aucune chance de survivre. Heureusement, l\'association APAC nous a présentés  à une chatte du refuge, Saphyre, qui avait mis bas 36 jours auparavant. Malgré cet écart d\'âge significatif, la chatte nous a accepté, nous avons donc rejoint les chatons de la portée. Je suis un jeune chatet très sociable, câlin et joueur.', '2021-05-05', 19, 2),
(278, 'Tina', 1, '11648023210.jpg', 'Abandonnée par mes anciens propriétaires, j\'ai été retrouvée en pleine nature avec un petit peu de nourriture et ma litière sur laquelle était inscrite « Ma nouvelle maison »… \nJ\'ai d’abord été recueillie une dizaine de jours par une passante qui m’avait retrouvé dehors, avant la prise en charge de l’APAC.\nJ\'ai été placé en famille d’accueil chez une des bénévoles, afin que je puisse reprendre des forces car j\'étais très maigre, que je puisse être soignée et surtout bénéficier d’un cadre de vie convenable en attendant de trouver ma nouvelle famille définitive. Je suis adorable, incroyablement douce et câline.', '2018-07-01', 19, 2),
(280, 'Reed', 0, '11648023405.jpg', 'Moi c\'est Reed je suis très joyeux et joueur, je suis un bébé dans un corps d\'adulte.\nSociable et câlin, je suis de bonnes bases d\'éducation qu\'il faudra continuer à entretenir avec douceur et bienveillance.\nJe suis décatégorisé et stérilisé. Je m\'entends bien avec mes congénères et les enfants.\nJe n\'ai pas d\'éducation coercitive.', '2021-01-01', 16, 3),
(281, 'Razel', 1, '11648023564.jpg', 'J\'ai rejoint l\'APAC le jour même de ma naissance accompagnée de ma sœur Rutie. Je suis une jeune chatte a super bon caractère et câline, malgré un petit côté solitaire.', '2020-08-22', 19, 2),
(282, 'Chimuelo', 0, '11648025081.jpg', 'Je suis un ado beau, joueur, sociable et équilibré. Mon prénom vient du nom espagnol de Krokmou du film d’animation Dragons !  Je suis un ado de 15 mois, aussi beau que gentil. Bien dans mes pattounes, j\'adore jouer, interagir avec les humains et réponds quand vous m’appelez… Je suis un peu un chat/chien, le compagnon idéal d’un foyer avec ou non des enfants (mais pas en bas âge). Côté entente d’après mes anciens propriétaires je serais ok chat mais pas chien.  Je suis actuellement en accueil sans autres animaux et visible à Paris 8ème.  Je suis proposé à l’adoption : identifié (puce électronique), stérilisé,  testé négatif FiV/Felv, primo-vacciné (typhus/coryza) et déparasité (vers/puces).', '2021-01-01', 13, 2),
(283, 'Caligula', 1, '11648025254.jpg', 'Je suis une petite puce vive, sociable, câline et énergique.\nAvec ma silhouette longiligne, ma belle robe lilas et mes yeux d’un bleu presque translucide,  je suis réellement très jolie ! De mon papa siamois j\'ai tout le caractère : vive, curieuse et pleine d’énergie.  Je cours partout et me faufile entre vos jambes au risque de vous faire tomber. Je suis une grande joueuse vous rapportant les balles ou autres jouets afin de poursuivre des parties de jeux sans fin. J\'aime les grands espaces et adore jouer avec un autre chat (faire de grandes courses poursuites notamment). Je réponds quand vous l’appelez par un petit miaulement et viens vous retrouver. J\'adore vous accueillir en se frottant contre vous tout en ronronnant. J\'aime venir vous retrouver sur le canapé faire une petite sieste près ou sur vous et le soir dormir à vos côtés. Je suis douce et sensible. Pour mon épanouissement, je recherche un foyer  vivant dans un grand appartement  (minimum 75 m2) ou une maison, avec un extérieur impérativement bien sécurisé pour les chats (terrasse, jardin, cour…), sans enfants en bas âge, et si possible avec un copain chat joueur comme moi ou avec une forte présence humaine afin de se dépenser et jouer. Je suis âgée de 7 mois et vous pouvez me retrouver à Paris 16ème sous l’association Adopte un Matou. Je suis proposée à l’adoption : identifiée, primo-vaccinée, stérilisée, négative FiV/Felv et déparasitée (vers/puces).', '2021-09-01', 13, 2),
(284, 'Sweet', 0, '11648204503.jpg', 'Né prématuré, j\'ai été sauvé in extremis de la mort avec mes 2 autres frère et sœur. Aux premières heures de nos vies dans la rue, nous avons eu un coup de froid. L\'association APAC nous a soignés et nous a fait donner des injections. Aujourd’hui je suis en excellente santé, je suis très joueur et je réclame beaucoup de caresses.', '2021-07-04', 19, 2),
(285, 'Sandy', 1, '11648204591.jpg', 'Né prématuré, j\'ai été sauvé in extremis de la mort avec mes 2 autres frères. Aux premières heures de nos vies dans la rue, nous avons eu un coup de froid. L\'association APACE nous a soignés et nous a fait donner des injections. Aujourd’hui je suis en excellente santé et je réclame beaucoup de caresses.', '2021-07-04', 19, 2),
(286, 'Shakira', 1, '11648204673.jpg', 'J\'ai subi un grave traumatisme il y a 1 an… Originaire de La Réunion où j\'ai mis bas, je suis arrivée en France après 14 heures de vol en cale avec mes bébés âgés de 5 mois, tous en cages de transport. À peine arrivée à l’aéroport, je me suis vue arracher mes bébés qui ont été remis à différentes familles adoptives, j\'étais émotionnellement très affectée et désorientée. Après différentes et malheureuses péripéties, l’APAC m\'a pris en charge en mai 2021.\nD’abord très peureuse, je me montrais craintive voir agressive, ce qui est un comportement normal après ce que j\'ai vécu. L\'association a commencé tout un travail de familiarisation et avec de la patience, ils m\'ont finalement rassuré et m\'ont redonné confiance en l’Homme.\nIl me faudra donc sans surprise, un petit temps d’adaptation pour avoir confiance en vous également.', '2021-04-15', 19, 2),
(287, 'Sky', 0, '11648204723.jpg', 'Je fais partie d\'une portée de 5 chatons nés chez un particulier à Chennevières. \nJe suis une pure boule d\'amour, tout comme le reste de la portée. Nous sommes des chatons bien dans leurs pattes, très joueurs et surtout en grande demande d\'affection.', '2021-07-01', 19, 2),
(288, 'Safran', 0, '11648204792.jpg', 'J\'ai intégré l\'APAC accompagné de ma mère Strass et de mes 3 frères et sœurs Shanelle, Shana et Sanka, alors que nous étions âgés que de quelques jours... Nous avons été trouvés dans la cave d\'un immeuble. Je suis un gentil chat encore timide, mais qui se dévoilera une fois mis en confiance dans mon nouveau foyer.', '2021-05-15', 19, 2),
(289, 'Shanelle', 0, '11648204850.jpg', 'J\'ai intégré l\'APAC accompagnée de ma mère Strass et de mes 3 frères et sœurs Shana, Sanka et Safran, alors que nous étions âgés que de quelques jours... Nous avons été trouvés dans la cave d\'un immeuble. Je suis encore timide et j\'aurais besoin d\'être mise en confiance avec vous, afin de dévoiler ma douceur.', '2021-05-15', 19, 2);

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
(74, 1),
(76, 1),
(79, 1),
(82, 1),
(87, 1),
(88, 1),
(94, 1),
(99, 1),
(111, 1),
(147, 1),
(151, 1),
(152, 1),
(154, 1),
(155, 1),
(156, 1),
(160, 1),
(161, 1),
(162, 1),
(169, 1),
(197, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(210, 1),
(211, 1),
(212, 1),
(215, 1),
(216, 1),
(234, 1),
(235, 1),
(236, 1),
(238, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(280, 1),
(282, 1),
(284, 1),
(287, 1),
(54, 2),
(103, 2),
(108, 2),
(109, 2),
(230, 2),
(234, 2),
(247, 2),
(264, 2),
(280, 2),
(59, 3),
(76, 3),
(79, 3),
(85, 3),
(91, 3),
(95, 3),
(122, 3),
(145, 3),
(229, 3),
(238, 3),
(251, 3),
(264, 3),
(283, 3),
(64, 4),
(85, 4),
(86, 4),
(92, 4),
(95, 4),
(122, 4),
(42, 5),
(51, 5),
(67, 5),
(69, 5),
(79, 5),
(88, 5),
(91, 5),
(145, 5),
(147, 5),
(153, 5),
(157, 5),
(163, 5),
(183, 5),
(185, 5),
(195, 5),
(197, 5),
(215, 5),
(216, 5),
(218, 5),
(219, 5),
(220, 5),
(230, 5),
(232, 5),
(233, 5),
(234, 5),
(235, 5),
(236, 5),
(247, 5),
(248, 5),
(249, 5),
(251, 5),
(252, 5),
(254, 5),
(255, 5),
(257, 5),
(258, 5),
(259, 5),
(260, 5),
(261, 5),
(262, 5),
(266, 5),
(268, 5),
(269, 5),
(270, 5),
(271, 5),
(272, 5),
(273, 5),
(274, 5),
(275, 5),
(276, 5),
(277, 5),
(278, 5),
(280, 5),
(283, 5),
(284, 5),
(285, 5),
(287, 5),
(160, 6),
(197, 6),
(227, 6),
(254, 6),
(281, 6),
(66, 7),
(82, 7),
(84, 7),
(90, 7),
(97, 7),
(104, 7),
(110, 7),
(146, 7),
(267, 7),
(64, 8),
(66, 8),
(68, 8),
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
(122, 8),
(130, 8),
(135, 8),
(146, 8),
(150, 8),
(151, 8),
(152, 8),
(159, 8),
(164, 8),
(171, 8),
(180, 8),
(181, 8),
(191, 8),
(219, 8),
(221, 8),
(226, 8),
(235, 8),
(237, 8),
(248, 8),
(253, 8),
(256, 8),
(263, 8),
(264, 8),
(266, 8),
(267, 8),
(273, 8),
(286, 8),
(288, 8),
(289, 8),
(42, 9),
(45, 9),
(51, 9),
(54, 9),
(59, 9),
(69, 9),
(74, 9),
(76, 9),
(88, 9),
(91, 9),
(99, 9),
(111, 9),
(154, 9),
(155, 9),
(159, 9),
(163, 9),
(164, 9),
(165, 9),
(166, 9),
(170, 9),
(171, 9),
(174, 9),
(175, 9),
(176, 9),
(177, 9),
(179, 9),
(180, 9),
(181, 9),
(182, 9),
(183, 9),
(184, 9),
(185, 9),
(186, 9),
(188, 9),
(190, 9),
(191, 9),
(198, 9),
(199, 9),
(201, 9),
(202, 9),
(203, 9),
(204, 9),
(205, 9),
(206, 9),
(207, 9),
(210, 9),
(211, 9),
(212, 9),
(215, 9),
(217, 9),
(229, 9),
(233, 9),
(253, 9),
(255, 9),
(268, 9),
(270, 9),
(271, 9),
(272, 9),
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
(99, 10),
(111, 10),
(145, 10),
(169, 10),
(172, 10),
(173, 10),
(198, 10),
(199, 10),
(240, 10),
(241, 10),
(242, 10),
(243, 10),
(244, 10),
(245, 10),
(246, 10),
(249, 10);

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
  `fk_idcategorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `resume`, `texte1`, `url_image`, `description_photo`, `texte2`, `date_publication`, `fk_idcategorie`) VALUES
(1, 'Pas de salon du cheval !', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois dû aux conditions sanitaires.', 'Le salon du cheval de Paris qui devait avoir lieu du 11 au 17 Octobre 2021 est annulé pour la seconde fois dû aux conditions sanitaires.\r\n', 'article_1.jpg', 'Photo de Jean van der Meulen provenant de Pexels', 'Dans un communiqué rendu public, l’équipe du salon du cheval de Paris explique et justifie sa décision : \r\n\r\n<em>“Si le vaccin permet aujourd\'hui une amélioration, bien des doutes subsistent quant aux conditions sanitaires permettant l\'organisation d\'un tel événement. C’est pourquoi, la mort dans l’âme, nous décidons, à l’instar d’autres événements, de renoncer à l’édition 2021. [...] Nous pensons inutile de faire prendre des risques aux exposants, aux éleveurs, aux visiteurs et à tous les passionnés. Parce qu’il faut rebondir et penser à l’avenir, nous réfléchissons à un autre événement dans les mois à venir permettant de réunir la grande famille du cheval. Sport, ruralité, bien-être animal seront au rendez-vous.”</em>\r\n\r\n<strong>Rendez-vous en 2022</strong> au Parc des Expositions de Paris Nord Villepinte pour vibrer au rythme des compétitions, des spectacles et des animations <strong>100% cheval</strong>.', '2021-11-15 09:32:16', NULL),
(2, 'Un samu pour chiens et chats', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence..', 'Depuis quelques semaines, en Suisse dans le canton de Bale, un samu est exclusivement dédié aux animaux de compagnie. C’est inédit, les habitants peuvent composer le 0800 111 114 en cas d’urgence, le centre d’appel est ouvert <strong>7 jours sur 7 et 24 heures sur 24.</strong>', 'article_2.jpg', 'Photo de Tima Miroshnichenko provenant de Pexels', 'En cas <strong>d’urgence vitale</strong> un professionnel se déplace sur les lieux pour effectuer les premier soins avec une ambulance équipée de matériels (médicaments, pharmacie d’urgence, masque à oxygène...) et adaptée au transport de l’animal. En moyenne, l’ambulance intervient une fois par jour depuis sa mise en service dans un rayon de 30km. \r\n\r\nÀ ce jour, l’intervention n’est pas remboursée intégralement car les animaux de compagnie ne possèdent pas de carte mutuelle ou de sécurité sociale. Le prix total d’une intervention est de <strong>400 euros</strong> mais heureusement le propriétaire débourse 10 à 20% de cette somme et le reste est pris en charge par la fondation et la clinique vétérinaire de Münchenstein.\r\n', '2021-11-18 09:37:36', NULL),
(3, '8 choses à savoir avant d\'adopter un animal ', 'N\'adoptez pas, avant d\'avoir compris qu\'un animal de compagnie implique de nombreuses responsabilités et dépenses dont vous devez tenir compte.', 'N\'adoptez pas, avant d\'avoir compris qu\'un animal de compagnie implique de nombreuses responsabilités et dépenses dont vous devez tenir compte.', 'article_3.jpg', 'Photo de cottonbro provenant de Pexels', '<p><strong>Que devez-vous savoir avant de prendre une décision ?</strong>\r\n<br><br>\r\n<strong>Avoir un animal de compagnie est un énorme engagement</strong>\r\n<br>\r\nUn nouveau chat ou chien doit s\'acclimater à votre maison, vous devez lui apprendre à demander à sortir pour faire ses besoins, vous devez acheter de la nourriture, des jouets, payer les vaccinations, les visites chez le vétérinaire et prendre le temps nécessaire pour une adoption réussie.\r\n<br>\r\n<br>\r\n<strong>Vous devez faire des recherches </strong>\r\n<br>\r\nVous devez tout savoir sur le type d\'animal que vous allez adopter ; ce qu\'il mange, la taille qu\'il aura, les caractéristiques de sa race, s\'il souffre d\'allergies, où est le vétérinaire le plus proche…Tout cela vous aidera à trouver le meilleur candidat pour ce dont vous avez besoin.\r\n<br>\r\n<br>\r\n <strong>Adopter est moins cher, mais vous allez dépenser beaucoup d\'argent</strong> \r\n<br>\r\nPrendre soin de vos animaux de compagnie est une dépense supplémentaire dont vous devez tenir compte, vous allez acheter beaucoup de nourriture, ils vont détruire les jouets à la vitesse de la lumière, vous devez leur faire faire tous les vaccins, payer leur toilettage, les médicaments et bien d\'autres choses encore. C\'est vraiment comme avoir un bébé à la maison tout le temps, et votre budget annuel va en prendre un coup.\r\n<br> \r\n<br>\r\n<strong>C\'est un engagement à long terme</strong> \r\n<br>\r\nLes chats et les chiens ne vivent pas aussi longtemps que les humains, mais les chats peuvent vivre jusqu\'à 20 ans et les chiens peuvent vivre au-delà de 18 ans, alors soyez prêts à prendre soin de ce petit être poilu pendant de nombreuses années.\r\n<br> \r\n<br>\r\n<strong>Le coup de foudre ne compte pas</strong>\r\n<br>\r\nVous aimez peut-être un chien ou un chat, mais vous ne pouvez pas fonder votre décision uniquement sur ce critère. En particulier pour les animaux adoptés dans des refuges, vous devez prendre le temps de les mettre à l\'aise avec vous, vous devez apprendre à déchiffrer leur personnalité et leur niveau d\'activité, s\'ils sont bons avec les enfants et sont sociables, tout cela vous aidera à trouver celui qui correspond le mieux à votre mode de vie.\r\n<br>\r\n<br>\r\n<strong>Les animaux de compagnie adoptés ont également besoin de formation</strong>\r\n<br>\r\nMême s\'ils appartenaient à quelqu\'un avant, ce sont des animaux qui ne vous connaissent pas et qui n\'ont pas l\'habitude de vivre dans votre maison. Vous allez donc devoir leur apprendre à suivre vos ordres, les endroits où ils ne peuvent pas entrer, et même à rester près de vous lorsqu\'ils sortent se promener.\r\n<br>\r\n<br>\r\n<strong>Vous allez devoir adapter votre maison</strong>\r\n<br>\r\nVous n\'avez pas besoin de tout changer, mais vous devez déplacer certaines choses afin qu\'elles ne soient pas à la portée d\'un animal curieux. Vous devez également savoir que vos chaises seront recouvertes de poils, que votre lit deviendra le leur et que certains petits objets peuvent être dangereux pour votre chien ou votre chat.\r\n<br>\r\n<br>\r\n<strong>Vous devez être flexible</strong>\r\n<br>\r\nTout le monde pense que les chiens et les chats vont suivre toutes les règles à la lettre, mais ce n\'est jamais le cas. Vous devez être prêt à accepter le fait que votre animal ne dormira pas dans le coin où vous avez mis son lit, vous allez devoir faire face à certains problèmes de comportement en vous adaptant l\'un à l\'autre et en vous attendant à l\'inattendu. Et ne stressez pas, votre chien le ressent et cela peut aggraver son comportement.\r\n<br>\r\n<br>\r\n<br> \r\nTous droits réservés à <a href=\"www.gqmagazine.fr\"target=\"_blank\">GpMagazine</a> \r\n</p>', '2021-11-25 10:06:25', NULL),
(4, 'Novembre, le mois des animaux âgés', 'Le vieillissement des animaux de compagnie s’accompagne de changements sur le plan physique, psychologique et comportemental.', '<p>Le <strong>vieillissement des animaux</strong> de compagnie s’accompagne de <strong>changements sur le plan physique, psychologique et comportemental</strong>. Plusieurs refuges rapportent que les animaux âgés sont souvent les derniers à être adoptés.</p>', 'article_4.jpg', 'Photo de Gabriela Neumeier provenant de Pexels', '<p>Pourtant de nombreuses raisons font que les animaux âgés sont une <strong>excellente option</strong> pour les familles qui souhaitent adopter un animal de compagnie. En voici quelques une décrite par Geneviève Lacombe passionnée par les animaux : <br><br>\r\n\r\n“• Les animaux plus âgés sont généralement <strong>plus calmes</strong> que les chiots et les chatons, se contentant souvent d\'une routine quotidienne plus tranquille. La nature souvent plus douce des animaux âgés en fait un excellent choix pour les familles avec enfants. Avant de se retrouver dans des refuges, les animaux seniors ont souvent vécu une sorte de vie de famille, ce qui rend l\'adaptation à un nouvel environnement familial beaucoup plus facile que pour les chiots ou les chatons.<br>\r\n• Les animaux de compagnie seniors sont souvent <strong>déjà propres </strong>et peuvent même être excellents pour exécuter des demandes de base.<br>\r\n• En raison de leur style de vie tranquille, les chiens âgés ne nécessitent pas le <strong>niveau d\'exercice</strong> des jeunes animaux de compagnie. Oui, ils aiment toujours jouer et se promener, mais ils ne nécessitent tout simplement pas autant de concentration et d\'énergie.<br>\r\n• What you see is what you get! Avec les animaux seniors, vous savez exactement ce que vous adoptez. La <strong>personnalité des animaux</strong> âgés est déjà développée et vous pouvez donc dire tout de suite s’ils conviendront à votre style de vie et votre famille.<br>\r\n• L\'amour! Plusieurs histoires racontent que les animaux âgés sont particulièrement<strong> reconnaissants pour leur deuxième chance</strong>. Ils semblent savoir qu’ils ont été sauvés. Les nouveaux parents remarquent souvent un sentiment d’amour et d’appréciation très spécial de la part de leur animal de compagnie senior.”\r\n<br><br>\r\nRetrouvez des animaux âgés à adopter sur notre compte Instagram :<br>\r\n<a href=https://www.instagram.com/p/CWv3mtxNDy4/ target=\"_blank\">Lobo, berger allemand</a><br> \r\n<a href=\"https://www.instagram.com/p/CWd5bGuNjWV/\"target=\"_blank\">Kenzo & Yuki</a>\r\n</p>\r\n', '2021-11-30 17:22:49', NULL),
(6, '5 conseils pour protéger un chat du froid ', 'Les chats détestent-ils la neige, le froid ? La neige est-elle dangereuse pour mon chat ? Mon chat est-il prêt à affronter l’hiver ? … C’est autant de questions que se posent de nombreux maîtres à la veille de l’hiver.', '<p>\r\nLes chats détestent-ils la neige, le froid ? La neige est-elle dangereuse pour mon chat ? Mon chat est-il prêt à affronter l’hiver ? … C’est autant de questions que se posent de nombreux maîtres à la veille de l’hiver.<br>\r\nDans tous les cas, vous ne devez pas trop vous inquiéter car, avec leur température corporelle moyenne de 38,5 °C, les chats supportent la neige et le froid beaucoup mieux que les humains. Toutefois, cela n’empêche que vous devriez prendre certaines mesures pour que votre petit félin affronte l’hiver en toute sécurité. Ci-dessous, vous allez découvrir tous nos conseils pour protéger votre chat des intempéries hivernales et traverser cette période en toute sérénité.\r\nSelon leur race, certains chats sont moins vulnérables au froid que d’autres, du fait de leurs poils naturellement plus longs et denses que la moyenne. Toutefois, quelle que soit la race de votre compagnon à 4 pattes comme de nombreux sites spécialisés pour les chats le confirme, il est essentiel que vous preniez des mesures de précaution pour le préserver du froid hivernal.\r\n</p>', 'article_6.jpg', 'Photo de Jenna Hamra provenant de Pexels', '<p>\r\n<strong>Aménagez-lui un couchage à l’abri du vent et bien douillet.</strong>\r\nMême si elle n’aime pas trop souvent le changement, votre boule de poils ne sera pas contre une niche plus chaude durant l’hiver. Aménagez-lui un couchage bien douillet, de préférence au-dessus du sol, loin des ouvertures et proche d’une source de chaleur. Le coin où votre petit félin devra passer ses longues heures de sieste doit toujours être bien chaud pour l’accueillir après ses activités journalières, vous devrez y veiller.<br>\r\n<strong>Préférez une alimentation plus riche</strong>\r\nDurant l’hiver, les animaux doivent développer une couche de graisse sur l’ensemble du corps pour se protéger du froid. C’est pourquoi, pour votre chat, il est recommandé une alimentation bien adaptée, avec des croquettes sans céréales dont la teneur en protéines d’origine animale est très forte.\r\nVous noterez aussi que si votre animal de compagnie est très actif et passe beaucoup de temps à l’extérieur, il devra manger plus que d’habitude durant l’hiver, et beaucoup plus encore s’il est trop jeune ou trop âgé. N’hésitez donc pas à lui lancer de temps à autre des friandises, ou même des morceaux de viande ou de poisson en complément aux croquettes.<br>\r\n<strong>Même en hiver un chat doit bien boire</strong>\r\nC’est un fait : même pendant l’hiver, le matou doit être bien hydraté, surtout à cause du chauffage de la maison et de l’air sec extérieur. En effet, le chauffage et le froid dans cette région diminue l’humidité de l’air ambiant et assèche l’air de la maison, ce qui va contribuer à la déshydratation de votre animal de compagnie. Vous remarquerez que votre chat aura plus soif que d’habitude. Raison pour laquelle vous devrez mettre à sa disposition de l’eau à volonté, et vérifier régulièrement qu’il n’en manque pas.<br>\r\n<strong>Vérifiez son état de santé régulièrement.</strong>\r\nQuand le mercure baisse en hiver, il n’est pas rare que de petites maladies bénignes se déclarent chez votre petit félin comme la toux, le rhume, etc… Après ses promenades journalières, ne manquez pas de lui faire un petit check-up régulier : contrôlez-lui les pattes et observez s’il tousse ou éternue.\r\nUne visite chez le vétérinaire n’est en général pas nécessaire, à moins que vous ne remarquiez d’autres symptômes alarmants.<br>\r\n<strong>Restez attentif s’il souhaite rentrer à la maison</strong>\r\nPour un félin casanier, l’hiver n’est pas trop inquiétant. Par contre, si votre chat est du genre aventurier, il ne faut pas qu’il se retrouve bloqué à l’extérieur. Vous devez donc installer des chatières dans la cabane, la grange, ou le garage pour faciliter et contrôler les allers et venues de votre matou et lui offrir un endroit au chaud quand il veut.\r\n<br>\r\nTous droits réservés à <a href=\"https://www.univers-chat.com\"target=\"_blank\">Univers Chat</a> \r\n</p>', '2021-12-16 16:07:27', NULL),
(7, 'Une fausse bonne idée pour Noël !', 'Chaque année, de nombreux animaux de compagnie sont offerts comme cadeaux de Noël à ses proches ou à ses enfants. Mais ils sont abandonnés quelques mois plus tard. C\'est le triste sort que connaissent malheureusement bon nombre d\'animaux qui sont victimes', '<p>Chaque année, de nombreux <strong>animaux de compagnie</strong> sont offerts comme cadeaux de Noël à ses proches ou à ses enfants. Mais ils sont <strong>abandonnés</strong> quelques mois plus tard. C\'est le triste sort que connaissent malheureusement bon nombre d\'animaux qui sont victimes d\'un choix précipité.\r\n</p>', 'article_7.jpg', 'Photo de Jenna Hamra provenant de Pexels', '<p>Des campagnes de prévention sont mises en place par des acteurs du monde animalier.\r\n\r\nDocteur Caroline Desbarax, vétérinaire à Toulouse, nous dit  : «  Offrir un animal de compagnie pour Noël n\'est pas une bonne idée si la personne n\'est pas au courant de ce qui l\'attend ou si elle n\'en a que vaguement émis l\'envie. » \r\n<br>\r\n« Un chat ou un chien apporte énormément de joie dans un foyer mais il faut bien se rendre compte que ce n’est pas un cadeau comme un autre ; les animaux de compagnie ne sont pas des jouets ! En être propriétaire est un engagement tout au long de la vie de l’animal et un devoir pour lui apporter les soins, une alimentation et une sécurité dont il a besoin. » a déclaré Julien Denormandie, ministre de l’Agriculture et de l’Alimentation.\r\n\r\n</p>', '2021-12-23 17:24:39', NULL),
(8, 'Les maladies de nos animaux de compagnie', 'Nos animaux de compagnie (chiens, chats, lapins, etc..) peuvent être porteurs de maladie. Le Dr Vétérinaire Frédéric Degorce, directrice générale du Laboratoire d’anatomie pathologique vétérinaire du Sud Ouest implanté à Toulouse, répond à nos questions..', 'Nos animaux de compagnie (chiens, chats, lapins, etc..) peuvent être porteurs de maladie. \r\nLe Dr Vétérinaire Frédéric Degorce, directrice générale du Laboratoire d’anatomie pathologique vétérinaire du Sud Ouest implanté à Toulouse, répond à nos questions et nous donne des conseils pour prévenir et guérir leurs maladies.', 'article_8.jpg', '', '<p>\r\n• <strong>Les animaux peuvent-ils nous transmettre des maladies ?</strong>\r\n<br>\r\n“Oui. Ces maladies s’appellent <strong> des zoonoses </strong>. Elles regroupent de nombreuses pathologies dont l’agent pathogène peut être une bactérie, un virus ou un champignon et dont la gravité pour l’Homme est très variable, les personnes immunodéprimées ou sous immunosuppresseurs, les personnes âgées, les jeunes enfants ou les femmes enceintes étant les plus à risque. On compte parmi les zoonoses : la teigne, la gale, la toxoplasmose, la toxocarose, la tuberculose, la rage…\r\nLa gravité de ces maladies chez l’Homme est très variable selon la maladie elle-même, l’agent pathogène responsable pouvant être plus ou moins virulent, mais également selon la personne infectée, qui peut présenter une sensibilité particulière à ces pathogènes. C’est souvent le cas des personnes au système immunitaire fragile telles que les immunodéprimés, les personnes sous traitement immunosuppresseur, les jeunes enfants, les personnes âgées, ou encore les femmes enceintes.”\r\n<br>\r\n• <strong>Existe-t-il des cas de rage en France ?</strong>\r\n<br>\r\n“Les rares cas de rages canines en France sont actuellement <strong>des cas rapportés</strong> : ce sont des animaux importés illégalement de pays où la rage des rues sévit encore (Par ex en Asie et en Afrique). Dans ces pays, les chiens sont le principal réservoir et la principale source de contamination de l’Homme. La France est officiellement indemne de rage depuis 2001. Des formes de rage touchant les chauves-souris existent cependant sur notre territoire.”\r\n<br>\r\n• <strong>Comment protéger notre animal de compagnie contre les tiques ?</strong>\r\n<br>\r\n“Il est conseillé de <strong>traiter son animal de compagnie préventivement</strong> avec un produit contre les tiques. Il existe de nombreux produits efficaces sur le marché pour lutter contre les parasites selon des présentations, des modes et des rythmes d’administration variés (comprimés, pipettes, spray, en application mensuelle, trimestrielle…). Demandez à votre vétérinaire de vous prescrire le produit le mieux adapté à votre animal. En outre, après chaque retour de promenade, il est conseillé d’examiner attentivement son animal et de lui retirer les éventuelles tiques fixées ou présentes sur le pelage.”\r\n<br>\r\n• <strong>Les animaux peuvent-ils avoir des allergies ?</strong>\r\n<br>\r\n“Oui. Certains chiens peuvent avoir <strong>une anomalie génétique de la barrière cutanée </strong>et développer une dermatite atopique qui peut les prédisposer à des allergies variées par exemple aux acariens des poussières de maison, à certains pollens... D’autres peuvent développer <strong>des intolérances ou des allergies alimentaires </strong>, des allergies aux piqûres de moustiques ou de puces. Le chat peut aussi être atteint de syndrome atopique.”\r\n<br>\r\n• <strong>Qu’est ce que le sida du chat et comment l’éviter ?</strong>\r\n<br>\r\n“Il est causé par <strong>le FIV ou virus de l’immunodéficience féline </strong>. Cette infection virale prédispose les chats aux autres infections (avec risque de développer des problèmes cutanés, buccaux, respiratoires, neurologiques, digestifs, rénaux…) et à certains cancers (par exemple les lymphomes). Les chats contractent le FIV lorsqu’ils se blessent entre eux au cours de combats. Le FIV peut aussi être transmis sexuellement et par le biais de transfusions sanguines. Il n’y a pas de vaccin contre le FIV. Pour l’éviter il faut donc <strong>éviter les combats entre individus </strong>et tous les problèmes de cohabitation difficile entre félins, stériliser son chat, le garder le plus possible à l’intérieur, ou prévoir des sorties surveillées ou en lieux sécurisés, ne pas introduire de nouveau chat chez vous sans test préalable, de façon à connaître le statut viral de tout individu nouvellement introduit et garder strictement à l’intérieur tout chat testé positif de façon à ce qu’il ne transmette pas le virus aux autres.”\r\n<br>\r\n<br>\r\n\r\n</p>', '2021-12-30 09:32:51', NULL),
(9, 'Les démarches pour adopter un animal', 'Il faut être majeur pour adopter un animal de compagnie. Les enfants mineurs, sous la responsabilité de leurs parents, doivent être accompagnés.', '<p>\r\n\r\nIl faut être <strong>majeur</strong> pour adopter un animal de compagnie. Les enfants mineurs, sous la responsabilité de leurs parents, doivent être accompagnés.<br>\r\n\r\nDes <strong>pièces justificatives</strong> sont demandées pour officialiser l’adoption : <br>\r\n• Carte Nationale d’Identité (CNI), \r\n• Justificatif de domicile (facture EDF, téléphone, impôts),\r\n• Attestation d’assurance (responsabilité civile),\r\n• Justificatif de revenus (salaires, attestation URSSAF),\r\n• Frais d’adoption s’élevant jusqu’à 300 €, variables selon la catégorie d’animal (chien, chat, NAC, etc.).\r\n\r\n</p>', 'article_9.jpg', '', '<p>\r\nPour adopter un animal de compagnie, dans un refuge ou une association, vos <strong>motivations</strong> sont passées au peigne fin. Mais chaque association à ses habitudes, par exemple, l’association Pattes-en-Rond se déplacent dans les foyers pour vérifier le nouvel environnement de l’animal et l’association SOS P’tite Bêtes demande des photos post adoption de l’animal.<br><br>\r\nPour adopter chez <strong>Pattes-en-Rond</strong>, voici le processus :<br>\r\n1.Remplir le formulaire en ligne et nous le renvoyer à asso.pattenrond@gmail.com <br>\r\n2.Échange téléphonique avec une bénévole si le formulaire est validé.<br>\r\n3.Si l’échange téléphonique est positif, sécurisation de vos fenêtres (et extérieur) si ce n’est pas déjà fait. Voir nos critères de sécurisation.<br>\r\n4.Après sécurisation, une pré-visite de chez vous sur RDV avec un.e bénévole est organisée, notamment pour vous rencontrer et vérifier la sécurisation.<br>\r\n5.Rencontre avec le chat dans sa famille d’accueil, si pré-visite validée.<br>\r\n6.Signature du contrat et règlement des frais d’adoption.<br>\r\n7.Transfert du chat dans sa nouvelle maison.<br><br>\r\nPour adopter chez <strong>SOS P’tite Bêtes</strong>, voici le processus :<br>\r\nL\'adoption est gratuite en dehors des frais de puçage (50 euros) des animaux qui doivent être enregistrés sur i-fap (liste ici). L\'adoption doit être réfléchie et doit se faire après s\'être assuré des bonnes conditions d\'accueil de l\'animal. En adoptant, vous vous engagez à nous envoyer de temps en temps une photo de l\'animal pour nous assurer que l\'adoption est réelle. Nous n\'expédions pas les animaux, nous ne faisons pas de livraisons à domicile, nous n\'offrons pas de terrarium.<br>\r\nNous ne répondons à des questions sur le maintien de l\'espèce qu\'à condition que la personne ait pris la peine de rechercher par elle-même avant (livres, fiches d\'élevage...).Un don libre est bienvenu ;)\r\n\r\n\r\n</p>', '2022-01-06 12:08:50', NULL),
(10, 'IFOA nous ouvre ses portes !', 'L’IFOA, Institut de Formation d\'Ostéopathes Animaliers, est un établissement d’enseignement supérieur privé. Il existe plusieurs centres de formation en France à Tarascon et Paris V, en Espagne à Barcelone, en Belgique à Loyers. ', '<p>L’IFOA, <strong> Institut de Formation d\'Ostéopathes Animaliers </strong>, est un établissement d’enseignement supérieur privé. Il existe plusieurs centres de formation en France à Tarascon et Paris V, en Espagne à Barcelone, en Belgique à Loyers. Nous avons eu le plaisir de rencontrer des étudiantes de 2ème année à l\'IFOA Paris, qui ont répondu à nos questions sur le métier d’ostéopathe animalier. \r\nBon plan : IFOA Paris propose des consultations en ostéopathie animale pour vos animaux (chiens, chats et NAC) à 15 euros réalisés par des étudiants de 4ème année.\r\n</p>', 'article_10.jpg', '', '<p>• <strong>Pourquoi consulter un ostéopathe animalier ?</strong>\r\n<br>\r\nPauline LAFUGE, étudiante en 2ème année, nous répond :  “Il y a plusieurs raisons. Pour faire un bilan de votre animal de compagnie, si c’est un jeune animal sportif, ça peut être pour un bilan pré compétition. Pour <strong>des raisons pathologiques </strong>, par exemple pour une boiterie (incapacité à se déplacer normalement sur un ou plusieurs membres) ou pour <strong>des douleurs lombaires</strong>. Vous pouvez consulter un ostéopathe pour plusieurs raisons mais il faut avoir vu un vétérinaire auparavant.” \r\n<br>\r\n\r\n•<strong> À quelle fréquence dois-je consulter un ostéopathe animalier ?</strong>\r\n<br>\r\nNolwenn PENFORNIS, étudiante en 2ème année, nous conseille : “Tout dépend de l’état de santé de l’animal, si c\'est un animal sportif ou qu’il n’y a pas de problème particulier, il est conseillé de faire <strong>deux séances par an</strong>, une tous les six mois, comme l’humain. Les chiots peuvent aussi être suivis pour un bilan de croissance. Si l’animal est suivi de près pour une pathologie qui est chronique ou autre, ce sera une séance par mois. “\r\n<br>\r\n• <strong>Comment gérer un animal stressé avant et pendant un rendez-vous chez un ostéopathe animalier ?</strong>\r\n<br>\r\nLuna CAKMAK, étudiante en 2ème année, nous explique : “Il faudra faire <strong>découvrir l’environnement </strong> à l’animal. Par exemple, si c\'est un cheval, nous sommes souvent dans le manège ou dans son box. Si c’est un chien, il faut le laisser sentir les odeurs de la salle de consultation pour qu’il puisse s’y sentir bien. Puis il faudra s’approcher de l’animal doucement, en le caressant et lui montrant qu’il faut être calme. Le propriétaire doit adopter un<strong> comportement rassurant </strong>pour son animal, en ne parlant pas fort, sans faire de grands gestes et sans montrer de stress. L’animal sera alors dans des conditions idéales.\"\r\n<br>\r\n• <strong>Comment se déroule une consultation chez un ostéopathe animalier ?</strong>\r\n<br>\r\nMathilde RASSON, étudiante en 2ème année, nous répond : “ Au début, nous allons poser des questions au propriétaire pour connaître les <strong>habitudes de vie </strong> de l’animal, son identité et tous ses antécédents vétérinaires ou ostéopathiques. Ainsi, nous pouvons nous faire une idée de ce que l’animal pourrait avoir. Ensuite, nous faisons un <strong>examen d’exclusion vétérinaire</strong>, vérifier que l’animal se porte bien, si ce n’est pas le cas il est redirigé vers un vétérinaire. Sinon, nous allons<strong> évaluer l’animal en statique et en dynamique </strong>et palper l’animal. Puis nous allons traiter l’animal en fonction de ce que nous avons détecté. Soit avec <strong>des techniques structurelles</strong>, où l’articulation de l’animal va être travaillée ou avec <strong>des techniques tissulaires</strong>, où l’on vient travailler la détente des tissus de l’animal. Pour finir, nous donnons des conseils aux propriétaires et un repos de trois jours pour l’animal.”\r\n<br>\r\n• <strong>Quel animal préférez-vous ausculter ?</strong>\r\n<br>\r\nMathilde RASSON : “Je préfère <strong>les chevaux </strong>car j’ai plus d’affinités avec eux mais j’aime bien aussi les chiens et puis on verra par la suite.”\r\nNolwenn PENFORNIS : “Moi, ce serait plutôt <strong>les chiens</strong> car j’ai moins d’affinité avec les chevaux que je manipule depuis moins longtemps.”\r\nLuna CAKMAK : “Moi aussi je préfère <strong>les chiens</strong> parce que j’en ai un et donc je me familiarise plus rapidement avec.”\r\n<br>\r\n•<strong> Qu’est-ce qui vous plaît le plus à l’IFOA ? </strong>\r\n<br>\r\nMathilde RASSON : ”La <strong>diversité des partenaires</strong>. Il y a vraiment beaucoup de partenaires ce qui nous permet d’aller d’une écurie à une autre, donc d\'ausculter un grand nombre de  chevaux. C’est donc hyper intéressant sur les cas et les différentes pathologies.”\r\nNolwenn PENFORNIS : “La <strong>diversité des formateurs</strong>. Les formateurs sont eux-mêmes ostéopathe animalier donc si nous avons des questions sur l’aspect réel du métier et moins pédagogique, ils peuvent y répondre.”\r\nLuna CAKMAK : “Beaucoup de <strong>pratique sur le terrain</strong> ce qui nous permet d’acquérir des expériences qui nous serviront pour exercer notre métier. “\r\n</p>', '2022-01-13 11:18:53', NULL),
(11, 'Une garde alternée pour les animaux ', 'Depuis le 05/01/2022, en Espagne, les animaux de compagnie peuvent être placés en garde alternée en cas de divorce de leurs propriétaires. ', '<p>Depuis le <strong>05/01/2022 </strong>, en Espagne, les animaux de compagnie peuvent être placés en <strong>garde alternée</strong> en cas de divorce de leurs propriétaires.Cette nouvelle loi espagnole a pour but de garantir le bien-être de l’animal. De plus, si une personne est connue par la justice pour des faits de maltraitance animale, elle se verra refuser ou retirer la garde de son animal de compagnie. Les animaux seront également pris en compte dans les testaments.</p>\r\n', 'article_11.jpg', 'Photo de EKATERINA BOLOVTSOVA provenant de Pexels', '<p>Ione Belarra, la ministre des Droits sociaux et secrétaire générale de Podemos (parti politique espagnol), poste sur twitter : “ À partir d’aujourd’hui, de par la loi les animaux cessent d’être des choses et deviennent ce qu’ils sont <strong>des êtres dotés de sensibilité</strong>. Nous faisons un grand pas vers l’amélioration du bien-être animal. En 2022, nous continuerons à travailler pour que la #LeyProtectionAnimal qui lutte contre l’abandon et la maltraitance soit également une réalité.”\r\n<br>\r\nEn France, cette caractéristique \"sensible\" des animaux est intégrée dans le Code civil depuis 2015. Auparavant, les animaux étaient des \"biens meubles\".</p> \r\n', '2022-01-20 18:03:57', NULL),
(12, 'Un refuge pour des renards ', 'En Dordogne, à Douzillac, un terrain de 1.500 m2 est en cours de débroussaillage par les bénévoles de l’association « Le clos des renardises » pour accueillir des renards incapables de vivre dans leur milieu naturel.', '\r\n<p>En Dordogne, à Douzillac, <strong>un terrain de 1.500 m2 </strong>est en cours de débroussaillage par les bénévoles de l’association « Le clos des renardises » pour accueillir  <strong>des renards incapables de vivre dans leur milieu naturel. </strong></p>', 'article_12.jpg', 'Photo de patrice schoefolt provenant de Pexels', '<p>\r\nSi tout se déroule comme prévu, une dizaine de renards devraient être hébergés <strong>dès l\'été 2022</strong>. Tous les animaux pris en charge par l’association seront stérilisés et équipés de puces. Pas question de faire un élevage. La cohabitation entre les individus devrait bien se passer car « ils seront bien nourris et il n’y aura donc pas de concurrence de chasse », précise Carine Gresse, présidente et fondatrice de l’association.\r\n<br>\r\nCôté financier, la fondation Brigitte Bardot a donné un accord de principe sur le projet. Des demandes de subventions ont été déposées auprès de collectivités. Une campagne de crowfunding a également été lancée auprès des particuliers.\r\n</p>', '2022-01-27 16:56:59', NULL),
(13, 'Journée du Golden Retriever', 'À l’origine, le Golden Retriever est connu comme un chien de chasse du type rapporteur. Depuis 1980 , le Golden Retriever a été adopté très régulièrement, aujourd\'hui il est l\'un des chiens les plus appréciés de France, avec plus de 50 000 individus à tra', '<p><strong>Son histoire</strong>\r\nÀ l’origine, le Golden Retriever est connu comme un chien de chasse du type rapporteur. Depuis 1980 , le Golden Retriever a été adopté très régulièrement, aujourd\'hui il est l\'un des chiens les plus appréciés de France, avec plus de 50 000 individus à travers l\'hexagone.\r\n</p>', 'article_13.jpg', 'Photo de Brigitte Pellerin provenant de Pexels', '<p>\r\n<strong>Son caractère</strong>\r\nLe Golden Retriever, un chien idéal pour toutes les familles  ! Il incarne le compagnon parfait à la fois aimable et affectueux. Incapable de rester seul, il réclame de l’affection et des caresses de son entourage. Très sportif, il aime se dépenser lors de promenades quotidiennes. Il a des facilités pour un apprentissage rapide. \r\n<br>\r\n<strong>Caractéristiques physiques</strong>\r\nOn trouve trois types de race du Golden Retriever :\r\n•le type britannique où la couleur du pelage est crème avec un poil court et ondulé. \r\n•le type américain avec un poil épais et dense avec des nuances de couleurs sombres. \r\n•le type canadien se différencie par sa taille. Il est plus grand que les deux autres et il est plus rare !\r\n\r\n</p>', '2022-02-03 18:37:51', NULL),
(14, 'Saint-Valentin : idées de cadeaux ', 'La Saint-Valentin c’est l’occasion de montrer à ce que l\'on aime, qu’on les aime. Alors donnez un peu de votre temps à votre animal de compagnie ! Et offrez-lui un cadeau, il vous en sera comme toujours reconnaissant. ', '<p>\r\nLa Saint-Valentin c’est l’occasion de montrer à ce que l\'on aime, qu’on les aime. Alors donnez un peu de votre temps à votre animal de compagnie ! Et offrez-lui un cadeau, il vous en sera comme toujours reconnaissant. \r\n</p>', 'article_14.jpg', 'Photo de Luciann Photography provenant de Pexels', '<p>\r\n<strong>Un nouveau jouet</strong> en forme de cœur pour éveiller ses sens et passer une soirée à jouer avec lui.\r\n\r\n<strong>Des biscuits et friandises</strong> tous les animaux en raffolent, alors faites lui plaisir le 14 Février 2022. Attention, ces petites douceurs ne doivent pas se substituer à son repas quotidien. \r\n\r\n<strong>Une gamelle</strong> en forme de cœur, il l’utilisera tous les jours pour manger ou pour boire.\r\n\r\n<strong>Un nouveau panier</strong> pour prolonger ses siestes et dormir confortablement.\r\n</p>', '2022-02-10 19:14:38', NULL),
(15, 'Qu’est-ce qu’un NAC ?', 'Un NAC (Nouveaux animaux de compagnie) est une espèce que l’on retrouve depuis plusieurs années dans nos foyers. La population des NAC est estimée à environ 5 millions d’individus en France, soit 10 % des animaux adoptés.', '<p>Un NAC (Nouveaux animaux de compagnie) est <strong>une espèce</strong> que l’on retrouve depuis plusieurs années <strong>dans nos foyers</strong>. La population des NAC est estimée à environ <strong>5 millions d’individus</strong> en France, soit 10 % des animaux adoptés.</p>', 'article_15.jpg', 'Photo de Mike van Schoonderwalt provenant de Pexels', '<p>Il existe <strong>différentes familles </strong>de ses nouveaux animaux de compagnie tels que des rongeurs, des primates, des lézards, des insectes, des crustacés, des mollusques, des amphibiens, des gallinacés, des poissons, etc... La liste est longue !  \r\n<br>\r\nLe hamster est sûrement le plus populaire car c\'est un animal qui vit la nuit et qui ne demande pas énormément d’attention. La souris est recherchée pour son intelligence et il est facile de s’en occuper. La poule fait partie des animaux très tendances : pour le plaisir d’avoir des œufs frais dans son jardin de plus, certaines races de poules sont très affectueuses.\r\n\r\n</p>', '2022-02-17 18:02:49', NULL),
(16, 'Une ferme à Center Parcs', 'Le Center Parcs de De Haan Aan Zee situé en bord de mer en Belgique flamande, accueille depuis peu de nombreux animaux en son sein', '<p>Le <strong>Center Parcs</strong> de <strong>De Haan Aan Zee</strong> ( Le Coq Sur Mer), situé en bord de mer en Belgique flamande, accueille depuis peu de nombreux animaux en son sein. En effet, il est possible d’accéder à une petite “ferme”, et de pouvoir aller caresser et sympathiser avec plusieurs de <strong>nos amis à quatre pattes</strong>. </p>', 'article_16.jpg', 'Photo prise par l\'équipe ZOEY', '<p>Il y a des moutons et des chèvres qui se baladent dans un enclos très large de plus d’un hectare. Il y a aussi de nombreuses poules, disposant d’un <strong>poulailler</strong> des plus chaleureux. Cochons, lapins et cochons d’inde seront aussi de la partie et n’attendent qu’à être dorlotés. Enfin, vous pouvez approcher l’un des animaux les plus nobles : le paon. \r\n<br><br>\r\nVous pouvez retrouver cette petite ferme à :<br>\r\n<a href=\"https://www.centerparcs.fr/fr-fr/belgique/fp_VM_vacances-domaine-de-vossemeren?&adlgid=c%7cg%7ccenter%20parcs%20de%20haan%7c449187854370%7ce&gclid=Cj0KCQiA64GRBhCZARIsAHOLriL7ao1LnvCyYZStI_lzSrb0EjhWoKAnKV6qvUJhprlNyDZWxmGwUsAaAlFAEALw_wcB&gclsrc=aw.ds\">Wenduinesteenweg 150, 8420 De Haan, Belgique</a><br>\r\n</p>', '2022-03-03 15:13:29', NULL),
(17, 'Aide aux animaux ukrainiens ', 'En cette période difficile, ZOEY souhaite venir en aide aux animaux victimes de la guerre en Ukraine. L’évolution catastrophique de la situation oblige de nombreuses associations européennes à créer toutes sortes de cagnottes et d’aides afin de pouvoir sa', 'En cette période difficile, ZOEY souhaite venir en aide aux animaux victimes de la guerre en Ukraine. L’évolution catastrophique de la situation oblige de nombreuses associations européennes à créer toutes sortes de cagnottes et d’aides afin de pouvoir sauver le maximum d’animaux. \r\n<br><br>\r\nNous transmettons donc par le biais de notre blog différents liens pouvant vous permettre, si vous le souhaitez, de pouvoir faire des dons afin de venir en aide à ces animaux abandonnés ou souffrant de la guerre en Ukraine. \r\n', 'article_17.jpg', 'Chien abandonné dans la rue', 'Liens :\r\n<br><br>\r\n<a href=\"https://www.helloasso.com/associations/association-youcare/collectes/ensemble-sauvons-des-vies-en-ukraine\">Cagnotte Youcare</a>\r\n<br>\r\n<a href=\"https://soutenir.avarefuge.fr/b/mon-don?ns_ira_cr_arg=IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyOoaKPGr%2FsGvboDdmv6zbmHXEE9DHoPrehR0nDWTKQvFBrNf9otRBPecheeKJWdjFfqpkLgBVMOnH7NwWH%2Bn3jUMWEExxRM4sxt%2FQvrVKAK0I6xYIPer9N1aJXTyQA5sl0%3D&utm_source=email&utm_medium=email&utm_campaign=solidarite-ukraine&cid=245&_cv=1\">Cagnotte Ava</a>', '2022-03-08 14:47:48', NULL),
(18, 'Un hôpital pour animaux sauvages ', 'L\'hôpital faune sauvage, dans le Cher près de Bourges, à ouvert ses portes début janvier à La Guerche sur L\'Aubois. Il recueille les animaux sauvages blessés ou malades. La structure a déjà soigné 80 animaux depuis le début de l\'année.', '<p>L\'hôpital faune sauvage, dans le Cher près de Bourges, à ouvert ses portes début janvier à La Guerche sur L\'Aubois. Il recueille les animaux sauvages blessés ou malades. La structure a déjà <strong>soigné 80 animaux</strong> depuis le début de l\'année. Elle est ouverte 24H/24 grâce à <strong>deux jeunes bénévoles</strong>, Fanny Villain et Tom Berger, qui travaillent sur ce projet depuis 4 ans.\r\n</p>', 'article_18.jpg', '', '<p>Les examens des animaux sont réalisés dans d’excellentes conditions affirme Tom Berger : \" Ici, vous avez un laboratoire d\'hématologie / bio-chimie pour les analyses de sang notamment. Une radio qui nous permet d\'évaluer les fractures par exemple. La table d\'auscultation avec un ban d\'anesthésie complet. Sans oublier un échographe et un imposant microscope chirurgical. On dispose peut-être du plus beau plateau technique de France. Tout le matériel n\'est pas installé par manque d\'espace.\" \r\n<br>\r\nActuellement, l\'hôpital est installé dans le sous-sol d\'un petit pavillon. L’achat d’un bâtiment existant de 350 m² avec 1 hectare de terrain, suivi de sa rénovation ouvrira en 2023.\r\n\r\n</p>', '2022-03-10 20:15:24', NULL),
(19, 'Puces et parasites du lapin', 'On recense deux catégories de parasites du lapin : les parasites internes, et les parasites externes. Dans la première catégorie se classe principalement le E. Cuniculi, un parasite responsable de l‘encéphalitozoonose. Dans la seconde se trouvent les puce', '<p> On recense deux catégories de parasites du lapin : <strong>les parasites internes</strong>, et <strong>les parasites externes</strong>. Dans la première catégorie se classe principalement le E. Cuniculi, un parasite responsable de l‘encéphalitozoonose. Dans la seconde se trouvent les puces, les poux, la gale, les cheylétielles, les teignes ou encore les tiques. Tous ne sont pas responsables des mêmes maux. Tous ne se traitent pas de la même façon. La plupart d’entre eux peuvent néanmoins être évités grâce à une action préventive.\r\n<br>\r\nDes conseils pour identifier les parasites et protéger votre lapins.\r\n<br>\r\n<strong>Identifiez les symptômes des parasites de votre lapin</strong>\r\nLe E. Cuniculi se manifeste par une inclinaison de la tête du lapin, une perte d’appétit, des troubles oculaires, une paralysie et/ou une insuffisance rénale. La présence de puces sur un lapin se repère grâce au comportement de l’animal : le lapin se gratte et présente des lésions sur sa peau. Les signes de la gale sont eux aussi assez faciles à détecter : le lapin se gratte les oreilles dans lesquelles se trouvent des croûtes. La perte de poils et l’apparition de plaques circulaires de couleur rouge sur la tête du lapin (ou sur ses pattes) traduisent enfin la présence de la teigne.\r\n<br>\r\n<strong>Consultez votre vétérinaire pour choisir le bon traitement pour votre lapin</strong>\r\nLa plupart des maladies causées par la présence de parasites se soigne assez bien avec un traitement adapté. Il est indispensable de consulter votre vétérinaire afin que celui-ci puisse déterminer avec précision la nature du parasite responsable des maux de votre lapin. Il mettra ensuite en place le traitement adapté et assurera le suivi de l’état de santé de votre lapin.\r\n</p>', 'article_19.jpg', 'Photo de Magda Ehlers provenant de Pexels', '<p>\r\n<strong>Protégez votre lapin contre les parasites</strong>\r\nIl existe aujourd’hui sur le marché de nombreux produits préventifs contre les parasites. Les sites Internet spécialisés comme Vetostore ou les grandes animaleries commercialisent un certain nombre de solutions anti-puces ou autres antiparasitaires  pour lapin. Avant d’appliquer l’un de ces produits, demandez toujours conseil à votre vétérinaire. À noter qu’il peut être extrêmement dangereux de donner à son lapin un antiparasitaire conçu pour un autre animal tel que le chien. Sur ce point, pensez donc à éloigner votre chien de votre lapin si le premier des deux a reçu un traitement antiparasitaire.\r\n<br>\r\n<strong>Soyez extrêmement vigilant(e) lorsqu’il faut retirer une tique de votre lapin</strong>\r\nLa présence de tiques est décelable à l’œil nu en écartant les poils du lapin. Il est possible de retirer soi-même une tique de son lapin. Mais il est alors important de prendre quelques précautions. Il faut en effet retirer l’intégralité de la tique et ne surtout pas en laisser une partie (la tête) dans la peau du lapin. Il existe pour cela des pinces à tiques spécifiques. Si vous avez un doute sur la réussite de l’opération, consultez votre vétérinaire.\r\n<br>\r\nTous droits réservés à <a href=\"https://www.vetostore.com/nos-conseils/puces-et-parasites-du-lapin-comment-les-reconnaitre-et-les-combattre.html\"target=\"_blank\">Vetostore</a>\r\n</p>', '2022-03-17 11:27:05', NULL),
(20, 'Les castors de retour à Londres', 'Après plus de quatre cents ans d’absence, plusieurs castors sont de retour dans la capitale du Royaume Uni.', 'Après plus de quatre cents ans d’absence, plusieurs castors sont de retour dans la capitale du Royaume Uni. En effet, deux de ces mammifères ont été réintroduits jeudi dernier afin de pouvoir améliorer l’éco-système londonien tout en faisant face au dérèglement climatique. Ces bâtisseurs ont donc été relâchés dans une grande enceinte de plus de six hectares, à la Forty Hall Farm, une ferme  du grand Londres. Nous pouvons même espérer des bébés castors d’ici 2023.\r\n', 'article_20.jpg', 'Provient de Pexels', ' Il est important de savoir que ces petites bêtes sont habituellement chassées pour leur fourrure, leur viande ou encore leur glandes, qui produisent une sécrétion odorante utilisée dans la production d’arômes alimentaires. Ils avaient donc disparu des rivières britanniques durant le seizième siècle. Le gouvernement a donc décidé de tenter de réintroduire cette espèce dans la ville de Londres, espérant pouvoir préserver cette merveilleuse espèce.\r\n', '2022-03-22 21:13:17', NULL);

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
  `texte_commentaire` mediumtext,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_dernier_message` datetime DEFAULT CURRENT_TIMESTAMP,
  `url_photo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`idconversation`, `titre`, `date_creation`, `date_dernier_message`, `url_photo`) VALUES
(1, NULL, '2022-03-15 08:57:51', '2022-03-15 11:49:42', NULL),
(2, NULL, '2022-03-15 10:33:36', '2022-03-15 11:50:10', NULL),
(3, NULL, '2022-03-15 13:25:23', '2022-03-15 13:25:23', NULL),
(4, NULL, '2022-03-15 13:25:38', '2022-03-16 16:54:46', NULL),
(5, NULL, '2022-03-15 13:32:46', '2022-03-22 18:12:17', NULL),
(6, NULL, '2022-03-15 14:50:24', '2022-03-16 08:31:55', NULL),
(7, NULL, '2022-03-15 15:39:23', '2022-03-22 02:02:09', NULL),
(8, NULL, '2022-03-16 11:36:54', '2022-03-24 21:15:37', NULL),
(9, NULL, '2022-03-16 11:41:16', '2022-03-18 21:54:25', NULL),
(10, NULL, '2022-03-16 15:42:51', '2022-03-23 08:06:04', NULL),
(11, NULL, '2022-03-16 16:50:34', '2022-03-16 16:50:45', NULL),
(12, NULL, '2022-03-16 16:50:34', '2022-03-16 16:51:07', NULL),
(13, NULL, '2022-03-16 16:52:26', '2022-03-16 16:52:39', NULL),
(14, NULL, '2022-03-16 17:01:30', '2022-03-16 17:01:38', NULL),
(15, NULL, '2022-03-16 17:02:14', '2022-03-16 17:26:59', NULL),
(16, NULL, '2022-03-16 17:19:40', '2022-03-24 21:15:24', NULL),
(17, NULL, '2022-03-16 18:55:40', '2022-03-16 21:06:48', NULL),
(18, NULL, '2022-03-16 19:37:23', '2022-03-21 14:11:42', NULL),
(19, NULL, '2022-03-16 20:49:02', '2022-03-21 07:38:09', NULL),
(20, NULL, '2022-03-16 21:06:57', '2022-03-16 21:06:57', NULL),
(21, NULL, '2022-03-20 12:15:41', '2022-03-20 12:15:41', NULL),
(22, NULL, '2022-03-20 12:18:25', '2022-03-21 19:40:56', NULL),
(23, NULL, '2022-03-22 09:56:41', '2022-03-22 09:56:41', NULL),
(24, NULL, '2022-03-22 10:01:42', '2022-03-22 10:07:25', NULL),
(25, NULL, '2022-03-22 17:48:00', '2022-03-22 18:34:10', NULL),
(26, NULL, '2022-03-22 18:32:31', '2022-03-22 18:32:31', NULL),
(27, NULL, '2022-03-22 18:43:59', '2022-03-22 18:43:59', NULL),
(28, NULL, '2022-03-22 18:45:54', '2022-03-22 18:45:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `conversation_has_utilisateur`
--

CREATE TABLE `conversation_has_utilisateur` (
  `conversation_idconversation` int(11) NOT NULL,
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `readstate` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conversation_has_utilisateur`
--

INSERT INTO `conversation_has_utilisateur` (`conversation_idconversation`, `utilisateur_idutilisateur`, `readstate`) VALUES
(1, 1, 1),
(1, 5, 1),
(2, 5, 1),
(2, 9, 1),
(3, 6, 1),
(3, 9, 1),
(4, 6, 1),
(4, 7, 1),
(5, 5, 1),
(5, 6, 1),
(6, 6, 1),
(6, 14, 1),
(7, 5, 1),
(7, 14, 1),
(8, 6, 1),
(8, 8, 1),
(9, 14, 1),
(9, 15, 1),
(10, 7, 1),
(10, 14, 1),
(11, 8, 1),
(11, 9, 1),
(12, 7, 1),
(12, 9, 1),
(13, 7, 1),
(13, 19, 1),
(14, 7, 1),
(14, 16, 1),
(15, 7, 1),
(15, 15, 1),
(16, 7, 1),
(16, 8, 1),
(17, 8, 1),
(17, 18, 1),
(18, 6, 1),
(18, 30, 1),
(19, 5, 1),
(19, 32, 1),
(20, 5, 1),
(20, 8, 1),
(21, 14, 1),
(21, 26, 1),
(22, 14, 1),
(22, 21, 1),
(23, 49, 1),
(23, 51, 1),
(24, 5, 1),
(24, 52, 1),
(25, 7, 1),
(25, 56, 1),
(26, 6, 1),
(26, 55, 1),
(27, 14, 1),
(27, 56, 1),
(28, 14, 1),
(28, 55, 1);

-- --------------------------------------------------------

--
-- Structure de la table `liste_amis`
--

CREATE TABLE `liste_amis` (
  `idliste_amis` int(11) NOT NULL,
  `id_demandeur` int(11) DEFAULT NULL,
  `id_receveur` int(11) DEFAULT NULL,
  `date_demande` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` tinyint(1) DEFAULT '1',
  `id_bloqueur` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `liste_amis`
--

INSERT INTO `liste_amis` (`idliste_amis`, `id_demandeur`, `id_receveur`, `date_demande`, `statut`, `id_bloqueur`) VALUES
(1, 5, 4, '2022-03-15 08:57:03', 1, 0),
(2, 5, 1, '2022-03-15 08:57:35', 2, 0),
(3, 1, 6, '2022-03-15 09:44:54', 1, 0),
(4, 9, 8, '2022-03-15 10:30:28', 2, 0),
(5, 9, 6, '2022-03-15 10:30:54', 2, 0),
(6, 9, 7, '2022-03-15 10:31:17', 2, 0),
(7, 9, 5, '2022-03-15 10:31:28', 2, 0),
(8, 7, 6, '2022-03-15 10:43:03', 2, 0),
(9, 6, 5, '2022-03-15 13:28:40', 2, 0),
(10, 10, 6, '2022-03-15 14:11:06', 1, 0),
(11, 14, 8, '2022-03-15 14:47:52', 1, 0),
(12, 14, 6, '2022-03-15 14:48:02', 2, 0),
(13, 14, 5, '2022-03-15 15:30:56', 2, 0),
(14, 14, 10, '2022-03-15 15:31:29', 1, 0),
(15, 6, 8, '2022-03-16 11:34:33', 2, 0),
(16, 15, 14, '2022-03-16 11:35:28', 2, 0),
(17, 8, 7, '2022-03-16 15:34:20', 2, 0),
(18, 8, 13, '2022-03-16 15:34:30', 1, 0),
(19, 14, 7, '2022-03-16 15:42:27', 2, 0),
(20, 14, 13, '2022-03-16 15:42:36', 1, 0),
(21, 7, 19, '2022-03-16 16:52:10', 2, 0),
(22, 8, 18, '2022-03-16 16:55:03', 2, 0),
(23, 7, 16, '2022-03-16 17:01:26', 2, 0),
(24, 15, 7, '2022-03-16 17:02:07', 2, 0),
(25, 20, 28, '2022-03-16 19:09:04', 1, 0),
(26, 6, 30, '2022-03-16 19:35:39', 2, 0),
(27, 32, 5, '2022-03-16 20:46:37', 2, 0),
(28, 5, 8, '2022-03-16 21:04:50', 2, 0),
(29, 20, 14, '2022-03-16 22:12:54', 1, 0),
(30, 20, 15, '2022-03-16 22:13:04', 1, 0),
(31, 14, 24, '2022-03-20 12:10:29', 1, 0),
(32, 14, 47, '2022-03-20 12:10:39', 1, 0),
(33, 14, 26, '2022-03-20 12:10:51', 2, 0),
(34, 14, 21, '2022-03-20 12:10:56', 2, 0),
(35, 50, 49, '2022-03-22 09:47:27', 1, 0),
(36, 51, 49, '2022-03-22 09:54:43', 2, 0),
(37, 52, 5, '2022-03-22 10:00:44', 2, 0),
(38, 21, 7, '2022-03-22 14:28:21', 1, 0),
(39, 56, 7, '2022-03-22 17:43:22', 2, 0),
(40, 56, 14, '2022-03-22 17:43:42', 2, 0),
(41, 13, 56, '2022-03-22 17:45:24', 1, 0),
(42, 6, 55, '2022-03-22 18:02:02', 2, 0),
(43, 55, 57, '2022-03-22 18:26:11', 1, 0),
(44, 14, 57, '2022-03-22 18:43:04', 1, 0),
(45, 14, 55, '2022-03-22 18:43:18', 2, 0),
(46, 7, 47, '2022-03-23 22:34:12', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idmessage` int(11) NOT NULL,
  `texte_message` text,
  `url_media` varchar(45) DEFAULT NULL,
  `date_envoi_msg` datetime DEFAULT CURRENT_TIMESTAMP,
  `utilisateur_idutilisateur` int(11) NOT NULL,
  `conversation_idconversation` int(11) NOT NULL,
  `tag` varbinary(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idmessage`, `texte_message`, `url_media`, `date_envoi_msg`, `utilisateur_idutilisateur`, `conversation_idconversation`, `tag`) VALUES
(1, '5jBPnw==', NULL, '2022-03-15 09:11:14', 1, 1, 0x227fa91df9da9a9ce48b4fe533c05b10),
(2, '5jBPn/U=', NULL, '2022-03-15 09:11:26', 1, 1, 0x6fe91fb8928c58fba6a2d0984392ee18),
(3, '5jBPn/Q=', NULL, '2022-03-15 09:14:42', 5, 1, 0x6faf7f6f4f990cb98165d9c2ac5716be),
(4, '3hAcp4iVbw==', '11647336364.png', '2022-03-15 10:26:04', 1, 1, 0x884a79f10ad572fc3755a01bbb442cac),
(5, 'yzocyueQSRnMk1pMt3a/YczD3fAaZvwkKA==', NULL, '2022-03-15 11:46:13', 5, 2, 0x05286f33747cb750fd491b56e4298775),
(6, 'xjBZmLOmVAg=', NULL, '2022-03-15 11:49:42', 5, 1, 0x53cdb09c2d8ede444154d5766206cddc),
(7, '3SBQiquzABaFhFYCsn/6e9eRmc9VYfBjeg==', NULL, '2022-03-15 11:50:10', 5, 2, 0x47d981cd7f3585dfdd1d646b1c4d5ed3),
(8, 'yzpTy+Y=', NULL, '2022-03-15 13:32:58', 5, 5, 0x547084e22dab65ba528c72f6679bfe23),
(9, '0DQ=', NULL, '2022-03-15 13:33:14', 5, 5, 0x151d363e810e478a38306abec35ad60a),
(10, 'yzQcj6KhAB7Xgkw=', NULL, '2022-03-15 13:33:20', 5, 5, 0x1d8e227d4027d6baa9e1784debe4c9ec),
(11, '5jI=', NULL, '2022-03-15 14:06:57', 7, 4, 0x3a537c2d59dd5c90822c7bd91db80adb),
(12, '8TRbhKu3', NULL, '2022-03-15 14:07:14', 7, 4, 0x0225ad17bb0386b763fc9736c165add7),
(13, '0DpSgainUlzhifyLr3bxZtDfmA==', NULL, '2022-03-15 14:50:39', 14, 6, 0xe2cfadebbed0919f67c292f925e88964),
(14, 'xiAcnaahAB7LgFEC/TPBTA==', NULL, '2022-03-15 14:51:24', 14, 6, 0x7a350abdbacd513178882579fc591b51),
(15, '3zpVy6SzAArDxQUR', NULL, '2022-03-15 14:51:30', 14, 6, 0xdd26173a231e2e725c1ac32be71708df),
(16, '2DAcnainTB3Llh9Ro2Xwe8uRjsNVYOQkfZcYRHmv+Gs5lyONofy2ychj4Std2LMp/1qBYwNkPtdgdyuxO8OeAr/TzVaj++gPj+3l9Cc=', NULL, '2022-03-15 14:51:49', 14, 6, 0x477ecf001bee1af9b0bf3393daf1fe8b),
(17, NULL, '141647352317.jpg', '2022-03-15 14:51:58', 14, 6, NULL),
(18, '3zpSy6O3QxeChlNDsXu/YNbInMYQ', NULL, '2022-03-15 14:52:02', 14, 6, 0x281e7b49cdfbf30fc491c9f170de716d),
(19, 'xiAciq6/RQ+CiFBM4nf6cdKRnsYUcO0ke51BQXy4uT0=', NULL, '2022-03-15 15:29:40', 14, 6, 0x96cb63f4e243e7dcaf4e170a465ee1a7),
(20, NULL, '141647354589.jpg', '2022-03-15 15:29:50', 14, 6, NULL),
(21, NULL, '141647354637.png', '2022-03-15 15:30:37', 14, 6, NULL),
(22, 'whFz0f2Xci7vqntnnVbHUfzhqeM6TQ==', NULL, '2022-03-15 15:41:01', 14, 7, 0x452e3f6d5c4e81f4bfa478885961489f),
(23, '8TQchqagQxTH', NULL, '2022-03-15 15:41:18', 14, 7, 0xb5ba92f4016d9291baa0407f70a24b75),
(24, '8CBb', NULL, '2022-03-15 15:41:23', 14, 7, 0xa895b9482766e175fbc483256e9b4774),
(25, 'whFz0f2Xci7vqntnnVbHUfzhqeM6TQ==', NULL, '2022-03-15 15:41:27', 14, 7, 0x452e3f6d5c4e81f4bfa478885961489f),
(26, 'rWoD', NULL, '2022-03-15 15:41:30', 14, 7, 0xc55ce308c60d8302888a56d8ea6cc4c4),
(27, '2DAcmLK7U1zGJpZRrX9cu5nhnN4HbOskY5cYTTe49yI70jLS4KD/', NULL, '2022-03-15 15:51:39', 14, 7, 0xc692a3e4cc729d815b769d8ab3b1ff80),
(28, NULL, '141647355944.png', '2022-03-15 15:52:24', 14, 6, NULL),
(29, '8DpSgainUg==', NULL, '2022-03-16 08:31:47', 14, 6, 0x6bad07ad2aa1cbaec7b923c9b2739de0),
(30, '4TRQnrM=', NULL, '2022-03-16 08:31:55', 14, 6, 0x087e6d68b8c5646545e01aab2ab111a6),
(31, '+jBQh6jyYRHHiVZH4mf6Yc2Ric8Gdw==', NULL, '2022-03-16 11:40:55', 6, 8, 0x3bc1d4a6b6d44ddabba0028a76586af3),
(32, '0DpSgainUlyYzA==', NULL, '2022-03-16 11:41:33', 15, 9, 0x75ea9343b9066e12363adee15cc7f2c6),
(33, NULL, '151647427342.jpg', '2022-03-16 11:42:22', 15, 9, NULL),
(34, '5jBPnwR7', NULL, '2022-03-16 15:06:08', 6, 8, 0x7e9bd8a3c61a81b49bffa4d193a8d0df),
(35, '9zA=', NULL, '2022-03-16 15:06:40', 7, 4, 0x51a946e586254e76246982ee575f58bf),
(36, '4jRPy6O3AA/NkFxLsTOlOw==', NULL, '2022-03-16 15:08:50', 5, 7, 0x913e792161ff56cae7a57fb2a3213bb9),
(37, '8w==', NULL, '2022-03-16 15:08:56', 5, 7, 0x6cd2cdf7fd87b5d0dc149a7daed1c929),
(38, '5jBPnw==', NULL, '2022-03-16 15:09:10', 5, 7, 0x227fa91df9da9a9ce48b4fe533c05b10),
(39, NULL, '51647439761.png', '2022-03-16 15:09:21', 5, 7, NULL),
(40, '1yBU', NULL, '2022-03-16 15:09:49', 5, 7, 0x97cc6702270d3dc1f8718de14cdd6841),
(41, NULL, '51647439795.jpg', '2022-03-16 15:09:56', 5, 7, NULL),
(42, NULL, '51647439808.jpg', '2022-03-16 15:10:08', 5, 7, NULL),
(43, '8Bpyo4iHclzypGtwjV0=', NULL, '2022-03-16 15:14:08', 14, 7, 0x05cbac621f6b6922095d4ccd5f9319ac),
(44, '8TpJiKin', NULL, '2022-03-16 15:20:16', 7, 4, 0x885a35da2f56af1783a3d08ff8de6062),
(45, '/ThLgqK1SBlhUVhLqnnudg==', NULL, '2022-03-16 15:20:44', 6, 4, 0x5634e47880448744f4c4650630e37ded),
(46, '8S1QmKy0SA3HjFlKp3z2eg==', NULL, '2022-03-16 15:24:00', 6, 4, 0xb3fd4891e744d201606afeac78e4afeb),
(47, '+DAcnaKnWFzQgFFWsHbtMtrZmNBVbupt', NULL, '2022-03-16 15:28:26', 6, 4, 0x41af989be2f88ae7f7f49419429109ab),
(48, 'xiAchaLyUBnXnR9So2C/c9HQlQ==', NULL, '2022-03-16 15:28:33', 7, 4, 0xfe19c115799962414004ac3bb83be1fa),
(49, '2DAcn6LyUB3QiVpQo3q/ZtbEic9Vd+Qkf5tdAGOo6yIX2CLT4++h2Ihs4A==', NULL, '2022-03-16 15:28:44', 7, 4, 0x256ba5fb1b280f1b1a2db7ffdf81acf0),
(50, '5jI=', NULL, '2022-03-16 15:28:53', 6, 4, 0x3a537c2d59dd5c90822c7bd91db80adb),
(51, 'wyBZh6u3ABnRkR9OozPrc9Ddkc9VZ+AkfZ1WAC8=', NULL, '2022-03-16 15:29:06', 15, 9, 0x64901ef9ee992485f1fbfddc77e5587f),
(52, '2DAcn6LySB3Llh9Ro3/6Mtrek8QUcPZhKZZdAH2462Yo', NULL, '2022-03-16 15:29:10', 7, 4, 0x14a6cd9f15ec57f6ecacef55f9d6ec53),
(53, '0TpJiKin', '81647441218.jpeg', '2022-03-16 15:33:38', 8, 8, 0xf0f0bd9ed7b7844a7b1cc44ff5c089ef),
(54, '0DpSgainUg==', NULL, '2022-03-16 15:43:04', 14, 10, 0x13078fe9d240e0f33f063709bf6d746d),
(55, '8TpShaahUxmCj1oCtjT+e9TU3cgcZuskeIdZTnT99MHn2iKKuqm024Z//CsPmqkp9B/SfxJiIt9gfyS2PcPM', NULL, '2022-03-16 16:19:09', 7, 4, 0x8a0107af81ac91c10095fe30c5fd234e),
(56, '5nJdmOe2RVzOhB9BqnLxcdyRiY0QcKVpZpwYUH+p/A==', NULL, '2022-03-16 16:20:22', 6, 4, 0x6cf7dfbe4d6353ef1e3f7948b9089a4d),
(57, '4ThYja8RlBXK', NULL, '2022-03-16 16:23:53', 6, 4, 0x01b266fa92b713195ac869972a14a267),
(58, '/jZEhq2kUBM=', NULL, '2022-03-16 16:25:31', 6, 4, 0xd23332433c5e074a4bdc6b36747fe610),
(59, '8TY=', NULL, '2022-03-16 16:25:57', 7, 4, 0xdb18c090da67eb9f9a950d29822c1925),
(60, '8TY=', NULL, '2022-03-16 16:26:22', 6, 4, 0xdb18c090da67eb9f9a950d29822c1925),
(61, '/zROiK+3ABLNkVZEq3D+ZtDek4oGd/U=', NULL, '2022-03-16 16:27:42', 6, 4, 0x09bbee9612cbbe010a2972d08435b909),
(62, '9DFM', NULL, '2022-03-16 16:31:17', 7, 10, 0x57966a6f31cdf8a71bea88c9c82c7a53),
(63, '3DBbmag=', NULL, '2022-03-16 16:31:49', 14, 10, 0xb9645139d89222262a45429f9ca2886b),
(64, '8XJZmLPyQw7blUvhazPwfJnC2s8bI+NrfIY=', NULL, '2022-03-16 16:31:59', 14, 10, 0x8d8683eb78e77ecff65f368f2870e0fa),
(65, '5jIchqOgUg7Q', NULL, '2022-03-16 16:32:10', 7, 10, 0x1e3ec36aba0de15fa80c941922f8e7b6),
(66, '/jpThw==', NULL, '2022-03-16 16:32:35', 7, 10, 0xa94541b7663e1dabb697e064978c578f),
(67, '3T0ch6LyUhnOiko=', NULL, '2022-03-16 16:33:07', 14, 10, 0x32f57761ef175da1636cfd05a64196b9),
(68, '5jI=', NULL, '2022-03-16 16:33:46', 6, 4, 0x3a537c2d59dd5c90822c7bd91db80adb),
(69, '5jQcm6byRB3PjB9Spg==', NULL, '2022-03-16 16:33:50', 14, 10, 0x703bec43efe5458f69f0e373d8fa3180),
(70, '4idTnrM=', NULL, '2022-03-16 16:33:53', 6, 4, 0xcb8f9c29c85e2e4d2f8d328ca9e43ea6),
(71, '8z9dg6a6SB3KikXhe3r5cMPUlM0dbEa9bM5L', NULL, '2022-03-16 16:39:10', 14, 10, 0xa8c996e6e30e0f2eea5dc6113cdd5fb3),
(72, '0DpSmKi7Ug==', NULL, '2022-03-16 16:39:59', 14, 10, 0x55fbd785a4bf3b218b0d409e18e7e5c5),
(73, '0DpSgainUg==', NULL, '2022-03-16 16:41:43', 14, 10, 0x13078fe9d240e0f33f063709bf6d746d),
(74, '8TY=', NULL, '2022-03-16 16:41:53', 7, 10, 0xdb18c090da67eb9f9a950d29822c1925),
(75, '4jE=', NULL, '2022-03-16 16:42:07', 7, 10, 0x666112d900a930e0d20bd748f61b6ef3),
(76, '5iFIn7M=', NULL, '2022-03-16 16:42:26', 7, 10, 0x05cf3bc5d433f1374d65a4d6ff0432d5),
(77, '6iJXhKO6RhPSi1Q=', NULL, '2022-03-16 16:43:06', 14, 10, 0xd782c854b2477f72a22c21e82086c9bc),
(78, '8TY=', NULL, '2022-03-16 16:43:25', 7, 4, 0xdb18c090da67eb9f9a950d29822c1925),
(79, '4idTnrM=', NULL, '2022-03-16 16:43:43', 6, 8, 0xcb8f9c29c85e2e4d2f8d328ca9e43ea6),
(80, '4iU=', NULL, '2022-03-16 16:43:56', 7, 10, 0xd6c412cc2a4a5c5017489f200e1c425a),
(81, '4idTnrPyWE4=', NULL, '2022-03-16 16:43:58', 6, 8, 0x36f3df5e8ee2c6ce9c38506895bc29af),
(82, '5g==', NULL, '2022-03-16 16:44:17', 7, 10, 0x22c78c9f392c0c4f70990a23a9959792),
(83, '8TYcjKU=', NULL, '2022-03-16 16:45:42', 7, 10, 0x87b847aec3ac34a26702922f26ae19e5),
(84, '3zRVmOe4Bx3LxU9DsTPvZ9Xd', NULL, '2022-03-16 16:47:46', 14, 10, 0x2469c12e660aec7b9e3e1f62248293d8),
(85, '5jI=', NULL, '2022-03-16 16:47:58', 7, 10, 0x3a537c2d59dd5c90822c7bd91db80adb),
(86, '+DAcn6LyUwnBgA==', NULL, '2022-03-16 16:49:17', 7, 10, 0x0b51c32561dd608510a71c6edcf4c18c),
(87, '9zA=', NULL, '2022-03-16 16:49:51', 7, 4, 0x51a946e586254e76246982ee575f58bf),
(88, '8TpJiKin', NULL, '2022-03-16 16:50:45', 8, 11, 0x885a35da2f56af1783a3d08ff8de6062),
(89, '+DAcmLK7U1zRjFFBAbvtd9TUk95VZ0atep1U47n9/Wdt2SKKvu+iiMd8/Sdd2LSEMwqdYhVld3HgMjGkacLbNZF+IBPm6+8so8k=', NULL, '2022-03-16 16:51:07', 7, 12, 0x7489f6dba91f8f6a4d9b495d48a6c80c),
(90, '8TY=', NULL, '2022-03-16 16:52:39', 7, 13, 0xdb18c090da67eb9f9a950d29822c1925),
(91, '/TscjrSmABjHlh9SsHrpe9VyVM0cwCx3', NULL, '2022-03-16 16:54:02', 6, 4, 0xfda794985c4f1f969ae65a6070b8b766),
(92, '4TRbgw==', NULL, '2022-03-16 16:54:31', 7, 4, 0x8ccb68cfb98d608ce452e200a58ef300),
(93, '9SdOmbU=', NULL, '2022-03-16 16:54:46', 6, 4, 0xb14c809904d0488f2a6f326dc268eb53),
(94, NULL, '141647446391.jpg', '2022-03-16 16:59:51', 14, 10, NULL),
(95, '9jE=', NULL, '2022-03-16 17:00:44', 7, 10, 0x6d6107f3e3c580259143bfb0f137c704),
(96, NULL, '81647446480.jpg', '2022-03-16 17:01:20', 8, 8, NULL),
(97, '8TY=', NULL, '2022-03-16 17:01:38', 7, 14, 0xdb18c090da67eb9f9a950d29822c1925),
(98, '9zA=', NULL, '2022-03-16 17:02:41', 7, 15, 0x51a946e586254e76246982ee575f58bf),
(99, 'S9HlYx9j+fZ7YB/6ZcoVyhFpTnP92gAk0HXhqDAEH9vIbs9yflZ9iH6tS8/3Uh72Qt0quqiad2vKy80d/34HeCmRnfzmV2+USngNY8cRq7vlPV99fzTFaEh/7CK9gUCnKkxL8Ord/C29iOFEZ6p/Oo6bCSSisnTPCNTmOsBjK/coWuFgsFXlv3ZokFwjU5PbJhHvF7iUSdZ7Eda+tNwsHpdk+jh9hfI1BDOPZS1sGr89MXLwabuEMmyH+/b2xRPnM7hj5rpbXVgJq6xdR0HHeSYJcx8G70j3ITTBVZm5TG/LNMEqyuN5T8VP50DBtJwTwRV4bGKh1Zt7q6Y/RSv+HKpOZawuy92pF5IJ6wUQ32J3qVzJZFpcr8an5HsX5LqL', NULL, '2022-03-16 17:03:49', 15, 15, 0x92a19da3bc6f240e008a0721c4c1b3f9),
(100, 'S9HlYx9j+fZ7YB/6ZcoVyhFpTnP92gAk0HXhqDAEH9vIbs9yflZ9iH6tS8/3Uh72Qt0quqiad2vKy80d/34HeCmRnfzmV2+USngNY8cRq7vlPV99fzTFaEh/7CK9gUCnKkxL8Ord/C29iOFEZ6p/Oo6bCSSisnTPCNTmOsBjK/coWuFgsFXlv3ZokFwjU5PbJhHvF7iUSdZ7Eda+tNwsHpdk+jh9hfI1BDOPZS1sGr89MXLwabuEMmyH+/b2xRPnM7hj5rpbXVgJq6xdR0HHeSYJcx8G70j3ITTBVZm5TG/LNMEqyuN5T8VP50DBtJwTwRV4bGKh1Zt7q6Y/RSv+HKpOZawuy92pF5IJ6wUQ32J3qVzJZFpcr8an5HsX5LqL', NULL, '2022-03-16 17:03:55', 15, 15, 0x92a19da3bc6f240e008a0721c4c1b3f9),
(101, 'S9HlYx9j+fZ7YB/6ZcoVyhFpTnP92gAk0HXhqDAEH9vIbs9yflZ9iH6tS8/3Uh72Qt0quqiad2vKy80d/34HeCmRnfzmV2+USngNY8cRq7vlPV99fzTFaEh/7CK9gUCnKkxL8Ord/C29iOFEZ6p/Oo6bCSSisnTPCNTmOsBjK/coWuFgsFXlv3ZokFwjU5PbJhHvF7iUSdZ7Eda+tNwsHpdk+jh9hfI1BDOPZS1sGr89MXLwabuEMmyH+/b2xRPnM7hj5rpbXVgJq6xdR0HHeSYJcx8G70j3ITTBVZm5TG/LNMEqyuN5T8VP50DBtJwTwRV4bGKh1Zt7q6Y/RSv+HKpOZawuy92pF5IJ6wUQ32J3qVzJZFpcr8an5HsX5LqL2FC4CRpOxm75/rpYzHPNmUOzQFRyijh9s8QAifxhwPwJTBE7l1ayVS6YjCoTLKwHZMowU2hVgpPThaD5ZL07K/vGRved+MK79UjeZ5QlKnMQIpgh3ZYmwV3tL4PH8XAP2YFdjrq8etfAEEZ4VcMrzq1dKYaekuZ+GCMS/vyMYhHozXgOAR/MR2dxtnX8JzNEl65/vwGQ2dUDaUv5QUm40sm4T4+zYxX7zmWAUxClEPQOJVVH4eds8goyX67f2770D1b8jMVRymsM1SIGhX9Hbtf0+a++0fYrWm7VpL01jvd5qZsEDGtXftC5UnMxib7KgHK2ah00dhqArZPMd/HjTmtCK2YtecVr5JodTXGsECRHhXJbTR4UvI8FR5ETttrq2aVBKRDgYSS94An6ceo6GErEhKQ62JKO7+Vcv0nDkPS0y6lQNagf8j8wOleCbWOmgKw8ZSARpE2i0lJUOlumL3LpQdlkF3Ro1W94pD8JxoYaFUe2PkVqJE0XD51MsGS2YiN5US23AOSXbqYnb/mpC3id9SrQ1LbV33UBrKBLernxXxGHMQIujO5uYiyAM5uFQKXQ589JxkD+jUyAlGU5wBIodHHVLHs/ZgW9njOgLITDJbx57z8VMX3pgmdYDx/R+8dS2jMdneYE+Qn3x7XC5wULjL0myFjPT807ib54Qg/BP2bHMUOQDb08QSoZloUtROG76Av4biJg7bBhbzXqceeLvJ/AM/LuLoiPVX6GXPDGG5EEtbwvOovyUO/Z4gWsA6ZerG3W3hnQonvm22H/rTv848bQjjMwI8bdh/mx414M/XrV8mttSlm6w/l8qxq9wY+3K8JK83bKzVV5zCHyRT1hzcjK6Gpkwbg2u2TgazKmCG7ozI01b7zTuggsIlqXFaMvbMaHlwhLniDTL8/+a/egLPpsWtQqw+tuGAS2KMKsVw0Chrs+xsFDtTyy+Fm2VWJwmQFuYAqntG+QmVg6b/nlbcS4y0rm6bxMxWX8z3UVmjCsXhtJhB0b3XNzk1DQhhu6c45281SV+ZtcU1G0/eb1KZiUr3DIQGe1+CyEUX34qMRZCrImMPce/xJeIwCLTcpeJwuiPNPM+MtsZbnk8/UhzHjjOL+8WJ+4uAME3/zFLayHidtchQpICoyJY+W7lMZvy4AbZEJ/BZAXArej5UNDY7ndSJo0Zn1Y8dqyl9W8/7VoyxAnT/w7MDNiRC/fNANF53kl7jXHwEYj2FeXMgcqSWy0dQl4pBnddwTOi1B2P5ycnsC0P6+xtg2jXzXAJuQG40ZhwsMlbq1miCtBtWy68BS8N5CCTfSYitpf5TwHWUxDB2KpumsAsVlQi07C2JgMilV+EHnK9UBzt0ig+0Jwkxy22PI8XZpy19rwYV/wm2X0hI1TFcmEhoUlUk/9PqVlDB7PxH/xZddEvUM8gV+wqR1yiCTw51l/1nJkv+aME1qz+QbH4RLa+hio3JWJ6kCTJLTVPDqmYZ3Wto34C94PsZ+cGHln76hZBDSe4UdvjbuownzVRGNo97KYQ89/', NULL, '2022-03-16 17:04:09', 15, 15, 0x2cfea50bc0848b025bdc7ad7a1df49d8),
(102, '9zBZ', NULL, '2022-03-16 17:06:08', 7, 15, 0x8781fbe85acbe0eac8d4e856fecb0c34),
(103, '9jROgKY=', NULL, '2022-03-16 17:10:56', 7, 15, 0xbc02ae06d455a36fc00287283171b165),
(104, '9jFYjw==', NULL, '2022-03-16 17:11:15', 7, 15, 0xa9a047857b2561629984dd87add720b2),
(105, '9DNbjQ==', NULL, '2022-03-16 17:13:32', 7, 15, 0x4f890d2c668a11c3662d22ab631d537d),
(106, '9TJbjA==', NULL, '2022-03-16 17:13:57', 7, 15, 0x35219be7163e9db7140e451a008d6ac6),
(107, '5iE=', NULL, '2022-03-16 17:16:40', 7, 15, 0x25e51695bdc9651ec3e06a5a97be3cb6),
(108, '5iE=', NULL, '2022-03-16 17:17:20', 7, 15, 0x25e51695bdc9651ec3e06a5a97be3cb6),
(109, '/Ds=', NULL, '2022-03-16 17:18:01', 7, 15, 0x30b38d6c07026e1f52462ff88ea205ab),
(110, '9zA=', NULL, '2022-03-16 17:19:06', 7, 15, 0x51a946e586254e76246982ee575f58bf),
(111, '5jI=', NULL, '2022-03-16 17:19:44', 7, 16, 0x3a537c2d59dd5c90822c7bd91db80adb),
(112, NULL, '151647448019.jpg', '2022-03-16 17:26:59', 15, 15, NULL),
(113, '0DpTham4TwnQl00=', NULL, '2022-03-16 18:42:46', 5, 7, 0x746b0d8f85639232071f80d808fdae9b),
(114, 'xBppuOeTbDDnvx9gi1bRMoaOwg==', NULL, '2022-03-16 18:52:40', 14, 7, 0xde8bd47c118b46556da48e2db97c1254),
(115, 'xiAcirTyVgmCiF4CsnvwZtY=', NULL, '2022-03-16 18:57:26', 18, 17, 0x6ac6d10acbd1f150eb2d99483cd5358d),
(116, '1z1Zg+e9VRWCgEsCtHzqYQ==', NULL, '2022-03-16 19:20:35', 5, 7, 0xf95722fe2cdcb5b89380a7227cb75c12),
(117, 'UdJdy77yRQ/WxVXAQor+e5nFj8UAdUatKZFXTX2493Ztw6UqV++yy8N65itd', NULL, '2022-03-16 19:38:03', 30, 18, 0x8d67e4c411991569c0cdda444d7e210a),
(118, '2Le8cqa2Tw7HxVPAQor+YsndlA==', NULL, '2022-03-16 19:38:10', 30, 18, 0x56fcc9b941e2bfcd10f28dc2701bcadc),
(119, '/zBOiK67SRXLxVtH4nnwZ9zD3cYQI+9hfNIZ', NULL, '2022-03-16 19:39:13', 6, 18, 0x624363b57ee83984771d00563651500d),
(120, '0TpJiKinVQk=', NULL, '2022-03-16 20:52:45', 32, 19, 0x605f78af8d1698539cf8248ceaf8bb4a),
(121, '2DAcn+CzSRHH', NULL, '2022-03-16 20:52:48', 32, 19, 0x4b2d16bf1430ce95b8483e430045012c),
(122, '0TpJiKinVQk=', NULL, '2022-03-16 20:53:36', 5, 19, 0x605f78af8d1698539cf8248ceaf8bb4a),
(123, '3zpVy6anUw/LjFYCtmHwYsnB', NULL, '2022-03-16 20:53:41', 5, 19, 0x8450f3112abe80e842d785084ea2b285),
(124, 'xiAciq6/RQ+Ch1ZHrDPzd5nfkt8DZuRxKYhXRWk=', NULL, '2022-03-16 20:53:49', 5, 19, 0xbaa55702451bed9f5f7c851f3cf12371),
(125, 'UdINy6qzUh/KgB9Pq3bqapmO', NULL, '2022-03-16 20:54:00', 5, 19, 0x4cdae9c80686319b4ae1d227f2c69b9f),
(126, '0TpJiKin', NULL, '2022-03-16 20:55:02', 32, 19, 0xf0f0bd9ed7b7844a7b1cc44ff5c089ef),
(127, '3SBVgq4=', NULL, '2022-03-16 20:55:05', 32, 19, 0xd3d18f4488d1b9e5c7235a6c74f25bb7),
(128, '0TBPn+e8SR/IgFM=', NULL, '2022-03-16 20:55:09', 32, 19, 0x99f394bfde41ab60586c4a83c2924763),
(129, NULL, '321647460524.jpg', '2022-03-16 20:55:24', 32, 19, NULL),
(130, '2DAcn6K8VBmCiRhHrGXwe9yRmc9Vc+1rfZ1L', NULL, '2022-03-16 20:55:30', 32, 19, 0xd6e95e6cb0c7c4491787510a5fba0267),
(131, '0XVSgqS5RRA=', NULL, '2022-03-16 20:55:35', 32, 19, 0x2f0ebc86f0cf3eb6b6104455b6ccb653),
(132, '2jxUgg==', NULL, '2022-03-16 21:02:13', 5, 19, 0xdab07cc160d83c47caf7342676582e1b),
(133, '2DAcn+CzSRHH', NULL, '2022-03-16 21:02:16', 5, 19, 0x4b2d16bf1430ce95b8483e430045012c),
(134, '3zBOiK4=', NULL, '2022-03-16 21:02:23', 5, 19, 0xbd563d167fdc64b5c49a2435f6ab4329),
(135, 'xidTm+exSBPXlVZMrWa/ZtiRjcIad+okbIYYQ3Wx9Wc+lyPf7uKw2M9ksjpdl7Zn+BOXYg==', NULL, '2022-03-16 21:02:34', 5, 19, 0xc9c94620850d22aef784e78a97118e3b),
(136, '3SBVy+Y=', NULL, '2022-03-16 21:06:48', 8, 17, 0xdf29227dcfc8d19535cc70606fb7a11e),
(137, '3TpTy631QQrDjEwCsnLsMs/EiN9Vb+B3KZ9dU2O8/mc+', NULL, '2022-03-16 22:00:13', 32, 19, 0xb676fc1d6237459ecf172c7dae5ded58),
(138, '0XJZmLPyUBPXlx9Bo2nl', NULL, '2022-03-16 22:00:18', 32, 19, 0xdaa00b27caac43e5ff0bb799940e2184),
(139, '2DAciLW9SQ+ClEpH4nC40RDFnMMBI+hlKYJKRX20Wqo/0mfLu+q43M9l/A==', NULL, '2022-03-16 22:00:26', 32, 19, 0x7c0031acf6f6fafd2f793ea781f5e529),
(140, '2DAcn+CzSRHHxV1LoHzq', NULL, '2022-03-16 22:00:31', 32, 19, 0x6445f768e7ab5bf20a3779146845b0d5),
(141, '0DpShaLyTgnLkR9So2ftfdc=', NULL, '2022-03-16 22:34:38', 14, 7, 0xd53e16c4562dfe1e6188bd12dd4822ae),
(142, 'xDpJmOcRigjHlh9XrDP4d9fFlMZVa/BpaJtW', NULL, '2022-03-16 22:34:43', 14, 7, 0x195f920974c41e20c9636868a93d31da),
(143, '1DRVn6KhABjHxV1Ho2bnMstyV9wQcA==', NULL, '2022-03-16 22:34:48', 14, 7, 0x6cf672487bbdad5a2654dd29378cec8e),
(144, '3T0chqKgQxWCxA==', NULL, '2022-03-16 23:19:32', 5, 7, 0x43e300ea757a87379a3e5b5012f7affe),
(145, 'UdJdy6q3AAjNkFxKpw==', NULL, '2022-03-16 23:19:45', 5, 7, 0x03bcf9e286d9896abf149c01abb2fc67),
(146, '3SBVy6a6QRSCj1oCtHL2YZnXnMMHZqVgbNJaRXGo4SI/dO3cq/0=', NULL, '2022-03-16 23:20:02', 5, 7, 0x6158c53eb341bb8fa87c90d9c409fd70),
(147, 'UdUciKKmVBmCjVpXsHa/fnoR3clSZvZwKZ4fSHWo62dt0yKK7PwSAtBv4GwPCFnfE4ptlPjgyCrJ4tpdwFYh/UXg29Nz', NULL, '2022-03-16 23:20:26', 5, 7, 0x335be706c6a5f49b6e2472dd42c68c7d),
(148, '2DAcmQR4VhmCgUpQ4n9cspnV2sscb+lhfIBL', NULL, '2022-03-16 23:20:32', 5, 7, 0xdede1f17e88fc82ebf795c2ba4bba8c8),
(149, '0CdZjQ==', NULL, '2022-03-16 23:20:35', 5, 7, 0xf27c6e5f83103ccbf673431066eb4bb9),
(150, '0DRUy7ezVA7Nix8d/Sw=', NULL, '2022-03-17 09:44:13', 14, 7, 0x011f67e8997a3825cf423a450c45810e),
(151, '0DRUy7anTxU=', NULL, '2022-03-17 17:12:46', 5, 7, 0x74c59456cfce8e5974fc3723100604d4),
(152, '3zpSy7emSQiCiF5Wtnv2YZnbmIoDYux3KZdWQ3mv/CIr1i7Yq66g2cVisipK2LYm6VqQZRR+', NULL, '2022-03-17 18:07:16', 5, 7, 0xd39ee3063d4cc68559d08250e4b57dea),
(153, '2DAcnaa7U1zDiVNHsDPrYNjHnMMZb+B2KZZZTmP97GxtxDPLvOyky815', NULL, '2022-03-17 18:07:29', 5, 7, 0x20432a698996b0dfb6bcac58a4a8ada8),
(154, '2DRVy7ezU1zOgB9Bqnz2apnXnN8BI/RxbNJSQWSp/Gwp0meYpq61ych5sj5Oiq80', NULL, '2022-03-17 18:07:40', 5, 7, 0x18ee542ffaf9e6d1f9512f7a1a1395b0),
(155, '3jBPy6W7QhDLiktKAbvuZ9zC3clVZeB2ZDGRANN9uWEowzPP7ua03dRvsiJO', NULL, '2022-03-17 18:07:49', 5, 7, 0xce11f33b43e6862bb62492f064c220f5),
(156, 'wjROj6i8', NULL, '2022-03-17 18:07:53', 5, 7, 0x314b7bf2225d59ce2083fe0133df9c29),
(157, 'wSBMjrXyVBnRxU9KrWfwYZnVmIoZYvVtZ9IZ', NULL, '2022-03-17 18:12:28', 5, 19, 0x931ceee927b54295f40e4629b5c49498),
(158, NULL, '51647540702.jpg', '2022-03-17 19:11:42', 5, 19, NULL),
(159, '0TpJiKinABHDxV1DoHY=', NULL, '2022-03-17 19:11:47', 5, 19, 0xfdef95c92f54e5c3bda5e958670f6000),
(160, 'xztZy7e6TwjNxU9Nt2G/ZtbY', NULL, '2022-03-17 19:11:52', 5, 19, 0xe215319401cf2433242a35679cc42d1c),
(161, 'xidTm+ewRRDOgA==', NULL, '2022-03-17 19:11:59', 5, 19, 0xa132e46b4286f3c8f631dd6a9c3ecd47),
(162, '3jBPy6S9VRDHkE1R', NULL, '2022-03-17 19:14:02', 5, 19, 0xb294f91629963a10d8e7a1b89c364429),
(163, '2DAcnainU1zShE1GrX3xd5nBnN4HbOsqJw==', NULL, '2022-03-17 19:16:43', 14, 7, 0xedb25f531d72f817598eb88b069decbb),
(164, '3zRVmOe8RVzQgFxNr376fNrUh4oFb/B3', NULL, '2022-03-17 19:16:53', 14, 7, 0x0038ff2b222e144dd87146af2e38c5ca),
(165, 'xyJJ', NULL, '2022-03-17 19:16:58', 14, 7, 0x176899373c4bdcee42b95ed2533cc96a),
(166, NULL, '51647541630.jpg', '2022-03-17 19:27:11', 5, 19, NULL),
(167, NULL, '51647541658.jpg', '2022-03-17 19:27:38', 5, 19, NULL),
(168, '1SdOmeewVRvRlkw=', NULL, '2022-03-17 19:27:54', 5, 19, 0x31112e3be0e3b647edbfdc226fab34e8),
(169, '0XVRiue0QRXWgA==', NULL, '2022-03-17 19:27:58', 5, 19, 0x28821e882b68e988a0a112008b399e26),
(170, '1DRJn6I=', NULL, '2022-03-17 19:28:00', 5, 19, 0x5795fad92feac16f5b4f359b417f77f6),
(171, 'xTpJirCl', NULL, '2022-03-17 22:24:39', 32, 19, 0x08fc800c88367c5b704148034eb2a8b9),
(172, 'xidTm+ewRR3XkEo=', NULL, '2022-03-17 22:24:43', 32, 19, 0xf7e2e7ebc6e419661b6e807f155546bd),
(173, '2DAcn+CzSRHHxV1LoHzqMt2WnMcadvc=', NULL, '2022-03-17 22:24:50', 32, 19, 0xbf2c3ae3733674bdbf7beb7935ded690),
(174, '3jpTnaK3RRk=', NULL, '2022-03-18 16:53:50', 5, 19, 0x99a8b8635bac7a574957be62314aa787),
(175, '0TpJiKin', NULL, '2022-03-18 16:53:55', 5, 19, 0xf0f0bd9ed7b7844a7b1cc44ff5c089ef),
(176, '0DpSy7e7WA==', NULL, '2022-03-18 16:53:59', 5, 19, 0x7dd1f62d76934fb9cf5d2ae82206ea5f),
(177, 'xjBPnw==', NULL, '2022-03-18 16:56:09', 5, 19, 0x5ad52159013bb1c11c345b253edeb29d),
(178, '2DAcn6KhVBmCgVpR4mftZ9rC', NULL, '2022-03-18 16:56:12', 5, 19, 0x9b56fe862ca56b4514a60e0eda8f3e86),
(179, 'UdJdy6byTFvDjE0Cpna/f9jDnsIQcQ==', NULL, '2022-03-18 16:56:16', 5, 19, 0xa6fbfc70ebe9e06a7aaf020ce7f1e64b),
(180, '0DpSgainUlCChlBPr3bxZpnHnNlVd/AkNg==', NULL, '2022-03-18 21:54:25', 14, 9, 0x10eb374a6b08e44c6c43f47767ffc94d),
(181, '3zBOiK7yQhnDkFxNt2O/dtyRicUbI+RtbZcYAQ==', NULL, '2022-03-18 21:54:34', 14, 10, 0x7d50d19c07d7381546b8433216ee6f41),
(182, '0yAcmaKkTxXQyw==', NULL, '2022-03-18 21:54:45', 14, 7, 0x52c583bd4f8144d79de953cd4e946dda),
(183, '0TY=', NULL, '2022-03-19 00:36:01', 7, 10, 0xa3b248d42286c0c2622a19e98f32f0a8),
(184, '1A==', NULL, '2022-03-19 00:36:38', 7, 10, 0x0d12e87df233a009abf265cfa2d5e441),
(185, '1j5XiA==', NULL, '2022-03-19 00:36:39', 7, 10, 0x7b4ad31d397f20d113a7ca909562e41d),
(186, '1jFY', NULL, '2022-03-19 00:36:42', 7, 10, 0x7334efaf938822238c1b2e0dad1b7a6a),
(187, '0TpJiKin', NULL, '2022-03-19 00:38:22', 7, 10, 0xf0f0bd9ed7b7844a7b1cc44ff5c089ef),
(188, '0Q==', NULL, '2022-03-19 00:38:24', 7, 10, 0x9e52ed374ae88c38fb207ff1a31ece3c),
(189, 'xjBPnw==', NULL, '2022-03-19 14:12:43', 7, 10, 0x5ad52159013bb1c11c345b253edeb29d),
(190, 'wSFTm+ehUB3PiFZMpTPyd5nViM4Q', NULL, '2022-03-20 12:09:35', 14, 10, 0x70ad4badc7b645ece078274da6cc0923),
(191, 'yzpJg6inVQnX', NULL, '2022-03-20 12:19:14', 21, 22, 0xdcc0f4adf885c95bd1b78cdb20ac5a84),
(192, '0TpJiKinABDHxU9Ot2C/cNzQiIpJMA==', NULL, '2022-03-20 12:19:36', 14, 22, 0xb72dad50aafdf035a418bb143519ef88),
(193, 'wDpUy6q3Q1zDl03haGf6MtqWmNkBI/FrYNJUUHL9e5/pWP8l', NULL, '2022-03-20 22:26:29', 21, 22, 0x1c65aeeff3b5404292e07a139adae9fa),
(194, '3jQcmKKxVBXNix9DpnzvZtDek4oQcPEkf4BZSX2493Zt1CjFog==', NULL, '2022-03-20 22:27:22', 21, 22, 0x629689168d91541ab551e5f2a80d9fd5),
(195, 'wTxPgue4RVzBl1BLsTPuZ9yRl89VdeRtetJKRXOy9G8o2STPvK6hy9cq8W5Jl7QzugqAbQV5Jscl', NULL, '2022-03-21 00:14:59', 5, 7, 0x4590c6badc7d797aa6748dbe61f9bb4a),
(196, 'xjBPnw==', NULL, '2022-03-21 07:38:04', 5, 19, 0x5ad52159013bb1c11c345b253edeb29d),
(197, '3T0=', NULL, '2022-03-21 07:38:09', 5, 19, 0xdbc22e9354f4de2f9b5c5f8d57d56959),
(198, '3zBOiK7yTBmCll5MpT+/eNyRiY0UauhhKc4L', NULL, '2022-03-21 11:58:42', 14, 22, 0xc050920cb46e9ff9ff6c56ec82a380d4),
(199, '/DpSy623AArNkEwCrjT2fM3Uj84ccA==', NULL, '2022-03-21 11:58:57', 14, 7, 0xe88b2dd1bf5a1c15f33d5af9d8ddd12d),
(200, '3T1ShKm8Tg==', NULL, '2022-03-21 12:03:29', 5, 7, 0xc5aca287348640612b8e55769e9f3b31),
(201, '/zRVmOexQVzPhE1Bqna/ZsvejYoXauBqKahXRWn98yUs0yjYqw==', NULL, '2022-03-21 12:04:53', 14, 7, 0x663b2cf53d3d2e01392d8e1c998ab8dc),
(202, '8XVMirTyTR3OxVBXqw==', NULL, '2022-03-21 12:43:03', 5, 7, 0x59fcb57f0fca62ffd84833c8432805f6),
(203, 'UfJdy7GzAL8IkU1H4nbxcdbDmIoYauBxcQ==', NULL, '2022-03-21 12:43:14', 5, 7, 0x754d3214e12bf1aa0df6912702fc775c),
(204, '5jBPn82mRQ/W72tWp2DrftbDmMccc/ZxZIJUUHSu8m8r3TTOpuW7z8Bg+j1InL8z6xyWeQhkMNo1ey+tL8HaPpd4Lh2q6bsotNHVzwu8ZQ0LiPmf', NULL, '2022-03-21 12:43:53', 5, 7, 0x226b2cdac82821b748657c1145caa218),
(205, NULL, '51647868143.png', '2022-03-21 14:09:03', 5, 7, NULL),
(206, NULL, '51647868181.png', '2022-03-21 14:09:41', 5, 7, NULL),
(207, NULL, '61647868279.jpg', '2022-03-21 14:11:19', 6, 18, NULL),
(208, NULL, '61647868302.jpg', '2022-03-21 14:11:42', 6, 18, NULL),
(209, '3TscmKigVFzHi0xHr3Hzd5mO', NULL, '2022-03-21 19:40:56', 21, 22, 0x0f170f7a9037aa6d38c60fdd41508b34),
(210, '5jBPn7M=', NULL, '2022-03-22 00:47:33', 5, 7, 0x7fe468bf19a6b1fe87f2b1fdd270d44c),
(211, 'xjBPnw==', NULL, '2022-03-22 00:55:57', 5, 7, 0x5ad52159013bb1c11c345b253edeb29d),
(212, '0TAchrS1ABnRkR9HrGXwa3oY3c4Qc/BtetJNTnX973As3iKKr/6hxM9v', NULL, '2022-03-22 00:56:08', 5, 7, 0x1a21bf9aee989f6b5b60f67ccb353c5d),
(213, 'xjBdmK68Rw==', '51647910896.jpg', '2022-03-22 02:01:36', 5, 7, 0x98acb90a956a0d505e312a2310d7d011),
(214, '0CdTywR1QVzDk15MoXa/e9WRkMsbcvBhKYJUVWP96HcolyvL7vy03s9v5W5LneYk8h+ILBZ/ONUsdw==', NULL, '2022-03-22 02:01:51', 5, 7, 0x6d99084dee95e4efc64c2dde6e177ac7),
(215, '3zRVmOerQVzGgB9FsHLxdtzC3ckdYutnbIEYUWW4ucHq1mfar/2izYZ68z0PnLNn6giXYRh1JZIjfTC1', NULL, '2022-03-22 02:02:09', 5, 7, 0x7bce7311119df3baa1cb9a006e0c7482),
(216, 'xjBPnw==', NULL, '2022-03-22 10:02:45', 5, 24, 0x5ad52159013bb1c11c345b253edeb29d),
(217, '2idWj622', '51647939773.jpg', '2022-03-22 10:02:53', 5, 24, 0x5a6492c9da20783111ecb8cbc132df23),
(218, '5jBPnw==', NULL, '2022-03-22 10:05:25', 5, 24, 0x227fa91df9da9a9ce48b4fe533c05b10),
(219, NULL, '51647939949.png', '2022-03-22 10:05:49', 5, 24, NULL),
(220, '/TRX', NULL, '2022-03-22 10:07:25', 52, 24, 0xa83b82f9787f4a077fc6d57bb3b8f927),
(221, '2DAcmLezTVzIhFJDq2C/a9Y=', NULL, '2022-03-22 13:13:42', 7, 10, 0xc960e3c6229eeb8667d49bdb0dbc0508),
(222, 'wTRQy7WzVA==', NULL, '2022-03-22 17:48:07', 7, 25, 0xc32f28bf996da8676ac5bfa856e6433c),
(223, '1DBOhqLyVB2CgkpHt3/6Mt/YkdlVZ+AkeYdMRQ==', NULL, '2022-03-22 17:49:00', 56, 25, 0xacd288956e15de9ad1688aeea95994c5),
(224, '8DpSgainUlzShEtQrX2/eNyRm8sccKVxZ9JMRWOpuXQkwyKKqO+43MM=', NULL, '2022-03-22 18:09:05', 6, 5, 0x0c012598d451f28c27609b0f8c0334d1),
(225, '83Vdn7PyShmCl1pEo3rs', NULL, '2022-03-22 18:09:12', 6, 5, 0xa18fb293a4b2e22084579f552857c32f),
(226, '/zhRgw==', NULL, '2022-03-22 18:09:18', 6, 5, 0x67c6da033863ddf2e21d27073d4ae9fd),
(227, NULL, '61647968976.jpg', '2022-03-22 18:09:36', 6, 5, NULL),
(228, '/T4chqKgQxWClV5WsHzx', NULL, '2022-03-22 18:09:44', 6, 5, 0x6c8955fb6eb27407a0bd2522c40470e5),
(229, '2DAcnainU1zHix9SsHr6', NULL, '2022-03-22 18:10:42', 5, 5, 0xf55dce9f2faf418bf47f542f2f1c15a5),
(230, '3jBPy7O3UwjRxfyLtnL2d9fF3ckabeZofJNWVGP9pg==', NULL, '2022-03-22 18:10:51', 5, 5, 0xfc4848dfc452c1a5b9548e8236a800bf),
(231, '/SBVy6T1RQ/WxV1NrDP1NdjHnMMGI+kjYJ9IUnWu6msi2Wfbu+vxxIFr/CdCmbIu9RTSaFZ1OcQve2UG4NLfMYQwJxe1/Avk7s3G0gHpb0UFl6GEmHty', NULL, '2022-03-22 18:12:08', 6, 5, 0x6a3d8730c9a9ed0a89444e8cb6d1d056),
(232, '8DpShaLyShPXl1Hha3a/YtjFj8Ub', NULL, '2022-03-22 18:12:17', 6, 5, 0x4e7db2b94a41caf69bf55784ab5d02d6),
(233, '2HJdguemTxKChFtQp2Dsd5nLmN8Xag==', NULL, '2022-03-22 18:34:10', 7, 25, 0x842f841cbbd8bbcce4fd1ef52f3c5ca1),
(234, 'xjBPn7OmVAg=', NULL, '2022-03-23 08:06:04', 7, 10, 0x376288a5fa8dbc51b61acd3aa259b820),
(235, '8TY=', NULL, '2022-03-23 08:51:24', 8, 8, 0xdb18c090da67eb9f9a950d29822c1925),
(236, '8TY=', NULL, '2022-03-23 08:51:42', 8, 16, 0xdb18c090da67eb9f9a950d29822c1925),
(237, 'xSZUy6u3AA/Di1g=', NULL, '2022-03-23 10:27:00', 6, 8, 0x975dcf4742106379db3aeb65b319b92b),
(238, 'wyBZy6q3AArHkEcPtma/Z83YkcMGYvF2YJFdAHS4uVgi0j6K8Q==', NULL, '2022-03-23 10:28:01', 7, 16, 0x1c2be0bdabeaae0445e4445dc0da056f),
(239, '4DxZhee2VVzWikpW', NULL, '2022-03-24 21:15:04', 8, 16, 0x1688286a3ab41a66c1d6a2f55d45f227),
(240, '0be8cqKhVFzBjVZDrGe/0R7Q3dAabOgkeIdZTnT98+DNLoQDrfy424Z55zwPlakpug4xpR0=', NULL, '2022-03-24 21:15:24', 8, 16, 0xd7288ebe47c51972a45cef9cb4ce537c),
(241, 'xTBPmK+hSA/FllhRpWA=', NULL, '2022-03-24 21:15:37', 8, 8, 0x6eee53a17261cf4b6aff9ae7244d9c1c);

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
(50, 'chloemontoya93@gmail.com', 'Chloé', '2022-01-17 20:41:08'),
(52, 'jules.mesnil@gmail.com', 'Jules', '2022-01-21 10:33:51'),
(53, 'sb.lucien77144@gmail.com', 'Lucien', '2022-02-01 11:15:07'),
(54, 'matthis.rousselle@gmail.com', 'Matthis', '2022-02-03 16:13:20'),
(55, 'sb.lucien77144@gmail.com', 'Lucien', '2022-02-07 14:20:13'),
(56, 'aleksendrav@hotmail.com', 'Alex', '2022-02-19 17:33:40'),
(57, 'alexleroy789@hotmail.fr', 'Alexandre', '2022-03-04 14:07:41'),
(58, 'dbalit123@gmail.com', 'Diyana', '2022-03-10 11:32:01'),
(59, 'dbalit123@gmail.com', 'Diyana', '2022-03-10 11:32:12');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `idpost` int(11) NOT NULL,
  `media` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_likes_utilisateurs` int(11) DEFAULT NULL,
  `profil_animal_de_compagnie_idprofil_animal_de_compagnie` int(11) NOT NULL,
  `profil_animal_de_compagnie_utilisateur_idutilisateur1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idpost`, `media`, `description`, `date_publication`, `id_likes_utilisateurs`, `profil_animal_de_compagnie_idprofil_animal_de_compagnie`, `profil_animal_de_compagnie_utilisateur_idutilisateur1`) VALUES
(1, '61647336510.jpeg', 'Mon péché mignon: les cerises 🍒', '2022-03-15 10:28:30', NULL, 1, 6),
(3, '61647336992.jpg', 'Sur cette photo j\'avais 1 ans aujourd\'hui j\'en ai 5, le temps passe si vite 😥', '2022-03-15 10:36:32', NULL, 1, 6),
(4, '101647349736.jpg', 'Dixi est allé chez le toiletteur ce matin. 🐶 Il est tout propre ! 🧽', '2022-03-15 14:08:56', NULL, 2, 10),
(6, '141647351484.jpg', 'Je suis bambou !', '2022-03-15 14:38:04', NULL, 3, 14),
(9, '61647429412.jpg', 'big turtle 🐢', '2022-03-16 12:16:52', NULL, 1, 6),
(10, '101647434315.jpg', 'Dixi adore se détendre au bord de la rivière. 🥰🌊', '2022-03-16 13:38:36', NULL, 2, 10),
(11, '171647434669.jpg', 'Onice à la plage en Vendée. C’était sa première baignade.', '2022-03-16 13:44:29', NULL, 18, 17),
(13, '171647450205.jpeg', 'Je participe au concours ! Onice est très joueuse.', '2022-03-16 18:03:26', NULL, 18, 17),
(14, '231647450246.jpeg', 'Le \"petit\" Nolan qui re-découvre la montagne ! Il ne fait plus si blanc que cela dans la neige...', '2022-03-16 18:04:06', NULL, 22, 23),
(16, '181647452887.jpg', 'Très facile en voyage et visite....', '2022-03-16 18:48:07', NULL, 25, 18),
(17, '261647452924.jpeg', 'Je participe au concours avec mon gros félin  ;)', '2022-03-16 18:48:44', NULL, 26, 26),
(18, '271647453405.jpeg', 'Titi au soleil', '2022-03-16 18:56:46', NULL, 28, 27),
(19, '281647453971.jpeg', 'Tommy!😽😽', '2022-03-16 19:06:11', NULL, 29, 28),
(20, '181647454386.jpg', 'Pas rasée ce matin ...', '2022-03-16 19:13:07', NULL, 25, 18),
(21, '311647454949.jpeg', 'Berger allemand', '2022-03-16 19:22:29', NULL, 30, 31),
(22, '311647455103.jpeg', '', '2022-03-16 19:25:03', NULL, 30, 31),
(23, '311647455154.jpeg', '', '2022-03-16 19:25:55', NULL, 30, 31),
(24, '301647455495.jpeg', 'Je participe au concours, avec ma grognasse de maîtresse. Admirez mes belles dents.', '2022-03-16 19:31:35', NULL, 31, 30),
(25, '301647455614.png', 'Je déteste me brosser les dents !', '2022-03-16 19:33:34', NULL, 31, 30),
(26, '341647459417.jpeg', '', '2022-03-16 20:36:57', NULL, 32, 34),
(27, '341647459469.jpeg', '', '2022-03-16 20:37:49', NULL, 32, 34),
(28, '341647459527.jpeg', '', '2022-03-16 20:38:47', NULL, 32, 34),
(29, '341647460050.jpeg', 'on lui a appris à faire du ski !!', '2022-03-16 20:47:30', NULL, 32, 34),
(30, '321647460310.jpg', '', '2022-03-16 20:51:50', NULL, 34, 32),
(31, '321647460356.jpg', '', '2022-03-16 20:52:36', NULL, 34, 32),
(32, '351647460822.jpeg', '😇', '2022-03-16 21:00:23', NULL, 35, 35),
(33, '351647461343.jpeg', '', '2022-03-16 21:09:03', NULL, 35, 35),
(34, '371647462371.jpeg', 'J’adore danser avec mon meilleur pote', '2022-03-16 21:26:11', NULL, 36, 37),
(35, '371647462455.png', 'Et voilà quand j’étais bébé 🙃', '2022-03-16 21:27:36', NULL, 36, 37),
(36, '391647466343.jpeg', '', '2022-03-16 22:32:24', NULL, 37, 39),
(37, '391647466424.jpeg', '🛀', '2022-03-16 22:33:44', NULL, 37, 39),
(38, '141647506625.jpg', 'Bambou surveillait sa maison ce matin 👀', '2022-03-17 09:43:45', NULL, 3, 14),
(39, '61647539323.jpeg', 'Bien parce que je suis la plus belle ☀️', '2022-03-17 18:48:43', NULL, 1, 6),
(40, '141647594704.jpg', 'Petite balade matinale', '2022-03-18 10:11:45', NULL, 40, 14),
(41, '61647602687.jpeg', 'Petit bain de soleil pour sortir de l’hibernation 💤', '2022-03-18 12:24:47', NULL, 1, 6),
(44, '261647775029.jpeg', 'La belle vie', '2022-03-20 12:17:09', NULL, 26, 26),
(45, '301647781869.jpeg', 'Trop contente d’avoir gagné le concours !!! Merci à mes fans. Bises de Goonie !', '2022-03-20 14:11:09', NULL, 31, 30),
(46, '301647782137.jpeg', 'Le jour du printemps est là ! Mes maîtres vont encore me mettre des fleurs sur la tête …', '2022-03-20 14:15:37', NULL, 31, 30),
(47, '61647935667.jpeg', 'Wesh mon pote à la compote', '2022-03-22 08:54:27', NULL, 1, 6),
(53, '551647968413.jpg', 'Quand on me dit ta fille a un problème et que c\'est elle que je regarde. Non non on te parlait de ta fille, la vraie. Comprendra qui pourra ❤', '2022-03-22 18:00:13', NULL, 57, 55),
(54, '571647969834.jpg', 'Je suis une springer spanish, je déborde d\'amour et de gentillesse. Très intelligente, je fais tout mon possible pour que ma maman et ma petite soeur soient fière de moi !\nJe déborde d\'énergie j\'adore les longues ballades dans les champs mais je finis toujours par m\'endormir sous la sous la couette !', '2022-03-22 18:23:54', NULL, 56, 57),
(55, '571647971481.jpg', 'Un petit creu !', '2022-03-22 18:51:21', NULL, 56, 57),
(56, '541647971581.jpg', 'I am a fan of Simon\'s cat', '2022-03-22 18:53:01', NULL, 58, 54),
(57, '601647987405.jpeg', 'Cool attitude du dimanche matin 😉', '2022-03-22 23:16:45', NULL, 62, 60),
(58, '551648025001.jpg', 'J\'aurais jamais pensé aimer autant quelqu\'un d\'aussi spécial que toi. Tes attitudes et tes preuves d\'amour ne trompe pas.', '2022-03-23 09:43:21', NULL, 57, 55),
(59, '471648068281.jpg', 'Toujours accompagnée de mon acolyte 😼', '2022-03-23 21:44:41', NULL, 45, 47),
(60, '471648068596.jpg', 'Quand j\'observe au loin mes croquettes mais que j\'ai la flemme d\'y aller (ps: je finissais de m\'étirer..)😹', '2022-03-23 21:49:56', NULL, 63, 47),
(64, '471648202919.jpg', 'Aujourd\'hui j\'ai les crocs !!', '2022-03-25 11:08:39', NULL, 63, 47);

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
  `description` mediumtext,
  `date_naissance` date DEFAULT NULL,
  `utilisateur_idutilisateur1` int(11) NOT NULL,
  `types_animaux_idtypes_animaux` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `profil_animal_de_compagnie`
--

INSERT INTO `profil_animal_de_compagnie` (`idprofil_animal_de_compagnie`, `nom`, `url_photo`, `description`, `date_naissance`, `utilisateur_idutilisateur1`, `types_animaux_idtypes_animaux`) VALUES
(1, 'Zoé', '61647336271.jpeg', 'Salut moi c’est zoé la mascotte de la Team 😉', NULL, 6, 6),
(2, 'Dixi', '101647349677.jpg', 'Dixi est chien calme et il adore dormir.', NULL, 10, 3),
(3, 'Bambouuu', '141647351364.jpg', 'Je suis le chat de Matthis ! Je suis un petit filou qui aime se cacher dans les placards de mon maître !', NULL, 14, 2),
(18, 'Onice', '171647434619.jpg', 'J\'adore les caresses et je suis timide.', NULL, 17, 3),
(21, '25€ la séance + retouche (5 photos)', '221647449600.jpg', 'Rendez-vous partout en Île de France. Réduction 10€ si tu connais ma date de naissance.\n@timeraki - Instagram', NULL, 22, 4),
(22, 'Nolan', '231647449640.jpeg', 'Nolan berger blanc suisse de 4 ans !', NULL, 23, 3),
(23, 'Rubyte', '231647450124.jpeg', 'Ancien chaton abandonné, il est aujourd\'hui heureux et arrive sur ses 2ans !\nDe base on pensait que c\'était une femelle donc on l\'avait appelé Ruby, son nom à évolué vous devinerez pourquoi...', NULL, 23, 2),
(24, 'Yuki', '', 'Bichon maltais, profession : roi incontesté de la famille.', NULL, 24, 3),
(25, 'Mayote', '181647452636.jpg', 'Coquine et joueuse ..', NULL, 18, 3),
(26, 'Simba', '261647452764.jpeg', '', NULL, 26, 2),
(27, 'Pepsi', '251647453003.jpg', 'Règne sur la côte d\'Azur depuis 2 ans. \nElle est crainte par ton chien.', NULL, 25, 3),
(28, 'Ice tea', '271647453331.jpeg', '', NULL, 27, 3),
(29, 'Tommy', '281647453875.jpeg', 'Tommy, un petit chat de 9 mois 🐱', NULL, 28, 2),
(30, 'Reina', '', '', NULL, 31, 3),
(31, 'Goonie', '301647455380.png', 'Je suis une petite boule de poil, gentille avec les gentils, méchante avec les méchants. \nEt une petite vieille de 11 ans, qui fait la grasse matinée  tout les matins jusqu’à 11h.\nJ’adore aller dans les buissons pour espionner la rue et surprendre les passants.', NULL, 30, 3),
(32, 'Ramsès', '', 'Le plus beau des Berger Australien', NULL, 34, 3),
(33, 'Lina', '191647460249.jpg', 'Lina est un staff américain (femelle). Elle adore les enfants et les caresses.', NULL, 19, 3),
(34, 'Noiraude', '321647460277.jpg', 'Lapin trop mignon ! 🐰🐇🥕', NULL, 32, 13),
(35, 'Piana', '351647460710.jpeg', 'Yo', NULL, 35, 3),
(36, 'Spikee', '371647462326.jpeg', 'une vraie star!!!', NULL, 37, 3),
(37, 'Nell', '391647466330.jpeg', '', NULL, 39, 2),
(38, 'Kiki', '421647542420.jpg', 'Le meilleur chien, tout simplement', NULL, 42, 3),
(39, 'Praline', '381647553585.jpeg', 'Le chien des câlins', NULL, 38, 3),
(40, 'Véro la poule', '141647594686.jpg', 'Je suis la poule la plus gentille du monde, même si je fais caca partout', NULL, 14, 11),
(41, 'Misti', '441647642758.jpeg', '', NULL, 44, 2),
(42, 'Féline', '451647645235.jpg', 'Chat fatigué se repose', NULL, 45, 2),
(45, 'Nina', '471647729676.jpeg', 'Je suis une boule de poils pleine d\'énergie !!', NULL, 47, 4),
(48, 'Alfa', '491647873445.jpg', 'Persan chinchilla d\'1 an et demi. Une petite merveille, un peu peureux mais tellement attachant!!', NULL, 49, 4),
(49, 'Roméo', '491647873672.jpg', 'Persan chinchilla silver-shaded de 8 ans et demi. Un survivor, celui-là! Et une boîte à ronrons fort efficace!', NULL, 49, 4),
(54, 'Merwan', '561647967015.png', 'Très joueur', NULL, 56, 4),
(55, 'Eden', '561647967133.jpeg', 'Vieux', NULL, 56, 4),
(56, 'Janine', '', 'je me demande souvent si il n\'y pas une personne, un humain qui se cache en elle !\nc\'est une jolie springer spanish', NULL, 57, 4),
(57, 'Maybe', '551647975034.jpg', 'Dog de Borbeaux. Dysplasique de naissance, elle nous a prouvé sa force de vivre auprès de nous. Elle est un amour. Elle sait se faire sa place. Mais surtout bientôt 6 ans qu elle à la sienne dans nos vies. Elle est la force tranquille et quand j\'avais besoin d\'une main, j\'ai trouvé sa patte.', NULL, 55, 4),
(58, 'Pixi', '', 'J\'adore dormir derrière l\'écran d\'un ordinateur !', NULL, 54, 4),
(59, 'Risotto', '581647982051.jpeg', 'Risotto est un amour de Dalmatien. Il adore les grandes promenades en forêt et les gros câlin 😉', NULL, 58, 4),
(60, 'Sushi', '581647982444.jpeg', 'Petit dernier de la famille. Voici le beau Sushi. Bébé chihuahua coquin et très joueur.', NULL, 58, 4),
(61, 'Tyrion', '581647982721.jpeg', 'Le boss de la maison !', NULL, 58, 4),
(62, 'Sky', '', 'Petite écaille de tortue espiègle et très affectueuse 🥰🥰', NULL, 60, 4),
(63, 'Léo', '471648067600.jpeg', 'Je suis un vrai p\'tit filou !!', NULL, 47, 4),
(64, 'Stay', '621648073232.jpg', 'Petite chihuahua de bientôt deux ans. On l appel le bébé covid. Elle est née pendant le 1er confinement et se réfugie très vite dans nos bras au moindre évènement qui lui fait peur. Elle a confiance en peu de personne.', NULL, 62, 4),
(65, 'Snoopy', '151648137642.jpg', 'Je suis cool', NULL, 15, 4);

-- --------------------------------------------------------

--
-- Structure de la table `refuge`
--

CREATE TABLE `refuge` (
  `idrefuge` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `description` mediumtext,
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
(11, 'Pattes-En-Rond', NULL, 'https://pattesenrond.fr/', '', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10570.063486753616!2d2.6515515!3d48.5233447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x96f150f440dd7223!2sPattes-En-Rond!5e0!3m2!1sfr!2sfr!4v1642451409618!5m2!1sfr!2sfr', '164 Rue Rousseau Vaudran, 77190 Dammarie-les-Lys', 'pattesenrond.jpg'),
(12, 'SOS P\'tites Bêtes', NULL, 'https://sosptitesbetes.wixsite.com/sosptitesb', '​contactsosptitesbetes@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2647.222111388748!2d2.1701492148712256!3d48.433076738513634!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5c96c08eccd57%3A0xc43ac93d681cd826!2s7%20Imp.%20du%20Moulin%20Fouleret%2C%2091150%20%C3%89tampes!5e0!3m2!1sfr!2sfr!4v1642455442418!5m2!1sfr!2sfr', '7 imp du Moulin Fouleret  91150 Etampes', 'déconnecté'),
(13, 'Adopte Un Matou', NULL, 'https://adopteunmatou.com/', 'laurence.br3@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10470.686291203052!2d2.0593742!3d48.9978072!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3f256eeb61743650!2sAdopte%20Un%20Matou!5e0!3m2!1sfr!2sfr!4v1644957546309!5m2!1sfr!2sfr', '14 Ter Sente des Basses Vignes, 78780 Maurecourt', '31644957634.png'),
(14, 'Les Patounes de Bezons', NULL, 'https://les-patounes-de-bezons.fr/', 'contact@les-patounes-de-bezons.fr', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10484.74051705359!2d2.2096524!3d48.9309156!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x153d8c8ccf6bcfaa!2sAssociation%20Les%20Patounes%20de%20Bezons!5e0!3m2!1sfr!2sfr!4v1645288679063!5m2!1sfr!2sfr', '80 Rue des Frères Bonneff, 95870 Bezons', '31645288861.jpg'),
(15, 'L\'Arche de Bagheera', NULL, 'http://refuge-larche-de-bagheera.weebly.com/', 'adb.refuge@yahoo.Fr', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2651.9326140773064!2d2.101994314830455!3d48.34260054483929!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5b5aa60d4ab53%3A0xa55dc150b586124b!2s70%20Chem.%20de%20Bossenval%2C%2091660%20M%C3%A9r%C3%A9ville!5e0!3m2!1sfr!2sfr!4v1646174047468!5m2!1sfr!2sfr', '70 Chem. de Bossenval 91660 Le Mérévillois', '31646170159.png'),
(16, 'Association Luna', NULL, 'https://www.facebook.com/associationlouna/', 'associationlouna@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d167994.54899336927!2d2.3953256104577556!3d48.85983450856045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e6120f9d0743c3%3A0x16582c071d6d5819!2s2%20All.%20Moli%C3%A8re%2C%2093330%20Neuilly-sur-Marne!5e0!3m2!1sfr!2sfr!4v1646418011814!5m2!1sfr!2sfr', '2 ALL Molière, 93330 Neuilly-sur-Marne', ''),
(17, 'Pitbulls sans toit', NULL, 'https://www.facebook.com/apibullssanstoit/', 'apitbullsanstoit@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d20990.537974923747!2d1.83641732404872!3d48.88076034712687!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e690934a0cd999%3A0xdd1b700605ef48c5!2s78124%20Montainville!5e0!3m2!1sfr!2sfr!4v1647275846682!5m2!1sfr!2sfr', '1, place de la Mairie, 78124 Montainville .', '31647275884.jpg'),
(18, 'Association EMÂ', NULL, 'https://associationema.wixsite.com/associatio', 'associationema@outlook.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d20959.58765358354!2d2.2996646242684196!3d48.95446730598183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e669302b0c04e5%3A0x522b4053655b2f61!2sAssociation%20EM%C3%82!5e0!3m2!1sfr!2sfr!4v1647694501190!5m2!1sfr!2sfr', 'Épinay-sur-Seine', '11647694754.png'),
(19, 'APAC 94', NULL, 'https://associationapac94.wixsite.com/website', 'associationapac94@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10511.825569638071!2d2.5352007!3d48.8018109!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5fd6c0a275c4f2ce!2sAPAC%20(Association%20de%20Protection%20Animale%20Canav%C3%A9roise)!5e0!3m2!1sfr!2sfr!4v1647713080531!5m2!1sfr!2sfr', '140 Bis Rue Aristide Briand Fort de Champigny, 94430 Chennevières-sur-Marne', '11647713275.png');

-- --------------------------------------------------------

--
-- Structure de la table `reinitialisation_mot_de_passe`
--

CREATE TABLE `reinitialisation_mot_de_passe` (
  `idreinitialisation_mot_de_passe` int(11) NOT NULL,
  `id_demandeur` int(11) DEFAULT NULL,
  `token_reinitialisation` varchar(255) DEFAULT NULL,
  `date_demande_reinitialisation` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reinitialisation_mot_de_passe`
--

INSERT INTO `reinitialisation_mot_de_passe` (`idreinitialisation_mot_de_passe`, `id_demandeur`, `token_reinitialisation`, `date_demande_reinitialisation`) VALUES
(1, 7, '$2y$10$INuuUNtHo3ixB1V4HWDLUOEuJWMM8kDxpNulRgQ0ScMbg826iKyeq', '2022-03-15 14:10:27'),
(2, 7, '$2y$10$SD3mBshgffbAoYWBevoK9.PVb746rutq4QRstCKtQGXXh72TmZiKu', '2022-03-15 14:12:35'),
(3, 7, '$2y$10$5/T7fFOB/0iXIdALneskPOk3qT4qtANNGUsp1hopJMnS.bDsMV7vi', '2022-03-15 14:12:36'),
(4, 7, '$2y$10$K36bv7PfFjSMVBoZglwOyuPrsi2IV1JX3FLHHupaeMwhk1vdx7mW.', '2022-03-15 14:18:14'),
(5, 7, '$2y$10$w2g3rxbmsn/RQipt4aDw1uVmx6IOgTfvvJLS97cM3wFTnnYyVlnWe', '2022-03-15 14:19:24'),
(6, 7, '$2y$10$LDwOEwKgIKddXuW.1akmWerg6S0a1kwTVg.yoav/bI/KWAsgXX1By', '2022-03-16 11:12:33'),
(7, 15, '$2y$10$zO5D9FXFNtZQwz3ObFVDSuJqZYpv7wS7QAhuNUNg1I.p9WxUvLThm', '2022-03-16 13:21:49'),
(8, 16, '$2y$10$gXxTm/jjAW2eWNeSRJUoKehka8rBmMAF6dlKwRxD5Tpr2hwseTyZC', '2022-03-16 13:22:28'),
(9, 16, '$2y$10$SW/R7lMNwfs8NjTNn9IrP.YtxPErtifw42BeuEWCVggitwizkqj9a', '2022-03-16 13:22:29'),
(10, 16, '$2y$10$5ERPSkJJglUiLZ9cKUsChum4OFK.Uhr.S3/2FXiom4fX//zU38Yk6', '2022-03-16 13:41:36'),
(11, 16, '$2y$10$ZgQUgPv5CC53345GZRvgZuX1YrmxbE9Pu5mxbiluvv3kvLYOgKrXq', '2022-03-16 13:57:30'),
(12, 41, '$2y$10$6GYjgizI0P6CqP9RWwqWX.MHqMzTz9mehVI3Sn5U7OFE0mMKaieIm', '2022-03-17 17:42:25'),
(13, 7, '$2y$10$PSaFxNjniTUtlnai0DOm0.SrolIhCODRXifrsizhZInUsdoyQjJNa', '2022-03-18 15:27:06'),
(14, 48, '$2y$10$znznMssYL0WJsZl5NR9MDuGNCcC8DTe9Et.rs4YMV2MC/glsTM1PO', '2022-03-22 17:58:21');

-- --------------------------------------------------------

--
-- Structure de la table `reponse_forum`
--

CREATE TABLE `reponse_forum` (
  `idreponse_forum` int(11) NOT NULL,
  `texte_reponse` mediumtext,
  `date_publication` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `message` mediumtext,
  `url_photo` varchar(45) DEFAULT NULL,
  `date_signalement` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` tinyint(4) DEFAULT '0',
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
  `url_icone` varchar(45) DEFAULT NULL,
  `typeOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_animaux`
--

INSERT INTO `types_animaux` (`idtypes_animaux`, `nom`, `url_icone`, `typeOrder`) VALUES
(2, 'Chats', NULL, 1),
(3, 'Chiens', NULL, 2),
(4, 'Autres', NULL, 13),
(5, 'Rongeurs', NULL, 3),
(6, 'Reptiles', NULL, 4),
(7, 'Poissons', NULL, 12),
(8, 'Crustacés', NULL, 10),
(9, 'Insectes', NULL, 11),
(10, 'Amphibiens', NULL, 9),
(11, 'Oiseaux', NULL, 7),
(12, 'Furets', NULL, 8),
(13, 'Lapins', NULL, 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int(11) NOT NULL,
  `pseudo` varchar(45) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `google_sub` varchar(35) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adresse_mail` varchar(45) DEFAULT NULL,
  `url_photo` varchar(45) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_derniere_connexion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `token` json DEFAULT NULL,
  `readstate` tinyint(4) DEFAULT '1',
  `statut` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `google_sub`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `readstate`, `statut`) VALUES
(1, 'Zoey', '$2y$10$4o48tqRZmFD3DM1bzLsJXuOxA/12Ptkt1rd27M6cmWFe2mFd7BZu2', NULL, 'admin', 'admin', 'zoey.app@gmail.com', '11647336341.png', '0001-01-01', NULL, NULL, '2022-01-14 19:58:24', '2022-03-23 09:09:44', '[{\"time\": 1647870450, \"token\": \"7303ff46ee5bf8219a566877114a7293d44b39aca6ffd55be83050a15dc4883a17a3bd\", \"idUser\": 1}, {\"time\": 1647895972, \"token\": \"5e30e416dba53df8cbe4fd1315b2b58327bb2b926f9f4d84450e3de2a83b429dac6575\", \"idUser\": 1}, {\"time\": 1648022984, \"token\": \"217973ed05d7e96434b3cf3c80c74aff1f111106d37c063048aba23e91550046870c41\", \"idUser\": 1}]', 1, 1),
(5, 'Marin', NULL, '105790575614120714764', NULL, NULL, 'marin.bouanchaud@gmail.com', 'gdl-1647331007.jpg', NULL, NULL, 'Adoptez vos animaux avec Zoey ! 😺', '2022-03-15 08:56:48', '2022-03-22 18:12:08', '[{\"time\": 1647939665, \"token\": \"527fe2f472ef4c339f95670522fafd9e077f72c0431a8380d1ad7d73a569b9f2ec386f\", \"idUser\": 5}, {\"time\": 1647939913, \"token\": \"69d5323ab805d3c4edafef3f587deaba4be4db0adf1e5230ccf1c1af0dd9c1a6ce1b0b\", \"idUser\": 5}]', 2, 1),
(6, 'clementine', NULL, '113223585551837117563', NULL, NULL, 'clementine.gilama@gmail.com', '61647336322.jpeg', NULL, NULL, 'Hello ! c\'est clem la maman de Zoé, n\'hésite pas à me contacter si tu as des questions !', '2022-03-15 09:16:31', '2022-03-24 21:15:37', '[{\"time\": 1647935619, \"token\": \"f9025039bb28234aa31e603672ab413d10f1fe0272bccdfcbbc347acf1b638977d718c\", \"idUser\": 6}, {\"time\": 1647965542, \"token\": \"4de625c60de7f53a1e032e59c17b27e421fb698a19d3e73feb614524d44f204f4e706f\", \"idUser\": 6}]', 2, 1),
(7, 'Lucien', '$2y$10$liS.78fC/ErxDyIr4veAVO97APNoncxCmRNUQL5Ma1oqGQxoYSwbG', NULL, NULL, NULL, 'sb.lucien77144@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-15 09:51:33', '2022-03-24 21:15:04', '[{\"time\": 1648115386, \"token\": \"e52bca72f4af9f061be98753cc2da87abb81f72e3e66c10e8449a5926b71cf8597c8a7\", \"idUser\": 7}]', 2, NULL),
(8, 'Amélie', NULL, '102196286606102807594', NULL, NULL, 'amelie.rubiales@gmail.com', '81647445994.png', NULL, NULL, 'Hello ! Je suis la chargée de communication & marketing chez Zoey. N\'hésitez pas si vous avez des questions. 😁', '2022-03-15 10:02:14', '2022-03-24 21:14:54', '[{\"time\": 1648152880, \"token\": \"0c19014f2bbb94da87f8d43cb1fb3958b635d1f0f5520011db3cd3f6610f6207be2276\", \"idUser\": 8}]', 1, NULL),
(9, 'elodie', '$2y$10$NwQAvPQh.IDfr32CPu.In.SzDqtBeWBjK8DU4SW5DvhqK3yKhfquS', NULL, NULL, NULL, 'elodpan@gmail.com', 'defaultProfile.png', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-15 10:30:01', '2022-03-16 16:50:59', 'null', 1, NULL),
(10, 'Claude', '$2y$10$MWunFdI0sT3L3j5Jok8IBO7ZudyWoyh.gBLVWHjCmnwDsYlVSFyuG', NULL, NULL, NULL, 'amelie.rubiales@yahoo.com', '101647349571.jpg', NULL, NULL, 'J’habite à Mialet, je suis toujours en compagnie de mon chien Dixi que j’ai adopté.', '2022-03-15 14:05:18', '2022-03-16 13:37:49', 'null', 1, NULL),
(11, 'robert', '$2y$10$T1dOQt9UjnuRhjVXuuDFauJXc11hS2aM5QNT6qvKSOT4JoeqPeJy2', NULL, NULL, NULL, 'robert@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-15 14:08:30', NULL, 'null', 1, NULL),
(12, 'robert2', '$2y$10$mecwAKc16CBUMucsSxJQZ..Td4jCXzSyt93ym0BQ/oun.Z6K.cl1a', NULL, NULL, NULL, 'Robert@Robert.robert', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-15 14:09:03', NULL, 'null', 1, NULL),
(13, 'Lucien_8056', NULL, '104470235682775407832', NULL, NULL, 'etudes.lucien@gmail.com', '131647939039.png', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-15 14:09:43', '2022-03-25 11:51:43', '[{\"time\": 1648205503, \"token\": \"50390a900a056c07236b2b0ce2f471ddf41eb8fe38c4d3d1748180b683a567df4d9064\", \"idUser\": 13}]', 1, NULL),
(14, 'Matthis le Fermier', NULL, '105770305331469864059', NULL, NULL, 'matthis.rousselle@gmail.com', 'gdl-1647351132.jpg', NULL, NULL, 'Jeune éleveur de poules du 77', '2022-03-15 14:32:12', '2022-03-25 11:49:03', '[{\"time\": 1647970978, \"token\": \"5141e2bc265cddf40121c27b1500cbb69da8ee020ed89f2d51d0032951e41ce13c3b33\", \"idUser\": 14}, {\"time\": 1648205338, \"token\": \"043ebe8ab4c3ae38980d8ff7eed0b1933ff6c4d36b2ec861bd8c688299beb89d5439da\", \"idUser\": 14}, {\"time\": 1648205343, \"token\": \"f6d4af1d60bfaa80d1e4e155cc1b4e07b668866b4eed12bccb68ac92f5e1ba95a116d5\", \"idUser\": 14}]', 1, NULL),
(15, 'matthis77', '$2y$10$Scm5EN4wqhaTJva6kvLLgO4BXdiNRl5QeYAl6J5KyUj4Zupu2ozxO', NULL, NULL, NULL, 'matthis77@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 10:18:52', '2022-03-21 12:05:17', '[{\"time\": 1647860709, \"token\": \"1b5cad11df127f7763b30525542b1a54a2fa76a2cafdfb2305edb706252361a9aae02a\", \"idUser\": 15}]', 1, NULL),
(16, 'thematthis77', '$2y$10$6QhvGelvWSZ9SkvfjEVcReaACae4EY/1ryE1kIFzAW62dhQQimP5i', NULL, NULL, NULL, 'thematthis77@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 13:22:17', '2022-03-16 17:01:10', 'null', 1, NULL),
(17, 'Michel', '$2y$10$fQactKLp4ZlvWC2cg8XJP.22FJ9NUICsgfCI/YDNlESPHM48FalRa', NULL, NULL, NULL, 'amevinc@yahoo.fr', '171647434575.jpg', NULL, NULL, NULL, '2022-03-16 13:42:19', '2022-03-16 18:01:32', 'null', 1, NULL),
(18, 'hrvinc', '$2y$10$rK9CwLyiekq8UXcz/gmyyOfKZv7L6e9BnU2sQTSiAjXitC7CDuSQK', NULL, NULL, NULL, 'hrvinc3@yahoo.fr', '181647451480.jpg', NULL, NULL, NULL, '2022-03-16 16:43:57', '2022-03-16 21:06:48', 'null', 2, NULL),
(19, 'cece', NULL, '108606856549213130196', NULL, NULL, 'lyanaceline3@gmail.com', 'gdl-1647445908.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-16 16:51:49', '2022-03-25 09:17:54', '[{\"time\": 1647894981, \"token\": \"d458732760cae079d6c6a29db14d34bb4748840a72f2bea82bd960550d424f06d4f58d\", \"idUser\": 19}]', 1, NULL),
(20, 'Luckas', NULL, '107698742849208217753', NULL, NULL, 'luckashernado@gmail.com', 'gdl-1647448653.jpg', NULL, NULL, NULL, '2022-03-16 17:37:33', '2022-03-16 22:12:42', 'null', 1, NULL),
(21, 'JuloPipo', '$2y$10$sCAgFs32zmUwzviNEs9IBeXaRNgGq8Tmmrwal/Ar.YO1Uz584SI7m', NULL, NULL, NULL, 'jules.mesnil@gmail.com', '211647449055.png', NULL, NULL, NULL, '2022-03-16 17:43:30', '2022-03-22 14:28:08', '[{\"time\": 1647955688, \"token\": \"989d12aba16ef9e647f3dbda4723818cebfc8a4faac24cf9f6eba538ae1f0abdf23f41\", \"idUser\": 21}]', 1, NULL),
(22, 'Tim le Photographe', NULL, '111385268485597667911', NULL, NULL, 'detectivegordon789@gmail.com', 'gdl-1647449202.jpg', NULL, NULL, 'Mon talent à ton service.', '2022-03-16 17:46:42', '2022-03-16 17:56:40', 'null', 1, NULL),
(23, 'Maxime F', NULL, '104056063029105648635', NULL, NULL, 'maxime.ferraille@gmail.com', 'gdl-1647449371.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-16 17:49:31', '2022-03-23 10:59:09', '[{\"time\": 1648029549, \"token\": \"1c5dc59e2e1edbdc1d49c738ccf6ac5f033176665d2b7b44afca7602bd7759645463be\", \"idUser\": 23}]', 1, NULL),
(24, 'Anna Maria', '$2y$10$7CwxBV.GRrnrFj64HCtpfu/mavw9PkjxuOY2FHMHH22nFA6lL9ZnG', NULL, NULL, NULL, 'am.lannaud@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 18:13:43', '2022-03-17 13:25:35', 'null', 1, NULL),
(25, 'Angelo', NULL, '110054636972081160282', NULL, NULL, 'angeloliveira77400@gmail.com', '251647453500.jpg', NULL, NULL, 'Je m\'', '2022-03-16 18:33:25', '2022-03-16 18:59:18', 'null', 1, NULL),
(26, 'Jessica', NULL, '116942873151343624210', NULL, NULL, 'giovannangelijessica@gmail.com', '261647453034.jpeg', NULL, NULL, NULL, '2022-03-16 18:45:14', '2022-03-20 12:14:50', 'null', 1, NULL),
(27, 'Julie', NULL, '102506632022932361575', NULL, NULL, 'julie.martinez264@gmail.com', 'gdl-1647453241.jpg', NULL, NULL, NULL, '2022-03-16 18:54:01', '2022-03-16 18:54:01', 'null', 1, NULL),
(28, 'Romane.rbs', '$2y$10$zuhzy/RBu9riGLGaj0uWs.la/7dXnq8hsltiX/JLfRsuGXmAzpYuG', NULL, NULL, NULL, 'rororubiales@yahoo.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 19:03:19', '2022-03-16 19:05:19', 'null', 1, NULL),
(29, 'lauraxbrs', '$2y$10$EqDymllJ2N0chREooWTRV.L792pTzyzo7FgQsfCk5oOt4KO4JjRJG', NULL, NULL, NULL, 'Laurabarros789@hotmail.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 19:13:48', NULL, 'null', 1, NULL),
(30, 'Elisa25', '$2y$10$/h9mGZIPHmZ7a2zU1Duwj.as/Da4fMPEfP1yByDdt2hnrY8YGGWiK', NULL, NULL, NULL, 'elisaaabrbb@gmail.com', '301647782367.jpeg', NULL, NULL, NULL, '2022-03-16 19:19:39', '2022-03-21 14:11:19', 'null', 2, NULL),
(31, 'Sarah.2101', '$2y$10$8r4gV4IatNYpUiZbOtxxquD8SyPQFXIYu5FuUwIvT1YUH6CqyFAdy', NULL, NULL, NULL, 'sarahboussaha@icloud.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 19:20:38', '2022-03-16 19:20:51', 'null', 1, NULL),
(32, 'Ninon', '$2y$10$28VClOgVHsOHCUmCO3lU2uvEtjpT4hgw0WFMdMGLzGBMQfqGXlr22', NULL, NULL, NULL, 'ninondere@yahoo.fr', '321647460235.jpg', NULL, NULL, NULL, '2022-03-16 19:32:35', '2022-03-21 07:38:04', 'null', 2, NULL),
(33, 'Guilhem', '$2y$10$mEzS0v5o4tx5nYEs5TEOguzo12/n79cisS64ARin28ljey12T3Kyi', NULL, NULL, NULL, 'guilhem.rousselle@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 20:16:49', NULL, 'null', 1, NULL),
(34, 'Vincent', NULL, '109497220888303300673', NULL, NULL, 'vin100lm@gmail.com', 'gdl-1647459265.jpg', NULL, NULL, NULL, '2022-03-16 20:34:26', '2022-03-16 21:06:50', 'null', 1, NULL),
(35, 'Marius', '$2y$10$9Csx8l1/pEQiXU26osEsv.2cpXKehQ/zkLgsZ8Je1MPspitLRX2p.', NULL, NULL, NULL, 'camr.m4rius@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 20:55:38', '2022-03-16 21:07:02', 'null', 1, NULL),
(36, 'Maxime', '$2y$10$JdWx6cc9gRGmseYf8I5jSuYGhr1mRGm6kCOMHCJ3X0r4dAV9C70ui', NULL, NULL, NULL, 'guenzimaxime@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 21:07:10', '2022-03-18 12:19:19', 'null', 1, NULL),
(37, 'Safia', NULL, '109705560360529771680', NULL, NULL, 'safiabl111@gmail.com', 'gdl-1647461745.jpg', NULL, NULL, NULL, '2022-03-16 21:15:46', '2022-03-16 21:24:29', 'null', 1, NULL),
(38, 'Alex', '$2y$10$796dGGPRuoTVHVmXcRqAiOX.mtyMWBYLv3t60s9sp7m3kg9iavaXy', NULL, NULL, NULL, 'alexandra.beaulieu77@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-16 21:29:57', '2022-03-17 22:43:12', 'null', 1, NULL),
(39, 'T.O', '$2y$10$tFK2xyNoHI4g4n5UnS9YW.S3DeX15rLXuT5m2mjuoMLhy89uOEbwq', NULL, NULL, NULL, 'theomoriceau12@gmail.com', 'defaultProfile.png', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-16 22:24:00', '2022-03-16 22:34:09', 'null', 1, NULL),
(40, 'Christine', NULL, '116532309343111189331', NULL, NULL, 'sb.christinesable@gmail.com', 'gdl-1647525432.jpg', NULL, NULL, NULL, '2022-03-17 14:57:13', '2022-03-22 17:18:06', '[{\"time\": 1647965886, \"token\": \"aebe1d4a13dfef3805d193d395041b4cf1123d626685a6b8b8341418115e8695aaae87\", \"idUser\": 40}]', 1, NULL),
(41, 'Bigou', '$2y$10$prAxd9pyeyphFyjMYf4BD.laAFz8UQeB8H7roD/WcP0lnBySlo41u', NULL, NULL, NULL, 'antoine.droyer@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-17 17:40:50', '2022-03-17 17:42:59', 'null', 1, NULL),
(42, 'Pauline', '$2y$10$xX069xh6PKPsrh4rfZtf3eyDaQX6tcJc7NtpcpP1m30OpFEdLAH52', NULL, NULL, NULL, 'pauline.fontan@gmail.com', '421647542640.jpg', NULL, NULL, NULL, '2022-03-17 19:37:22', '2022-03-17 19:44:00', 'null', 1, NULL),
(43, 'Titi', NULL, '101545156708571397715', NULL, NULL, 'titilegrandinet@gmail.com', 'gdl-1647633979.jpg', NULL, NULL, NULL, '2022-03-18 21:06:20', '2022-03-19 12:49:35', 'null', 1, NULL),
(44, 'eleaa', '$2y$10$FgTYzVXYXGejkvKGmCeuRuJYJZMmugRDNgfMqC6S9nMP/zqq2uxNa', NULL, NULL, NULL, 'eleaa.crt@gmail.com', '441647642470.jpeg', NULL, NULL, NULL, '2022-03-18 23:25:10', '2022-03-19 13:45:44', 'null', 1, NULL),
(45, 'valactu', NULL, '115640739865083550172', NULL, NULL, '3alala11110@gmail.com', 'gdl-1647645145.jpg', NULL, NULL, NULL, '2022-03-19 00:12:26', '2022-03-19 00:12:26', 'null', 1, NULL),
(46, 'Anat94', NULL, '109877429418056237963', NULL, NULL, 'anatole.babin@gmail.com', 'gdl-1647685310.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-19 11:21:50', '2022-03-19 12:13:00', 'null', 1, NULL),
(47, 'anna_djr', '$2y$10$Cx7jNGC1N2M6LjeTPOcMyuB5C4kpK5GZX6C7wvwN.Mghgp4Pmykpa', NULL, NULL, NULL, 'anna.hassani77@gmail.com', '471648203258.jpg', NULL, NULL, NULL, '2022-03-19 19:23:28', '2022-03-25 11:14:18', '[{\"time\": 1648202795, \"token\": \"fb076e60bdecda5eba55375b621468e79fde9f334e6e6ff44d1bc485f1117f06aaf676\", \"idUser\": 47}]', 1, NULL),
(48, 'Orphetila', '$2y$10$TXFqa1KmR.rNVLYkm6BzZOYeajo0xgmSI/XEeY6D84K2WwjT2eDOq', NULL, NULL, NULL, 'liline.celine@hotmail.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-20 15:23:10', NULL, 'null', 1, NULL),
(49, 'Alexandre', NULL, '108927521495704361481', NULL, NULL, 'alexleroy789@gmail.com', '', NULL, NULL, NULL, '2022-03-21 15:22:52', '2022-03-22 09:49:35', '[{\"time\": 1647872572, \"token\": \"461acce96bffc7c95d7a124307eb34b2b2293a52868b35ac648fa14010623b0509daa5\", \"idUser\": 49}]', 1, NULL),
(50, 'Hazelkao-man', NULL, '106440585748510160561', NULL, NULL, 'danielavenn78@gmail.com', '501647945419.png', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-22 09:33:14', '2022-03-22 11:37:19', '[{\"time\": 1647945383, \"token\": \"48e0a8efffffa2a8dfb155ea3b2890dc87fa74252d1b352bbcc0d579507a3544ea091e\", \"idUser\": 50}]', 1, NULL),
(51, 'Lucien mais genre pas le vrai', NULL, '113041733343688859286', NULL, NULL, 'specialpaypal@gmail.com', '511647939186.png', NULL, NULL, 'J\'aime pas le prof d\'anglais ce raton', '2022-03-22 09:52:47', '2022-03-22 09:54:26', '[{\"time\": 1647939167, \"token\": \"b70391150d320812b59d018dbb41e9ca9db6bf929500f7060cca467488e88aab46c15e\", \"idUser\": 51}]', 1, NULL),
(52, 'Marin_4858', NULL, '116179095823259577328', NULL, NULL, 'contact@marinb.com', '521647939461.jpg', NULL, NULL, NULL, '2022-03-22 09:57:14', '2022-03-22 10:07:22', '[{\"time\": 1647940037, \"token\": \"b73ca48a4a04250bb50050faf7c59357de5e8fbef775ab05f4936fb7165ecd8b183855\", \"idUser\": 52}]', 1, NULL),
(53, 'tonyhouziaux', NULL, '116239640911715736809', NULL, NULL, 'tonyhouziaux@gmail.com', 'gdl-1647953287.jpg', NULL, NULL, NULL, '2022-03-22 13:48:07', '2022-03-22 13:48:07', '[{\"time\": 1647953287, \"token\": \"83a0ea1f67757ee82223a6a5818fb3a3bc26b75cc0f2f4c96aa978061cfd6ffe9711b0\", \"idUser\": 53}]', 1, NULL),
(54, 'Anne', NULL, '117127344433318383575', NULL, NULL, 'anne.tasso@gmail.com', 'gdl-1647953310.jpg', NULL, NULL, NULL, '2022-03-22 13:48:30', '2022-03-22 13:48:31', '[{\"time\": 1647953311, \"token\": \"a1f560117b65a11a7e5d82691de30852d2e09e762583760a1ec05742a9e5fc56b42152\", \"idUser\": 54}]', 1, NULL),
(55, 'Jessy09', '$2y$10$sg4z4koLMq16pAvakiPP5ODwDp.ZBgafaKxWNcJ1f9iUe3PoMdqtG', NULL, NULL, NULL, 'jessfania@msn.com', '551647967189.jpg', NULL, NULL, 'Jessica, la marraine de Maybe. Celle qui aura toujours une place particulière dans mon cœur, dans ma vie.', '2022-03-22 17:31:17', '2022-03-22 18:31:35', '[{\"time\": 1647970295, \"token\": \"eaf90600ff29703fa186ef290d93d0b6b1f87c35d4b3514ad1e396fb5e4a15636068fd\", \"idUser\": 55}]', 1, NULL),
(56, 'Grand Roi', NULL, '104597958145039515621', NULL, NULL, 'antoinedroyer@gmail.com', 'gdl-1647966963.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-22 17:36:04', '2022-03-22 18:34:10', '[{\"time\": 1647966965, \"token\": \"090decc511bc3351e0bdb4d4e9fe044909ba524b24a3b5c8301fe50910d3c4c54bbe95\", \"idUser\": 56}]', 2, NULL),
(57, 'celine', NULL, '116042657686996627213', NULL, NULL, 'putchere@gmail.com', 'gdl-1647967173.jpg', NULL, NULL, NULL, '2022-03-22 17:39:33', '2022-03-22 18:49:49', '[{\"time\": 1647971389, \"token\": \"2851a37eb14004a199049bcdabc06178a721db9fee36e3d03a1b34bcfdc91377caeeed\", \"idUser\": 57}]', 1, NULL),
(58, 'Fanny941', '$2y$10$6QBiSShZQTzvAHiyCvqsa.N6PPwMkxFjpM76kjr2QKuGBHDP4RZMq', NULL, NULL, NULL, 'familleheber@orange.fr', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-22 21:03:37', '2022-03-22 21:44:39', '[{\"time\": 1647981879, \"token\": \"5bf7a9a7fe1448be15470fd8e00395183de88a4946155bb03201d1bec1e668929889a8\", \"idUser\": 58}]', 1, NULL),
(59, 'Mag', '$2y$10$eWLpBQiMuHea1s3M9UTkYO7jUXXrOES6p6gfuQBp01iqVxNRao4vi', NULL, NULL, NULL, 'magali.poloni@cegetel.net', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-22 21:36:21', NULL, NULL, 1, NULL),
(60, 'Flaeva', '$2y$10$k9OJ60EpWhV67Rbe1nch4.0qrZIts7N572vmsiyFwen4AihwMOohq', NULL, NULL, NULL, 'magali.poloni@gmail.com', 'defaultProfile.png', NULL, NULL, NULL, '2022-03-22 23:12:36', '2022-03-22 23:14:45', '[{\"time\": 1647987285, \"token\": \"05376a5984143504cbf31aa34333539e578ef5f81372399755ae3200ce5f9d8461c264\", \"idUser\": 60}]', 1, NULL),
(61, 'Ninon_4935', NULL, '103372972714371719133', NULL, NULL, 'aviata94@gmail.com', 'gdl-1648041581.jpg', NULL, NULL, NULL, '2022-03-23 14:19:42', '2022-03-23 14:19:47', '[{\"time\": 1648041587, \"token\": \"160ad5a6ea96e5e2159e16d786b70dec6f4bd712e9ec70a31fa620b78d803a94160d69\", \"idUser\": 61}]', 1, NULL),
(62, 'Jessica_13', NULL, '101801856993550855405', NULL, NULL, 'jessyoups09@gmail.com', '621648072770.jpg', NULL, NULL, 'Bienvenue sur mon profil !', '2022-03-23 22:56:53', '2022-03-23 22:59:30', '[{\"time\": 1648072614, \"token\": \"56d3c635896d207b12c31df27ecb0fd6d7d1df640e2ee3e89d059b160dc6c1c1a51c35\", \"idUser\": 62}]', 1, NULL);

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
(10, 2),
(10, 3),
(10, 6),
(17, 2),
(17, 3),
(17, 6),
(18, 2),
(18, 6),
(18, 9),
(46, 2),
(46, 6),
(46, 9),
(6, 2),
(6, 4),
(6, 8),
(43, 2),
(43, 3),
(43, 4),
(43, 5),
(43, 8),
(43, 9),
(14, 1),
(14, 3),
(14, 4),
(14, 8),
(15, 1),
(15, 3),
(15, 4),
(15, 8),
(13, 1),
(13, 2),
(13, 6),
(5, 2),
(5, 3),
(5, 7),
(7, 1),
(7, 2),
(7, 6),
(8, 6),
(19, 1),
(19, 2),
(19, 3),
(19, 6),
(19, 8),
(19, 9),
(1, 6);

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
(10, 3),
(17, 3),
(18, 3),
(46, 8),
(6, 2),
(43, 11),
(14, 11),
(15, 11),
(13, 2),
(5, 13),
(7, 2),
(8, 7),
(19, 3),
(1, 7);

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
  MODIFY `idanimal_a_adopter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `idbadge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `idconversation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `liste_amis`
--
ALTER TABLE `liste_amis`
  MODIFY `idliste_amis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idmessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `profil_animal_de_compagnie`
--
ALTER TABLE `profil_animal_de_compagnie`
  MODIFY `idprofil_animal_de_compagnie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `refuge`
--
ALTER TABLE `refuge`
  MODIFY `idrefuge` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `reinitialisation_mot_de_passe`
--
ALTER TABLE `reinitialisation_mot_de_passe`
  MODIFY `idreinitialisation_mot_de_passe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `idtypes_animaux` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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

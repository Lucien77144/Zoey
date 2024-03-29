-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Hôte : db5006335318.hosting-data.io
-- Généré le : ven. 04 mars 2022 à 00:21
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
-- Base de données : `dbs5282415`
--

--
-- Tronquer la table avant d'insérer `animal_a_adopter`
--

TRUNCATE TABLE `animal_a_adopter`;
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
(115, 'Marco', 0, '31644957916.jpg', 'Je suis un jeune chat de 3 ans qui traîne derrière moi un lourd passé dans la rue. J\'en ai gardé des petites cicatrices sur ma tête et un tempérament assez craintif. Il me faudra un peu de temps pour m’adapter à mon nouveau domicile et à vous faire confiance. Au départ, je resterais caché sous un lit ou un meuble. Mais si vous faites preuve de patience et de douceur, au fil des jours, je vous donnerais ma confiance. Et là, vous découvrirez le vrai Marco, un chat très attachant, ronronnant facilement, aimant les caresses et les gratouilles. Je suis un gentil matou, un tantinet gourmand et qui communique beaucoup avec les humains par petits miaulements. Je suis aussi joueur : je m\'amuserais seul, avec vous ou un copain chat. J\'aime m’allonger à vos pieds, car j\'apprécie la compagnie humaine sans toutefois sauter sur vos genoux pour dormir. Toutefois, je serais toujours à votre proximité et ronronnerais à la moindre caresse. J\'aime les câlins sans être pot de colle et je m’entends avec les autres chats.', '2019-01-01', 13, 2),
(122, 'Venus', 1, '31644961773.jpg', 'Je suis une tortue mauresque, je mesure environ 18 cm et mon espérance de vie est de 100 ans. Je suis végétarienne, je me nourris principalement de plantes sauvages.', '2014-01-01', 12, 6),
(124, 'Sweety', 1, '31645010035.jpg', 'Je suis une petite boule de poil pleine de vie, j\'adooore jouer avec tout et n’importe quoi, même si parfois, je suis un peu brute dans mes mouvements ! Je suis un peu timide quand je ne connais pas mais une fois bien en confiance, je deviens très câline et je vous accueillerez avec des séances de ronrons non-stop. Âgée d’un an et demi, je suis une jeune chatte extrêmement vive et énergique ayant besoin de se dépenser ! Un foyer avec un copain chat joueur (mâle ou femelle) serait l’idéal pour moi. Toutefois, je ne passe pas tout mon temps à faire la fofolle. J\'ai des moments de calme pendant lesquels j\'aime m\'assoupir près du chauffage ou vous montrer mon affection en frottant doucement ma tête contre la vôtre (ça peut durer très longtemps !). Je ne suis pas bavarde, je suis une chatte plutôt discrète qui respecte votre tranquillité. Mais attention je suis exigeante sur mon dîner, une bonne pâtée et c’est la clef du succès !', '2020-01-01', 13, 2),
(125, 'Albi', 1, '31645021281.jpg', 'Je suis un python royal et je mesure 1m20. J\'ai un régime particulier, je mange des rats tous les 15 jours. Je vis dans un terrarium sec.', '2017-01-01', 12, 6),
(128, 'Trois', 0, '31645021515.jpg', 'Je suis un python royal et je mesure 1m20. J\'ai un régime particulier, je mange des rats tous les 15 jours. Je vis dans un terrarium sec. J\'aime pouvoir me cacher et me balader dans le terrarium.', '2015-01-01', 12, 6),
(129, 'Panthère', 1, '31645026414.jpg', 'Je suis un serpent des blés et je mesure 100 cm. Je suis carnivore, je mange des souris adultes ou petits rats une fois toutes les 2 semaines. Je vis dans un terrarium semi arboricole. J\'aime pouvoir me cacher et me balader dans le terrarium car je suis semi-arboricole.', '2017-01-01', 12, 6),
(130, 'Obsucurus', 0, '31645026534.jpg', 'Je suis un serpent ratier gris et je mesure 1m20. Je suis carnivore, je mange des souris adultes ou petits rats une fois toutes les 2 semaines. Je suis un très bon mangeur ! Je vis dans un terrarium semi arboricole. J\'aime pouvoir me cacher et me balader dans le terrarium car je suis semi-arboricole.', '2016-01-01', 12, 6),
(132, 'Korinn', 1, '31645181314.jpg', 'Je suis une chatte très sociable, hyper proche de l’humain à la limite collante, douce et très gentille. Je suis mille fois reconnaissante d’avoir été sortie de la rue où je galérais depuis plusieurs semaines. Je suis actuellement en fin de traitement pour un coryza que j\'ai attrapé lors de mon abandon. Je serais heureuse d’être la compagne à 4 pattes d’un couple, d’une famille avec des enfants aussi doux que moi ou d’une personne seule.', '2019-01-01', 13, 2),
(134, 'Bella', 1, '31645363008.jpg', 'Je suis un petit ange sur pattes ! D’une douceur incroyable, je suis âgée de 5 mois et je suis extrêmement sociable aussi bien avec les humains, les enfants et les autres chats. Je vous suis partout, adorant partager votre quotidien, venir dormir sur ou près de vous, recherchant votre présence et contact. Mes futurs adoptants devront également être des cordon-bleu, car j\'ai été élevée à la nourriture faite maison, j\'ai du mal à accepter la nourriture industrielle.', '2021-02-01', 13, 2),
(135, 'Genos', 0, '31645449314.jpg', 'Je suis un python royal et je mesure 1m20. Je suis carnivore, je mange des rats tous les 15 jours. Je vis dans un terrarium sec. J\'aime pouvoir me cacher et me balader dans le terrarium.', '2017-01-01', 12, 6),
(136, 'Malé', 1, '31645803654.jpg', 'Je suis une jeune femelle labrador de 3 ans. Je suis très sociable avec les humains, les enfants et les chiens. Habituée à la vie en appartement, je préfère maintenant une vie en maison avec jardin. J\'ai besoin d\'une famille assez présente. J\'adore les balades et jouer avec vous.', '2019-01-01', 14, 3),
(138, 'Tina', 1, '31645803784.jpg', 'Je suis une jeune minette d’environ 1 an, très très câline. Je suis très sociable, proche de l’homme, une vrai boite à ronrons ! J\'aurais besoin d’un accès extérieur, jardin, car j\'ai été habituée dans ma précédente famille.', '2021-01-01', 14, 2),
(139, 'Pruneau', 0, '31645803865.jpg', 'Je suis absolument craquant avec mes yeux miel surlignés de noir, mon beau pelage tigré blanc et mon petit museau rose. Mais je suis surtout un chat ayant un super caractère : d’une patience extrême, d’une douceur incroyable, d’un calme olympien et d’une affection incroyable. Une fois en confiance (très vite), je suis très câlin. J\'adore la proximité avec l’humain. J\'aime tout particulièrement venir me blottir tout contre vous afin que vous me grattouilliez mon petit ventre. Je suis un chat très facile à vivre qui s’adapte facilement à un nouvel environnement, ne fait pas de bêtises et est très calme pendant les transports dans ma caisse. D’un petit gabarit, j\'ai des allures de chaton junior ! Mon seul petit défaut, c’est ma gourmandise : mais je suis tellement adorable qu’on me pardonne tout. Je veux apporter à mes futurs adoptants une tonne d’amour.', '2021-01-01', 13, 2),
(140, 'Eliott', 0, '31645817566.jpg', 'Je fais partie de ces petits bouts un tantinet timides qui ont besoin d’un peu de temps pour s’habituer à vous et à un nouvel environnement. Mais dès que je suis en confiance, je deviens un redoutable joueur et un chaton très proche de vous : je réponds et viens quand vous m’appelez par mon nom et j\'adore m’endormir blotti tout contre votre joue. Âgé de 3 mois et demi, je suis rassuré par la présence d’un autre chat, mais effrayé par les chiens et les lapins !', '2022-01-01', 13, 2),
(141, 'Tina-Alda', 1, '31645817663.jpg', 'Je suis une jeune minette d’environ 8-10 mois. Je suis très câline, avenante, a tendance à suivre mon maître partout dans la maison. J\'ai mes petits moments de folie, où je joue comme une folle. Mais j\'ai un tempérament général plutôt calme. J\'adore les séances télé dans le canapé.', '2022-01-01', 14, 2),
(143, 'Migui', 1, '31645817802.jpg', 'Je suis une petite chatonne de 6 mois, qui est calme, indépendante,  qui aime sa tranquillité, mais apprécie qu\'on vienne me papouiller en offrant mon bidon.\nJ\'adore dormir dans la douche.', '2022-01-01', 14, 2),
(144, 'Sunny', 0, '31645817877.jpg', 'Je suis un jeune chat parfait ! Avec mes grands yeux verts et ma petite oreille noire. Âgé de 11 mois je suis un amour sur pattes. Hyper sociable, j\'adore jouer, je suis vif et super câlinou. Je serais parfait comme 1er chat ou le chat d’un foyer avec ou non des enfants.', '2021-01-01', 13, 2),
(145, 'Moon', 0, '31645817993.jpg', 'Je suis un adorable feu follet. Je suis un jeune chat d’un an et demi qui est hyper facile à vivre. Bien dans ma tête, je suis très sociable, câlin, je m’entends avec les autres chats et je suis tout de suite à l’aise dans un nouvel environnement. Je suis aussi un matou très vif et dynamique qui a besoin de se dépenser. Je recherche un foyer avec impérativement un jardin/grande terrasse sécurisé. Pas d’appartement de petite surface', '2020-01-01', 13, 2),
(146, 'John François Albert 1er', 0, '31645818064.jpg', 'Je suis un boa constrictor, je mesure 2 m. Je suis carnivore, je mange un rat de 150g tous les 15 jours. Je vis dans un grand terrarium avec des branches et des endroits pour me cacher, j’aime aussi me baigner dans un grand bac d’eau.', '2010-01-01', 12, 6),
(147, 'Rocinante', 1, '31646057536.jpg', 'Avec mon miaulement adorable et ma petite frimousse à craquer.Je suis une minette de rêve. Extrêmement câline, je suis également une joueuse invétérée ! Je vous porte le plumeau pour qu’ensemble, nous fassions une partie de jeu endiablée. Une fois fatiguée, je pars me reposer dans mon coin de prédilection. Je suis affectueuse tout en étant indépendante (je ne suis pas un pot de colle). Âgée de 8 mois, je suis facile à vivre pour peu que je puisse me dépenser en jouant.', '2021-01-01', 13, 2),
(148, 'Weasley', 0, '31646057597.jpg', 'Je suis un amoureux éternel… des humains ! Je les adore, je recherche constamment leur attention, réclame des câlins et aime être là où vous vous trouvez. Je suis un jeune ado de 6 mois et demi, d’une extrême douceur, très affectueux et d’une grande gentillesse. Je suis un peu réservé quand je ne connais pas, mais mon amour des humains prend très vite le dessus. Je suis également comme tous les jeunes matous : très joueur. J\'ai cependant un petit pêché mignon (personne n’est parfait) : je suis gourmand. À la moindre odeur de nourriture, j\'arrive en courant.', '2021-01-01', 13, 2),
(149, 'Monya', 0, '31646057670.jpg', 'J\'ai une passion dans sa vie : l’humain ! J\'adore être avec vous, aimant vous observer, suivre vos faits et gestes, venir dormir contre vous, ronronner de plaisir sous vos caresses…Je suis gentille et sociable avec tous dont les autres chats.', '2020-01-01', 13, 2),
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
(163, 'Réglisse', 0, '31646238535.jpg', 'Je vivais dans un clapier dans un jardin, je m\'acharnais sans cesse à vouloir partir, un jour où j\'ai encore réussi à m\'en échapper, j\'ai terminé mon escapade chez l\'une des bénévoles ! J\'ai attaqué le chien de la famille et également la maman... Je me montrais très agressif. Après discutions avec ma propriétaire, la bénévole a apprit qu\'elle souhaitait se séparer de moi car justement j\'étais trop agressif. Je suis donc arrivée au refuge. Petite sensibilité respiratoire, je ne pourrais pas vivre dans un milieu trop humide. Au vu de ma description, j\'ai été stérilisé en urgence au moment de mon arrivée. Depuis, je suis un véritable amour, pas une seule fois je me suis montré agressif avec les bénévoles ou même les visiteurs ! Alors qu\'on &quot;m\'embête&quot; dans mon espace, quand on prend ma gamelle ou qu\'on change mon clapier... Je suis un petit lapin très curieux qui vient même volontiers chercher quelques gratouilles.', '0001-01-01', 15, 13),
(164, 'Mélody', 1, '31646238707.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire a décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Je suis arrivée au refuge très maigre, apeurée, avec des griffes très longues et énormément de bourres de poils/nœuds, j\'étais dans un sale état, non entretenue depuis des mois... Je vais maintenant beaucoup mieux ! Je dois seulement reprendre un peu de poids. J\'ai mon petit caractère, je n\'aime pas beaucoup qu\'on touche à mes affaires, et je n\'ai pas eu beaucoup de contact avec l\'homme, j\'ai besoin de temps avant de vous faire confiance.', '0001-01-01', 15, 13),
(165, 'Igloo', 0, '31646239004.jpg', 'Je suis arrivé avec ma maman Neige, suite à une erreur de sexage mon adoptante s\'est retrouvée avec un couple, non stérilisé. Je suis donc née, la personne ne pouvant pas assumer mes frères et sœurs, elle nous a confiée au refuge. Je suis un petit bonhomme très curieux, je suis le plus grand de la bande.', '2021-03-09', 15, 13),
(166, 'Pépite', 0, '31646239070.jpg', 'Je suis arrivé avec ma maman Neige, suite à une erreur de sexage mon adoptante s\'est retrouvée avec un couple, non stérilisé. Je suis donc née, la personne ne pouvant pas assumer mes frères et sœurs, elle nous a confiée au refuge. Je suis hyper curieux et sociable.', '2021-03-09', 15, 13),
(167, '​Burberry', 1, '31646241875.jpg', 'J\'ai été abandonnée  par mes anciens propriétaires (Trop de dégâts, manque de temps, lassitude, installation non esthétique). Je suis timide au premier abord, mais je me détends très rapidement et prends vite mes marques ! Je suis une puce très vive le soir venu, bien dans mes pattes et qui adore le bois ! Je suis à adopter avec Groseille.', '2019-03-01', 15, 5),
(168, 'Groseille', 1, '31646242008.jpg', 'J\'ai été abandonnée par mes anciens propriétaires (Trop de dégâts, manque de temps, lassitude, installation non esthétique). Plutôt réservée, c\'est seulement après quelques jours que je commencerais à venir de plus en plus vers vous, à chercher le contact et à prendre des friandises dans vos mains, je suis beaucoup ma copine Groseille et je me rassure auprès d\'elle.', '2019-06-01', 15, 5),
(169, '​Galopin', 0, '31646242757.jpg', 'Je viens d\'une portée de souris non désirée chez un particulier. Je suis un pépère adorable, qui sors au moindre bruit. Je suis un peu timide au premier abord, mais je me montre très très vite curieux et aventurier ! Je viens sentir les doigts mais n\'aime pas être attrapé. Je devrais vivre seul dans mon futur foyer. J\'aurais besoin d\'une cage spacieuse mais bien sécurisée (attention à l\'espace entre les barreaux !). J\'ai également besoin d\'avoir une bonne couche de litière pour creuser et faire mon nid. Je suis une petite souris extrêmement active, vive, et curieuse.', '2021-02-01', 15, 5),
(170, 'Venus', 1, '31646251152.jpg', 'J\'ai été confiée au refuge suite au décès de ma propriétaire. Je suis une petite lapine assez flipette au quotidien avec les gens, en raison de mes conditions de vie passée, mais j\'ai fait de gros progrès, je suis assez curieuse, mais j\'ai besoin de la présente de ma sœur Isis pour être rassurée pour le moment. Je suis malheureusement porteuse du parasite e-cuniculi et j\'ai parfois des &quot;crises&quot; qui nécessitent un traitement.', '0001-01-01', 15, 13),
(171, 'Isis', 1, '31646251193.jpg', 'J\'ai été confiée au refuge suite au décès de ma propriétaire. Je suis une lapine discrète, sociable, qui a besoin de temps avant d\'accorder sa confiance aux humains.  Je suis malheureusement porteuse du parasite e-cuniculi et j\'ai parfois des &quot;crises&quot; qui nécessitent un traitement.', '0001-01-01', 15, 13),
(172, 'Oxana', 1, '31646251547.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire a décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Le refuge m\'a accueilli, je suis une petite chinchilla très réservée, encore peureuse de la main de l\'homme, il reste encore du travail pour m\'apprivoiser, mes anciennes conditions de vie n\'ont pas du aider, je suis une puce vraiment méfiante. J\'espère trouver une nouvelle famille avec ma copine Oural.', '0001-01-01', 15, 5),
(173, 'Oural', 1, '31646251613.jpg', 'J\'ai été trouvée dans un logement avec d\'autres animaux, malheureusement ma propriétaire a décédée 13 jours avant, et nous sommes restés dans le logement, et beaucoup sont décédés... Le refuge m\'a accueilli, je suis comme ma copine Oxana, plutôt réservé, mais je progresse rapidement, vous pourrez me toucher sans que je ne cherche à fuir et viens de plus en plus chercher les friandises dans nos mains.', '0001-01-01', 15, 5),
(174, 'Crispy', 1, '31646316806.jpg', 'J\'ai été capturée avec 13 autres lapins suite à un signalement, quelqu\'un nous avait simplement balancés tous en pleine nature...  Je suis une lapine plutôt discrète sauf quand il faut manger.. Là je sais me faire entendre et attaque les grilles. Je commence cependant à perdre ce comportement, mon séjour dehors avec peu de nourriture a dû avoir un impact. Je suis une lapine qui accepte assez bien le contact humain.', '0001-01-01', 15, 13),
(175, 'Takara', 1, '31646317016.jpg', 'Une personne qui aménageait son logement nous a trouvés dans sa grange, l\'ancien propriétaire n\'a pas jugé nécessaire de nous emmener avec lui.', '2021-01-01', 15, 13),
(176, 'Pompom', 0, '31646317105.jpg', 'J\'ai été trouvé dans un parc par une promeneuse. Je suis actuellement totalement sous le contrôle de mes hormones, je marque, monte tout ce que je peux et je me montre agressif sur mon territoire. Nul doute que je serais un petit amour après ma castration.', '0001-01-01', 15, 13),
(177, 'Pandora', 1, '31646317179.jpg', 'Mon ancienne famille ne pouvait plus s\'occuper de nous, je suis née d\'une portée non contrôlées, je m\'échappais avec mes copains du jardin pour aller sur le parking de la résidence.', '2021-04-10', 15, 13),
(178, 'Daisy', 1, '31646317259.jpg', 'J\'ai été livré à moi-même dans un jardin, avec d\'autres lapins, j\'ai été prise en charge  en urgence. J\'ai de gros soucis dentaires, j\'ai l\'œil gauche purulent et j\'éternue quelques fois, je suis actuellement toujours sous traitement. Je suis une lapine qui malgré son passé est adorable avec l\'homme, vraiment curieuse et gourmande ! J\'ai parfois du mal avec les soins et mon traitement mais je me laisse toujours faire, je suis une petite mère très courageuse.', '0001-01-01', 15, 13),
(179, 'Miko', 0, '31646317317.jpg', 'J\'ai été abandonné dans la rue par un monsieur, une voisine m\'a récupérée et m\'a déposée au refuge. J\'avais une malocclusion dentaire sur mes incisives, toutes ont donc été retirées, je ne peux donc plus couper mes aliments, mais je peux toujours manger normalement (granulés, petits brins de foins ou d\'herbe et légumes/fruits coupés en petits morceaux). Je suis un lapin très gentil, doux, propre dans son clapier, qui devient de plus en plus câlin avec l\'humain, un petit amour !', '2021-01-01', 15, 13),
(180, 'Lilo', 0, '31646317380.jpg', 'J\'ai été trouvé errant, mes propriétaires n\'ont pas été retrouvés. Je suis un petit mâle très calme, qui s\'est rapidement habitué au refuge, je suis plutôt propre et viens facilement au contact.', '0001-01-01', 15, 13),
(181, 'Fanta', 1, '31646317468.jpg', 'Je suis une vraie décoratrice d\'intérieure, curieuse et posée, j\'aime la tranquillité mais accepte volontiers les petites friandises qu\'on me donne.', '2018-01-01', 15, 13),
(182, 'Maddy', 1, '31646317579.jpg', 'J\'ai été trouvée errante par des particuliers fin janvier. Je suis là depuis peu au refuge. Pour le moment, je suis une lapine plutôt calme et curieuse.', '0001-01-01', 15, 13),
(183, 'Benny', 0, '31646317640.jpg', 'J\'ai été trouvé dans la rue. Fan incontesté de l\'humain, des câlins, de l\'attention ! Je suis une vraie crème pleine de poils. Je suis également très attiré par la nourriture, comme je suis arrivé un peu maigrichon... Je suis un grand lapin, très curieux et qui fait beaucoup de flops.', '0001-01-01', 15, 13);

--
-- Tronquer la table avant d'insérer `animal_a_adopter_has_badge`
--

TRUNCATE TABLE `animal_a_adopter_has_badge`;
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
(115, 1),
(124, 1),
(136, 1),
(140, 1),
(144, 1),
(147, 1),
(148, 1),
(151, 1),
(152, 1),
(154, 1),
(155, 1),
(156, 1),
(160, 1),
(161, 1),
(162, 1),
(169, 1),
(54, 2),
(103, 2),
(108, 2),
(109, 2),
(132, 2),
(134, 2),
(136, 2),
(59, 3),
(76, 3),
(79, 3),
(85, 3),
(91, 3),
(95, 3),
(122, 3),
(136, 3),
(138, 3),
(145, 3),
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
(115, 5),
(124, 5),
(132, 5),
(134, 5),
(138, 5),
(139, 5),
(141, 5),
(144, 5),
(145, 5),
(147, 5),
(148, 5),
(149, 5),
(153, 5),
(157, 5),
(163, 5),
(183, 5),
(160, 6),
(66, 7),
(82, 7),
(84, 7),
(90, 7),
(97, 7),
(104, 7),
(110, 7),
(125, 7),
(128, 7),
(143, 7),
(146, 7),
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
(125, 8),
(128, 8),
(129, 8),
(130, 8),
(135, 8),
(139, 8),
(140, 8),
(141, 8),
(143, 8),
(146, 8),
(150, 8),
(151, 8),
(152, 8),
(159, 8),
(164, 8),
(171, 8),
(180, 8),
(181, 8),
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
(124, 9),
(134, 9),
(140, 9),
(149, 9),
(154, 9),
(155, 9),
(159, 9),
(163, 9),
(164, 9),
(165, 9),
(166, 9),
(167, 9),
(168, 9),
(170, 9),
(171, 9),
(174, 9),
(175, 9),
(176, 9),
(177, 9),
(178, 9),
(179, 9),
(180, 9),
(181, 9),
(182, 9),
(183, 9),
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
(167, 10),
(168, 10),
(169, 10),
(172, 10),
(173, 10);

--
-- Tronquer la table avant d'insérer `badge`
--

TRUNCATE TABLE `badge`;
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

--
-- Tronquer la table avant d'insérer `blog`
--

TRUNCATE TABLE `blog`;
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
(16, 'Une ferme à Center Parcs', 'Le Center Parcs de De Haan Aan Zee situé en bord de mer en Belgique flamande, accueille depuis peu de nombreux animaux en son sein', '<p>Le <strong>Center Parcs</strong> de <strong>De Haan Aan Zee</strong> ( Le Coq Sur Mer), situé en bord de mer en Belgique flamande, accueille depuis peu de nombreux animaux en son sein. En effet, il est possible d’accéder à une petite “ferme”, et de pouvoir aller caresser et sympathiser avec plusieurs de <strong>nos amis à quatre pattes</strong>. </p>', 'article_16.jpg', 'Photo prise par l\'équipe ZOEY', '<p>Il y a des moutons et des chèvres qui se baladent dans un enclos très large de plus d’un hectare. Il y a aussi de nombreuses poules, disposant d’un <strong>poulailler</strong> des plus chaleureux. Cochons, lapins et cochons d’inde seront aussi de la partie et n’attendent qu’à être dorlotés. Enfin, vous pouvez approcher l’un des animaux les plus nobles : le paon. \r\n<br><br>\r\nVous pouvez retrouver cette petite ferme à :<br>\r\n<a href=\"https://www.centerparcs.fr/fr-fr/belgique/fp_VM_vacances-domaine-de-vossemeren?&adlgid=c%7cg%7ccenter%20parcs%20de%20haan%7c449187854370%7ce&gclid=Cj0KCQiA64GRBhCZARIsAHOLriL7ao1LnvCyYZStI_lzSrb0EjhWoKAnKV6qvUJhprlNyDZWxmGwUsAaAlFAEALw_wcB&gclsrc=aw.ds\">Wenduinesteenweg 150, 8420 De Haan, Belgique</a><br>\r\n</p>', '2022-03-03 15:13:29', NULL);

--
-- Tronquer la table avant d'insérer `newsletter`
--

TRUNCATE TABLE `newsletter`;
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
(56, 'aleksendrav@hotmail.com', 'Alex', '2022-02-19 17:33:40');

--
-- Tronquer la table avant d'insérer `refuge`
--

TRUNCATE TABLE `refuge`;
--
-- Déchargement des données de la table `refuge`
--

INSERT INTO `refuge` (`idrefuge`, `nom`, `description`, `lien`, `adresse_mail`, `telephone`, `lien_maps`, `adresse`, `url_logo`) VALUES
(11, 'Pattes-En-Rond', NULL, 'https://pattesenrond.fr/', '', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10570.063486753616!2d2.6515515!3d48.5233447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x96f150f440dd7223!2sPattes-En-Rond!5e0!3m2!1sfr!2sfr!4v1642451409618!5m2!1sfr!2sfr', '164 Rue Rousseau Vaudran, 77190 Dammarie-les-Lys', 'pattesenrond.jpg'),
(12, 'SOS P\'tites Bêtes', NULL, 'https://sosptitesbetes.wixsite.com/sosptitesbetes', '​contactsosptitesbetes@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2647.222111388748!2d2.1701492148712256!3d48.433076738513634!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5c96c08eccd57%3A0xc43ac93d681cd826!2s7%20Imp.%20du%20Moulin%20Fouleret%2C%2091150%20%C3%89tampes!5e0!3m2!1sfr!2sfr!4v1642455442418!5m2!1sfr!2sfr', '7 imp du Moulin Fouleret  91150 Etampes', 'déconnecté'),
(13, 'Adopte Un Matou', NULL, 'https://adopteunmatou.com/', 'laurence.br3@gmail.com', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10470.686291203052!2d2.0593742!3d48.9978072!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3f256eeb61743650!2sAdopte%20Un%20Matou!5e0!3m2!1sfr!2sfr!4v1644957546309!5m2!1sfr!2sfr', '14 Ter Sente des Basses Vignes, 78780 Maurecourt', '31644957634.png'),
(14, 'Les Patounes de Bezons', NULL, 'https://les-patounes-de-bezons.fr/', 'contact@les-patounes-de-bezons.fr', NULL, 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10484.74051705359!2d2.2096524!3d48.9309156!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x153d8c8ccf6bcfaa!2sAssociation%20Les%20Patounes%20de%20Bezons!5e0!3m2!1sfr!2sfr!4v1645288679063!5m2!1sfr!2sfr', '80 Rue des Frères Bonneff, 95870 Bezons', '31645288861.jpg'),
(15, 'L\'Arche de Bagheera', NULL, 'http://refuge-larche-de-bagheera.weebly.com/', 'adb.refuge@yahoo.Fr', NULL, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2651.9326140773064!2d2.101994314830455!3d48.34260054483929!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e5b5aa60d4ab53%3A0xa55dc150b586124b!2s70%20Chem.%20de%20Bossenval%2C%2091660%20M%C3%A9r%C3%A9ville!5e0!3m2!1sfr!2sfr!4v1646174047468!5m2!1sfr!2sfr', '70 Chem. de Bossenval 91660 Le Mérévillois', '31646170159.png');

--
-- Tronquer la table avant d'insérer `types_animaux`
--

TRUNCATE TABLE `types_animaux`;
--
-- Déchargement des données de la table `types_animaux`
--

INSERT INTO `types_animaux` (`idtypes_animaux`, `nom`, `url_icone`) VALUES
(1, 'Poule', NULL),
(2, 'Chat', NULL),
(3, 'Chien', NULL),
(4, 'Autre', NULL),
(5, 'Rongeur', NULL),
(6, 'Reptile', NULL),
(7, 'Poisson', NULL),
(8, 'Crustacé', NULL),
(9, 'Insecte', NULL),
(10, 'Amphibien', NULL),
(11, 'Oiseau', NULL),
(12, 'Furet', NULL),
(13, 'Lapin', NULL);

--
-- Tronquer la table avant d'insérer `utilisateur`
--

TRUNCATE TABLE `utilisateur`;
--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `pseudo`, `mot_de_passe`, `prenom`, `nom`, `adresse_mail`, `url_photo`, `date_naissance`, `adresse`, `description`, `date_creation`, `date_derniere_connexion`, `token`, `statut`) VALUES
(1, 'Zoey', '$2y$10$4o48tqRZmFD3DM1bzLsJXuOxA/12Ptkt1rd27M6cmWFe2mFd7BZu2', 'admin', 'admin', 'zoey.app@gmail.com', 'déconnecté', '0001-01-01', NULL, NULL, '2022-01-14 19:58:24', NULL, 'bf3b4e1d991b0bd8ef7dbeb10557c81c416aeaa596e389b82e81aebd3450138f5e6283-1-1644939467', 1),
(3, 'amelie_rbls', '$2y$10$iQ9836duCciEi5hboVAQCu4ZCYkJkIguklq9pWYn/cZaE58umqTZu', 'Amélie', 'Rubiales', 'amelie.rubiales@gmail.com', 'déconnecté', '2002-04-07', NULL, NULL, '2022-01-18 12:59:03', NULL, 'e672a25e816c3ce93d3f7e6c2ce95e551f5d0c091a65bddf0496defcf2fc83861dd10c-3-1646317640', 1),
(4, 'clementine', '$2y$10$rubu/BuNIrkONMHC5usK7.j6asUrN0tXpnfHqO7rc9lWp/l0YL6/6', 'clementine', 'Gilama', 'clementine.gilama@gmail.com', 'déconnecté', '2002-05-03', NULL, NULL, '2022-01-18 12:59:18', NULL, '5230e93a9a843e5cc5d9a17db5916eec02b13d23d964c1279381d4d1013855617eee56-4-1642507232', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Hôte : db5006335318.hosting-data.io
-- Généré le : jeu. 03 mars 2022 à 23:15
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

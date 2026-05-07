-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 07 mai 2026 à 12:37
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `siron2`
--
CREATE DATABASE IF NOT EXISTS `SAE2.03` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SAE2.03`;
-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame'),
(4, 'Science-fiction'),
(5, 'Animation'),
(6, 'Thriller'),
(7, 'Horreur'),
(8, 'Aventure'),
(9, 'Fantaisie'),
(10, 'Documentaire');

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id_profil` int(11) NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id_profil`, `id_film`) VALUES
(5, 40),
(6, 40),
(6, 42),
(6, 55),
(7, 7),
(7, 17),
(7, 27),
(7, 40),
(7, 42),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 53),
(7, 54),
(7, 55),
(7, 56),
(7, 57),
(7, 58),
(7, 59),
(7, 60),
(7, 61);

-- --------------------------------------------------------

--
-- Structure de la table `Movie`
--

CREATE TABLE `Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL,
  `mis_en_avant` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Movie`
--

INSERT INTO `Movie` (`id`, `name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`, `mis_en_avant`) VALUES
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12, 0),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16, 0),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10, 0),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12, 0),
(40, 'Pacific Rim', 2013, 131, ' Des créatures monstrueuses venues d’ailleurs, les «Kaiju», ont dévastés l\'humanité pendant des années. Pour les combattre, les humains ont crée de gigantesques robots, les «Jaegers», contrôlés par deux pilotes via un système neuronal. Deux héros hors du commun sont appelés pour contrôler ces \"Jaegers\" : Charlie Hunnam qui incarne un ancien pilote et Rinko Kikuchi qui incarne une jeune femme qui termine son entraînement... Ensemble, ils sont le dernier rempart face à l\'Apocalypse imminente ! ', 'Guillermo Del Toro', 1, 'Pacific-Rim.jpg', 'https://www.youtube.com/embed/5guMumPFBag', 10, 0),
(42, 'The amazing spider-man 2', 2014, 142, 'Ce n’est un secret pour personne que le combat le plus rude de Spider-Man est celui qu’il mène contre lui-même en tentant de concilier la vie quotidienne de Peter Parker et les lourdes responsabilités de Spider-Man. Mais Peter Parker va se rendre compte qu’il fait face à un conflit de bien plus grande ampleur. Être Spider-Man, quoi de plus grisant ? Peter Parker trouve son bonheur entre sa vie de héros, bondissant d’un gratte-ciel à l’autre, et les doux moments passés aux côté de Gwen. Mais être Spider-Man a un prix : il est le seul à pouvoir protéger ses concitoyens new-yorkais des abominables méchants qui menacent la ville.  Face à Electro, Peter devra affronter un ennemi nettement plus puissant que lui.  Au retour de son vieil ami Harry Osborn, il se rend compte que tous ses ennemis ont un point commun : OsCorp.', 'Marc Webb', 1, 'tasm2.jpg', 'https://www.youtube.com/embed/DlM2CWNTQ84', 12, 0),
(49, 'Blade Runner 2049', 2017, 163, 'En 2049, la société est fragilisée par les nombreuses tensions entre les humains et leurs esclaves créés par bio-ingénierie. L\'officier K est un Blade Runner: il fait partie d\'une force d\'intervention d\'élite chargée de trouver et d\'éliminer ceux qui n\'obéissent pas aux ordres des humains.', 'Denis Villeneuve', 4, 'blade-runner-2049.jpg', 'https://www.youtube.com/embed/O4C5cwSbXZ8?si=Y4fhZOS9YwVyFNl4', 1, 0),
(50, 'Arthur et les Minimoys', 2006, 94, 'Un garçon découvre un monde miniature et part à l’aventure pour sauver sa maison.', 'Luc Besson', 5, 'Athur.jpg', 'https://www.youtube.com/embed/nwYpQF4ESks?si=ruIgWBecVF5NqFvK', 1, 0),
(51, 'Django Unchained', 2012, 165, 'Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le chasseur de primes d\'origine allemande, le Dr King Schultz, fait l\'acquisition de Django, un esclave qui peut l\'aider à traquer les frères Brittle. En échange, Schultz promet de libérer Django et de l\'aider à retrouver sa femme, Broomhilda, retenue par le redoutable propriétaire d\'une plantation, Calvin Candie.', 'Quentin Tarantino', 1, 'django-unchained.jpg', 'https://www.youtube.com/embed/0fUCuvNlOCg?si=ZKmmiNlWSJxD5fZq', 18, 0),
(52, 'Joker', 2019, 122, 'L’histoire sombre d’un homme marginal qui devient le célèbre criminel Joker.', 'Todd Phillips', 3, 'joker.jpg', 'https://www.youtube.com/embed/HL3EuCbcOAo?si=uIYD5zHs_AR2EIgB', 18, 0),
(53, 'Oppenheimer', 2023, 180, '\"Le film retrace la vie de J. Robert Oppenheimer, physicien brillant mais tourmenté, depuis ses années de formation en Europe jusqu’à la direction du Projet Manhattan durant la Seconde Guerre mondiale. Chargé de concevoir la première bombe atomique, il rassemble une équipe de scientifiques à Los Alamos et mène l’essai Trinity, qui marque un tournant historique. Après les bombardements d’Hiroshima et de Nagasaki, Oppenheimer est rongé par la culpabilité et s’oppose au développement de l’arme thermonucléaire, ce qui le met en conflit avec certains de ses anciens collègues. Dans le climat tendu de la guerre froide, ses liens passés avec des communistes sont exploités contre lui, menant à la révocation de son habilitation de sécurité en 1954. Le récit alterne entre son ascension scientifique, ses dilemmes moraux et les conséquences politiques qui finiront par briser sa carrière, tout en posant la question du prix humain et éthique du progrès scientifique.\"', 'Christopher Nolan', 6, 'oppenheimer.jpg', 'https://www.youtube.com/embed/uYPbbksJxIg?si=lcOJQ_xm-cQj5NaW', 18, 0),
(54, 'Ring', 1998, 96, 'Tokyo, fin des années 2000, une ru­meur se répand parmi les adoles­cents : visionner une mystérieuse cassette vidéo provoquerait une mort cer­taine au bout d’une semaine. Après le dé­cès inexplicable de sa nièce, la journaliste Reiko Asakawa décide de mener l’enquête mais se retrouve elle-même sous le coup de la malédiction. Pendant les sept jours qui lui restent à vivre, elle devra remonter à l’origine de la vidéo fatale et affronter le spectre qui hante les télévisions : Sadako.', 'Hiroshi Takahashi', 7, 'ring.jpg', 'https://www.youtube.com/embed/mRDE5l-PJYY?si=seySexEKLXqRh47I', 12, 0),
(55, 'Apex', 2026, 135, 'Sasha pratique l\'escalade de haut niveau. Frappée par un deuil, elle tente de se changer les idées en grimpant sur des falaises en forêt. Elle est alors prise en chasse par un braconnier inconnu. Tout en luttant contre les éléments naturels, elle va devoir affronter cet ennemi mystérieux. Elle ne pourra pas compter sur l\'aide de son partenaire[1].', 'Baltasar Kormákur', 1, 'apex.jpeg', 'https://www.youtube.com/embed/ELJ_orzMy1M?si=xTxEe-WWndmItRbT', 12, 0),
(56, 'Top Gun', 1986, 110, 'Jeune as du pilotage et tête brûlée d\'une école réservée à l\'élite de l\'aéronavale US (\"Top Gun\"), Pete Mitchell, dit \"Maverick\", tombe sous le charme d\'une instructrice alors qu\'il est en compétition pour le titre du meilleur pilote...', 'Jim Cash, Jack Epps Jr.', 1, 'TopGun.jpg', 'https://www.youtube.com/embed/xa_z57UatDY?si=pZuh4guhgxVrxRNA', 7, 0),
(57, 'Top Gun: Maverick', 2022, 131, 'Après avoir été l’un des meilleurs pilotes de chasse de la Marine américaine pendant plus de trente ans, Pete “Maverick\" Mitchell continue à repousser ses limites en tant que pilote d\'essai. Il refuse de monter en grade, car cela l’obligerait à renoncer à voler. Il est chargé de former un détachement de jeunes diplômés de l’école Top Gun pour une mission spéciale qu’aucun pilote n\'aurait jamais imaginée. Lors de cette mission, Maverick rencontre le lieutenant Bradley “Rooster” Bradshaw, le fils de son défunt ami, le navigateur Nick “Goose” Bradshaw. Face à un avenir incertain, hanté par ses fantômes, Maverick va devoir affronter ses pires cauchemars au cours d’une mission qui exigera les plus grands des sacrifices.', 'Christopher McQuarrie, Ehren Kruger', 1, 'TopGun2.jpg', 'https://www.youtube.com/embed/qSqVVswa420?si=cabyT0kamRmRbBjY', 1, 0),
(58, 'Spider-Man: Across the Spider-Verse', 2023, 141, 'Après avoir retrouvé Gwen Stacy, Spider-Man, le sympathique héros originaire de Brooklyn, est catapulté à travers le Multivers, où il rencontre une équipe de Spider-Héros chargée d\'en protéger l\'existence. Mais lorsque les héros s\'opposent sur la façon de gérer une nouvelle menace, Miles se retrouve confronté à eux et doit redéfinir ce que signifie être un héros afin de sauver les personnes qu\'il aime le plus.', 'Phil Lord, Christopher Miller', 5, 'spiderman-arossthespiderverse.jpg', 'https://www.youtube.com/embed/cqGjhVJWtEg?si=8Se4TUReWG6e--F0', 1, 1),
(59, 'Spider-Man: Into the Spider-Verse', 2018, 117, 'Spider-Man : Into the Spider-Verse suit les aventures de Miles Morales, un adolescent afro-américain et portoricain qui vit à Brooklyn et s’efforce de s’intégrer dans son nouveau collège à Manhattan. Mais la vie de Miles se complique quand il se fait mordre par une araignée radioactive et se découvre des super-pouvoirs : il est désormais capable d’empoisonner ses adversaires, de se camoufler, de coller littéralement aux murs et aux plafonds ; son ouïe est démultipliée... Dans le même temps, le plus redoutable cerveau criminel de la ville, le Caïd, a mis au point un accélérateur de particules nucléaires capable d’ouvrir un portail sur d’autres univers. Son invention va provoquer l’arrivée de plusieurs autres versions de Spider-Man dans le monde de Miles, dont un Peter Parker plus âgé, Spider-Gwen, Spider-Man Noir, Spider-Cochon et Peni Parker, venue d’un dessin animé japonais.', 'Phil Lord, Rodney Rothman', 5, 'Spider-Man_Into_the_Spider-Verse.png', 'https://www.youtube.com/embed/cqGjhVJWtEg?si=8Se4TUReWG6e--F0', 1, 1),
(60, 'Super Mario Bros, le film', 2023, 92, 'Alors qu’ils tentent de réparer une canalisation souterraine, Mario et son frère Luigi, tous deux plombiers, se retrouvent plongés dans un nouvel univers féerique à travers un mystérieux conduit. Mais lorsque les deux frères sont séparés, Mario s’engage dans une aventure trépidante pour retrouver Luigi. Dans sa quête, il peut compter sur l’aide du champignon Toad, habitant du Royaume Champignon, et les conseils avisés, en matière de techniques de combat, de la Princesse Peach, guerrière déterminée à la tête du Royaume. C’est ainsi que Mario réussit à mobiliser ses propres forces pour aller au bout de sa mission.', 'Matthew Fogel', 5, 'mario-bros.jpg', 'https://www.youtube.com/embed/iwst-UZn3wM?si=pntF_OzGOCKgcapw', 1, 1),
(61, 'James Bond Skyfall', 2012, 143, '\"Lorsqu’une mission tourne mal à Istanbul, James Bond est porté disparu et présumé mort. Peu après, le MI6 subit une attaque informatique qui vise directement M, révélant qu’un ennemi intime connaît ses secrets et cherche à la détruire. Bond réapparaît et reprend du service malgré une condition physique affaiblie, déterminé à identifier l’auteur de ces attaques.  Son enquête le mène jusqu’à Raoul Silva, ancien agent du MI6 devenu cyber‑terroriste, animé par une vengeance personnelle contre M. Pour protéger son service et affronter ce passé qui ressurgit, Bond doit repousser ses limites et revenir sur les traces de son enfance, jusqu’au manoir familial de Skyfall, où se joue l’affrontement final.\"', '        Sam Mendes', 1, 'skyfall.jpg', 'https://www.youtube.com/embed/6kw1UVovByw?si=wogrRbNA36Iywf9E', 12, 0),
(62, 'Titanic', 1997, 194, 'Southampton, 10 avril 1912. Le paquebot le plus grand et le plus moderne du monde, réputé pour son insubmersibilité, le \"Titanic\", appareille pour son premier voyage. Quatre jours plus tard, il heurte un iceberg. A son bord, un artiste pauvre et une grande bourgeoise tombent amoureux.', 'James Cameron', 3, 'titanic.jpg', 'https://www.youtube.com/embed/CHekzSiZjrY?si=TW7cGyQ78jHwp2km', 12, 0),
(63, 'I Robot ', 2004, 115, 'Un policier enquête sur un robot impliqué dans un meurtre malgré les lois de la robotique.', 'Alex Proyas', 4, 'I-robot.jpg', 'https://www.youtube.com/embed/PjECS38ZGWE?si=8f5svvKpHBmu5KvU', 12, 0),
(64, 'Le Labyrinthe', 2014, 113, 'Un groupe d’adolescents tente de s’échapper d’un labyrinthe géant.', 'Wes Ball', 4, 'labyrinthe.jpg', 'https://www.youtube.com/embed/LyPiCH_4Al4?si=HhFyKVb8Bt_aOfBN', 12, 0),
(65, 'Men in Black', 1997, 98, 'Deux agents secrets surveillent les extraterrestres vivant sur Terre.', 'Barry Sonnenfeld', 4, 'meninblack.jpg', 'https://www.youtube.com/embed/UxUTTrU6PA4?si=TcAGoD3Tp9aDepdS', 7, 0),
(66, 'Star Wars, épisode I : La Menace fantôme ', 1999, 136, 'Avant de devenir un célèbre chevalier Jedi, et bien avant de se révéler l\'âme la plus noire de la galaxie, Anakin Skywalker est un jeune esclave sur la planète Tatooine. La Force est déjà puissante en lui et il est un remarquable pilote de Podracer. Le maître Jedi Qui-Gon Jinn le découvre et entrevoit alors son immense potentiel. Pendant ce temps, l\'armée de droïdes de l\'insatiable Fédération du Commerce a envahi Naboo dans le cadre d\'un plan secret des Sith visant à accroître leur pouvoir.', 'George Lucas', 4, 'starwars1.jpg', 'https://www.youtube.com/embed/bD7bpG-zDJQ?si=W5B7P99yUqF1SWtJ', 1, 0),
(67, 'Kung fu panda ', 2008, 132, 'Un panda maladroit devient un maître du kung-fu pour sauver la vallée de la paix.', 'Mark Osborne', 5, 'kungfupanda.jpg', 'https://www.youtube.com/embed/PXi3Mv6KMzY?si=bZecgzuHoYRfZieg', 1, 0),
(68, 'Le Comte de Monte-Cristo', 2024, 178, 'Victime d’un complot, le jeune Edmond Dantès est arrêté le jour de son mariage pour un crime qu’il n’a pas commis. Après quatorze ans de détention au château d’If, il parvient à s’évader. Devenu immensément riche, il revient sous l’identité du comte de Monte-Cristo pour se venger des trois hommes qui l’ont trahi.', 'Alexandre de La Patellière, Matthieu Delaporte', 8, 'montecristo.jpg', 'https://www.youtube.com/watch?v=u0YnbsyvGS0', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Profile`
--

CREATE TABLE `Profile` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `age_restriction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Profile`
--

INSERT INTO `Profile` (`id`, `nom`, `avatar`, `age_restriction`) VALUES
(5, 'Enfant', 'spider-man.jpg', 10),
(6, 'Ado', 'captain-america.jpg', 12),
(7, 'Adulte', 'iron-man.webp', 18);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id_profil`,`id_film`);

--
-- Index pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `Profile`
--
ALTER TABLE `Profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `Profile`
--
ALTER TABLE `Profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

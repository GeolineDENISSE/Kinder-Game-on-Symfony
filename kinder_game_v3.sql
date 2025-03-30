-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 26 mars 2025 à 12:44
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kinder_game`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `label`, `color`) VALUES
(1, 'Plateforme', 'wheat'),
(2, 'FPS', 'red'),
(3, 'Action', 'purple'),
(4, 'Horreur', 'black'),
(9, 'RPG', 'orange'),
(10, 'MOBA', 'grey');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250314084021', '2025-03-14 08:40:46', 167),
('DoctrineMigrations\\Version20250314084329', '2025-03-14 08:43:39', 116),
('DoctrineMigrations\\Version20250314093622', '2025-03-14 09:36:42', 28),
('DoctrineMigrations\\Version20250314102326', '2025-03-14 10:23:45', 31),
('DoctrineMigrations\\Version20250317125245', '2025-03-17 12:53:12', 78),
('DoctrineMigrations\\Version20250318095557', '2025-03-18 09:56:37', 78);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `is_reduced` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `label`, `price`, `description`, `media`, `category_id`, `is_reduced`) VALUES
(15, 'Mario Galaxy', 60, 'C\'est Mario dans les étoiles. Mais sinon, il doit toujours sauver Peach.', 'https://images2.fanpop.com/images/photos/5400000/Super-Mario-Galaxy-Wallpaper-super-mario-bros-5432171-1600-1200.jpg', 1, 1),
(16, 'Final Fantasy', 9, 'On se bat, mais avec fantaisie ^^\' (mais, c ki fantési ?)', 'https://static.actugaming.net/media/2020/05/final-fantasy-9-illustration.jpg', 9, 0),
(17, 'Rayman 2', 50, 'Un héro sans bras, mais avec des mains, qui se bas dans la jungle avec des créatures étranges.', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/06/Rayman-1.jpg', 1, 1),
(18, 'Spyro', 50, 'Un petit dragon (je ne connais pas ce jeu)', 'https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_SpyroReignitedTrilogy_image1600w.jpg', 1, 0),
(19, 'League of Legends', 0, 'De l\'aventure, des combats, et beaucoup de rage !', 'https://igrofania.ru/upload/images/news/03.08.21/League%20of%20Legends_1.jpg', 10, 1),
(20, 'Until Dawn', 19, 'ça fait peur, et des gens décèdent dans une maison.', 'https://legendary-digital-network-assets.s3.amazonaws.com/wp-content/uploads/2024/01/17153642/Until-Dawn-920x518.jpg', 4, 0),
(21, 'Resident Evil 4', 19, 'On tue des gens.', 'https://img.youtube.com/vi/Yj9UeZzp12o/maxresdefault.jpg', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'homies@gmax.com', '[\"ROLE_ADMIN\"]', '$2y$13$TxKdT5EMZGQiBlBjuFKJROtBBGIlawwP/jrQSQPjyZ79I7RKaPXIi'),
(2, 'goo.dancer@gg.com', '[]', '$2y$13$dltgB..El6ixXlIZZnzBRuvG7WcXSUtTCjYjBzvZNABasPgjgiYxq'),
(3, 'fromage.de.chevre@ggoat.com', '[]', '$2y$13$BqX/dqk581N3JnWkugEwbeaoiR5td9SCue/XgG/MYAWaRR2GNbNvy');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

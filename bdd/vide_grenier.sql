  -- --------------------------------------------------
  -- --  Créer la bdd vide_grenier_v1_zr_hp
  -- --------------------------------------------------
  create database IF NOT EXISTS vide_grenier_v1_zr_hp;
  USE vide_grenier_v1_zr_hp;

  -- --------------------------------------------------
  -- -- Drop pour clear la BDD (tables & procédures)
  -- --------------------------------------------------
  DROP TABLE IF EXISTS reservation_place;
  DROP TABLE IF EXISTS videgrenier;
  DROP TABLE IF EXISTS utilisateur;
  DROP TABLE IF EXISTS statuts;
  DROP TABLE IF EXISTS mailing_list;
  DROP TABLE IF EXISTS reservation_vg;
  DROP TABLE IF EXISTS places;
  
  DROP PROCEDURE IF EXISTS add_mailing_list;
  DROP PROCEDURE IF EXISTS remove_mailing_list;
  DROP TRIGGER IF EXISTS inscription_mailing_auto;

  -- ---------------------------------------------
  -- -- Créer les Procédures
  -- ---------------------------------------------
  DELIMITER $$

  CREATE DEFINER=`root`@`localhost` PROCEDURE `add_mailing_list` (IN `mail` VARCHAR(100))  BEGIN
    INSERT INTO mailing_list(MAIL_ML) VALUES (mail);
  END$$

  CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_mailing_list` (IN `mail` VARCHAR(100))  BEGIN
    DELETE FROM mailing_list WHERE MAIL_ML = mail;
  END$$

  DELIMITER ;



  -- --------------------------------------------------------
  -- Structure de la table `mailing_list`
  -- --------------------------------------------------------
  CREATE TABLE `mailing_list` (
    `ID_ML` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `MAIL_ML` varchar(50) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  -- --------------------------------------------------------
  -- Structure de la table `reservation_vg`
  -- --------------------------------------------------------
  CREATE TABLE `reservation_vg` (
    `ID_RESA` int(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    `ID_VG` int(11) NOT NULL,
    `ID_UTIL` int(11) NOT NULL,
    `NOM_RESA` varchar(50) NOT NULL,
    `PRENOM_RESA` varchar(50) NOT NULL,
    `MAIL_RESA` varchar(50) NOT NULL,
    `ADDRESSE_RESA` varchar(100) NOT NULL,
    `CODE_POSTAL_RESA` varchar(6) NOT NULL,
    `VILLE_RESA` varchar(50) NOT NULL,
    `PORTABLE_RESA` varchar(15) DEFAULT NULL,
    `CNI_RESA` varchar(12) NOT NULL,
    `DELIVRE_CNI_RESA` varchar(10) NOT NULL,
    `PAR_CNI_RESA` varchar(50) NOT NULL,
    `IMMATRICULATION_RESA` varchar(10) NOT NULL,
    `NBR_RESA` int(11) NOT NULL,
    `INFO_RESA` varchar(150) DEFAULT NULL,
    `STATU_RESA` int(11) NOT NULL DEFAULT 1
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  -- --------------------------------------------------------
  -- Structure de la table `statuts`
  -- --------------------------------------------------------
  CREATE TABLE `statuts` (
    `ID_STATUTS` int(11) PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    `LABEL_STATUTS` varchar(15) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  -- --------------------------------------------------------
  -- Structure de la table `utilisateur`
  -- --------------------------------------------------------
  CREATE TABLE `utilisateur` (
    `ID_UTIL` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `MAIL_UTIL` varchar(50) NOT NULL,
    `MDP_UTIL` varchar(30) NOT NULL,
    `NOM_UTIL` varchar(50) DEFAULT NULL,
    `PRENOM_UTIL` varchar(50) DEFAULT NULL,
    `TEL_UTIL` varchar(15) DEFAULT NULL,
    `DESC_UTIL` varchar(280) DEFAULT NULL,
    `ADMIN_UTIL` tinyint(1) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  -- --------------------------------------------------------
  -- Structure de la table `videgrenier`
  -- --------------------------------------------------------
  CREATE TABLE `videgrenier` (
    `ID_VG` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `LABEL_VG` varchar(50) DEFAULT NULL,
    `DATE_VG` varchar(11) DEFAULT NULL,
    `HEURE_VG` varchar(15) NOT NULL,
    `ADDRESSE_VG` varchar(100) NOT NULL,
    `NBR_EMPLACEMENTS` int(11) DEFAULT NULL,
    `NBR_RESTANT_VG` int(11) NOT NULL,
    `PRIX_EMPLACEMENTS` decimal(10,0) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  -- --------------------------------------------------------
  -- Structure de la table `places`
  -- --------------------------------------------------------
  CREATE TABLE `places` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `coords` VARCHAR(50) NOT NULL,
    type VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
  ) ENGINE = InnoDB;

  -- --------------------------------------------------------
  -- Structure de la table `reservation_place`
  -- --------------------------------------------------------
  CREATE TABLE `reservation_place` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `reservation_id` int(11) NOT NULL,
    `place_id` int(11) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_vg(ID_RESA),
    FOREIGN KEY (place_id) REFERENCES places(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  -- --
  -- -- Index pour la table `reservation_place`
  -- --
  -- ALTER TABLE `reservation_place`
  --   ADD KEY `fk_reservation_place_places` (`place_id`),
  --   ADD KEY `fk_reservation_place_reservation` (`reservation_id`);

  -- -- --------------------------------------------------------
  -- -- Clés étrangères table reservation_place
  -- -- --------------------------------------------------------
  -- ALTER TABLE `reservation_place`
  --   ADD CONSTRAINT `fk_reservation_place_places` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  --   ADD CONSTRAINT `fk_reservation_place_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation_vg` (`ID_RESA`);
  -- COMMIT;


  -- ---------------------------------------------
  -- trigger `inscription_mailing_auto`
  -- ---------------------------------------------
  DELIMITER $$

  CREATE TRIGGER `inscription_mailing_auto` AFTER INSERT ON `utilisateur` FOR EACH ROW BEGIN   
    
    INSERT INTO mailing_list (MAIL_ML) VALUE(NEW.MAIL_UTIL);
      
  END
  $$
  DELIMITER ;

  -- ----------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------
  -- ----------------------------------------------------------------------------------



  -- ----------------------------------------------------------------------------------
  -- - Début Insertion des données
  -- ----------------------------------------------------------------------------------

  --
  -- Déchargement des données de la table `mailing_list`
  --
  INSERT INTO `mailing_list` (`ID_ML`, `MAIL_ML`) VALUES
  (136, 'compte_inscrit_mailing_list@mail.fr');

  --
  -- Déchargement des données de la table `reservation_vg`
  --
  INSERT INTO `reservation_vg` (`ID_RESA`, `ID_VG`, `ID_UTIL`, `NOM_RESA`, `PRENOM_RESA`, `MAIL_RESA`, `ADDRESSE_RESA`, `CODE_POSTAL_RESA`, `VILLE_RESA`, `PORTABLE_RESA`, `CNI_RESA`, `DELIVRE_CNI_RESA`, `PAR_CNI_RESA`, `IMMATRICULATION_RESA`, `NBR_RESA`, `INFO_RESA`, `STATU_RESA`) VALUES
  (2, 2, 2, 'mom', 'non', 'adresse@mail.fr', '123 avenue exemple', '12333', 'Lyon', '0123456789', 'ZAEP1EK1E3O1', '12/12/1990', 'Lyon', '123 AB 11', 6, NULL, 2),
  (4, 2, 2, 'nom', 'prenom', 'aa@ee.fr', '4 aa', '6900', 'sa', '0123456789', 'aaa123a46', '01/01/2000', 'rhone', 'aa-222-ac', 2, NULL, 3);

  --
  -- Déchargement des données de la table `statuts`
  --
  INSERT INTO `statuts` (`ID_STATUTS`, `LABEL_STATUTS`) VALUES
  (1, 'En attente'),
  (2, 'Validée'),
  (3, 'Refusée');


  --
  -- Déchargement des données de la table `utilisateur`
  --
  INSERT INTO `utilisateur` (`ID_UTIL`, `MAIL_UTIL`, `MDP_UTIL`, `NOM_UTIL`, `PRENOM_UTIL`, `TEL_UTIL`, `DESC_UTIL`, `ADMIN_UTIL`) VALUES
  (2, 'adresse@mail.fr', 'aaaaaa', 'Dupiont', 'Rogere', '0222222222', 'dazdazdaz', NULL),
  (6, 'admin@admin.fr', 'xxxxxx', 'Admin', 'Alvin', NULL, 'Admin du site', 1),
  (113, 'miyazaki1@yopmail.com', '123+aze', 'zaj', 'Jean', '0392313222', NULL, NULL),
  (114, 'mlolap3@yopmail.com', '123+aze', 'dumpont', 'jmean', '0231328189', 'nn', NULL),
  (115, 'zakaria@mail.fr', '123+aze', 'rh', 'zakaria', '0123456789', 'non', NULL);

  --
  -- Déchargement des données de la table `videgrenier`
  --
  INSERT INTO `videgrenier` (`ID_VG`, `LABEL_VG`, `DATE_VG`, `HEURE_VG`, `ADDRESSE_VG`, `NBR_EMPLACEMENTS`, `NBR_RESTANT_VG`, `PRIX_EMPLACEMENTS`) VALUES
  (2, 'Vide-grenier annuel 2016', '03/07/2016', 'de 6h à 16h', 'Esplanade de la Gravière, Avenue De Limburg., Sainte-foy-lès-lyon 69110', 100, 59, '20'),
  (3, 'Test vide-grenier par Admin', '10/02/9999', 'de 4h à 23h', 'Un exemple random, 44444 Ville', 102, 95, '300'),
  (5, 'Vide grenier printemps', '01/04/2021', 'de 08h à 16h', '52 Place des reines, 69004 Lyon', 200, 0, '35');

--
-- Déchargement des données de la table `places` (les emplacements pour la carte)
--
INSERT INTO `places` (`id`, `coords`, `type`) VALUES
(1, '1_1', '_'),
(2, '1_2', '_'),
(3, '1_3', '_'),
(4, '1_4', '_'),
(5, '1_5', '_'),
(6, '1_6', '_'),
(7, '1_7', '_'),
(8, '1_8', 'a'),
(9, '1_9', 'a'),
(10, '1_10', 'a'),
(11, '1_11', 'a'),
(12, '1_12', 'a'),
(13, '1_13', 'a'),
(14, '1_14', 'a'),
(15, '1_15', 'a'),
(16, '1_16', 'a'),
(17, '1_17', 'a'),
(18, '1_18', 'a'),
(19, '1_19', 'a'),
(20, '1_20', 'a'),
(21, '1_21', 'a'),
(22, '1_22', 'a'),
(23, '1_23', 'a'),
(24, '1_24', 'a'),
(25, '1_25', 'a'),
(26, '1_26', 'a'),
(27, '1_27', 'a'),
(28, '1_28', 'a'),
(29, '1_29', 'a'),
(30, '1_30', 'a'),
(31, '1_31', 'a'),
(32, '1_32', 'a'),
(33, '1_33', 'a'),
(34, '1_34', 'a'),
(35, '1_35', 'a'),
(36, '1_36', 'a'),
(37, '1_37', 'a'),
(38, '1_38', 'a'),
(39, '1_39', 'a'),
(40, '1_40', 'a'),
(41, '1_41', 'a'),
(42, '2_1', '_'),
(43, '2_2', '_'),
(44, '2_3', '_'),
(45, '2_4', '_'),
(46, '2_5', '_'),
(47, '2_6', '_'),
(48, '2_7', '_'),
(49, '2_8', 'a'),
(50, '2_9', '_'),
(51, '2_10', '_'),
(52, '2_11', '_'),
(53, '2_12', '_'),
(54, '2_13', '_'),
(55, '2_14', '_'),
(56, '2_15', '_'),
(57, '2_16', '_'),
(58, '2_17', '_'),
(59, '2_18', '_'),
(60, '2_19', '_'),
(61, '2_20', '_'),
(62, '2_21', '_'),
(63, '2_22', '_'),
(64, '2_23', '_'),
(65, '2_24', '_'),
(66, '2_25', '_'),
(67, '2_26', '_'),
(68, '2_27', '_'),
(69, '2_28', '_'),
(70, '2_29', '_'),
(71, '2_30', '_'),
(72, '2_31', '_'),
(73, '2_32', '_'),
(74, '2_33', '_'),
(75, '2_34', '_'),
(76, '2_35', '_'),
(77, '2_36', '_'),
(78, '2_37', '_'),
(79, '2_38', '_'),
(80, '2_39', '_'),
(81, '2_40', '_'),
(82, '2_41', '_'),
(83, '3_1', '_'),
(84, '3_2', '_'),
(85, '3_3', '_'),
(86, '3_4', '_'),
(87, '3_5', '_'),
(88, '3_6', '_'),
(89, '3_7', '_'),
(90, '3_8', 'a'),
(91, '3_9', '_'),
(92, '3_10', '_'),
(93, '3_11', 'b'),
(94, '3_12', 'b'),
(95, '3_13', 'a'),
(96, '3_14', 'a'),
(97, '3_15', 'b'),
(98, '3_16', '_'),
(99, '3_17', 'b'),
(100, '3_18', 'a'),
(101, '3_19', 'a'),
(102, '3_20', 'b'),
(103, '3_21', '_'),
(104, '3_22', 'b'),
(105, '3_23', 'a'),
(106, '3_24', 'a'),
(107, '3_25', 'b'),
(108, '3_26', '_'),
(109, '3_27', 'b'),
(110, '3_28', 'a'),
(111, '3_29', 'a'),
(112, '3_30', 'b'),
(113, '3_31', '_'),
(114, '3_32', 'b'),
(115, '3_33', 'a'),
(116, '3_34', 'a'),
(117, '3_35', 'b'),
(118, '3_36', '_'),
(119, '3_37', 'b'),
(120, '3_38', 'a'),
(121, '3_39', 'a'),
(122, '3_40', 'b'),
(123, '3_41', 'a'),
(124, '4_1', '_'),
(125, '4_2', '_'),
(126, '4_3', '_'),
(127, '4_4', '_'),
(128, '4_5', '_'),
(129, '4_6', '_'),
(130, '4_7', '_'),
(131, '4_8', 'a'),
(132, '4_9', '_'),
(133, '4_10', '_'),
(134, '4_11', 'b'),
(135, '4_12', 'b'),
(136, '4_13', 'a'),
(137, '4_14', 'a'),
(138, '4_15', 'b'),
(139, '4_16', '_'),
(140, '4_17', 'b'),
(141, '4_18', 'a'),
(142, '4_19', 'a'),
(143, '4_20', 'b'),
(144, '4_21', '_'),
(145, '4_22', 'b'),
(146, '4_23', 'a'),
(147, '4_24', 'a'),
(148, '4_25', 'b'),
(149, '4_26', '_'),
(150, '4_27', 'b'),
(151, '4_28', 'a'),
(152, '4_29', 'a'),
(153, '4_30', 'b'),
(154, '4_31', '_'),
(155, '4_32', 'b'),
(156, '4_33', 'a'),
(157, '4_34', 'a'),
(158, '4_35', 'b'),
(159, '4_36', '_'),
(160, '4_37', 'b'),
(161, '4_38', 'a'),
(162, '4_39', 'a'),
(163, '4_40', 'b'),
(164, '4_41', 'a'),
(165, '5_1', '_'),
(166, '5_2', '_'),
(167, '5_3', '_'),
(168, '5_4', '_'),
(169, '5_5', '_'),
(170, '5_6', '_'),
(171, '5_7', '_'),
(172, '5_8', '_'),
(173, '5_9', '_'),
(174, '5_10', '_'),
(175, '5_11', '_'),
(176, '5_12', '_'),
(177, '5_13', '_'),
(178, '5_14', '_'),
(179, '5_15', '_'),
(180, '5_16', '_'),
(181, '5_17', '_'),
(182, '5_18', '_'),
(183, '5_19', '_'),
(184, '5_20', '_'),
(185, '5_21', '_'),
(186, '5_22', '_'),
(187, '5_23', '_'),
(188, '5_24', '_'),
(189, '5_25', '_'),
(190, '5_26', '_'),
(191, '5_27', '_'),
(192, '5_28', '_'),
(193, '5_29', '_'),
(194, '5_30', '_'),
(195, '5_31', '_'),
(196, '5_32', '_'),
(197, '5_33', '_'),
(198, '5_34', '_'),
(199, '5_35', '_'),
(200, '5_36', '_'),
(201, '5_37', '_'),
(202, '5_38', '_'),
(203, '5_39', '_'),
(204, '5_40', '_'),
(205, '5_41', '_'),
(206, '6_1', '_'),
(207, '6_2', 'b'),
(208, '6_3', 'a'),
(209, '6_4', 'a'),
(210, '6_5', 'a'),
(211, '6_6', '_'),
(212, '6_7', 'b'),
(213, '6_8', 'a'),
(214, '6_9', 'a'),
(215, '6_10', 'b'),
(216, '6_11', '_'),
(217, '6_12', 'b'),
(218, '6_13', 'a'),
(219, '6_14', 'a'),
(220, '6_15', 'b'),
(221, '6_16', '_'),
(222, '6_17', 'b'),
(223, '6_18', 'a'),
(224, '6_19', 'a'),
(225, '6_20', 'b'),
(226, '6_21', '_'),
(227, '6_22', 'b'),
(228, '6_23', 'a'),
(229, '6_24', 'a'),
(230, '6_25', 'b'),
(231, '6_26', '_'),
(232, '6_27', 'b'),
(233, '6_28', 'a'),
(234, '6_29', 'a'),
(235, '6_30', 'b'),
(236, '6_31', '_'),
(237, '6_32', 'b'),
(238, '6_33', 'a'),
(239, '6_34', 'a'),
(240, '6_35', 'b'),
(241, '6_36', '_'),
(242, '6_37', 'b'),
(243, '6_38', 'a'),
(244, '6_39', 'a'),
(245, '6_40', 'b'),
(246, '6_41', 'a'),
(247, '7_1', '_'),
(248, '7_2', 'b'),
(249, '7_3', 'a'),
(250, '7_4', 'a'),
(251, '7_5', 'a'),
(252, '7_6', '_'),
(253, '7_7', 'b'),
(254, '7_8', 'a'),
(255, '7_9', 'a'),
(256, '7_10', 'b'),
(257, '7_11', '_'),
(258, '7_12', 'b'),
(259, '7_13', 'a'),
(260, '7_14', 'a'),
(261, '7_15', 'b'),
(262, '7_16', '_'),
(263, '7_17', 'b'),
(264, '7_18', 'a'),
(265, '7_19', 'a'),
(266, '7_20', 'b'),
(267, '7_21', '_'),
(268, '7_22', 'b'),
(269, '7_23', 'a'),
(270, '7_24', 'a'),
(271, '7_25', 'b'),
(272, '7_26', '_'),
(273, '7_27', 'b'),
(274, '7_28', 'a'),
(275, '7_29', 'a'),
(276, '7_30', 'b'),
(277, '7_31', '_'),
(278, '7_32', 'b'),
(279, '7_33', 'a'),
(280, '7_34', 'a'),
(281, '7_35', 'b'),
(282, '7_36', '_'),
(283, '7_37', 'b'),
(284, '7_38', 'a'),
(285, '7_39', 'a'),
(286, '7_40', 'b'),
(287, '7_41', 'a'),
(288, '8_1', 'a'),
(289, '8_2', '_'),
(290, '8_3', '_'),
(291, '8_4', '_'),
(292, '8_5', '_'),
(293, '8_6', 'a'),
(294, '8_7', 'a'),
(295, '8_8', '_'),
(296, '8_9', '_'),
(297, '8_10', '_'),
(298, '8_11', '_'),
(299, '8_12', 'a'),
(300, '8_13', 'a'),
(301, '8_14', '_'),
(302, '8_15', '_'),
(303, '8_16', '_'),
(304, '8_17', '_'),
(305, '8_18', 'a'),
(306, '8_19', 'a'),
(307, '8_20', '_'),
(308, '8_21', '_'),
(309, '8_22', '_'),
(310, '8_23', '_'),
(311, '8_24', 'a'),
(312, '8_25', 'a'),
(313, '8_26', '_'),
(314, '8_27', '_'),
(315, '8_28', '_'),
(316, '8_29', '_'),
(317, '8_30', 'a'),
(318, '8_31', 'a'),
(319, '8_32', '_'),
(320, '8_33', '_'),
(321, '8_34', '_'),
(322, '8_35', '_'),
(323, '8_36', 'a'),
(324, '8_37', 'a'),
(325, '8_38', '_'),
(326, '8_39', '_'),
(327, '8_40', '_'),
(328, '8_41', '_');
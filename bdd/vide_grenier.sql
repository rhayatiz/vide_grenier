-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 21 mai 2021 à 16:14
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vide_grenier`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_mailing_list` (IN `mail` VARCHAR(100))  BEGIN
	INSERT INTO mailing_list(MAIL_ML) VALUES (mail);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_mailing_list` (IN `mail` VARCHAR(100))  BEGIN
	DELETE FROM mailing_list WHERE MAIL_ML = mail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `mailing_list`
--

CREATE TABLE `mailing_list` (
  `ID_ML` int(11) NOT NULL,
  `MAIL_ML` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mailing_list`
--

INSERT INTO `mailing_list` (`ID_ML`, `MAIL_ML`) VALUES
(4, 'testTrigger@test.fr'),
(7, 'consectetuer.ipsum@laoreetipsum.net'),
(8, 'erat.vel@fermentumarcu.org'),
(9, 'imperdiet.ullamcorper.Duis@euismodest.ca'),
(10, 'mus.Proin.vel@tristiquepharetra.co.uk'),
(11, 'et.ultrices@interdumCurabitur.org'),
(12, 'interdum.Nunc@lectusjusto.co.uk'),
(13, 'cursus.et.eros@Sedcongueelit.edu'),
(14, 'vitae@luctusvulputatenisi.edu'),
(15, 'eget.venenatis@sit.org'),
(16, 'consectetuer@tortornibh.com'),
(17, 'nulla.Integer@justo.edu'),
(18, 'Nunc.pulvinar@augue.com'),
(19, 'placerat.Cras@tellusPhaselluselit.org'),
(20, 'erat.eget.tincidunt@molestiein.net'),
(21, 'diam.Sed@enimgravidasit.edu'),
(22, 'porttitor.eros@idmagnaet.org'),
(23, 'egestas@eu.com'),
(24, 'dictum@malesuadaaugueut.co.uk'),
(25, 'dictum.Phasellus.in@intempus.com'),
(26, 'tempus@turpis.edu'),
(27, 'non@sit.net'),
(28, 'non@semconsequatnec.org'),
(29, 'amet@facilisis.org'),
(30, 'risus@ipsumleo.edu'),
(31, 'in.magna.Phasellus@Nunc.org'),
(32, 'dui@semvitaealiquam.net'),
(33, 'ultrices.iaculis.odio@maurisInteger.com'),
(34, 'leo.in@lectus.co.uk'),
(35, 'dolor.sit@Suspendissealiquet.org'),
(36, 'Curabitur.vel.lectus@laciniamattisInteger.com'),
(37, 'metus@necmetusfacilisis.edu'),
(38, 'consectetuer@vitaemauris.net'),
(39, 'sem.egestas.blandit@parturient.org'),
(40, 'nec.urna@perconubianostra.com'),
(41, 'orci.Ut.sagittis@nunc.edu'),
(42, 'ut.cursus@elitNullafacilisi.co.uk'),
(43, 'faucibus.ut@mollisnon.co.uk'),
(44, 'Cum.sociis.natoque@Integer.co.uk'),
(45, 'est@risusNulla.com'),
(46, 'urna@arcu.com'),
(47, 'tincidunt@Pellentesquetincidunttempus.edu'),
(48, 'enim.consequat.purus@sem.com'),
(49, 'non@eleifendnunc.org'),
(50, 'Maecenas@consectetuereuismod.org'),
(51, 'felis.orci.adipiscing@vulputatemaurissagittis.edu'),
(52, 'mauris.a@mollis.org'),
(53, 'mi@utpharetrased.co.uk'),
(54, 'lobortis@tristiquesenectus.edu'),
(55, 'tincidunt@sit.org'),
(56, 'arcu@dapibusid.co.uk'),
(57, 'primis.in.faucibus@urnaconvalliserat.co.uk'),
(58, 'leo.Morbi.neque@metusIn.ca'),
(59, 'eu.nulla@turpis.co.uk'),
(60, 'et.ultrices@Aliquamrutrumlorem.net'),
(61, 'et@Sedneque.co.uk'),
(62, 'sem@turpis.net'),
(63, 'Ut@atlibero.com'),
(64, 'dictum@enim.com'),
(65, 'rutrum.non.hendrerit@sollicitudin.co.uk'),
(66, 'amet@sedtortorInteger.com'),
(67, 'netus.et@nonummyut.edu'),
(68, 'dapibus.quam.quis@elitfermentumrisus.co.uk'),
(69, 'vulputate.risus.a@ultrices.org'),
(70, 'eu.arcu.Morbi@orci.edu'),
(71, 'eu.enim@disparturient.co.uk'),
(72, 'eget.massa@ac.net'),
(73, 'Cras.dolor@eleifendegestasSed.ca'),
(74, 'nunc.interdum.feugiat@Quisqueimperdieterat.edu'),
(75, 'vitae.risus@Nullamenim.net'),
(76, 'Integer.aliquam.adipiscing@ornare.com'),
(77, 'ac.turpis@Donectempor.edu'),
(78, 'et.rutrum@massa.net'),
(79, 'Cras.lorem.lorem@ipsum.ca'),
(80, 'nec.leo@malesuada.co.uk'),
(81, 'neque@Nullaaliquet.com'),
(82, 'Mauris@dignissim.com'),
(83, 'sed.sem.egestas@antebibendumullamcorper.ca'),
(84, 'aliquet.molestie.tellus@urnajustofaucibus.com'),
(85, 'Nam.interdum.enim@inconsectetueripsum.net'),
(86, 'Nulla.tincidunt.neque@habitantmorbi.net'),
(87, 'Ut.tincidunt@dignissimpharetraNam.ca'),
(88, 'Duis@tinciduntorciquis.net'),
(89, 'elit.Etiam@NullainterdumCurabitur.co.uk'),
(90, 'neque.pellentesque@velit.com'),
(91, 'a.felis.ullamcorper@facilisisSuspendisse.edu'),
(92, 'nec.cursus@at.edu'),
(93, 'ultrices@maurisrhoncusid.edu'),
(94, 'Donec@anteNunc.edu'),
(95, 'eget.magna.Suspendisse@Vivamussit.com'),
(96, 'elit.Etiam@egetipsumSuspendisse.com'),
(97, 'elit.pellentesque@Duis.com'),
(98, 'mi.ac.mattis@dictum.co.uk'),
(99, 'in.magna@amet.co.uk'),
(100, 'nec@feugiatSed.co.uk'),
(101, 'Etiam.vestibulum.massa@VivamusnisiMauris.co.uk'),
(102, 'amet.orci@pede.ca'),
(103, 'sed.orci.lobortis@maurisSuspendissealiquet.com'),
(104, 'lacus.Cras@duinec.ca'),
(105, 'enim.Etiam@Duisdignissimtempor.ca'),
(106, 'non.lacinia.at@arcuSed.com'),
(107, 'miyazaki1@yopmail.com'),
(108, 'mlolap3@yopmail.com'),
(111, 'zakaria@mail.fr'),
(112, 'aa@gga.fr'),
(114, 'hello@a.f'),
(116, 'compte_test@mail.fr'),
(117, 'compte_test@mail.fr'),
(118, 'compte_test@mail.fr'),
(119, 'compte_test@mail.fr'),
(120, 'compte_test@mail.fr'),
(121, 'compte_test@mail.fr'),
(122, 'compte_test@mail.fr'),
(123, 'compte_test@mail.fr'),
(124, 'compte_test@mail.fr'),
(125, 'compte_test@mail.fr'),
(126, 'compte_test@mail.fr'),
(127, 'compte_test@mail.fr'),
(128, 'compte_test@mail.fr'),
(129, 'compte_test@mail.fr'),
(130, 'compte_test@mail.fr'),
(131, 'compte_test@mail.fr'),
(132, 'compte_test@mail.fr'),
(133, 'compte_test@mail.fr'),
(134, 'compte_test@mail.fr'),
(135, 'compte_test@mail.fr'),
(136, 'compte_test@mail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `reservation_vg`
--

CREATE TABLE `reservation_vg` (
  `ID_RESA` int(11) NOT NULL,
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

--
-- Déchargement des données de la table `reservation_vg`
--

INSERT INTO `reservation_vg` (`ID_RESA`, `ID_VG`, `ID_UTIL`, `NOM_RESA`, `PRENOM_RESA`, `MAIL_RESA`, `ADDRESSE_RESA`, `CODE_POSTAL_RESA`, `VILLE_RESA`, `PORTABLE_RESA`, `CNI_RESA`, `DELIVRE_CNI_RESA`, `PAR_CNI_RESA`, `IMMATRICULATION_RESA`, `NBR_RESA`, `INFO_RESA`, `STATU_RESA`) VALUES
(2, 2, 2, 'mom', 'non', 'adresse@mail.fr', '123 avenue exemple', '12333', 'Lyon', '0123456789', 'ZAEP1EK1E3O1', '12/12/1990', 'Lyon', '123 AB 11', 6, NULL, 2),
(3, 3, 2, 'nom', 'prenom', 'a@b.da', '23232', '69123', 'Saint', '0123456789', '31209312P', '01/01/2000', 'lyon', '123 AB 12', 1, NULL, 3),
(4, 2, 2, 'nom', 'prenom', 'aa@ee.fr', '4 aa', '6900', 'sa', '0123456789', 'aaa123a46', '01/01/2000', 'rhone', 'aa-222-ac', 2, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `statuts`
--

CREATE TABLE `statuts` (
  `ID_STATUTS` int(11) NOT NULL,
  `LABEL_STATUTS` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statuts`
--

INSERT INTO `statuts` (`ID_STATUTS`, `LABEL_STATUTS`) VALUES
(1, 'En attente'),
(2, 'Validée'),
(3, 'Refusée');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_UTIL` int(11) NOT NULL,
  `MAIL_UTIL` varchar(50) NOT NULL,
  `MDP_UTIL` varchar(30) NOT NULL,
  `NOM_UTIL` varchar(50) DEFAULT NULL,
  `PRENOM_UTIL` varchar(50) DEFAULT NULL,
  `TEL_UTIL` varchar(15) DEFAULT NULL,
  `DESC_UTIL` varchar(280) DEFAULT NULL,
  `ADMIN_UTIL` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTIL`, `MAIL_UTIL`, `MDP_UTIL`, `NOM_UTIL`, `PRENOM_UTIL`, `TEL_UTIL`, `DESC_UTIL`, `ADMIN_UTIL`) VALUES
(2, 'adresse@mail.fr', 'aaaaaa', 'Dupiont', 'Rogere', '0222222222', 'dazdazdaz', NULL),
(6, 'admin@admin.fr', 'xxxxxx', 'Admin', 'Alvin', NULL, 'Admin du site', 1),
(7, 'dee@dee.com', 'eeeeee', 'Ben', 'Roger', NULL, 'Une description', NULL),
(10, 'testTrigger@test.fr', 'eeeeee', NULL, NULL, NULL, NULL, NULL),
(11, 'ozzaxazxujz@azxoj.fr', 'vvvvvv', NULL, NULL, NULL, NULL, NULL),
(12, 'riku@chat.fr', 'chatpo', 'Riku', NULL, '0222222222', NULL, 1),
(13, 'consectetuer.ipsum@laoreetipsum.net', 'turpis.', 'Wolf', 'Kato', '0274604684', 'ante. Maecenas mi felis, adipiscing fringilla, porttitor', NULL),
(14, 'erat.vel@fermentumarcu.org', 'eu', 'Kirk', 'Elijah', '0357637435', 'neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec', NULL),
(15, 'imperdiet.ullamcorper.Duis@euismodest.ca', 'aliquet', 'Moore', 'Travis', '0593947317', 'fermentum vel, mauris. Integer sem elit, pharetra ut,', NULL),
(16, 'mus.Proin.vel@tristiquepharetra.co.uk', 'Mauris', 'Camacho', 'Ryan', '0655423569', 'enim commodo hendrerit. Donec porttitor', NULL),
(17, 'et.ultrices@interdumCurabitur.org', 'lacus', 'Gregory', 'Illiana', '0894925417', 'sollicitudin a, malesuada id, erat. Etiam', NULL),
(18, 'interdum.Nunc@lectusjusto.co.uk', 'odio.', 'David', 'Chelsea', '0169555241', 'eget nisi dictum augue malesuada malesuada.', NULL),
(19, 'cursus.et.eros@Sedcongueelit.edu', 'elit.', 'Cantrell', 'Lucy', '0196586932', 'eleifend nec, malesuada ut, sem. Nulla', NULL),
(20, 'vitae@luctusvulputatenisi.edu', 'imperdiet', 'Orr', 'Dara', '0177939115', 'ligula. Nullam enim. Sed nulla ante,', NULL),
(21, 'eget.venenatis@sit.org', 'amet', 'Becker', 'Lila', '0249147371', 'nascetur ridiculus mus. Proin vel nisl. Quisque fringilla', NULL),
(22, 'consectetuer@tortornibh.com', 'lorem', 'Giles', 'Howard', '0704483664', 'aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a,', NULL),
(23, 'nulla.Integer@justo.edu', 'vitae', 'Campos', 'Hammett', '0310766555', 'urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', NULL),
(24, 'Nunc.pulvinar@augue.com', 'sem', 'Cotton', 'Rafael', '0235108793', 'id nunc interdum feugiat. Sed nec metus facilisis lorem tristique', NULL),
(25, 'placerat.Cras@tellusPhaselluselit.org', 'Nulla', 'Finch', 'Jayme', '0242033877', 'sem, consequat nec, mollis vitae, posuere at, velit.', NULL),
(26, 'erat.eget.tincidunt@molestiein.net', 'diam.', 'Wooten', 'Jonas', '0689753177', 'risus. Nunc ac sem ut dolor dapibus gravida. Aliquam', NULL),
(27, 'diam.Sed@enimgravidasit.edu', 'eros', 'Sykes', 'Yasir', '0715437560', 'eu nibh vulputate mauris sagittis placerat.', NULL),
(28, 'porttitor.eros@idmagnaet.org', 'enim.', 'Mckee', 'Eden', '0971821933', 'enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris', NULL),
(29, 'egestas@eu.com', 'Donec', 'Lara', 'Zia', '0506930965', 'Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.', NULL),
(30, 'dictum@malesuadaaugueut.co.uk', 'cursus', 'Berry', 'Dale', '0745314567', 'egestas rhoncus. Proin nisl sem, consequat', NULL),
(31, 'dictum.Phasellus.in@intempus.com', 'non,', 'Haynes', 'Allegra', '0147073442', 'Aenean sed pede nec ante blandit viverra. Donec', NULL),
(32, 'tempus@turpis.edu', 'in', 'Lowe', 'Seth', '0765878698', 'erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh.', NULL),
(33, 'non@sit.net', 'magna', 'Cox', 'Laith', '0475639313', 'hendrerit consectetuer, cursus et, magna. Praesent interdum ligula', NULL),
(34, 'non@semconsequatnec.org', 'sem,', 'Dejesus', 'Ryan', '0461938734', 'Cras convallis convallis dolor. Quisque tincidunt pede', NULL),
(35, 'amet@facilisis.org', 'quis,', 'Hammond', 'Carlos', '0280016180', 'fringilla. Donec feugiat metus sit amet ante. Vivamus', NULL),
(36, 'risus@ipsumleo.edu', 'orci,', 'Robinson', 'Upton', '0383621525', 'neque. Nullam ut nisi a odio semper cursus. Integer mollis.', NULL),
(37, 'in.magna.Phasellus@Nunc.org', 'mauris,', 'Alvarez', 'Roth', '0985909665', 'velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,', NULL),
(38, 'dui@semvitaealiquam.net', 'pede', 'Merritt', 'Kay', '0536939596', 'In condimentum. Donec at arcu. Vestibulum ante ipsum', NULL),
(39, 'ultrices.iaculis.odio@maurisInteger.com', 'urna.', 'Poole', 'Jerome', '0899457480', 'Sed id risus quis diam luctus', NULL),
(40, 'leo.in@lectus.co.uk', 'ornare', 'Rodriquez', 'Violet', '0794532368', 'tempor lorem, eget mollis lectus pede et risus. Quisque', NULL),
(41, 'dolor.sit@Suspendissealiquet.org', 'magna.', 'Dixon', 'David', '0632004742', 'Morbi quis urna. Nunc quis arcu vel quam dignissim', NULL),
(42, 'Curabitur.vel.lectus@laciniamattisInteger.com', 'facilisis', 'Conley', 'Nyssa', '0301370121', 'eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus', NULL),
(43, 'metus@necmetusfacilisis.edu', 'ipsum', 'Farmer', 'Shaine', '0195002417', 'lobortis ultrices. Vivamus rhoncus. Donec est.', NULL),
(44, 'consectetuer@vitaemauris.net', 'Duis', 'Terry', 'Jacob', '0194767240', 'malesuada vel, convallis in, cursus et, eros.', NULL),
(45, 'sem.egestas.blandit@parturient.org', 'odio.', 'Mcclure', 'Gavin', '0272776150', 'aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla', NULL),
(46, 'nec.urna@perconubianostra.com', 'sed,', 'Fox', 'Christine', '0323824468', 'interdum feugiat. Sed nec metus facilisis lorem', NULL),
(47, 'orci.Ut.sagittis@nunc.edu', 'arcu.', 'Logan', 'Nasim', '0100711044', 'augue, eu tempor erat neque non quam. Pellentesque habitant', NULL),
(48, 'ut.cursus@elitNullafacilisi.co.uk', 'semper', 'Koch', 'Graiden', '0514495123', 'aliquet diam. Sed diam lorem,', NULL),
(49, 'faucibus.ut@mollisnon.co.uk', 'at', 'Dillon', 'Marcia', '0716019232', 'Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat', NULL),
(50, 'Cum.sociis.natoque@Integer.co.uk', 'orci.', 'Greene', 'Uriah', '0786462272', 'nec, leo. Morbi neque tellus, imperdiet non,', NULL),
(51, 'est@risusNulla.com', 'pede', 'Berry', 'Yardley', '0986403700', 'arcu. Vivamus sit amet risus. Donec egestas. Aliquam', NULL),
(52, 'urna@arcu.com', 'Aliquam', 'Bowers', 'Warren', '0328178389', 'eget magna. Suspendisse tristique neque venenatis', NULL),
(53, 'tincidunt@Pellentesquetincidunttempus.edu', 'mauris', 'Clemons', 'Blossom', '0883367285', 'Aliquam erat volutpat. Nulla facilisis.', NULL),
(54, 'enim.consequat.purus@sem.com', 'varius', 'Collins', 'Victor', '0509157161', 'Donec fringilla. Donec feugiat metus sit amet ante.', NULL),
(55, 'non@eleifendnunc.org', 'vel,', 'Steele', 'Nicholas', '0715339715', 'Aenean egestas hendrerit neque. In ornare', NULL),
(56, 'Maecenas@consectetuereuismod.org', 'a', 'Day', 'Justina', '0831696384', 'Curabitur vel lectus. Cum sociis natoque penatibus et magnis', NULL),
(57, 'felis.orci.adipiscing@vulputatemaurissagittis.edu', 'augue.', 'Gaines', 'Tanner', '0206087432', 'Mauris blandit enim consequat purus. Maecenas libero est,', NULL),
(58, 'mauris.a@mollis.org', 'Nam', 'Browning', 'Patience', '0104348284', 'diam. Pellentesque habitant morbi tristique', NULL),
(59, 'mi@utpharetrased.co.uk', 'eget', 'Dunn', 'Mariam', '0718741325', 'in consequat enim diam vel arcu. Curabitur ut odio vel', NULL),
(60, 'lobortis@tristiquesenectus.edu', 'magna', 'Clark', 'Alana', '0344893611', 'ornare. In faucibus. Morbi vehicula. Pellentesque', NULL),
(61, 'tincidunt@sit.org', 'Fusce', 'Jensen', 'Jordan', '0268177284', 'nec urna et arcu imperdiet ullamcorper.', NULL),
(62, 'arcu@dapibusid.co.uk', 'odio', 'Brady', 'Erasmus', '0468765404', 'lorem eu metus. In lorem. Donec elementum, lorem ut', NULL),
(63, 'primis.in.faucibus@urnaconvalliserat.co.uk', 'quam', 'Marquez', 'Tanek', '0284800677', 'at, iaculis quis, pede. Praesent eu dui.', NULL),
(64, 'leo.Morbi.neque@metusIn.ca', 'erat.', 'Francis', 'Preston', '0903866307', 'Aenean eget metus. In nec orci. Donec nibh.', NULL),
(65, 'eu.nulla@turpis.co.uk', 'purus', 'Harrington', 'Abdul', '0578544618', 'iaculis quis, pede. Praesent eu dui. Cum sociis', NULL),
(66, 'et.ultrices@Aliquamrutrumlorem.net', 'magna', 'Dillard', 'Kylie', '0325005735', 'diam. Pellentesque habitant morbi tristique', NULL),
(67, 'et@Sedneque.co.uk', 'at,', 'Mejia', 'Hunter', '0137511008', 'aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,', NULL),
(68, 'sem@turpis.net', 'mi', 'Goodman', 'Tad', '0718414386', 'mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In', NULL),
(69, 'Ut@atlibero.com', 'mauris,', 'Trujillo', 'Shay', '0154935281', 'sed dui. Fusce aliquam, enim nec tempus scelerisque,', NULL),
(70, 'dictum@enim.com', 'amet,', 'Hawkins', 'Xander', '0563215524', 'nunc id enim. Curabitur massa. Vestibulum accumsan neque', NULL),
(71, 'rutrum.non.hendrerit@sollicitudin.co.uk', 'vel,', 'Key', 'Forrest', '0996452249', 'erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat', NULL),
(72, 'amet@sedtortorInteger.com', 'montes,', 'Johns', 'Claire', '0769818415', 'eu augue porttitor interdum. Sed', NULL),
(73, 'netus.et@nonummyut.edu', 'molestie.', 'Larson', 'Renee', '0620901032', 'dictum. Proin eget odio. Aliquam vulputate', NULL),
(74, 'dapibus.quam.quis@elitfermentumrisus.co.uk', 'laoreet', 'Franklin', 'Ariel', '0539787541', 'vehicula aliquet libero. Integer in magna. Phasellus', NULL),
(75, 'vulputate.risus.a@ultrices.org', 'quam', 'Rodriquez', 'Eleanor', '0473880870', 'Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue', NULL),
(76, 'eu.arcu.Morbi@orci.edu', 'ipsum', 'Mitchell', 'Kaitlin', '0626212461', 'ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere', NULL),
(77, 'eu.enim@disparturient.co.uk', 'vitae', 'Ortega', 'Plato', '0276873859', 'nec luctus felis purus ac tellus. Suspendisse sed dolor.', NULL),
(78, 'eget.massa@ac.net', 'dui', 'Tillman', 'Tiger', '0277555963', 'magna tellus faucibus leo, in lobortis', NULL),
(79, 'Cras.dolor@eleifendegestasSed.ca', 'tellus', 'Copeland', 'Jordan', '0373223576', 'arcu vel quam dignissim pharetra. Nam', NULL),
(80, 'nunc.interdum.feugiat@Quisqueimperdieterat.edu', 'malesuada.', 'Curry', 'Lamar', '0474671726', 'nec, euismod in, dolor. Fusce feugiat. Lorem', NULL),
(81, 'vitae.risus@Nullamenim.net', 'lorem', 'Petty', 'Elmo', '0648424142', 'ante dictum mi, ac mattis velit justo', NULL),
(82, 'Integer.aliquam.adipiscing@ornare.com', 'dictum', 'Fitzpatrick', 'Maxwell', '0606182565', 'aliquet, sem ut cursus luctus, ipsum leo elementum', NULL),
(83, 'ac.turpis@Donectempor.edu', 'interdum', 'Reyes', 'Rhoda', '0728068015', 'lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam', NULL),
(84, 'et.rutrum@massa.net', 'risus.', 'Holden', 'Tashya', '0707859535', 'nec, cursus a, enim. Suspendisse aliquet, sem ut', NULL),
(85, 'Cras.lorem.lorem@ipsum.ca', 'Sed', 'Gilliam', 'Grace', '0658051481', 'imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at', NULL),
(86, 'nec.leo@malesuada.co.uk', 'Fusce', 'Mcpherson', 'Shannon', '0249149452', 'odio. Aliquam vulputate ullamcorper magna. Sed eu', NULL),
(87, 'neque@Nullaaliquet.com', 'magna.', 'Cain', 'Lester', '0488022611', 'Duis dignissim tempor arcu. Vestibulum', NULL),
(88, 'Mauris@dignissim.com', 'quam', 'Chapman', 'Cain', '0246731224', 'non, cursus non, egestas a, dui. Cras pellentesque.', NULL),
(89, 'sed.sem.egestas@antebibendumullamcorper.ca', 'ipsum', 'Emerson', 'Kerry', '0531514682', 'eget varius ultrices, mauris ipsum porta elit, a', NULL),
(90, 'aliquet.molestie.tellus@urnajustofaucibus.com', 'mauris', 'Parsons', 'Phelan', '0907178111', 'nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut', NULL),
(91, 'Nam.interdum.enim@inconsectetueripsum.net', 'amet', 'Hartman', 'Kitra', '0585017880', 'interdum enim non nisi. Aenean eget metus. In nec orci.', NULL),
(92, 'Nulla.tincidunt.neque@habitantmorbi.net', 'tristique', 'Hardin', 'Clio', '0673132301', 'netus et malesuada fames ac turpis', NULL),
(93, 'Ut.tincidunt@dignissimpharetraNam.ca', 'Nulla', 'Wilkerson', 'Myra', '0463263000', 'a tortor. Nunc commodo auctor velit. Aliquam', NULL),
(94, 'Duis@tinciduntorciquis.net', 'ultricies', 'Hutchinson', 'Rafael', '0574655918', 'nulla magna, malesuada vel, convallis in, cursus et,', NULL),
(95, 'elit.Etiam@NullainterdumCurabitur.co.uk', 'rhoncus.', 'Logan', 'Neve', '0254282323', 'tempor diam dictum sapien. Aenean', NULL),
(96, 'neque.pellentesque@velit.com', 'convallis', 'Moon', 'Ifeoma', '0715515929', 'tellus. Phasellus elit pede, malesuada vel, venenatis vel,', NULL),
(97, 'a.felis.ullamcorper@facilisisSuspendisse.edu', 'est.', 'Short', 'Ignacia', '0630798185', 'interdum enim non nisi. Aenean eget', NULL),
(98, 'nec.cursus@at.edu', 'vel', 'Frank', 'Miriam', '0757085076', 'dui. Fusce aliquam, enim nec tempus scelerisque,', NULL),
(99, 'ultrices@maurisrhoncusid.edu', 'Aliquam', 'Keith', 'Jolie', '0310347261', 'Maecenas mi felis, adipiscing fringilla, porttitor', NULL),
(100, 'Donec@anteNunc.edu', 'quis,', 'Wilcox', 'Skyler', '0526776811', 'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac', NULL),
(101, 'eget.magna.Suspendisse@Vivamussit.com', 'aptent', 'Horne', 'Idona', '0950942527', 'molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras', NULL),
(102, 'elit.Etiam@egetipsumSuspendisse.com', 'orci,', 'Odom', 'Madeson', '0718073107', 'nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit', NULL),
(103, 'elit.pellentesque@Duis.com', 'sit', 'Mcclain', 'Jordan', '0520249294', 'elit. Nulla facilisi. Sed neque. Sed eget lacus.', NULL),
(104, 'mi.ac.mattis@dictum.co.uk', 'augue', 'Berry', 'Yvonne', '0246281381', 'vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet', NULL),
(105, 'in.magna@amet.co.uk', 'eget', 'Bass', 'Jordan', '0778346326', 'ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,', NULL),
(106, 'nec@feugiatSed.co.uk', 'nec', 'Sexton', 'Rudyard', '0435641697', 'mollis vitae, posuere at, velit. Cras lorem', NULL),
(107, 'Etiam.vestibulum.massa@VivamusnisiMauris.co.uk', 'sed', 'Jimenez', 'Rudyard', '0504686357', 'odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis', NULL),
(108, 'amet.orci@pede.ca', 'libero.', 'Price', 'Alec', '0929075161', 'ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,', NULL),
(109, 'sed.orci.lobortis@maurisSuspendissealiquet.com', 'convallis', 'Rowland', 'Kylie', '0396375414', 'aliquet molestie tellus. Aenean egestas hendrerit', NULL),
(110, 'lacus.Cras@duinec.ca', 'vitae', 'Mcfarland', 'May', '0265682613', 'Duis cursus, diam at pretium aliquet,', NULL),
(111, 'enim.Etiam@Duisdignissimtempor.ca', 'sed', 'Dotson', 'Keefe', '0258133673', 'ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi', NULL),
(112, 'non.lacinia.at@arcuSed.com', 'Sed', 'Powell', 'Adena', '0504628589', 'Sed congue, elit sed consequat auctor, nunc', NULL),
(113, 'miyazaki1@yopmail.com', '123+aze', 'zaj', 'Jean', '0392313222', NULL, NULL),
(114, 'mlolap3@yopmail.com', '123+aze', 'dumpont', 'jmean', '0231328189', 'nn', NULL),
(115, 'zakaria@mail.fr', '123+aze', 'rh', 'zakaria', '0123456789', 'non', NULL);

--
-- Déclencheurs `utilisateur`
--
DELIMITER $$
CREATE TRIGGER `inscription_mailing_auto` AFTER INSERT ON `utilisateur` FOR EACH ROW BEGIN
    
  
	INSERT INTO mailing_list (MAIL_ML) VALUE(NEW.MAIL_UTIL);
    
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `videgrenier`
--

CREATE TABLE `videgrenier` (
  `ID_VG` int(11) NOT NULL,
  `LABEL_VG` varchar(50) DEFAULT NULL,
  `DATE_VG` varchar(11) DEFAULT NULL,
  `HEURE_VG` varchar(15) NOT NULL,
  `ADDRESSE_VG` varchar(100) NOT NULL,
  `NBR_EMPLACEMENTS` int(11) DEFAULT NULL,
  `NBR_RESTANT_VG` int(11) NOT NULL,
  `PRIX_EMPLACEMENTS` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `videgrenier`
--

INSERT INTO `videgrenier` (`ID_VG`, `LABEL_VG`, `DATE_VG`, `HEURE_VG`, `ADDRESSE_VG`, `NBR_EMPLACEMENTS`, `NBR_RESTANT_VG`, `PRIX_EMPLACEMENTS`) VALUES
(2, 'Vide-grenier annuel 2016', '03/07/2016', 'de 6h à 16h', 'Esplanade de la Gravière, Avenue De Limburg., Sainte-foy-lès-lyon 69110', 100, 59, '20'),
(3, 'Test vide-grenier par Admin', '10/02/9999', 'de 4h à 23h', 'Un exemple random, 44444 Ville', 102, 95, '300'),
(5, 'Vide grenier printemps', '01/04/2021', 'de 08h à 16h', '52 Place des reines, 69004 Lyon', 200, 0, '35');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mailing_list`
--
ALTER TABLE `mailing_list`
  ADD PRIMARY KEY (`ID_ML`);

--
-- Index pour la table `reservation_vg`
--
ALTER TABLE `reservation_vg`
  ADD PRIMARY KEY (`ID_RESA`);

--
-- Index pour la table `statuts`
--
ALTER TABLE `statuts`
  ADD PRIMARY KEY (`ID_STATUTS`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_UTIL`);

--
-- Index pour la table `videgrenier`
--
ALTER TABLE `videgrenier`
  ADD PRIMARY KEY (`ID_VG`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mailing_list`
--
ALTER TABLE `mailing_list`
  MODIFY `ID_ML` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT pour la table `reservation_vg`
--
ALTER TABLE `reservation_vg`
  MODIFY `ID_RESA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `statuts`
--
ALTER TABLE `statuts`
  MODIFY `ID_STATUTS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_UTIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT pour la table `videgrenier`
--
ALTER TABLE `videgrenier`
  MODIFY `ID_VG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

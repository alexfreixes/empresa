-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 27-06-2022 a las 00:27:54
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `VideoWalls`
--
CREATE DATABASE IF NOT EXISTS `VideoWalls` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `VideoWalls`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Botigues`
--

CREATE TABLE `Botigues` (
  `id` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `nomComercial` varchar(100) NOT NULL,
  `adreça` varchar(100) NOT NULL,
  `poblacio` varchar(100) NOT NULL,
  `cp` int(11) NOT NULL,
  `idComunitat` int(11) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `tel1` varchar(100) NOT NULL,
  `tel2` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Botigues`
--

INSERT INTO `Botigues` (`id`, `idClient`, `nomComercial`, `adreça`, `poblacio`, `cp`, `idComunitat`, `pais`, `tel1`, `tel2`, `email`) VALUES
(1, 1, 'Botiga1', 'AdreçaBotiga1', 'PoblacioBotiga1', 8222, 1, 'Espanya', '937885133', '638233590', 'alfrar@jviladoms.cat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clients`
--

CREATE TABLE `Clients` (
  `id` int(5) NOT NULL,
  `nomFiscal` varchar(200) NOT NULL,
  `tel1` varchar(200) DEFAULT NULL,
  `tel2` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Clients`
--

INSERT INTO `Clients` (`id`, `nomFiscal`, `tel1`, `tel2`, `email`) VALUES
(1, 'General', NULL, NULL, NULL),
(2, 'Terrass.D\'inform.i Serveis,SLU', NULL, NULL, NULL),
(146, 'Sensus España, S.A', NULL, NULL, NULL),
(152, 'S.A. Rubí Industrial', NULL, NULL, NULL),
(306, 'Técnica Química del Aerosol SL', NULL, NULL, NULL),
(321, 'Redsun System, SL', NULL, NULL, NULL),
(378, 'García Jane, S.A.', NULL, NULL, NULL),
(403, 'Piscinas Bonaigua, S.L.', NULL, NULL, NULL),
(464, 'Dotest, S.L.', NULL, NULL, NULL),
(530, 'Comercial Lampistera, S.L.', NULL, NULL, NULL),
(555, 'Elect SIS 4 S.L.', NULL, NULL, NULL),
(558, 'Vitrotec, S.L.U', NULL, NULL, NULL),
(569, 'Mecter, S.L.', NULL, NULL, NULL),
(612, 'Centre de Gestió Edoges, S.L.', NULL, NULL, NULL),
(618, 'Instal. y Reformas Symat, SL', NULL, NULL, NULL),
(653, 'Riscalla Terrassa, S.L.', NULL, NULL, NULL),
(762, 'Terrassenca d\'inversions,S.L.U', NULL, NULL, NULL),
(782, 'Carlos Triviño Zurita', NULL, NULL, NULL),
(783, 'WOODMARFI, SL.', NULL, NULL, NULL),
(807, 'Joycaplast, SL', NULL, NULL, NULL),
(817, 'SON 4 DISEÑO Y MODA, SL', NULL, NULL, NULL),
(821, 'Juan Triviño Zurita', NULL, NULL, NULL),
(822, 'Bestseller Wholesale Spain SLU', NULL, NULL, NULL),
(834, 'Matías Javier Balsells Huguet', NULL, NULL, NULL),
(836, 'SEVEN YOU S.L.', NULL, NULL, NULL),
(842, 'Anna Sais Tomàs', NULL, NULL, NULL),
(852, 'Urbanita Casual, S.L.', NULL, NULL, NULL),
(856, 'Mª Rosalía Larumbe Pérez', NULL, NULL, NULL),
(862, 'Narcis Peraferrer Palau', NULL, NULL, NULL),
(864, 'Llufriu i Pons, S.L.', NULL, NULL, NULL),
(867, 'Mendicoa C.B.', NULL, NULL, NULL),
(873, 'Sergio Rodríguez Roldán', NULL, NULL, NULL),
(878, 'Pere Hidalgo Linares', NULL, NULL, NULL),
(897, 'Unipreus, S.L.', NULL, NULL, NULL),
(901, 'Narciso Agudo Rodriguez', NULL, NULL, NULL),
(903, 'Maimar 21, SL', NULL, NULL, NULL),
(907, 'Dressing Balaguer, S.L.', NULL, NULL, NULL),
(920, 'Boutique Europa, C.B.', NULL, NULL, NULL),
(922, 'Perpiel 2010, S.L.', NULL, NULL, NULL),
(923, 'Canal Detall, S.L.', NULL, NULL, NULL),
(933, 'Egarmasa Subministraments, SL', NULL, NULL, NULL),
(935, 'Immaculada Morató Montserrat', NULL, NULL, NULL),
(938, 'Ana Maria Cazorla Galindo', NULL, NULL, NULL),
(940, 'Patricia Gil Quirce', NULL, NULL, NULL),
(943, 'Dueñas Soler, S.L.', NULL, NULL, NULL),
(946, 'Moda Picatex, S.L.', NULL, NULL, NULL),
(949, 'Motif Moda, S.L.', NULL, NULL, NULL),
(950, 'Amaia Sertucha Montalbo', NULL, NULL, NULL),
(951, 'Carme Queralt, SL', NULL, NULL, NULL),
(952, 'Vanessa Orensanz Campo', NULL, NULL, NULL),
(955, 'Combas Retail, S.L.', NULL, NULL, NULL),
(958, 'Fashion Big Team, S.L.', NULL, NULL, NULL),
(967, 'Almacenes Hermanos Avila, S.L.', NULL, NULL, NULL),
(978, 'Maria Del Mar Feal Reborido', NULL, NULL, NULL),
(994, 'J. Y S. Sauquet, S.A.', NULL, NULL, NULL),
(998, 'Jorge Sáenz de Zaitigui', NULL, NULL, NULL),
(1000, 'Amit Aidasani Aidasani', NULL, NULL, NULL),
(1005, 'Kargoshop, C.B.', NULL, NULL, NULL),
(1006, 'Sitacosmos, S.L.', NULL, NULL, NULL),
(1007, 'Camiseria Roma, S.L.', NULL, NULL, NULL),
(1008, 'Joan Josep Guiteras i Codina', NULL, NULL, NULL),
(1018, 'Pankhaj Aidasani Khyami', NULL, NULL, NULL),
(1022, 'Mònica Gonzalez Anillo', NULL, NULL, NULL),
(1024, 'Dakota Jeans, S.C.P.', NULL, NULL, NULL),
(1025, 'Positivo Fashion Wear, S.L.', NULL, NULL, NULL),
(1030, 'Maite Soldevila Bolivar', NULL, NULL, NULL),
(1032, 'Cristina Perxes Moner', NULL, NULL, NULL),
(1040, 'Naturnostra, S.L.', NULL, NULL, NULL),
(1044, 'Iria Castro Carballa', NULL, NULL, NULL),
(1046, 'Mirage Vision, S.L.', NULL, NULL, NULL),
(1047, 'Centro Cial. Plaza Elíptica,SL', NULL, NULL, NULL),
(1049, 'Tiendas Matmar, S.L.', NULL, NULL, NULL),
(1054, 'Puntalakashmi, SL', NULL, NULL, NULL),
(1057, 'Rosa Sahun Arroyos', NULL, NULL, NULL),
(1058, 'Jose Ignacio Alonso Valeta', NULL, NULL, NULL),
(1063, 'Aidasani, S.L.', NULL, NULL, NULL),
(1065, 'Grupo Romar Benidorm, S.L.', NULL, NULL, NULL),
(1070, 'Julio y Teresa Moda, S.L.', NULL, NULL, NULL),
(1073, 'Port Simteck, S.L.', NULL, NULL, NULL),
(1079, 'Lana Clothes, S.L.', NULL, NULL, NULL),
(1080, 'Cristina Guerrero González', NULL, NULL, NULL),
(1083, 'Plavisual, SLU', NULL, NULL, NULL),
(1086, 'Marta Balsells Cabestany', NULL, NULL, NULL),
(1089, 'Costasol de Hipermercados, SL', NULL, NULL, NULL),
(1094, 'Pilar Barber Torres', NULL, NULL, NULL),
(1097, 'Indogo, S.L.', NULL, NULL, NULL),
(1101, 'Administracion Tesamon, S.L.', NULL, NULL, NULL),
(1106, 'One Thousand Jeans, SL', NULL, NULL, NULL),
(1108, 'Empordà Grup Pizzeries, SL', NULL, NULL, NULL),
(1111, 'Consuelo Galeote Agudo', NULL, NULL, NULL),
(1113, 'José Gámez Blesa', NULL, NULL, NULL),
(1125, 'María García Cincunegui', NULL, NULL, NULL),
(1127, 'The House Village, SCP', NULL, NULL, NULL),
(1132, 'Juan Antonio Salcedo Lopez', NULL, NULL, NULL),
(1133, 'Blackma Project, SL', NULL, NULL, NULL),
(1135, 'Cristina Susunaga Calixto', NULL, NULL, NULL),
(1136, 'Aima AS, SLU', NULL, NULL, NULL),
(1138, 'Sinter XXI, SL', NULL, NULL, NULL),
(1141, 'Caché Shop, SL', NULL, NULL, NULL),
(1147, 'Grupo Primos Sak, SL', NULL, NULL, NULL),
(1151, 'Raquel Rakhi Mahtani Santana', NULL, NULL, NULL),
(1153, 'Celebrating U Vol 1, SL', NULL, NULL, NULL),
(1154, 'Gotic Pell, SL', NULL, NULL, NULL),
(1155, 'M2L2000 Invest, SL', NULL, NULL, NULL),
(1157, 'Montserrat Esteva Planell', NULL, NULL, NULL),
(1158, 'Azulik 18, SL', NULL, NULL, NULL),
(1164, 'Sociedad de Comercio Satex, SL', NULL, NULL, NULL),
(1167, 'Jorge Agramunt Monfort', NULL, NULL, NULL),
(1168, 'Embalajes JME Terrassa, SL', NULL, NULL, NULL),
(1169, 'M Dolores Serna Parra', NULL, NULL, NULL),
(1170, 'Rean, SA', NULL, NULL, NULL),
(1171, 'Erika Sepúlveda Peregrina', NULL, NULL, NULL),
(1173, 'Barcelona Positivo 2016, SL', NULL, NULL, NULL),
(1175, 'Teens Invaders, SLU', NULL, NULL, NULL),
(1176, 'José Miguel Mullor', NULL, NULL, NULL),
(1177, 'Carlotta Iberia SL', NULL, NULL, NULL),
(1178, 'Grupo Corinpa, SL', NULL, NULL, NULL),
(1179, 'David Cobo Gámiz', NULL, NULL, NULL),
(1180, 'NCC 1701, SL', NULL, NULL, NULL),
(1181, '4LC SPORTS, SL', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comunitat`
--

CREATE TABLE `Comunitat` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Comunitat`
--

INSERT INTO `Comunitat` (`id`, `descripcio`) VALUES
(1, 'Comunitat1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contingut`
--

CREATE TABLE `Contingut` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Contingut`
--

INSERT INTO `Contingut` (`id`, `descripcio`, `url`) VALUES
(1, 'contingut1', 'url1'),
(2, 'contingut2', 'url2'),
(3, 'contingut3', 'url3'),
(4, 'sabater', 'sabater'),
(5, 'O Temporada1 V3x1', 'O Temporada1 V3x1'),
(6, 'O Temporada1 H2x3', 'O Temporada1 H2x3'),
(7, 'O Temporada1 H3x1', 'O Temporada1 H3x1'),
(8, 'EL IMPERIO CONTRAATACA XXXXII', 'EL IMPERIO CONTRAATACA XXXXII'),
(9, 'A. FREIXAS EL RETORNO', 'A. FREIXAS EL RETORNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Contractes`
--

CREATE TABLE `Contractes` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL,
  `dataAcceptacio` datetime NOT NULL,
  `dataIniciCicle` datetime DEFAULT NULL,
  `dataFinalCicle` datetime DEFAULT NULL,
  `renovacions` int(11) DEFAULT NULL,
  `dataFiContracte` datetime DEFAULT NULL,
  `observacions` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Contractes`
--

INSERT INTO `Contractes` (`id`, `descripcio`, `dataAcceptacio`, `dataIniciCicle`, `dataFinalCicle`, `renovacions`, `dataFiContracte`, `observacions`) VALUES
(1, 'Contracte1', '2022-02-21 11:15:30', '2022-02-21 11:15:30', '2022-02-21 11:15:30', NULL, '2022-02-21 11:15:30', 'ObservacioContracte1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dispositiu`
--

CREATE TABLE `Dispositiu` (
  `id` int(11) NOT NULL,
  `NSVW` varchar(20) DEFAULT NULL,
  `nom` varchar(25) NOT NULL,
  `MAC` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `numSerie` varchar(20) NOT NULL,
  `url` varchar(20) NOT NULL,
  `firmware` varchar(20) NOT NULL,
  `prgClient` varchar(20) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `baixa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Dispositiu`
--

INSERT INTO `Dispositiu` (`id`, `NSVW`, `nom`, `MAC`, `model`, `numSerie`, `url`, `firmware`, `prgClient`, `IP`, `baixa`) VALUES
(1, 'VW0029', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', 'fjdshhigf', '2022-03-01'),
(2, 'VW0001', 'sagadfsghadsh', '38-01-95-FD-97-78', 'DB40E', '07QYHSKGA00159J', 'http://videocontent.', 'B2B-EP-APP-5413-223', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(3, 'VW0001', 'MM-BalsellsVin-2', '38-01-95-FD-97-9F', 'DB40E', '07QYHSKGA00155L', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(4, 'VW0002', 'MM-SevenViladecans-1', 'CC-B1-1A-74-43-F0', 'DB32E', '07QWHSKH600416N', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(5, 'VW0002', 'MM-SevenViladecans-2', 'CC-B1-1A-C1-F1-DE', 'DB32E', '07QWHSLH600105F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(6, 'VW0002', 'MM-SevenViladecans-3', 'CC-B1-1A-74-43-AF', 'DB32E', '07QWHSKH600789', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(7, 'VW0002', 'MM-SevenViladecans-4', 'CC-B1-1A-74-43-E1', 'DB32E', '07QWHSKH600408P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(8, 'VW0002', 'MM-SevenViladecans-5', 'CC-B1-1A-74-43-E2', 'DB32E', '07QWHSKH600415K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(9, 'VW0003', 'MM-Positivo-1-1', '40-16-3B-41-F6-16', 'DB40E', '07QYHSJH700229W', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(10, 'VW0003', 'MM-Positivo-1-2', '40-16-3B-41-F6-39', 'DB40E', '07QYHSJH700228F', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(11, 'VW0004', 'MM-Positivo-2-1', '9C-8C-6E-F5-58-87', 'DB40E', '07QYHSJH700201P', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(12, 'VW0004', 'MM-Positivo-2-2', '40-16-3B-41-F6-3F', 'DB40E', '07QYHSJH700212M', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(13, 'VW0005', 'MM-Positivo-1', 'CC-B1-1A-74-44-CF', 'DB32E', '07QWHSKH600799X', 'http://videocontent.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(14, 'VW0005', 'MM-Positivo-2', 'CC-B1-1A-74-44-64', 'DB32E', '07QWHSKH600827P', 'http://videocontent.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(15, 'VW0005', 'MM-Positivo-3', 'CC-B1-1A-74-44-EC', 'DB32E', '07QWHSKH600796P', 'http://videocontent.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(16, 'VW0005', 'MM-Positivo-4', 'CC-B1-1A-74-44-81', 'DB32E', '07QWHSKH600798B', 'http://videocontent.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(17, 'VW0005', 'MM-Positivo-5', 'CC-B1-1A-74-45-0B', 'DB32E', '07QWHSKH600734Y', 'http://videocontent.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(18, 'VW0006', 'VW-CanPicafort-1', 'CC-B1-1A-D6-C7-6C', 'ExtraDisplay', 'NA', 'http://NA', 'FAIL', 'V3. 2 NA-MIIPP-3201.', 'DHCP', NULL),
(19, 'VW0007', 'VW-CanPicafort-2', 'CC-B1-1A-D6-D4-8E', 'ExtraDisplay', 'NA', 'http://NA', 'FAIL', 'V3. 2 NA-MIIPP-3201.', 'DHCP', NULL),
(20, 'VW0083', 'VW-Pollença', 'C0-48-E6-EE-F8-2D', 'ExtraDisplay', 'NA', 'http://NA', 'FAIL', 'NA', 'DHCP', NULL),
(21, 'VW0076', 'MM-PositivoManresa-2-1', '28-39-5E-04-BE-A3', 'DB40E', '07QYHSFJ600360L', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(22, 'VW0076', 'MM-PositivoManresa-2-2', '28-39-5E-05-0B-6C', 'DB40E', '07QYHSFJ600685A', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(23, 'VW0077', 'MM-PositivoManresa-3-1', '28-39-5E-05-0A-5B', 'DB40E', '07QYHSFJ600365M', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(24, 'VW0077', 'MM-PositivoManresa-3-2', '28-39-5E-04-BE-A6', 'DB40E', '07QYHSFJ600359D', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(25, 'VW0078', 'MM-PositivoManresa-1-1', 'F8-3F-51-FE-F0-38', 'DB32E', '07QWHSKJ200320D', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(26, 'VW0078', 'MM-PositivoManresa-1-2', 'F8-3F-51-FE-F0-51', 'DB32E', '07QWHSKJ200325P', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(27, 'VW0078', 'MM-PositivoManresa-1-3', 'F8-3F-51-FE-F0-57', 'DB32E', '07QWHSKJ200316N', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(28, 'VW0078', 'MM-PositivoManresa-1-4', 'F8-3F-51-FE-F0-3C', 'DB32E', '07QWHSKJ200312P', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(29, 'VW0078', 'MM-PositivoManresa-1-5', 'F8-3F-51-FE-F0-45', 'DB32E', '07QWHSKJ200319W', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(30, 'VW0085', 'MM-PositivoValls-1', '84-C0-EF-BF-9B-CD', 'DB40E', '07QYHSIJ900598', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(31, 'VW0085', 'MM-PositivoValls-2', '84-C0-EF-BF-9B-B8', 'DB40E', '07QYHSIJ900630', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(32, 'VW0086', 'MM-PositivoTarrega-1', '54-BD-79-36-E2-7D', 'DB40E', '07QYHSIJ900640', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(33, 'VW0086', 'MM-PositivoTarrega-2', '54-BD-79-36-E2-75', 'DB40E', '07QYHSIJ900641', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(34, 'VW0088', 'MM-PositivoEsparraguera-1', '84-C0-EF-BF-9B-C6', 'DB40E', '07QYHSIJ900644', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(35, 'VW0088', 'MM-PositivoEsparraguera-2', '54-BD-79-36-E2-7C', 'DB40E', '07QYHSIJ900646', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(36, 'VW0087', 'MM-PositivoMartorell-1', 'FC-8F-90-77-73-64', 'DB32D', 'ZCNLHSKG401008', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-MIP-4602-235', 'DHCP', '0000-00-00'),
(37, 'VW0087', 'MM-PositivoMartorell-2', 'FC-8F-90-77-73-7F', 'DB32D', 'ZCNLHSKG401004', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-MIP-4602-235', 'DHCP', '0000-00-00'),
(38, 'VW0089', 'MM-Positivo-Olesa-1', '54-BD-79-36-E2-76', 'DB40E', '07QYHSIJ900650', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(39, 'VW0089', 'MM-Positivo-Olesa-2', '84-C0-EF-BF-9B-EE', 'DB40E', '07QYHSIJ900654', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(40, 'VW0100', 'MM-PositivoMollerussa-1', '54-3A-D6-B2-D1-DA', 'QB50R', '0CUEHNFR400527', 'http://vico.montcau.', 'T-KTM2ELAKUC-2220.5 ', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(41, 'VW0100', 'MM-PositivoMollerussa-2', '54-3A-D6-B2-D1-DB', 'QB50R', '0CUEHNFR400525Z', 'http://vico.montcau.', 'T-KTM2ELAKUC-2220.5 ', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(42, 'VW0093', 'MM-AimaSA-1', '24-FC-E5-00-25-2A', 'DB32E', '0DNGHHPM200860W', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(43, 'VW0093', 'MM-AimaSA-2', '24-FC-E5-00-24-EC', 'DB32E', '0DNGHHPM200866F', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(44, 'VW0093', 'MM-AimaSA-3', '24-FC-E5-00-24-EB', 'DB32E', '0DNGHHPM200868Z', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(45, 'VW0093', 'MM-AimaSA-4', '24-FC-E5-00-25-09', 'DB32E', '0DNGHHPM200908T', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(46, 'VW0096', 'MM-Positivo-Paddock-1-1', '00-7C-2D-D6-2A-FF', 'PM43H', '04YCHNDM600370H', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(47, 'VW0096', 'MM-Positivo-Paddock-1-2', '00-7C-2D-D6-2B-08', 'PM43H', '04YCHNDM600373M', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(48, 'VW0096', 'MM-Positivo-Paddock-1-3', '00-7C-2D-D6-2B-37', 'PM43H', '04YCHNDM600454A', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(49, 'VW0096', 'MM-Positivo-Paddock-1-4', '00-7C-2D-D6-2B-03', 'PM43H', '04YCHNDM600369K', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(50, 'VW0096', 'MM-Positivo-Paddock-1-5', '00-7C-2D-D6-2B-67', 'PM43H', '04YCHNDM600466V', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(51, 'VW0087', 'MM-PositivoMartorell-1', 'FC-8F-90-77-73-64', 'DB32D', 'ZCNLHSKG401008Y', 'http://vico.montcau.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(52, 'VW0087', 'MM-PositivoMartorell-2', 'FC-8F-90-77-73-7F', 'DB32D', 'ZCNLHSKG401004V', 'http://vico.montcau.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(53, 'VW0101', 'MM-Positivo-Outlet-1', '64-07-F6-00-51-92', 'QB43R', '080DHNBR502289T', 'http://vico.montcau.', 'T-KTM2ELAKUC-2230.3 ', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(54, 'VW0101', 'MM-Positivo-Outlet-2', '64-07-F6-00-51-BE', 'QB43R', '080DHNBR502294Y', 'http://vico.montcau.', 'T-KTM2ELAKUC-2230.3 ', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(55, 'VW0098', 'vw-MMLanzarote@ad', 'NA', 'LedVision', 'NA', 'http://NA', '', '', '', NULL),
(56, 'VW0032', 'MM-Lanzarote-1', 'B8-BB-AF-02-4B-49', 'DB32E', '07QYHSKH800722H', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(57, 'VW0032', 'MM-Lanzarote-2', 'B8-BB-AF-02-4B-6D', 'DB32E', '07QYHSKH800730V', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(58, 'VW0032', 'MM-Lanzarote-3', 'B8-BB-AF-02-4A-E0', 'DB32E', '07QYHSKH800737T', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(59, NULL, 'MM-Positivo-Gava-1-1', '54-3a-d6-cf-d2-20', 'QB50R', '0CUEHNFR500253J', 'http://vico.montcau.', 'T-KTM2ELAKUC-2230.3T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(60, NULL, 'MM-Positivo-Gava-1-2', '54-3a-d6-cf-d2-80', 'QB50R', '0CUEHNFR500344Y', 'http://vico.montcau.', 'T-KTM2ELAKUC-2230.3T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(61, NULL, 'O-SantCugat-1', '24-4B-03-56-EE-A4', 'DB40D', 'ZCMGHSKG300082L', 'http://videocontent.', 'T-GFSLDDWWC 1024,0 ,', 'B2B-EP-MIP-4602-153', 'DHCP', '0000-00-00'),
(62, NULL, 'ONLY-Sants-1', 'BC-14-85-1A-A8-70', 'NA', 'ZCNLHSKFC00772J', 'http://NA', 'T-GFSLDDWWC 1020.5 ,', 'B2B-EP-MIP-4602-142', '', '0000-00-00'),
(63, 'VW0010', 'O-Cerdanyola-1', 'BC-14-85-3E-60-A6', 'DB32D', 'ZCNLHSKG100861V', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(64, 'VW0010', 'O-Cerdanyola-2', 'BC-14-85-3E-60-9D', 'DB32D', 'ZCNLHSKG100862M', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(65, 'VW0010', 'O-Cerdanyola-3', 'BC-14-85-3E-5F-DE', 'DB32D', 'ZCNLHSKG100868Z', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(66, 'VW0011', 'O-LaPuebla-1', 'BC-14-85-3E-60-23', 'DB32D', 'ZCNLHSKG100874V', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(67, 'VW0011', 'O-LaPuebla-2', 'BC-14-85-3E-60-BA', 'DB32D', 'ZCNLHSKG100870P', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(68, 'VW0011', 'O-LaPuebla-3', 'BC-14-85-70-D6-BD', 'DB32D', 'ZCNLHSKG100887L', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(69, 'VW0087', 'MM-PositivoMartorell-1', 'FC-8F-90-77-73-64', 'DB32D', 'ZCNLHSKG401008Y', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', '0000-00-00'),
(70, 'VW0087', 'MM-PositivoMartorell-2', 'FC-8F-90-77-73-7F', 'DB32D', 'ZCNLHSKG401004V', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', '0000-00-00'),
(71, NULL, 'O-Sitges-3', 'FC-8F-90-77-73-40', 'DB32D', 'ZCNLHSKG401073Z', 'http://videocontent.', 'T-GFSLDDWWC 1044.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', '0000-00-00'),
(72, 'VW0013', 'ONLY-Bestseller-1', 'FC-8F-90-77-73-5B', 'DB32D', 'ZCNLHSKG401007R', 'http://videocontent.', 'T-GFSLDDWWC 1025.3 ,', 'B2B-EP-MIP-4602-159', 'DHCP', NULL),
(73, 'VW0013', 'ONLY-Bestseller-2', 'FC-8F-90-77-73-69', 'DB32D', 'ZCNLHSKG401015J', 'http://videocontent.', 'T-GFSLDDWWC 1025.3 ,', 'B2B-EP-MIP-4602-159', 'DHCP', NULL),
(74, 'VW0013', 'ONLY-Bestseller-3', 'FC-8F-90-77-73-7e', 'DB32D', 'ZCNLHSKG401003P', 'http://videocontent.', 'T-GFSLDDWWC 1025.3 ,', 'B2B-EP-MIP-4602-159', 'DHCP', NULL),
(75, NULL, 'O-Palafrugell-1', 'FC-8F-90-81-98-72', 'DB32E', '07QWHSKG500339E', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-029', 'DHCP', NULL),
(76, NULL, 'O-Palafrugell-2', 'FC-8F-90-81-98-75', 'DB32E', '07QWHSKG500342M', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-029', 'DHCP', NULL),
(77, NULL, 'O-Palafrugell-3', '78-BD-BC-E4-07-BF', 'DB32E', '07QWHSKG500335R', 'http://videocontent.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-086', 'DHCP', NULL),
(78, 'VW0015', 'O-Reus-1', 'FC-8F-90-B4-7F-23', 'DB32E', '07QWHSKG500501Z', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(79, 'VW0015', 'O-Reus-2', 'FC-8F-90-B4-7F-29', 'DB32E', '07QWHSKG500507T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(80, 'VW0015', 'O-Reus-3', 'FC-8F-90-B4-7F-26', 'DB32E', '07QWHSKG500502R', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(81, 'VW0016', 'O-Lalin-1', 'FC-8F-90-B4-7F-2A', 'DB32E', '07QWHSKG500508N', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(82, 'VW0016', 'O-Lalin-2', 'FC-8F-90-B4-7F-1B', 'DB32E', '07QWHSKG500492A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(83, 'VW0016', 'O-Lalin-3', 'FC-8F-90-B4-7F-21', 'DB32E', '07QWHSKG500498K', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(84, 'VW0017', 'O-Baricentro-1', '78-BD-BC-EF-CA-56', 'DB40E', '07QYHSKG800191P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.90', NULL),
(85, 'VW0017', 'O-Baricentro-2', '78-BD-BC-EF-CA-38', 'DB40E', '07QYHSKG800181M', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.91', NULL),
(86, 'VW0017', 'O-Baricentro-3', '78-BD-BC-EF-CA-81', 'DB40E', '07QYHSKG800169T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.92', NULL),
(87, 'VW0017', 'O-Baricentro-4', '78-BD-BC-EF-CA-35', 'DB40E', '07QYHSKG800186F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.93', NULL),
(88, 'VW0017', 'O-Baricentro-5', '78-BD-BC-EF-CA-53', 'DB40E', '07QYHSKG800174J', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.94', NULL),
(89, 'VW0017', 'O-Baricentro-6', '78-BD-BC-EF-CA-32', 'DB40E', '07QYHSKG800183K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.1.95', NULL),
(90, 'VW0018', 'O-Magic-1', '38-01-95-5C-2D-73', 'DB40E', '07QYHSPG900950A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.90', NULL),
(91, 'VW0018', 'O-Magic-2', '38-01-95-FD-FA-87', 'DB40E', '07QYHSKGA00270H', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.91', NULL),
(92, 'VW0018', 'O-Magic-3', '38-01-95-5C-2D-94', 'DB40E', '07QYHSPG900958H', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.92', NULL),
(93, 'VW0018', 'O-Magic-4', '38-01-95-5C-2D-8F', 'DB40E', '07QYHSPG900938T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.93', NULL),
(94, 'VW0018', 'O-Magic-5', '38-01-95-5C-2D-84', 'DB40E', '07QYHSPG900964P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.94', NULL),
(95, 'VW0018', 'O-Magic-6', '38-01-95-5C-2D-77', 'DB40E', '07QYHSPG900951P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.3.95', NULL),
(96, NULL, 'O-Casablanca-1', '78-BD-BC-F0-58-0E', 'DB32E', '07QWHSPGA00010T', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(97, NULL, 'O-Casablanca-2', '38-01-95-2D-0B-3A', 'DB32E', '07QWHSPGA00109D', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(98, NULL, 'O-Casablanca-3', '38-01-95-2D-3A-72', 'DB32E', '07QWHSPGA00108X', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(99, NULL, 'O-GranCanaria-1', '38-01-95-5b-67-5d', 'DB32E', '07QWHSPGA00112V', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(100, NULL, 'O-GranCanaria-2', '38-01-95-5b-67-73', 'DB32E', '07QWHSPGA00116H', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(101, NULL, 'O-GranCanaria-3', '78-BD-BC-F0-58-0F', 'DB32E', '07QWHSPGA00111L', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(102, NULL, 'ONLY-Toledo-1', '38-01-95-FD-AA-B2', 'DB40E', '07QYHSKGA00977X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(103, NULL, 'ONLY-Toledo-2', '38-01-95-FD-AA-AD', 'DB40E', '07QYHSKGA00983M', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(104, NULL, 'ONLY-Toledo-3', '38-01-95-FD-E3-DB', 'DB40E', '07QYHSKGA00310V', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(105, NULL, 'ONLY-Toledo-4', '38-01-95-FD-E4-E3', 'DB40E', '07QYHSKGA90307D', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(106, NULL, 'ONLY-Toledo-5', '38-01-95-FD-E4-02', 'DB40E', '07QYHSKGA00377N', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(107, NULL, 'ONLY-Toledo-6', '38-01-95-B1-59-83', 'DB40E', '07QYHSKGA00379D', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(108, 'VW0022', 'O-Calella-1', '38-01-95-FD-98-80', 'DB40E', '07QYHSKGA00091R', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(109, 'VW0022', 'O-Calella-2', '38-01-95-FD-98-86', 'DB40E', '07QYHSKGA00095X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(110, 'VW0022', 'O-Calella-3', '38-01-95-FD-98-74', 'DB40E', '07QYHSKGA00092F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(111, NULL, 'O-LoiosPorto-1', '38-01-95-FD-AA-9C', 'DB40E', '07QYHSKGA00957K', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(112, NULL, 'O-LoiosPorto-2', '38-01-95-FD-AA-C2', 'DB40E', '07QYHSKGA00956Z', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(113, NULL, 'O-LoiosPorto-3', '14-BB-6E-5F-84-22', 'DB40E', '07QYHSLH200268V', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(114, 'VW0024', 'O-Vic-1', '38-01-95-B0-F0-37', 'DB32E', '07QWHSKGA00441H', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(115, 'VW0024', 'O-Vic-2', '38-01-95-B0-EE-EC', 'DB32E', '07QWHSKGA00370B', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(116, 'VW0024', 'O-Vic-3', '38-01-95-B1-19-E4', 'DB32E', '07QWHSKGA00434D', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(117, 'VW0024', 'O-Vic-4', '38-01-95-B1-1A-36', 'DB32E', '07QWHSKGA01058T', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(118, 'VW0024', 'O-Vic-5', '38-01-95-AF-FE-09', 'DB32E', '07QWHSKGA00438Z', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(119, 'VW0024', 'O-Vic-6', '38-01-95-B0-EF-4C', 'DB32E', '07QWHSKGA00372L', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(120, 'VW0025', 'O-Tenerife-1', '38-01-95-FD-97-A8', 'DB40E', '07QYHSKGA00141T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(121, 'VW0025', 'O-Tenerife-2', '38-01-95-FD-97-9A', 'DB40E', '07QYHSKGA00164Z', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(122, 'VW0025', 'O-Tenerife-3', '38-01-95-FD-97-59', 'DB40E', '07QYHSKGA00133J', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(123, 'VW0025', 'O-Tenerife-4', '38-01-95-FD-97-A5', 'DB40E', '07QYHSKGA00140B', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(124, 'VW0025', 'O-Tenerife-5', '38-01-95-FD-97-99', 'DB40E', '07QYHSKGA00163Y', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(125, 'VW0025', 'O-Tenerife-6', '38-01-95-FD-97-72', 'DB40E', '07QYHSKGA00161P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(126, 'VW0026', 'O-CalaRatjada-1', 'FC-F1-36-10-4C-66', 'DB40E', '07QYHSPGA00892B', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(127, 'VW0026', 'O-CalaRatjada-2', '5C-F6-DC-B7-10-3C', 'DB40E', '07QYHSPGA00937T', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(128, 'VW0026', 'O-CalaRatjada-3', 'FC-F1-36-10-4C-5B', 'DB40E', '07QYHSPGA00894L', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(129, 'VW0026', 'O-CalaRatjada-4', '5C-F6-DC-B7-10-2F', 'DB40E', '07QYHSPGA00950H', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(130, 'VW0026', 'O-CalaRatjada-5', 'FC-F1-36-10-4C-6E', 'DB40E', '07QYHSPGA00893T', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(131, 'VW0026', 'O-CalaRatjada-6', '5C-F6-DC-B7-10-28', 'DB40E', '07QYHSPGA00941N', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(132, 'VW0027', 'O-WalaBCN-1', '14-BB-6E-E8-6B-38', 'DB32E', '07QWHSKH300188A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(133, 'VW0027', 'O-WalaBCN-2', '14-BB-6E-E8-6B-50', 'DB32E', '07QWHSKH300198Y', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(134, 'VW0027', 'O-WalaBCN-3', '14-BB-6E-E8-6B-47', 'DB32E', '07QWHSKH300195Z', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(135, NULL, 'O-ValenciaMN4-1', 'F8-77-B8-A4-D6-6A', 'DB40E', '07QYHSKH400202L', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(136, NULL, 'O-ValenciaMN4-2', 'F8-77-B8-A4-D7-1F', 'DB40E', '07QYHSKH400126A', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(137, NULL, 'O-ValenciaMN4-3', 'F8-77-B8-CB-AD-80', 'DB40E', '07QYHSKH401051X', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(138, NULL, 'O-ValenciaMN4-4', 'F8-77-B8-A4-D6-66', 'DB40E', '07QYHSKH400197L', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(139, NULL, 'O-ValenciaMN4-5', 'F8-77-B8-A4-D6-65', 'DB40E', '07QYHSKH400192B', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(140, NULL, 'O-ValenciaMN4-6', 'F8-77-B8-A4-D6-39', 'DB40E', '07QYHSKH400129A', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(141, 'VW0029', 'O-Tafalla-1', 'CC-B1-1A-74-44-7D', 'DB32E', '07QWHSKH600940X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(142, 'VW0029', 'O-Tafalla-2', 'CC-B1-1A-74-43-E4', 'DB32E', '07QWHSKH600427J', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(143, 'VW0029', 'O-Tafalla-3', 'CC-B1-1A-74-44-6E', 'DB32E', '07QWHSKH600792W', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(144, 'VW0030', 'VW-Ciutadella', 'CC-B1-1A-D6-B8-96', 'ExtraDisplay', 'NA', 'http://vico.montcau.', 'FAIL', 'V3. 2 NA-MIIPP-3201.', 'DHCP', NULL),
(145, 'VW0031', 'O-Alcudia-1', 'B8-BB-AF-01-B7-5E', 'DB40E', '07QYHSKH802485F', 'http://videocontent.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-189', 'DHCP', NULL),
(146, 'VW0031', 'O-Alcudia-2', 'B8-BB-AF-01-B6-F4', 'DB40E', '07QYHSKH802484X', 'http://videocontent.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-189', 'DHCP', NULL),
(147, 'VW0031', 'O-Alcudia-3', 'B8-BB-AF-01-B7-49', 'DB40E', '07QYHSKH802493M', 'http://videocontent.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-189', 'DHCP', NULL),
(148, 'VW0033', 'O-Olot-1', 'F8-3F-51-01-01-6A', 'DB32E', '07QWHSKJ100252A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(149, 'VW0033', 'O-Olot-2', 'F8-3F-51-01-01-64', 'DB32E', '07QWHSKJ100229F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(150, 'VW0033', 'O-Olot-3', 'F8-3F-51-01-01-77', 'DB32E', '07QWHSKJ100234X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(151, NULL, 'O-Ejido-1', '38-01-95-AF-FE-07', 'DB32E', '07QWHSKGA00458N', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00'),
(152, NULL, 'O-Ejido-2', '38-01-95-5B-67-4A', 'DB32E', '07QWHSKG900778H', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00'),
(153, NULL, 'O-Ejido-3', '38-01-95-FE-D3-C1', 'DB32E', '07QWHSKGA01172M', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00'),
(154, 'VW0035', 'O-Terrassa-1', 'FE-F6-22-3F-B0-86', 'DB40E', '07QYHSKH800559K', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(155, 'VW0035', 'O-Terrassa-2', '40-16-3B-79-A8-D4', 'DB40E', '07QYHSKH800554P', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(156, 'VW0036', 'O-Igualada-1', 'D8-E0-E1-6C-28-AD', 'DB32E', '07QWHSKJ300295R', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(157, 'VW0036', 'O-Igualada-2', 'D8-E0-E1-6C-28-B1', 'DB32E', '07QWHSKJ300292F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(158, 'VW0036', 'O-Igualada-3', 'D8-E0-E1-6C-28-B0', 'DB32E', '07QWHSKJ300296P', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(159, NULL, 'O-Calpe-1', '28-39-5E-F1-75-66', 'DB32E', '07QWHSPJ800752T', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(160, NULL, 'O-Calpe-2', '28-39-5E-F1-75-61', 'DB32E', '07QWHSPJ800756R', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(161, NULL, 'O-Calpe-3', '28-39-5E-05-7C-36', 'DB32E', '07QWHSLJ600379R', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(162, 'VW0081', 'O-Empuriabrava-1', 'CC-6E-A4-6E-DD-69', 'DB32E', '0DNGHHPK200299T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(163, 'VW0081', 'O-Empuriabrava-2', 'CC-6E-A4-6E-DC-45', 'DB32E', '0DNGHHPK200317T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(164, 'VW0081', 'O-Empuriabrava-3', 'CC-6E-A4-6E-DD-7A', 'DB32E', '0DNGHHPK200232H', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(165, 'VW0082', 'O-Inca-1', 'C0-48-E6-CA-4E-AF', 'DB32E', '0DNGHHPK700410Y', 'http://vico.montcau.', 'T-GFSLE2AKUC 1042.1 ', 'B2B-EP-APP-5413-228', 'DHCP', NULL),
(166, 'VW0082', 'O-Inca-2', 'C0-48-E6-88-AB-0C', 'DB32E', '0DNGHHPK600104X', 'http://vico.montcau.', 'T-GFSLE2AKUC 1041.1 ', 'B2B-EP-APP-5413-226', 'DHCP', NULL),
(167, 'VW0082', 'O-Inca-3', 'C0-48-E6-CA-1D-97', 'DB32E', '0DNGHHPK700418P', 'http://vico.montcau.', 'T-GFSLE2AKUC 1042.1 ', 'B2B-EP-APP-5413-228', 'DHCP', NULL),
(168, 'VW0084', 'VW-Inca', '10-77-B1-71-3A-0B', 'ExtraDisplay', 'NA', 'http://NA', 'FAIL', '', 'DHCP', NULL),
(169, NULL, 'O-Sagunto-1-1', 'FC-8F-90-CF-7A-21', 'DB32E', '07QWHSKG600627T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(170, NULL, 'O-Sagunto-1-2', 'FC-8F-90-CF-7A-16', 'DB32E', '07QWHSKG600626R', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(171, NULL, 'O-Sagunto-1-3', 'FC-8F-90-CF-7A-23', 'DB32E', '07QWHSKG600620X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(172, NULL, 'O-Sagunto-2-1', '78-BD-BC-E3-61-86', 'DB48E', '07ROHSPG800351A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(173, NULL, 'O-Sagunto-2-2', '78-BD-BC-E3-61-14', 'DB48E', '07ROHSPG800422D', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(174, NULL, 'O-Sagunto-2-3', '78-BD-BC-E3-83-DE', 'DB48E', '07R0HSPG800350K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(175, NULL, 'O-Sagunto-3-1', '78-BD-BC-E3-61-87', 'DB48E', '07R0HSPG800349T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(176, NULL, 'O-Sagunto-3-2', '78-BD-BC-E3-61-75', 'DB48E', '07R0HSPG800425W', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(177, NULL, 'O-Sagunto-3-3', '78-BD-BC-E3-61-1A', 'DB48E', '07R0HSPG800424H', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(178, 'VW0090', 'O-Fraga-1-1', 'D0-03-DF-71-81-E8', 'DB32E', '0DNGHHPM200052J', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(179, 'VW0090', 'O-Fraga-1-2', 'D0-03-DF-72-EE-4F', 'DB32E', '0DNGHHPM200403V', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-231', 'DHCP', NULL),
(180, 'VW0090', 'O-Fraga-1-3', 'D0-03-DF-72-EF-1D', 'DB32E', '0DNGHHPM200374N', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-232', 'DHCP', NULL),
(181, 'VW0091', 'O-Fraga-2-1', 'FC-03-9F-A9-54-E1', 'DB32E', '0DNGHHPKB00502L', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-233', 'DHCP', NULL),
(182, 'VW0091', 'O-Fraga-2-2', 'D0-03-DF-1B-DC-6A', 'DB32E', '0DNGHHPM100146T', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-234', 'DHCP', NULL),
(183, 'VW0091', 'O-Fraga-2-3', 'FC-03-9F-7B-DA-49', 'DB32E', '0DNGHHPKB00004A', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(184, 'VW0091', 'O-Fraga-2-4', 'D0-03-DF-71-82-0C', 'DB32E', '0DNGHHPM200061F', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-236', 'DHCP', NULL),
(185, 'VW0092', 'vw-OnlyFraga@ad', '80-EE-73-E2-19-32', 'LED', 'NA', 'http://vico.montcau.', '', '', 'DHCP', NULL),
(186, 'VW0094', 'O-Tarrega-1-1', '24-FC-E5-00-24-F1', 'DB32E', '0DNGHHPM200792', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(187, 'VW0094', 'O-Tarrega-1-2', '24-FC-E5-00-25-08', 'DB32E', '0DNGHHPM200909', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(188, 'VW0094', 'O-Tarrega-1-3', 'D0-03-DF-86-B3-B7', 'DB32E', '0DNGHHPM200919', 'http://vico.montcau.', 'T-GFSLE2AKUC 1043.4 ', 'B2B-EP-APP-5413-230', 'DHCP', NULL),
(189, 'VW0095', 'O-Tarrega-2-1', 'D0-03-DF-27-7E-15', 'PM43H', '04YCHNDM100594', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(190, 'VW0095', 'O-Tarrega-2-2', 'D0-03-DF-27-7E-18', 'PM43H', '04YCHNDM100598', 'http://vico.montcau.', 'T-HKMLAKUC-2131.0 ,T', 'MagicInfo_SPlayer_Ti', 'DHCP', NULL),
(191, NULL, 'OAS-Terrassa-1', 'CC-B1-1A-22-52-07', 'DB32E', '07QWHSKH402307W', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(192, NULL, 'OAS-Terrassa-2', 'CC-B1-1A-22-52-OA', 'DB32E', '07QWHSKH402308X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(193, NULL, 'OAS-Terrassa-3', 'CC-B1-1A-22-23-1A', 'DB32E', '07QWHSKH402310B', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(194, 'VW0038', 'OAS-Tafalla-1', '40-16-3B-41-F6-42', 'DB40E', '07QYHSJH700198', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(195, 'VW0038', 'OAS-Tafalla-2', '40-16-3B-41-F5-9A', 'DB40E', '07QYHSJH700209', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(196, 'VW0039', 'OAS-Lalin-1', '5C-49-7D-54-AE-92', 'DB32E', '07QWHSKHA00422W', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(197, 'VW0039', 'OAS-Lalin-2', '5C-49-7D-1F-7D-9F', 'DB32E', '07QWHSLHA00009F', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(198, 'VW0039', 'OAS-Lalin-3', '5C-49-7D-54-AE-A9', 'DB32E', '07QWHSKHA00432T', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(199, NULL, 'OAS-Tetuan-1', '5C- 49-7D-55-AB-AD', 'DB32E', '07QWHSKHA00493V', 'http://vico.montcau.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-186', 'DHCP', '0000-00-00'),
(200, NULL, 'OAS-Tetuan-2', 'B8-BB-AF-02-4B-5E', 'DB32E', '07QWHSKH800729M', 'http://vico.montcau.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-186', 'DHCP', '0000-00-00'),
(201, NULL, 'OAS-Tetuan-3', 'B8-BB-AF-02-4B-6B', 'DB32E', '07QWHSKH800720D', 'http://vico.montcau.', 'T-GFSLE2AKUC 1030.3 ', 'B2B-EP-APP-5413-186', 'DHCP', '0000-00-00'),
(202, 'VW0041', 'OAS-Igualada-1', 'D8-E0-E1-BF-AC-75', 'DB32E', '07QWHSKJ300385R', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(203, 'VW0041', 'OAS-Igualada-2', 'D8-E0-E1-6C-3B-BE', 'DB32E', '07QWHSKJ300386P', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(204, 'VW0041', 'OAS-Igualada-3', 'D8-E0-E1-BF-AC-91', 'DB32E', '07QWHSKJ300380Y', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(205, NULL, 'OP-PlazaEliptica-1', 'B8-BB-AF-03-4B-CB', 'DB40E', '07QYHSKH802602L', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(206, NULL, 'OP-PlazaEliptica-2', 'B8-BB-AF-03-24-84', 'DB40E', '07QYHSKH802605X', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(207, NULL, 'OP-PlazaEliptica-3', 'B8-BB-AF-03-24-7D', 'DB40E', '07QYHSKH802608V', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(208, 'VW0043', 'O-Almeria-1', 'BC-14-85-1C-10-47', 'DB32D', 'ZCNLHSKFC00721B', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(209, 'VW0043', 'O-Almeria-2', 'BC-14-85-1C-10-63', 'DB32D', 'ZCNLHSKFC00730K', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(210, 'VW0043', 'O-Almeria-3', 'BC-14-85-1C-10-67', 'DB32D', 'ZCNLHSKFC00731W', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(211, 'VW0044', 'O-Manacor-1', 'BC-14-85-1A-A8-B3', 'DB32D', 'ZCNLHSKFC00655F', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(212, 'VW0044', 'O-Manacor-2', 'BC-14-85-1C-10-39', 'DB32D', 'ZCNLHSKFC00720P', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(213, 'VW0044', 'O-Manacor-3', 'BC-14-85-1C-10-57', 'DB32D', 'ZCNLHSKFC00711A', 'http://videocontent.', 'T-GFSLDDWWC 1047.0 ,', 'B2B-EP-MIP-4602-235', 'DHCP', NULL),
(214, 'VW0048', 'O-Abrera-1-1', '38-01-95-5C-E1-F4', 'DB48E', '07R0HSKG900890D', 'http://videocontent.', 'T-GFSLE2AKUC 1038.1 ', 'B2B-EP-APP-5413-221', '10.16.2.96', NULL),
(215, 'VW0048', 'O-Abrera-1-2', '38-01-95-5C-E1-F9', 'DB48E', '07R0HSKG900889T', 'http://videocontent.', 'T-GFSLE2AKUC 1038.1 ', 'B2B-EP-APP-5413-221', '10.16.2.97', NULL),
(216, 'VW0048', 'O-Abrera-1-3', '38-01-95-5C-5C-28', 'DB48E', '07R0HSKG901358B', 'http://videocontent.', 'T-GFSLE2AKUC 1038.1 ', 'B2B-EP-APP-5413-221', '10.16.2.98', NULL),
(217, 'VW0049', 'O-Abrera-2-1', '78-BD-BC-EF-CA-1C', 'DB40E', '07QYHSKG800052W', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.90', NULL),
(218, 'VW0049', 'O-Abrera-2-2', '78-BD-BC-EF-CA-36', 'DB40E', '07QYHSKG800184A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.91', NULL),
(219, 'VW0049', 'O-Abrera-2-3', '78-BD-BC-EF-CA-44', 'DB40E', '07QYHSKG800173F', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.92', NULL),
(220, 'VW0049', 'O-Abrera-2-4', '78-BD-BC-EF-CA-45', 'DB40E', '07QYHSKG800179E', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.93', NULL),
(221, 'VW0049', 'O-Abrera-2-5', '78-BD-BC-EF-CA-5D', 'DB40E', '07QYHSKG800176B', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.94', NULL),
(222, 'VW0049', 'O-Abrera-2-6', '78-BD-BC-EF-CA-55', 'DB40E', '07QYHSKG800175V', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', '10.16.2.95', NULL),
(223, 'VW0050', 'O-GranVia2-1-1', '38-01-95-5C-2D-81', 'DB40E', '07QYHSPG900963A', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.90', NULL),
(224, 'VW0050', 'O-GranVia2-1-2', '38-01-95-5C-2D-A2', 'DB40E', '07QYHSPG901004E', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.91', NULL),
(225, 'VW0050', 'O-GranVia2-1-3', '38-01-95-5C-2D-78', 'DB40E', '07QYHSPG900961Z', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.92', NULL),
(226, 'VW0050', 'O-GranVia2-1-4', '38-01-95-5C-2D-7E', 'DB40E', '07QYHSPG900962Y', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.93', NULL),
(227, 'VW0050', 'O-GranVia2-1-5', '38-01-95-5C-2D-76', 'DB40E', '07QYHSPG900960K', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.94', NULL),
(228, 'VW0050', 'O-GranVia2-1-6', '38-01-95-5C-2D-7D', 'DB40E', '07QYHSPG900944R', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.95', NULL),
(229, 'VW0051', 'O-GranVia2-2-1', '38-01-95-5C-2D-8C', 'DB40E', '07QYHSPG900955E', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.96', NULL),
(230, 'VW0051', 'O-GranVia2-2-2', '38-01-95-5C-2D-89', 'DB40E', '07QYHSPG900954N', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.97', NULL),
(231, 'VW0051', 'O-GranVia2-2-3', '38-01-95-5C-2D-80', 'DB40E', '07QYHSPG900953X', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.98', NULL),
(232, 'VW0051', 'O-GranVia2-2-4', '38-01-95-5C-2D-9B', 'DB40E', '07QYHSPG900956F', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.99', NULL),
(233, 'VW0051', 'O-GranVia2-2-5', '38-01-95-5C-2D-7C', 'DB40E', '07QYHSPG900952D', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.100', NULL),
(234, 'VW0051', 'O-GranVia2-2-6', '38-01-95-FD-76-EB', 'DB40E', '07QYHSPGA00081H', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', '10.16.4.101', NULL),
(235, 'VW0052', 'O-Lanzarote-1-1', '14-BB-6E-44-28-F5', 'DB32E', '07QWHSKH100067V', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(236, 'VW0052', 'O-Lanzarote-1-2', '38-01-95-B1-59-94', 'DB32E', '07QWHSKGA00571P', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(237, 'VW0052', 'O-Lanzarote-1-3', 'FC-F1-36-F3-23-FA', 'DB32E', '07QWHSKH100061E', 'http://videocontent.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(238, 'VW0053', 'O-Lanzarote-2-1', '14-BB-6E-5E-60-21', 'DB40E', '07QYHSKH200720Z', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(239, 'VW0053', 'O-Lanzarote-2-2', '14-BB-6E-5E-60-35', 'DB40E', '07QYHSKH200722J', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(240, 'VW0053', 'O-Lanzarote-2-3', '14-BB-6E-5E-60-D8', 'DB40E', '07QYHSKH200484Y', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(241, 'VW0053', 'O-Lanzarote-2-4', '14-BB-6E-5E-60-3B', 'DB40E', '07QYHSKH200702N', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(242, 'VW0053', 'O-Lanzarote-2-5', '14-BB-6E-5E-60-48', 'DB40E', '07QYHSKH200697N', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(243, 'VW0053', 'O-Lanzarote-2-6', '14-BB-6E-5E-60-1D', 'DB40E', '07QYHSKH200716A', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(244, NULL, 'ONLY-PuntaReina-1-1', '14-BB-6E-46-A6-91', 'DB32E', '07QWHSKH100453A', 'http://videocontent.', 'T-GFSLE2AKUC 1019.9 ', 'B2B-EP-APP-5413-116', 'DHCP', '0000-00-00'),
(245, NULL, 'ONLY-PuntaReina-1-2', '38-01-95-B0-EF-F5', 'DB32E', '07QWHSKGA00578L', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(246, NULL, 'ONLY-PuntaReina-1-3', '38-01-95-B1-59-8E', 'DB32E', '07QWHSKGA00569J', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(247, NULL, 'ONLY-PuntaReina-2-1', '14-BB-6E-44-24-55', 'DB32E', '07QWHSKH100161W', 'http://videocontent.', 'T-GFSLE2AKUC 1019.9 ', 'B2B-EP-APP-5413-116', 'DHCP', '0000-00-00'),
(248, NULL, 'ONLY-PuntaReina-2-2', '14-BB-6E-44-24-77', 'DB32E', '07QWHSKH100451N', 'http://videocontent.', 'T-GFSLE2AKUC 1019.9 ', 'B2B-EP-APP-5413-116', 'DHCP', '0000-00-00'),
(249, NULL, 'ONLY-PuntaReina-2-3', '38-01-95-B0-EF-F6', 'DB32E', '07QWHSKGA00577T', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(250, NULL, 'ONLY-PuntaReina-3-1', '38-01-95-B0-EF-F3', 'DB32E', '07QWHSKGA00575K', 'http://videocontent.', 'T-GFSLE2AKUC 1014.5 ', 'B2B-EP-APP-5413-086', 'DHCP', '0000-00-00'),
(251, NULL, 'ONLY-PuntaReina-3-2', '14-BB-6E-44-24-59', 'DB32E', '07QWHSKH100162J', 'http://videocontent.', 'T-GFSLE2AKUC 1019.9 ', 'B2B-EP-APP-5413-116', 'DHCP', '0000-00-00'),
(252, NULL, 'ONLY-PuntaReina-3-3', '14-BB-6E-44-28-61', 'DB32E', '07QWHSKH100154Y', 'http://videocontent.', 'T-GFSLE2AKUC 1019.9 ', 'B2B-EP-APP-5413-116', 'DHCP', '0000-00-00'),
(253, 'VW0057', 'O-SmukLleida-1', 'CC-B1-1A-22-23-1C', 'DB32E', '07QWHSKH402294Y', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(254, 'VW0057', 'O-SmukLleida-2', 'CC-B1-1A-22-23-51', 'DB32E', '07QWHSKH402297L', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(255, 'VW0057', 'O-SmukLleida-3', 'CC-B1-1A-22-23-54', 'DB32E', '07QWHSKH402298E', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(256, 'VW0058', 'VW-Tafalla', 'CC-B1-1A-D6-C4-4E', 'ExtraDisplay', 'NA', 'http://videocontent.', 'FAIL', 'V3. 1 NA-MIIPP-3106,', 'DHCP', NULL),
(257, 'VW0059', 'O-PlazaEliptica-1-1', '40-16-3B-42-B6-4E', 'DB32E', '07QWHSJH700835N', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(258, 'VW0059', 'O-PlazaEliptica-1-2', '40-16-3B-42-B6-48', 'DB32E', '07QWHSJH700838A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(259, 'VW0059', 'O-PlazaEliptica-1-3', '40-16-3B-42-B6-5D', 'DB32E', '07QWHSJH700836J', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(260, 'VW0060', 'O-PlazaEliptica-2-1', 'B8-BB-AF-01-F1-1D', 'DB40E', '07QYHSKH802144J', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(261, 'VW0060', 'O-PlazaEliptica-2-2', 'B8-BB-AF-03-24-86', 'DB40E', '07QYHSKH802604A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(262, 'VW0060', 'O-PlazaEliptica-2-3', 'B8-BB-AF-03-4C-E0', 'DB40E', '07QYHSKH802548N', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(263, 'VW0099', 'O-PlazaEliptica-3-1', '64-e7-d8-e5-81-f2', 'QB43R', '080DHNBNA00375Y', 'http://vico.montcau.', 'T-KTM2ELAKUC-2172.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(264, 'VW0099', 'O-PlazaEliptica-3-2', '64-e7-d8-e5-81-eb', 'QB43R', '080DHNBNA00385D', 'http://vico.montcau.', 'T-KTM2ELAKUC-2172.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(265, 'VW0099', 'O-PlazaEliptica-3-3', '64-e7-d8-e5-81-ed', 'QB43R', '080DHNBNA00383N', 'http://vico.montcau.', 'T-KTM2ELAKUC-2172.0 ', 'B2B-EP-APP-5413-235', 'DHCP', NULL),
(266, 'VW0061', 'OAS-Manresa-1-1', 'FC-F1-36-9F-86-A0', 'DB48E', '07R0HSKGB00059R', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(267, 'VW0061', 'OAS-Manresa-1-2', 'FC-F1-36-79-7C-6B', 'DB48E', '07R0HSKGB00069K', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(268, 'VW0061', 'OAS-Manresa-1-3', 'FC-F1-36-79-7C-86', 'DB48E', '07R0HSPGB00356J', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(269, 'VW0062', 'O-Manresa-2-1', 'B8-BB-AF-03-A6-10', 'DB32E', '07QWHSKH801057V', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(270, 'VW0062', 'O-Manresa-2-2', 'B8-BB-AF-03-A6-A9', 'DB32E', '07QWHSKH801076M', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(271, 'VW0062', 'O-Manresa-2-3', 'B8-BB-AF-03-A6-B0', 'DB32E', '07QWHSKH801079A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(272, 'VW0063', 'O-Manresa-3-1', '40-16-3B-76-BA-1B', 'DB48E', '07R0HSKH800192M', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(273, 'VW0063', 'O-Manresa-3-2', '40-16-3B-76-BA-5C', 'DB48E', '07R0HSKH800193L', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(274, 'VW0063', 'O-Manresa-3-3', 'FC-F1-36-56-9E-8B', 'DB48E', '07R0HSPGB00101Y', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(275, NULL, 'O-Malaga-1', '5C-49-7D-55-AB-AC', 'DB32E', '07QWHSKHA00488N', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(276, NULL, 'O-Malaga-2', '5C-49-7D-55-AC-DF', 'DB32E', '07QWHSKHA00486F', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(277, NULL, 'O-Malaga-3', '5C-49-7D-D0-EF-91', 'DB32E', '07QWHSKHB00170X', 'http://vico.montcau.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(278, 'VW0080', 'O-Balaguer-1', '9C-8C-6E-AB-C3-B8', 'DB32E', '0DNGHHPK100220A', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(279, 'VW0080', 'O-Balaguer-2', '9C-8C-6E-AB-C3-1E', 'DB32E', '0DNGHHPK100247Z', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(280, 'VW0080', 'O-Balaguer-3', '9C-8C-6E-AB-C3-BF', 'DB32E', '0DNGHHPK100219T', 'http://vico.montcau.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(281, NULL, 'V-Mogan-1', 'FC-8F-90-CF-7A-0C', 'DB32E', '07QWHSKG600636E', 'http://videocontent.', 'T-GFSLE2AKUC 1008.3 ', 'B2B-EP-APP-5413-045', 'DHCP', '0000-00-00'),
(282, NULL, 'V-Mogan-2', 'FC-8F-90-CF-7A-2C', 'DB32E', '07QWHSKG600635Z', 'http://videocontent.', 'T-GFSLE2AKUC 1008.3 ', 'B2B-EP-APP-5413-045', 'DHCP', '0000-00-00'),
(283, NULL, 'V-Mogan-3', 'FC-8F-90-CF-7A-05', 'DB32E', '07QWHSKG600625A', 'http://videocontent.', 'T-GFSLE2AKUC 1008.3 ', 'B2B-EP-APP-5413-045', 'DHCP', '0000-00-00'),
(284, NULL, 'V-Vic-1', 'FC-F1-36-55-D2-A9', 'DB32E', '07QWHSKGA02649V', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(285, NULL, 'V-Vic-2', 'FC-F1-36-0E-BF-5D', 'DB32E', '07QWHSKGA01733B', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(286, NULL, 'V-Vic-3', 'FC-F1-36-0F-3E-6A', 'DB32E', '07QWHSKGA01732K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(287, NULL, 'V-Alcudia-1', '38-01-95-FD-98-75', 'DB40E', '07QYHSKGA00052L', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(288, NULL, 'V-Alcudia-2', '38-01-95-FD-97-CA', 'DB40E', '07QYHSKGA00051T', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(289, NULL, 'V-Alcudia-3', '38-01-95-B1-58-CA', 'DB40E', '07QYHSKG900331D', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(290, NULL, 'O-Sagunto-2-1', '78-BD-BC-E3-61-86', 'DB48E', '07R0HSPG800351A', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(291, NULL, 'O-Sagunto-3-3', '78-BD-BC-E3-61-1A', 'DB48E', '07R0HSPG800424H', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(292, NULL, 'O-Sagunto-2-2', '78-BD-BC-E3-61-14', 'DB48E', '07R0HSPG800422D', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(293, NULL, 'O-Sagunto-3-1', '78-BD-BC-E3-61-87', 'DB48E', '07R0HSPG800349T', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(294, NULL, 'O-Sagunto-3-2', '78-BD-BC-E3-61-75', 'DB48E', '07R0HSPG800425W', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(295, NULL, 'VILA-Sagunto-6', '78-BD-BC-E3-61-DE', 'DB48E', '07R0HSPG800350K', 'http://videocontent.', 'T-GFSLE2AKUC 1013.1 ', 'B2B-EP-APP-5413-079', 'DHCP', '0000-00-00'),
(296, NULL, 'NAMEIT-Figueres', '14-BB-6E-49-E7-6E', 'DB48E', '07R0HSLH200014K', 'http://videocontent.', 'T-GFSLE2AKUC 1022.0 ', 'B2B-EP-APP-5413-131', 'DHCP', '0000-00-00'),
(297, NULL, 'NAMEIT-Milko-1', '68-27-37-A8-27-09', 'DB32E', '07QWHSKJ600168E', 'http://vico.montcau.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00'),
(298, NULL, 'NAMEIT-Milko-2', 'F8-3F-51-FE-F0-65', 'DB32E', '07QWHSKJ200322L', 'http://vico.montcau.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00');
INSERT INTO `Dispositiu` (`id`, `NSVW`, `nom`, `MAC`, `model`, `numSerie`, `url`, `firmware`, `prgClient`, `IP`, `baixa`) VALUES
(299, NULL, 'NAMEIT-Milko-3', '68-27-37-A8-27-71', 'DB32E', '07QWHSKJ600167Z', 'http://vico.montcau.', 'T-GFSLE2AKUC 1037.2 ', 'B2B-EP-APP-5413-218', 'DHCP', '0000-00-00'),
(300, 'VW0071', 'O-ECIPCatalunya-1', 'FC-F1-36-9F-86-99', 'DB48E', '07R0HSKGB00055A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(301, 'VW0071', 'O-ECIPCatalunya-2', 'FC-F1-36-7B-85-7C', 'DB48E', '07R0HSKGB00068A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(302, 'VW0071', 'O-ECIPCatalunya-3', 'D8-E0-E1-63-24-DF', 'DB48E', '07R0HSLJ200521B', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-218', 'DHCP', NULL),
(303, 'VW0072', 'O-ECIDiagonal-1', '40-16-3B-41-F5-CB', 'DB40E', '07QYHSJH700230', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(304, 'VW0072', 'O-ECIDiagonal-2', '40-16-3B-41-F5-B4', 'DB40E', '07QYHSJH700214', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(305, 'VW0073', 'OAS-ECIParqueSur-1', 'B8-BB-AF-01-B6-E9', 'DB40E', '07QYHSKH802494L', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(306, 'VW0073', 'OAS-ECIParqueSur-2', 'B8-BB-AF-01-B6-F8', 'DB40E', '07QYHSKH802483A', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(307, 'VW0074', 'OAS-ECIValladolid-1', 'B8-BB-AF-03-4B-C9', 'DB40E', '07QYHSKH802603K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(308, 'VW0074', 'OAS-ECIValladolid-2', 'B8-BB-AF-03-4C-54', 'DB40E', '07QYHSKH802598K', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(309, 'VW0074', 'OAS-ECIValladolid-3', 'B8-BB-AF-03-4C-94', 'DB40E', '07QYHSKH802600R', 'http://videocontent.', 'T-GFSLE2AKUC 1039.1 ', 'B2B-EP-APP-5413-223', 'DHCP', '0000-00-00'),
(310, 'VW0075', 'OAS-ECIPintorSorolla-1', '68-27-37-2C-9F-50', 'DB40E', '07QYHSLJ500030X', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(311, 'VW0075', 'OAS-ECIPintorSorolla-2', '68-27-37-2C-9F-4B', 'DB40E', '07QYHSLJ500031V', 'http://videocontent.', 'T-GFSLE2AKUC 1047.0 ', 'B2B-EP-APP-5413-223', 'DHCP', NULL),
(312, 'VW0075', 'VW-Gruptis', '10-77-B1-71-4C-97', 'LED', 'none', 'http://vico.montcau.', 'V3.2 NA-MIIPP-3201.8', '', 'DHCP', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grups`
--

CREATE TABLE `Grups` (
  `id` int(3) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Grups`
--

INSERT INTO `Grups` (`id`, `descripcio`) VALUES
(1, 'test'),
(2, 'Multimarca'),
(3, 'Only'),
(4, 'Only&Sons'),
(5, 'Only-Only&Sons'),
(6, 'VILA'),
(7, 'VILA SELECTED'),
(8, 'NAME IT'),
(9, 'ECI'),
(10, 'REDSUN'),
(11, 'ONLY PLAY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Hoja1`
--

CREATE TABLE `Hoja1` (
  `NSVW` varchar(6) DEFAULT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `MAC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Hoja1`
--

INSERT INTO `Hoja1` (`NSVW`, `Nom`, `MAC`) VALUES
('VW0001', 'MM-BalsellsVin-1 baja', 'F8-77-B8-E3-15-5F'),
('VW0001', 'MM-BalsellsVin-1', '38-01-95-FD-97-78'),
('VW0001', 'MM-BalsellsVin-2', '38-01-95-FD-97-9F'),
('VW0002', 'MM-SevenViladecans-1', 'CC-B1-1A-74-43-F0'),
('VW0002', 'MM-SevenViladecans-2', 'CC-B1-1A-C1-F1-DE'),
('VW0002', 'MM-SevenViladecans-3', 'CC-B1-1A-74-43-AF'),
('VW0002', 'MM-SevenViladecans-4', 'CC-B1-1A-74-43-E1'),
('VW0002', 'MM-SevenViladecans-5', 'CC-B1-1A-74-43-E2'),
('VW0003', 'MM-Positivo-1-1', '40-16-3B-41-F6-16'),
('VW0003', 'MM-Positivo-1-2', '40-16-3B-41-F6-39'),
('VW0004', 'MM-Positivo-2-1', '9C-8C-6E-F5-58-87'),
('VW0004', 'MM-Positivo-2-2', '40-16-3B-41-F6-3F'),
('VW0005', 'MM-Positivo-1', 'CC-B1-1A-74-44-CF'),
('VW0005', 'MM-Positivo-2', 'CC-B1-1A-74-44-64'),
('VW0005', 'MM-Positivo-3', 'CC-B1-1A-74-44-EC'),
('VW0005', 'MM-Positivo-4', 'CC-B1-1A-74-44-81'),
('VW0005', 'MM-Positivo-5', 'CC-B1-1A-74-45-0B'),
('VW0006', 'VW-CanPicafort-1', 'CC-B1-1A-D6-C7-6C'),
('VW0007', 'VW-CanPicafort-2', 'CC-B1-1A-D6-D4-8E'),
('VW0083', 'VW-Pollença', 'C0-48-E6-EE-F8-2D'),
('VW0076', 'MM-PositivoManresa-2-1', '28-39-5E-04-BE-A3'),
('VW0076', 'MM-PositivoManresa-2-2', '28-39-5E-05-0B-6C'),
('VW0077', 'MM-PositivoManresa-3-1', '28-39-5E-05-0A-5B'),
('VW0077', 'MM-PositivoManresa-3-2', '28-39-5E-04-BE-A6'),
('VW0078', 'MM-PositivoManresa-1-1', 'F8-3F-51-FE-F0-38'),
('VW0078', 'MM-PositivoManresa-1-2', 'F8-3F-51-FE-F0-51'),
('VW0078', 'MM-PositivoManresa-1-3', 'F8-3F-51-FE-F0-57'),
('VW0078', 'MM-PositivoManresa-1-4', 'F8-3F-51-FE-F0-3C'),
('VW0078', 'MM-PositivoManresa-1-5', 'F8-3F-51-FE-F0-45'),
('VW0085', 'MM-PositivoValls-1', '84-C0-EF-BF-9B-CD'),
('VW0085', 'MM-PositivoValls-2', '84-C0-EF-BF-9B-B8'),
('VW0086', 'MM-PositivoTarrega-1', '54-BD-79-36-E2-7D'),
('VW0086', 'MM-PositivoTarrega-2', '54-BD-79-36-E2-75'),
('VW0088', 'MM-PositivoEsparraguera-1', '84-C0-EF-BF-9B-C6'),
('VW0088', 'MM-PositivoEsparraguera-2', '54-BD-79-36-E2-7C'),
('VW0087', 'MM-PositivoMartorell-1', 'FC-8F-90-77-73-64'),
('VW0087', 'MM-PositivoMartorell-2', 'FC-8F-90-77-73-7F'),
('VW0089', 'MM-Positivo-Olesa-1', '54-BD-79-36-E2-76'),
('VW0089', 'MM-Positivo-Olesa-2', '84-C0-EF-BF-9B-EE'),
('VW0100', 'MM-PositivoMollerussa-1', '54-3A-D6-B2-D1-DA'),
('VW0100', 'MM-PositivoMollerussa-2', '54-3A-D6-B2-D1-DB'),
('VW0093', 'MM-AimaSA-1', '24-FC-E5-00-25-2A'),
('VW0093', 'MM-AimaSA-2', '24-FC-E5-00-24-EC'),
('VW0093', 'MM-AimaSA-3', '24-FC-E5-00-24-EB'),
('VW0093', 'MM-AimaSA-4', '24-FC-E5-00-25-09'),
('VW0096', 'MM-Positivo-Paddock-1-1', '00-7C-2D-D6-2A-FF'),
('VW0096', 'MM-Positivo-Paddock-1-2', '00-7C-2D-D6-2B-08'),
('VW0096', 'MM-Positivo-Paddock-1-3', '00-7C-2D-D6-2B-37'),
('VW0096', 'MM-Positivo-Paddock-1-4', '00-7C-2D-D6-2B-03'),
('VW0096', 'MM-Positivo-Paddock-1-5', '00-7C-2D-D6-2B-67'),
('VW0097', 'MM-Positivo-Paddock-2-1', 'FC-8F-90-77-73-64'),
('VW0097', 'MM-Positivo-Paddock-2-2', 'FC-8F-90-77-73-7F'),
('VW0101', 'MM-Positivo-Outlet-1', '64-07-F6-00-51-92'),
('VW0101', 'MM-Positivo-Outlet-2', '64-07-F6-00-51-BE'),
('VW0098', 'vw-MMLanzarote@ad', NULL),
('VW0032', 'MM-Lanzarote-1', 'B8-BB-AF-02-4B-49'),
('VW0032', 'MM-Lanzarote-2', 'B8-BB-AF-02-4B-6D'),
('VW0032', 'MM-Lanzarote-3', 'B8-BB-AF-02-4A-E0'),
('VW102', 'MM-Positivo-Gava-1-1', '54-3a-d6-cf-d2-20'),
('VW102', 'MM-Positivo-Gava-1-2', '54-3a-d6-cf-d2-80'),
('VW0008', 'O-SantCugat-1', '24-4B-03-56-EE-A4'),
('VW0009', 'ONLY-Sants-1', 'BC-14-85-1A-A8-70'),
('VW0010', 'O-Cerdanyola-1', 'BC-14-85-3E-60-A6'),
('VW0010', 'O-Cerdanyola-2', 'BC-14-85-3E-60-9D'),
('VW0010', 'O-Cerdanyola-3', 'BC-14-85-3E-5F-DE'),
('VW0011', 'O-LaPuebla-1', 'BC-14-85-3E-60-23'),
('VW0011', 'O-LaPuebla-2', 'BC-14-85-3E-60-BA'),
('VW0011', 'O-LaPuebla-3', 'BC-14-85-70-D6-BD'),
('VW0012', 'O-Sitges-1', 'FC-8F-90-77-73-64'),
('VW0012', 'O-Sitges-2', 'FC-8F-90-77-73-7F'),
('VW0012', 'O-Sitges-3', 'FC-8F-90-77-73-40'),
('VW0013', 'ONLY-Bestseller-1', 'FC-8F-90-77-73-5B'),
('VW0013', 'ONLY-Bestseller-2', 'FC-8F-90-77-73-69'),
('VW0013', 'ONLY-Bestseller-3', 'FC-8F-90-77-73-7e'),
('VW0014', 'O-Palafrugell-1', 'FC-8F-90-81-98-72'),
('VW0014', 'O-Palafrugell-2', 'FC-8F-90-81-98-75'),
('VW0014', 'O-Palafrugell-3', '78-BD-BC-E4-07-BF'),
('VW0015', 'O-Reus-1', 'FC-8F-90-B4-7F-23'),
('VW0015', 'O-Reus-2', 'FC-8F-90-B4-7F-29'),
('VW0015', 'O-Reus-3', 'FC-8F-90-B4-7F-26'),
('VW0016', 'O-Lalin-1', 'FC-8F-90-B4-7F-2A'),
('VW0016', 'O-Lalin-2', 'FC-8F-90-B4-7F-1B'),
('VW0016', 'O-Lalin-3', 'FC-8F-90-B4-7F-21'),
('VW0017', 'O-Baricentro-1', '78-BD-BC-EF-CA-56'),
('VW0017', 'O-Baricentro-2', '78-BD-BC-EF-CA-38'),
('VW0017', 'O-Baricentro-3', '78-BD-BC-EF-CA-81'),
('VW0017', 'O-Baricentro-4', '78-BD-BC-EF-CA-35'),
('VW0017', 'O-Baricentro-5', '78-BD-BC-EF-CA-53'),
('VW0017', 'O-Baricentro-6', '78-BD-BC-EF-CA-32'),
('VW0018', 'O-Magic-1', '38-01-95-5C-2D-73'),
('VW0018', 'O-Magic-2', '38-01-95-FD-FA-87'),
('VW0018', 'O-Magic-3', '38-01-95-5C-2D-94'),
('VW0018', 'O-Magic-4', '38-01-95-5C-2D-8F'),
('VW0018', 'O-Magic-5', '38-01-95-5C-2D-84'),
('VW0018', 'O-Magic-6', '38-01-95-5C-2D-77'),
('VW0019', 'O-Casablanca-1', '78-BD-BC-F0-58-0E'),
('VW0019', 'O-Casablanca-2', '38-01-95-2D-0B-3A'),
('VW0019', 'O-Casablanca-3', '38-01-95-2D-3A-72'),
('VW0020', 'O-GranCanaria-1', '38-01-95-5b-67-5d'),
('VW0020', 'O-GranCanaria-2', '38-01-95-5b-67-73'),
('VW0020', 'O-GranCanaria-3', '78-BD-BC-F0-58-0F'),
('VW0021', 'ONLY-Toledo-1', '38-01-95-FD-AA-B2'),
('VW0021', 'ONLY-Toledo-2', '38-01-95-FD-AA-AD'),
('VW0021', 'ONLY-Toledo-3', '38-01-95-FD-E3-DB'),
('VW0021', 'ONLY-Toledo-4', '38-01-95-FD-E4-E3'),
('VW0021', 'ONLY-Toledo-5', '38-01-95-FD-E4-02'),
('VW0021', 'ONLY-Toledo-6', '38-01-95-B1-59-83'),
('VW0022', 'O-Calella-1', '38-01-95-FD-98-80'),
('VW0022', 'O-Calella-2', '38-01-95-FD-98-86'),
('VW0022', 'O-Calella-3', '38-01-95-FD-98-74'),
('VW0023', 'O-LoiosPorto-1', '38-01-95-FD-AA-9C'),
('VW0023', 'O-LoiosPorto-2', '38-01-95-FD-AA-C2'),
('VW0023', 'O-LoiosPorto-3', '14-BB-6E-5F-84-22'),
('VW0024', 'O-Vic-1', '38-01-95-B0-F0-37'),
('VW0024', 'O-Vic-2', '38-01-95-B0-EE-EC'),
('VW0024', 'O-Vic-3', '38-01-95-B1-19-E4'),
('VW0024', 'O-Vic-4', '38-01-95-B1-1A-36'),
('VW0024', 'O-Vic-5', '38-01-95-AF-FE-09'),
('VW0024', 'O-Vic-6', '38-01-95-B0-EF-4C'),
('VW0025', 'O-Tenerife-1', '38-01-95-FD-97-A8'),
('VW0025', 'O-Tenerife-2', '38-01-95-FD-97-9A'),
('VW0025', 'O-Tenerife-3', '38-01-95-FD-97-59'),
('VW0025', 'O-Tenerife-4', '38-01-95-FD-97-A5'),
('VW0025', 'O-Tenerife-5', '38-01-95-FD-97-99'),
('VW0025', 'O-Tenerife-6', '38-01-95-FD-97-72'),
('VW0026', 'O-CalaRatjada-1', 'FC-F1-36-10-4C-66'),
('VW0026', 'O-CalaRatjada-2', '5C-F6-DC-B7-10-3C'),
('VW0026', 'O-CalaRatjada-3', 'FC-F1-36-10-4C-5B'),
('VW0026', 'O-CalaRatjada-4', '5C-F6-DC-B7-10-2F'),
('VW0026', 'O-CalaRatjada-5', 'FC-F1-36-10-4C-6E'),
('VW0026', 'O-CalaRatjada-6', '5C-F6-DC-B7-10-28'),
('VW0027', 'O-WalaBCN-1', '14-BB-6E-E8-6B-38'),
('VW0027', 'O-WalaBCN-2', '14-BB-6E-E8-6B-50'),
('VW0027', 'O-WalaBCN-3', '14-BB-6E-E8-6B-47'),
('VW0028', 'O-ValenciaMN4-1', 'F8-77-B8-A4-D6-6A'),
('VW0028', 'O-ValenciaMN4-2', 'F8-77-B8-A4-D7-1F'),
('VW0028', 'O-ValenciaMN4-3', 'F8-77-B8-CB-AD-80'),
('VW0028', 'O-ValenciaMN4-4', 'F8-77-B8-A4-D6-66'),
('VW0028', 'O-ValenciaMN4-5', 'F8-77-B8-A4-D6-65'),
('VW0028', 'O-ValenciaMN4-6', 'F8-77-B8-A4-D6-39'),
('VW0029', 'O-Tafalla-1', 'CC-B1-1A-74-44-7D'),
('VW0029', 'O-Tafalla-2', 'CC-B1-1A-74-43-E4'),
('VW0029', 'O-Tafalla-3', 'CC-B1-1A-74-44-6E'),
('VW0030', 'VW-Ciutadella', 'CC-B1-1A-D6-B8-96'),
('VW0031', 'O-Alcudia-1', 'B8-BB-AF-01-B7-5E'),
('VW0031', 'O-Alcudia-2', 'B8-BB-AF-01-B6-F4'),
('VW0031', 'O-Alcudia-3', 'B8-BB-AF-01-B7-49'),
('VW0033', 'O-Olot-1', 'F8-3F-51-01-01-6A'),
('VW0033', 'O-Olot-2', 'F8-3F-51-01-01-64'),
('VW0033', 'O-Olot-3', 'F8-3F-51-01-01-77'),
('VW0034', 'O-Ejido-1', '38-01-95-AF-FE-07'),
('VW0034', 'O-Ejido-2', '38-01-95-5B-67-4A'),
('VW0034', 'O-Ejido-3', '38-01-95-FE-D3-C1'),
('VW0035', 'O-Terrassa-1', 'FE-F6-22-3F-B0-86'),
('VW0035', 'O-Terrassa-2', '40-16-3B-79-A8-D4'),
('VW0036', 'O-Igualada-1', 'D8-E0-E1-6C-28-AD'),
('VW0036', 'O-Igualada-2', 'D8-E0-E1-6C-28-B1'),
('VW0036', 'O-Igualada-3', 'D8-E0-E1-6C-28-B0'),
('VW0079', 'O-Calpe-1', '28-39-5E-F1-75-66'),
('VW0079', 'O-Calpe-2', '28-39-5E-F1-75-61'),
('VW0079', 'O-Calpe-3', '28-39-5E-05-7C-36'),
('VW0081', 'O-Empuriabrava-1', 'CC-6E-A4-6E-DD-69'),
('VW0081', 'O-Empuriabrava-2', 'CC-6E-A4-6E-DC-45'),
('VW0081', 'O-Empuriabrava-3', 'CC-6E-A4-6E-DD-7A'),
('VW0082', 'O-Inca-1', 'C0-48-E6-CA-4E-AF'),
('VW0082', 'O-Inca-2', 'C0-48-E6-88-AB-0C'),
('VW0082', 'O-Inca-3', 'C0-48-E6-CA-1D-97'),
('VW0084', 'VW-Inca', '10-77-B1-71-3A-0B'),
('VW0045', 'O-Sagunto-1-1', 'FC-8F-90-CF-7A-21'),
('VW0045', 'O-Sagunto-1-2', 'FC-8F-90-CF-7A-16'),
('VW0045', 'O-Sagunto-1-3', 'FC-8F-90-CF-7A-23'),
('VW0046', 'O-Sagunto-2-1', '78-BD-BC-E3-61-86'),
('VW0046', 'O-Sagunto-2-2', '78-BD-BC-E3-61-14'),
('VW0046', 'O-Sagunto-2-3', '78-BD-BC-E3-83-DE'),
('VW0047', 'O-Sagunto-3-1', '78-BD-BC-E3-61-87'),
('VW0047', 'O-Sagunto-3-2', '78-BD-BC-E3-61-75'),
('VW0047', 'O-Sagunto-3-3', '78-BD-BC-E3-61-1A'),
('VW0090', 'O-Fraga-1-1', 'D0-03-DF-71-81-E8'),
('VW0090', 'O-Fraga-1-2', 'D0-03-DF-72-EE-4F'),
('VW0090', 'O-Fraga-1-3', 'D0-03-DF-72-EF-1D'),
('VW0091', 'O-Fraga-2-1', 'FC-03-9F-A9-54-E1'),
('VW0091', 'O-Fraga-2-2', 'D0-03-DF-1B-DC-6A'),
('VW0091', 'O-Fraga-2-3', 'FC-03-9F-7B-DA-49'),
('VW0091', 'O-Fraga-2-4', 'D0-03-DF-71-82-0C'),
('VW0092', 'vw-OnlyFraga@ad', '80-EE-73-E2-19-32'),
('VW0094', 'O-Tarrega-1-1', '24-FC-E5-00-24-F1'),
('VW0094', 'O-Tarrega-1-2', '24-FC-E5-00-25-08'),
('VW0094', 'O-Tarrega-1-3', 'D0-03-DF-86-B3-B7'),
('VW0095', 'O-Tarrega-2-1', 'D0-03-DF-27-7E-15'),
('VW0095', 'O-Tarrega-2-2', 'D0-03-DF-27-7E-18'),
('VW0037', 'OAS-Terrassa-1', 'CC-B1-1A-22-52-07'),
('VW0037', 'OAS-Terrassa-2', 'CC-B1-1A-22-52-OA'),
('VW0037', 'OAS-Terrassa-3', 'CC-B1-1A-22-23-1A'),
('VW0038', 'OAS-Tafalla-1', '40-16-3B-41-F6-42'),
('VW0038', 'OAS-Tafalla-2', '40-16-3B-41-F5-9A'),
('VW0039', 'OAS-Lalin-1', '5C-49-7D-54-AE-92'),
('VW0039', 'OAS-Lalin-2', '5C-49-7D-1F-7D-9F'),
('VW0039', 'OAS-Lalin-3', '5C-49-7D-54-AE-A9'),
('VW0040', 'OAS-Tetuan-1', '5C- 49-7D-55-AB-AD'),
('VW0040', 'OAS-Tetuan-2', 'B8-BB-AF-02-4B-5E'),
('VW0040', 'OAS-Tetuan-3', 'B8-BB-AF-02-4B-6B'),
('VW0041', 'OAS-Igualada-1', 'D8-E0-E1-BF-AC-75'),
('VW0041', 'OAS-Igualada-2', 'D8-E0-E1-6C-3B-BE'),
('VW0041', 'OAS-Igualada-3', 'D8-E0-E1-BF-AC-91'),
('VW0042', 'OP-PlazaEliptica-1', 'B8-BB-AF-03-4B-CB'),
('VW0042', 'OP-PlazaEliptica-2', 'B8-BB-AF-03-24-84'),
('VW0042', 'OP-PlazaEliptica-3', 'B8-BB-AF-03-24-7D'),
('VW0043', 'O-Almeria-1', 'BC-14-85-1C-10-47'),
('VW0043', 'O-Almeria-2', 'BC-14-85-1C-10-63'),
('VW0043', 'O-Almeria-3', 'BC-14-85-1C-10-67'),
('VW0044', 'O-Manacor-1', 'BC-14-85-1A-A8-B3'),
('VW0044', 'O-Manacor-2', 'BC-14-85-1C-10-39'),
('VW0044', 'O-Manacor-3', 'BC-14-85-1C-10-57'),
('VW0048', 'O-Abrera-1-1', '38-01-95-5C-E1-F4'),
('VW0048', 'O-Abrera-1-2', '38-01-95-5C-E1-F9'),
('VW0048', 'O-Abrera-1-3', '38-01-95-5C-5C-28'),
('VW0049', 'O-Abrera-2-1', '78-BD-BC-EF-CA-1C'),
('VW0049', 'O-Abrera-2-2', '78-BD-BC-EF-CA-36'),
('VW0049', 'O-Abrera-2-3', '78-BD-BC-EF-CA-44'),
('VW0049', 'O-Abrera-2-4', '78-BD-BC-EF-CA-45'),
('VW0049', 'O-Abrera-2-5', '78-BD-BC-EF-CA-5D'),
('VW0049', 'O-Abrera-2-6', '78-BD-BC-EF-CA-55'),
('VW0050', 'O-GranVia2-1-1', '38-01-95-5C-2D-81'),
('VW0050', 'O-GranVia2-1-2', '38-01-95-5C-2D-A2'),
('VW0050', 'O-GranVia2-1-3', '38-01-95-5C-2D-78'),
('VW0050', 'O-GranVia2-1-4', '38-01-95-5C-2D-7E'),
('VW0050', 'O-GranVia2-1-5', '38-01-95-5C-2D-76'),
('VW0050', 'O-GranVia2-1-6', '38-01-95-5C-2D-7D'),
('VW0051', 'O-GranVia2-2-1', '38-01-95-5C-2D-8C'),
('VW0051', 'O-GranVia2-2-2', '38-01-95-5C-2D-89'),
('VW0051', 'O-GranVia2-2-3', '38-01-95-5C-2D-80'),
('VW0051', 'O-GranVia2-2-4', '38-01-95-5C-2D-9B'),
('VW0051', 'O-GranVia2-2-5', '38-01-95-5C-2D-7C'),
('VW0051', 'O-GranVia2-2-6', '38-01-95-FD-76-EB'),
('VW0052', 'O-Lanzarote-1-1', '14-BB-6E-44-28-F5'),
('VW0052', 'O-Lanzarote-1-2', '38-01-95-B1-59-94'),
('VW0052', 'O-Lanzarote-1-3', 'FC-F1-36-F3-23-FA'),
('VW0053', 'O-Lanzarote-2-1', '14-BB-6E-5E-60-21'),
('VW0053', 'O-Lanzarote-2-2', '14-BB-6E-5E-60-35'),
('VW0053', 'O-Lanzarote-2-3', '14-BB-6E-5E-60-D8'),
('VW0053', 'O-Lanzarote-2-4', '14-BB-6E-5E-60-3B'),
('VW0053', 'O-Lanzarote-2-5', '14-BB-6E-5E-60-48'),
('VW0053', 'O-Lanzarote-2-6', '14-BB-6E-5E-60-1D'),
('VW0054', 'ONLY-PuntaReina-1-1', '14-BB-6E-46-A6-91'),
('VW0054', 'ONLY-PuntaReina-1-2', '38-01-95-B0-EF-F5'),
('VW0054', 'ONLY-PuntaReina-1-3', '38-01-95-B1-59-8E'),
('VW0055', 'ONLY-PuntaReina-2-1', '14-BB-6E-44-24-55'),
('VW0055', 'ONLY-PuntaReina-2-2', '14-BB-6E-44-24-77'),
('VW0055', 'ONLY-PuntaReina-2-3', '38-01-95-B0-EF-F6'),
('VW0056', 'ONLY-PuntaReina-3-1', '38-01-95-B0-EF-F3'),
('VW0056', 'ONLY-PuntaReina-3-2', '14-BB-6E-44-24-59'),
('VW0056', 'ONLY-PuntaReina-3-3', '14-BB-6E-44-28-61'),
('VW0057', 'O-SmukLleida-1', 'CC-B1-1A-22-23-1C'),
('VW0057', 'O-SmukLleida-2', 'CC-B1-1A-22-23-51'),
('VW0057', 'O-SmukLleida-3', 'CC-B1-1A-22-23-54'),
('VW0058', 'VW-Tafalla', 'CC-B1-1A-D6-C4-4E'),
('VW0059', 'O-PlazaEliptica-1-1', '40-16-3B-42-B6-4E'),
('VW0059', 'O-PlazaEliptica-1-2', '40-16-3B-42-B6-48'),
('VW0059', 'O-PlazaEliptica-1-3', '40-16-3B-42-B6-5D'),
('VW0060', 'O-PlazaEliptica-2-1', 'B8-BB-AF-01-F1-1D'),
('VW0060', 'O-PlazaEliptica-2-2', 'B8-BB-AF-03-24-86'),
('VW0060', 'O-PlazaEliptica-2-3', 'B8-BB-AF-03-4C-E0'),
('VW0099', 'O-PlazaEliptica-3-1', '64-e7-d8-e5-81-f2'),
('VW0099', 'O-PlazaEliptica-3-2', '64-e7-d8-e5-81-eb'),
('VW0099', 'O-PlazaEliptica-3-3', '64-e7-d8-e5-81-ed'),
('VW0061', 'OAS-Manresa-1-1', 'FC-F1-36-9F-86-A0'),
('VW0061', 'OAS-Manresa-1-2', 'FC-F1-36-79-7C-6B'),
('VW0061', 'OAS-Manresa-1-3', 'FC-F1-36-79-7C-86'),
('VW0062', 'O-Manresa-2-1', 'B8-BB-AF-03-A6-10'),
('VW0062', 'O-Manresa-2-2', 'B8-BB-AF-03-A6-A9'),
('VW0062', 'O-Manresa-2-3', 'B8-BB-AF-03-A6-B0'),
('VW0063', 'O-Manresa-3-1', '40-16-3B-76-BA-1B'),
('VW0063', 'O-Manresa-3-2', '40-16-3B-76-BA-5C'),
('VW0063', 'O-Manresa-3-3', 'FC-F1-36-56-9E-8B'),
('VW0064', 'O-Malaga-1', '5C-49-7D-55-AB-AC'),
('VW0064', 'O-Malaga-2', '5C-49-7D-55-AC-DF'),
('VW0064', 'O-Malaga-3', '5C-49-7D-D0-EF-91'),
('VW0080', 'O-Balaguer-1', '9C-8C-6E-AB-C3-B8'),
('VW0080', 'O-Balaguer-2', '9C-8C-6E-AB-C3-1E'),
('VW0080', 'O-Balaguer-3', '9C-8C-6E-AB-C3-BF'),
('VW0065', 'V-Mogan-1', 'FC-8F-90-CF-7A-0C'),
('VW0065', 'V-Mogan-2', 'FC-8F-90-CF-7A-2C'),
('VW0065', 'V-Mogan-3', 'FC-8F-90-CF-7A-05'),
('VW0066', 'V-Vic-1', 'FC-F1-36-55-D2-A9'),
('VW0066', 'V-Vic-2', 'FC-F1-36-0E-BF-5D'),
('VW0066', 'V-Vic-3', 'FC-F1-36-0F-3E-6A'),
('VW0067', 'V-Alcudia-1', '38-01-95-FD-98-75'),
('VW0067', 'V-Alcudia-2', '38-01-95-FD-97-CA'),
('VW0067', 'V-Alcudia-3', '38-01-95-B1-58-CA'),
('VW0068', 'VILA-Sagunto-1', '78-BD-BC-E3-61-86'),
('VW0068', 'VILA-Sagunto-2', '78-BD-BC-E3-61-1A'),
('VW0068', 'VILA-Sagunto-3', '78-BD-BC-E3-61-14'),
('VW0068', 'VILA-Sagunto-4', '78-BD-BC-E3-61-87'),
('VW0068', 'VILA-Sagunto-5', '78-BD-BC-E3-61-75'),
('VW0068', 'VILA-Sagunto-6', '78-BD-BC-E3-61-DE'),
('VW0069', 'NAMEIT-Figueres', '14-BB-6E-49-E7-6E'),
('VW0070', 'NAMEIT-Milko-1', '68-27-37-A8-27-09'),
('VW0070', 'NAMEIT-Milko-2', 'F8-3F-51-FE-F0-65'),
('VW0070', 'NAMEIT-Milko-3', '68-27-37-A8-27-71'),
('VW0071', 'O-ECIPCatalunya-1', 'FC-F1-36-9F-86-99'),
('VW0071', 'O-ECIPCatalunya-2', 'FC-F1-36-7B-85-7C'),
('VW0071', 'O-ECIPCatalunya-3', 'D8-E0-E1-63-24-DF'),
('VW0072', 'O-ECIDiagonal-1', '40-16-3B-41-F5-CB'),
('VW0072', 'O-ECIDiagonal-2', '40-16-3B-41-F5-B4'),
('VW0073', 'OAS-ECIParqueSur-1', 'B8-BB-AF-01-B6-E9'),
('VW0073', 'OAS-ECIParqueSur-2', 'B8-BB-AF-01-B6-F8'),
('VW0074', 'OAS-ECIValladolid-1', 'B8-BB-AF-03-4B-C9'),
('VW0074', 'OAS-ECIValladolid-2', 'B8-BB-AF-03-4C-54'),
('VW0074', 'OAS-ECIValladolid-3', 'B8-BB-AF-03-4C-94'),
('VW0075', 'OAS-ECIPintorSorolla-1', '68-27-37-2C-9F-50'),
('VW0075', 'OAS-ECIPintorSorolla-2', '68-27-37-2C-9F-4B'),
('VW0075', 'VW-Gruptis', '10-77-B1-71-4C-97');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LlistaRepr`
--

CREATE TABLE `LlistaRepr` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `LlistaRepr`
--

INSERT INTO `LlistaRepr` (`id`, `descripcio`) VALUES
(1, 'Llista auctudsbd'),
(2, 'kkh 2022'),
(4, 'TheMen 2022'),
(5, 'Llista Proba 2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LlistesContingut`
--

CREATE TABLE `LlistesContingut` (
  `id` int(11) NOT NULL,
  `idLlistes` int(11) NOT NULL,
  `idContingut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `LlistesContingut`
--

INSERT INTO `LlistesContingut` (`id`, `idLlistes`, `idContingut`) VALUES
(4, 2, 4),
(5, 2, 1),
(14, 1, 2),
(15, 1, 2),
(16, 1, 3),
(17, 1, 9),
(18, 1, 6),
(19, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LlistesProgramacions`
--

CREATE TABLE `LlistesProgramacions` (
  `id` int(11) NOT NULL,
  `idProgramacio` int(11) NOT NULL,
  `idLlistes` int(11) NOT NULL,
  `dataInici` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL,
  `inconvenients` varchar(200) NOT NULL,
  `activa` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `LlistesProgramacions`
--

INSERT INTO `LlistesProgramacions` (`id`, `idProgramacio`, `idLlistes`, `dataInici`, `dataFinal`, `inconvenients`, `activa`) VALUES
(4, 3, 5, '2022-04-15', '2022-10-25', 'Molt Be gracies', 0),
(5, 4, 4, '2022-04-14', '2025-04-15', 'Pot tenir Problemes.', 0),
(6, 3, 4, '2022-04-15', '2022-10-25', 'Molt Be gracies', 0),
(7, 4, 1, '2022-04-14', '2025-04-15', 'Pot tenir Problemes.', 0),
(8, 3, 2, '2022-04-15', '2022-10-25', 'Molt Be gracies', 0),
(9, 4, 2, '2022-04-14', '2025-04-15', 'Pot tenir Problemes.', 1),
(10, 3, 4, '2022-04-15', '2022-10-25', 'Molt Be gracies', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marcas`
--

CREATE TABLE `Marcas` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Marcas`
--

INSERT INTO `Marcas` (`id`, `descripcio`) VALUES
(1, 'ONLY'),
(2, 'ONLY & SONS'),
(3, 'JACK & JONES'),
(4, 'NAME IT'),
(5, 'VILA'),
(6, 'VERO MODA'),
(7, 'POSITIVO MAN'),
(8, 'SUPERDRY'),
(9, 'MUNICH'),
(10, 'GOORIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MarcasVideowall`
--

CREATE TABLE `MarcasVideowall` (
  `id` int(11) NOT NULL,
  `NSVW` varchar(20) NOT NULL,
  `idMarcas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `MarcasVideowall`
--

INSERT INTO `MarcasVideowall` (`id`, `NSVW`, `idMarcas`) VALUES
(23, 'VW0001', 1),
(24, 'VW0001', 7),
(25, 'VW0001', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertesEsp`
--

CREATE TABLE `ofertesEsp` (
  `id` int(11) NOT NULL,
  `descOferta` varchar(200) NOT NULL,
  `idBotiga` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `idLlistaRepr` int(11) NOT NULL,
  `cobrat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Programacions`
--

CREATE TABLE `Programacions` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL,
  `idTipusContingut` int(11) NOT NULL,
  `observacions` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Programacions`
--

INSERT INTO `Programacions` (`id`, `descripcio`, `idTipusContingut`, `observacions`) VALUES
(3, 'Programacio Final 5', 2, 'Hola que tal? Molt BE.'),
(4, 'Programacio 2', 3, 'Es una observacio.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipusContingut`
--

CREATE TABLE `TipusContingut` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TipusContingut`
--

INSERT INTO `TipusContingut` (`id`, `descripcio`) VALUES
(1, 'TipusContingut1'),
(2, 'grup2'),
(3, 'Nou Contingut');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipusFormat`
--

CREATE TABLE `TipusFormat` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TipusFormat`
--

INSERT INTO `TipusFormat` (`id`, `descripcio`) VALUES
(1, 'H1'),
(2, '2xH1'),
(3, 'H1x3'),
(4, 'H2x2'),
(5, 'H2x3'),
(6, 'H3x1'),
(7, 'H4x1'),
(8, 'H5x1'),
(9, 'L1x2'),
(10, 'L1x3'),
(11, 'L2x1'),
(12, 'L2x3'),
(13, 'L2x4'),
(14, 'V1'),
(15, 'V1x2'),
(16, 'V3x1'),
(17, 'L2x1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Videowall`
--

CREATE TABLE `Videowall` (
  `NSVW` varchar(20) NOT NULL,
  `descripcio` varchar(200) NOT NULL,
  `idGrup` int(11) NOT NULL,
  `idTipusFormat` int(11) NOT NULL,
  `idContracte` int(11) DEFAULT NULL,
  `idClient` int(5) NOT NULL,
  `idBotiga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Videowall`
--

INSERT INTO `Videowall` (`NSVW`, `descripcio`, `idGrup`, `idTipusFormat`, `idContracte`, `idClient`, `idBotiga`) VALUES
('VW0000', 'VW-Gruptis', 1, 17, NULL, 1, NULL),
('VW0001', 'MM Balsells Vinaros 2', 5, 13, 1, 834, 1),
('VW0002', 'MM Seven Viladecans', 2, 8, NULL, 836, NULL),
('VW0003', 'MM Positivo 1', 2, 15, NULL, 1025, NULL),
('VW0004', 'MM Positivo 2', 2, 15, NULL, 1025, NULL),
('VW0005', 'MM Positivo 3', 2, 8, NULL, 1025, NULL),
('VW0006', 'MM Can Picafort 1 LED (Only)', 2, 12, NULL, 946, NULL),
('VW0007', 'MM Can Picafort 2 LED (JJ)', 2, 12, NULL, 946, NULL),
('VW0010', 'O PD Cerdanyola', 3, 16, NULL, 949, NULL),
('VW0011', 'O PD La Puebla Burgos', 3, 16, NULL, 940, NULL),
('VW0013', 'ONLY Madrid Deleite', 3, 16, NULL, 955, NULL),
('VW0015', 'O PD Reus', 3, 16, NULL, 951, NULL),
('VW0016', 'O PD Lalin', 3, 16, NULL, 907, NULL),
('VW0017', 'O PD Baricentro', 3, 5, NULL, 958, NULL),
('VW0018', 'O PD Magic', 3, 5, NULL, 958, NULL),
('VW0022', 'O PD Calella', 3, 3, NULL, 994, NULL),
('VW0024', 'O PD Vic', 3, 5, NULL, 1008, NULL),
('VW0025', 'O PD Tenerife', 3, 5, NULL, 1000, NULL),
('VW0026', 'O PD Cala Ratjada', 3, 5, NULL, 946, NULL),
('VW0027', 'O PD Wala BCN', 3, 14, NULL, 897, NULL),
('VW0029', 'O PD Tafalla', 3, 16, NULL, 867, NULL),
('VW0030', 'O PD Ciutadella LED', 3, 5, NULL, 864, NULL),
('VW0031', 'O PD Alcudia', 3, 3, NULL, 1063, NULL),
('VW0032', 'MM Lanzarote 1', 2, 16, NULL, 1006, NULL),
('VW0033', 'O PD Olot', 3, 16, NULL, 842, NULL),
('VW0035', 'O PD Terrassa', 3, 15, NULL, 994, NULL),
('VW0036', 'O PD Igualada', 3, 16, NULL, 943, NULL),
('VW0038', 'OAS PD Tafalla 1', 4, 2, NULL, 867, NULL),
('VW0039', 'OAS PD Lalin', 4, 16, NULL, 907, NULL),
('VW0041', 'OAS PD Igualada', 4, 16, NULL, 1070, NULL),
('VW0043', 'O-OAS Almeria', 5, 16, NULL, 938, NULL),
('VW0044', 'O-OAS Manacor', 5, 16, NULL, 852, NULL),
('VW0048', 'O-OAS Abrera 1', 5, 16, NULL, 958, NULL),
('VW0049', 'O-OAS Abrera 2', 5, 5, NULL, 958, NULL),
('VW0050', 'O-OAS Gran Via 2 1', 5, 5, NULL, 958, NULL),
('VW0051', 'O-OAS Gran Via 2 2', 5, 5, NULL, 958, NULL),
('VW0052', 'O-OAS Lanzarote 1', 5, 16, NULL, 1006, NULL),
('VW0053', 'O-OAS Lanzarote 2', 5, 5, NULL, 1006, NULL),
('VW0057', 'O-OAS Smuk Lleida', 5, 16, NULL, 897, NULL),
('VW0058', 'O-OAS Tafalla LED', 5, 12, NULL, 867, NULL),
('VW0059', 'O-OAS Plaza Elíptica 1', 3, 16, NULL, 1054, NULL),
('VW0060', 'O-OAS Plaza Eliptica 2', 4, 3, NULL, 1054, NULL),
('VW0061', 'OAS Manresa 1', 4, 6, NULL, 817, NULL),
('VW0062', 'O-OAS Manresa 2', 5, 16, NULL, 817, NULL),
('VW0063', 'O Manresa 3', 3, 6, NULL, 817, NULL),
('VW0071', 'O ECI Plaza Cataluña', 9, 3, NULL, 822, NULL),
('VW0072', 'O PD ECI Diagonal', 9, 15, NULL, 822, NULL),
('VW0073', 'OAS PD ECI Parque Sur', 9, 15, NULL, 822, NULL),
('VW0074', 'OAS PD ECI Valladolid', 9, 3, NULL, 822, NULL),
('VW0075', 'OAS PD ECI Pintor Sorolla', 9, 15, NULL, 822, NULL),
('VW0076', 'MM Positivo Manresa 2', 2, 15, NULL, 1025, NULL),
('VW0077', 'MM Positivo Manresa 3', 2, 15, NULL, 1025, NULL),
('VW0078', 'MM Positivo Manresa 1', 2, 8, NULL, 1025, NULL),
('VW0080', 'O-OAS Balaguer', 5, 16, NULL, 907, NULL),
('VW0081', 'O PD Empuriabrava', 3, 16, NULL, 1108, NULL),
('VW0082', 'O PD Inca', 3, 16, NULL, 946, NULL),
('VW0083', 'MM Pollença LED', 2, 13, NULL, 946, NULL),
('VW0084', 'O PD Inca LED', 3, 10, NULL, 946, NULL),
('VW0085', 'MM Positivo Valls', 2, 15, NULL, 1025, NULL),
('VW0086', 'MM Positivo Tarrega', 2, 15, NULL, 1025, NULL),
('VW0087', 'MM Positivo Martorell', 2, 15, NULL, 1025, NULL),
('VW0088', 'MM Positivo Esparraguera', 2, 15, NULL, 1025, NULL),
('VW0089', 'MM Positivo Olesa', 2, 15, NULL, 1025, NULL),
('VW0090', 'O Fraga 1', 3, 16, NULL, 907, NULL),
('VW0091', 'O Fraga 2', 3, 7, NULL, 907, NULL),
('VW0092', 'O Fraga LED', 3, 12, NULL, 907, NULL),
('VW0093', 'MM Aima SA', 2, 4, NULL, 1136, NULL),
('VW0094', 'O Tarrega 1', 3, 6, NULL, 907, NULL),
('VW0095', 'O Tarrega 2', 3, 15, NULL, 907, NULL),
('VW0096', 'MM Positivo Paddock', 2, 8, NULL, 1025, NULL),
('VW0097', 'MM Positivo Paddock - 2', 2, 15, NULL, 1025, NULL),
('VW0098', 'MM Lanzarote LED', 2, 9, NULL, 1006, NULL),
('VW0099', 'O-OAS Plaza Eliptica 3', 4, 3, NULL, 1054, NULL),
('VW0100', 'MM Positivo Mollerussa', 2, 15, NULL, 1025, NULL),
('VW0101', 'MM Positivo Outlet', 2, 15, NULL, 1025, NULL),
('VW102', 'MM Positivo Gava', 2, 15, NULL, 1025, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VideowallProgramacio`
--

CREATE TABLE `VideowallProgramacio` (
  `id` int(11) NOT NULL,
  `NSVW` varchar(20) NOT NULL,
  `idProgramacio` int(11) NOT NULL,
  `activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `VideowallProgramacio`
--

INSERT INTO `VideowallProgramacio` (`id`, `NSVW`, `idProgramacio`, `activa`) VALUES
(2, 'VW0010', 3, 0),
(3, 'VW0005', 4, 1),
(4, 'VW0006', 3, 0),
(5, 'VW0011', 3, 0),
(6, 'VW0011', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Botigues`
--
ALTER TABLE `Botigues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkBotigues_idComunitatComunitat` (`idComunitat`);

--
-- Indices de la tabla `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Comunitat`
--
ALTER TABLE `Comunitat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Contingut`
--
ALTER TABLE `Contingut`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Contractes`
--
ALTER TABLE `Contractes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Dispositiu`
--
ALTER TABLE `Dispositiu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkDispositiu_NSVWVideowall` (`NSVW`);

--
-- Indices de la tabla `Grups`
--
ALTER TABLE `Grups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `LlistaRepr`
--
ALTER TABLE `LlistaRepr`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `LlistesContingut`
--
ALTER TABLE `LlistesContingut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkLlistesContingut_idLlistesLlistesRepr` (`idLlistes`),
  ADD KEY `fkLlistesContingut_idContingutContingut` (`idContingut`);

--
-- Indices de la tabla `LlistesProgramacions`
--
ALTER TABLE `LlistesProgramacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkLlistesProgramacions_idProgramacioProgramacions` (`idProgramacio`),
  ADD KEY `fkLlistesProgramacions_idLlistesLlistesRepr` (`idLlistes`);

--
-- Indices de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MarcasVideowall`
--
ALTER TABLE `MarcasVideowall`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkMarcasVideowall_NSVWVideowall` (`NSVW`),
  ADD KEY `fkMarcasVideowall_idMarcasMarcas` (`idMarcas`);

--
-- Indices de la tabla `ofertesEsp`
--
ALTER TABLE `ofertesEsp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkOfertesEsp_idComunitatComunitat` (`idBotiga`),
  ADD KEY `fkOfertesEsp_idLlistaReprLlistaRepr` (`idLlistaRepr`);

--
-- Indices de la tabla `Programacions`
--
ALTER TABLE `Programacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkProgramacions_idTipusContingutTipusContingut` (`idTipusContingut`);

--
-- Indices de la tabla `TipusContingut`
--
ALTER TABLE `TipusContingut`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `TipusFormat`
--
ALTER TABLE `TipusFormat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Videowall`
--
ALTER TABLE `Videowall`
  ADD PRIMARY KEY (`NSVW`),
  ADD KEY `fkVideowall_idGrupGrups` (`idGrup`),
  ADD KEY `fkVideowall_idContracteContractes` (`idContracte`),
  ADD KEY `fkVideowall_idClientClient` (`idClient`),
  ADD KEY `fkVideowall_idBotigaBotigues` (`idBotiga`),
  ADD KEY `fkVideowall_idTipusFormatTipusFormat` (`idTipusFormat`) USING BTREE;

--
-- Indices de la tabla `VideowallProgramacio`
--
ALTER TABLE `VideowallProgramacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkVideowallProgramacio_NSVWVideowall` (`NSVW`),
  ADD KEY `fkVideowallProgramacio_idProgramacioProgramacions` (`idProgramacio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Botigues`
--
ALTER TABLE `Botigues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Comunitat`
--
ALTER TABLE `Comunitat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Contingut`
--
ALTER TABLE `Contingut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `Contractes`
--
ALTER TABLE `Contractes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Dispositiu`
--
ALTER TABLE `Dispositiu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT de la tabla `Grups`
--
ALTER TABLE `Grups`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `LlistaRepr`
--
ALTER TABLE `LlistaRepr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `LlistesContingut`
--
ALTER TABLE `LlistesContingut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `LlistesProgramacions`
--
ALTER TABLE `LlistesProgramacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `MarcasVideowall`
--
ALTER TABLE `MarcasVideowall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ofertesEsp`
--
ALTER TABLE `ofertesEsp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Programacions`
--
ALTER TABLE `Programacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `TipusContingut`
--
ALTER TABLE `TipusContingut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `TipusFormat`
--
ALTER TABLE `TipusFormat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `VideowallProgramacio`
--
ALTER TABLE `VideowallProgramacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Botigues`
--
ALTER TABLE `Botigues`
  ADD CONSTRAINT `fkBotigues_idComunitatComunitat` FOREIGN KEY (`idComunitat`) REFERENCES `Comunitat` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Dispositiu`
--
ALTER TABLE `Dispositiu`
  ADD CONSTRAINT `fkDispositiu_NSVWVideowall` FOREIGN KEY (`NSVW`) REFERENCES `Videowall` (`NSVW`);

--
-- Filtros para la tabla `LlistesContingut`
--
ALTER TABLE `LlistesContingut`
  ADD CONSTRAINT `fkLlistesContingut_idContingutContingut` FOREIGN KEY (`idContingut`) REFERENCES `Contingut` (`id`),
  ADD CONSTRAINT `fkLlistesContingut_idLlistesLlistesRepr` FOREIGN KEY (`idLlistes`) REFERENCES `LlistaRepr` (`id`);

--
-- Filtros para la tabla `LlistesProgramacions`
--
ALTER TABLE `LlistesProgramacions`
  ADD CONSTRAINT `fkLlistesProgramacions_idLlistesLlistesRepr` FOREIGN KEY (`idLlistes`) REFERENCES `LlistaRepr` (`id`),
  ADD CONSTRAINT `fkLlistesProgramacions_idProgramacioProgramacions` FOREIGN KEY (`idProgramacio`) REFERENCES `Programacions` (`id`);

--
-- Filtros para la tabla `MarcasVideowall`
--
ALTER TABLE `MarcasVideowall`
  ADD CONSTRAINT `fkMarcasVideowall_NSVWVideowall` FOREIGN KEY (`NSVW`) REFERENCES `Videowall` (`NSVW`),
  ADD CONSTRAINT `fkMarcasVideowall_idMarcasMarcas` FOREIGN KEY (`idMarcas`) REFERENCES `Marcas` (`id`);

--
-- Filtros para la tabla `ofertesEsp`
--
ALTER TABLE `ofertesEsp`
  ADD CONSTRAINT `fkOfertesEsp_idComunitatComunitat` FOREIGN KEY (`idBotiga`) REFERENCES `Botigues` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkOfertesEsp_idLlistaReprLlistaRepr` FOREIGN KEY (`idLlistaRepr`) REFERENCES `LlistaRepr` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `Programacions`
--
ALTER TABLE `Programacions`
  ADD CONSTRAINT `fkProgramacions_idTipusContingutTipusContingut` FOREIGN KEY (`idTipusContingut`) REFERENCES `TipusContingut` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Videowall`
--
ALTER TABLE `Videowall`
  ADD CONSTRAINT `fkVideowall_idBotigaBotigues` FOREIGN KEY (`idBotiga`) REFERENCES `Botigues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVideowall_idClientClient` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVideowall_idContracteContractes` FOREIGN KEY (`idContracte`) REFERENCES `Contractes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVideowall_idGrupGrups` FOREIGN KEY (`idGrup`) REFERENCES `Grups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVideowall_idTipsuFormarTipusFormat` FOREIGN KEY (`idTipusFormat`) REFERENCES `TipusFormat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `VideowallProgramacio`
--
ALTER TABLE `VideowallProgramacio`
  ADD CONSTRAINT `fkVideowallProgramacio_NSVWVideowall` FOREIGN KEY (`NSVW`) REFERENCES `Videowall` (`NSVW`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkVideowallProgramacio_idProgramacioProgramacions` FOREIGN KEY (`idProgramacio`) REFERENCES `Programacions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

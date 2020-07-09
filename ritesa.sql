-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2020 a las 00:13:04
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ritesa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion`
--

CREATE TABLE `administracion` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio_precios`
--

CREATE TABLE `cambio_precios` (
  `id` int(11) NOT NULL,
  `precio_anterior` int(11) NOT NULL,
  `precio_actual` int(11) NOT NULL,
  `usuario_administracion` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `rut` varchar(50) NOT NULL,
  `fono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `rut`, `fono`, `email`, `clave`, `region`, `comuna`, `direccion`, `estado`) VALUES
(1, 'Brandon', 'Moreno', '19019032-3', 947935273, 'b.m.balboa@hotmail.com', '12', 'VI', 'Machali', 'Camino el llano villa doña maria #777', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `ruta_imagen` varchar(50) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id`, `nombre`, `estado`, `ruta_imagen`, `imagen`, `url`, `id_producto`) VALUES
(1, 'ARTICULO ASEO', 1, './img/familia/', 'ArticuloAseo.jpg', 'ArticuloAseo.php', NULL),
(2, 'BOLSAS', 1, './img/familia/', 'bolsas.jpg', 'Bolsas.php', NULL),
(3, 'CARTONES', 1, './img/familia/', 'cartones.jpg', 'Cartones.php', NULL),
(4, 'CONTENEDOR ALUMINIO', 1, './img/familia/', 'aluminio.png', 'ContenedorAluminio.php', NULL),
(5, 'CONTENEDOR PLASTICO', 1, './img/familia/', 'plastico.png', 'ContenedorPlastico.php', NULL),
(6, 'DISPENSADOR', 1, './img/familia/', 'dispensador.png', 'Dispensador.php', NULL),
(7, 'ETIQUETAS', 1, './img/familia/', 'etiquetas.jpg', 'Etiquetas.php', NULL),
(8, 'FILMS', 1, './img/familia/', 'films.jpg', 'Films.php', NULL),
(9, 'PAPEL TISSUE', 1, './img/familia/', 'papeltissue.png', 'PapelTissue.php', NULL),
(10, 'PAPELES', 1, './img/familia/', 'papel.png', 'Papeles.php', NULL),
(11, 'PLATO - BANDEJA', 1, './img/familia/', 'bandeja.png', 'PlatoBandeja.php', NULL),
(12, 'QUIMICOS', 1, './img/familia/', 'quimico.jpg', 'Quimicos.php', NULL),
(13, 'SERVICIOS', 1, './img/familia/', 'servicio.jpg', 'Servicios.php', NULL),
(14, 'USO PERSONAL', 1, './img/familia/', 'personal.jpg', 'UsoPersonal.php', NULL),
(15, 'VASOS', 1, './img/familia/', 'vaso.png', 'Vasos.php', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `numero_pedido` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `rut_cliente` varchar(50) NOT NULL,
  `region_cliente` varchar(50) NOT NULL,
  `comuna_cliente` varchar(50) NOT NULL,
  `direccion_cliente` varchar(50) NOT NULL,
  `fono_cliente` int(11) NOT NULL,
  `email_cliente` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cantidad_paquete` int(11) NOT NULL,
  `ruta_imagen` varchar(50) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `familia` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `cantidad_paquete`, `ruta_imagen`, `imagen`, `precio`, `familia`, `estado`) VALUES
(1, 'BANDEJA 1S 1X400', 400, './img/productos/', '20200220223319.jpg', 38, 11, 1),
(2, 'BANDEJA 2S 1X600', 600, './img/productos/', '20200220223328.jpg', 65, 11, 1),
(3, 'BANDEJA 4S 1X500', 500, './img/productos/', '20200220223403.jpg', 38, 11, 1),
(4, 'PORTA SANDWICH  DARNEL 1X500', 500, './img/productos/', '20200625174504.png', 43, 11, 1),
(5, 'PORTA SANDWICH  1X200', 200, './img/productos/', '20200220224231.jpg', 61, 11, 1),
(6, 'PORTA HOT DOG CHI. 1X200', 200, './img/productos/', '20200220130328.jpg', 47, 11, 1),
(7, 'PORTA HOT DOG GRANDE 1X200', 200, './img/productos/', '20200220130310.jpg', 87, 11, 1),
(8, 'MARMITAS 1X100', 100, './img/productos/', '20200220224026.jpg', 83, 11, 1),
(9, '205 CON DIV. 1X200', 200, './img/productos/', '20200220122520.jpg', 59, 11, 1),
(10, '205 SIN DIV. 1X200', 200, './img/productos/', '20200220123718.jpg', 59, 11, 1),
(11, 'CT-1 1x100', 100, './img/productos/', '20200220124351.jpg', 114, 11, 1),
(12, 'CT-3 1x200', 200, './img/productos/', '20200220124328.jpg', 118, 11, 1),
(13, 'CT-5 C/D ', 200, './img/productos/', '20200625172100.png', 50, 11, 1),
(14, 'CT-5 S/D 1X200', 200, './img/productos/', '20200625171944.png', 62, 11, 1),
(15, 'TACOS 22X 30 1x100 1x1000 ', 1, './img/productos/', '20200429171543.jpg', 4, 2, 1),
(16, 'PULLPACK 35X50 1x4', 1, './img/productos/', '20200222000801.jpg', 5625, 2, 1),
(17, 'PULL-PACK 40X60 1x4', 1, './img/productos/', '20200222000826.jpg', 6408, 2, 1),
(18, 'PREP. LAMINA 20X30 Kg.', 1, './img/productos/', '20200509232221.jpg', 2302, 2, 1),
(19, 'PREP. LAMINA 40X60 Kg.', 1, './img/productos/', '20200509232327.jpg', 2302, 2, 1),
(20, 'PREP.LAMINA 50X70 Kg.', 1, './img/productos/', '20200509232503.jpg', 2302, 2, 1),
(21, 'PREP.LAMINA 60X90 Kg.', 1, './img/productos/', '20200222000053.jpg', 2302, 2, 1),
(22, 'PREPICADO 20x30 Kg.', 1, './img/productos/', '20200509232538.jpg', 2302, 2, 1),
(23, 'PREPICADO 25x35 Kg.', 1, './img/productos/', '20200509232607.jpg', 2302, 2, 1),
(24, 'PREPICADO 30x40 Kg.', 1, './img/productos/', '20200509232633.jpg', 2302, 2, 1),
(25, 'PREPICADO 35x50 Kg.', 1, './img/productos/', '20200509232713.jpg', 2302, 2, 1),
(26, 'PREPICADO 40x60 Kg.', 1, './img/productos/', '20200509232742.jpg', 2302, 2, 1),
(27, 'PREPICADO 50x70 Kg.', 1, './img/productos/', '20200509232839.jpg', 2302, 2, 1),
(28, 'PREPICADO 60x90 Kg.', 1, './img/productos/', '20200509232911.jpg', 2302, 2, 1),
(29, 'PREPICADO 70X150 Kg.', 1, './img/productos/', '20200509232946.jpg', 2650, 2, 1),
(30, 'CAMISETA 35X40 10.000 UN.', 0, './img/productos/', '20200221232051.jpg', 6, 2, 1),
(31, 'CAMISETA 33X40 1X100 NEGRA', 0, './img/productos/', '', 0, 2, 0),
(32, 'CAMISETA 35X45 1x100 8000 UN', 1, './img/productos/', '20200302234326.jpg', 8, 2, 1),
(33, 'CAMISETA 35X45 1X100 NEGRA', 0, './img/productos/', '', 0, 2, 0),
(34, 'CAMISETA 35X55 1X100 BOTILLERIA ', 0, './img/productos/', '', 0, 2, 0),
(35, 'CAMISETA 40X50 1x100 5000 UN.', 1, './img/productos/', '20200429181423.jpg', 9, 2, 1),
(36, 'CAMISETA 40X50 1X100 BOTILLERIA', 1, './img/productos/', '20200626122135.png', 14, 2, 1),
(37, 'CAMISETA 40x50 20 MC. 1x100 4000 UN.', 1, './img/productos/', '20200626122029.png', 14, 2, 1),
(38, 'CAMISETA 40x50 22 MC. 1x100', 0, './img/productos/', '', 0, 2, 0),
(39, 'CAMISETA 50x60 1x100 2500 UN.', 1, './img/productos/', '20200429181612.jpg', 20, 2, 1),
(40, 'CAMISETA 50X60 1X100 NEGRA', 0, './img/productos/', '', 0, 2, 0),
(41, 'CAMISETA 50x60 20MC. 1x100', 0, './img/productos/', '', 0, 2, 0),
(42, 'CAMISETA 60x70 1x100', 0, './img/productos/', '', 0, 2, 0),
(43, 'CAMISETA 60X70 1X100 20 MC', 0, './img/productos/', '', 0, 2, 0),
(44, 'BASURA 50X70 1X10 ', 1, './img/productos/', '20200429165509.jpg', 37, 2, 1),
(45, 'BASURA 70X90 1X10', 1, './img/productos/', '20200429165722.jpg', 85, 2, 1),
(46, 'BASURA 70X90 GRUESA 1X10', 1, './img/productos/', '20200429165813.jpg', 110, 2, 1),
(47, 'BASURA 80X110 1X10 35mc.', 1, './img/productos/', '20200429165859.jpg', 106, 2, 1),
(48, 'BASURA 80X110 1X10 80mc.', 1, './img/productos/', '20200429165938.jpg', 188, 2, 1),
(49, 'BASURA 90X110 1X10 80mc.', 1, './img/productos/', '20200429170005.jpg', 202, 2, 1),
(50, 'BASURA 90X110 1X10 100mc.', 1, './img/productos/', '20200429170020.jpg', 221, 2, 1),
(51, 'BASURA 110X120 1X10 100mc. ', 1, './img/productos/', '20200429170715.jpg', 339, 2, 1),
(52, 'BASURA 140X160 1X10 100mc.', 1, './img/productos/', '20200429170847.jpg', 555, 2, 1),
(53, 'BOLSA BAJA DENSID. 10x20 70MC. 1X100', 1, './img/productos/', '20200222000440.jpg', 10, 2, 1),
(54, 'BOLSA BAJA DENSID. 20x30 100MC. 1X100', 1, './img/productos/', '20200222000456.jpg', 40, 2, 1),
(55, 'BOLSA BAJA DEN. 20X30 90MC. 1X50', 1, './img/productos/', '20200222000514.jpg', 29, 2, 1),
(56, 'MANGA TRANSPARENTE 30X80MC.', 1, './img/productos/', '20200429181649.jpg', 2805, 2, 1),
(57, 'CUCHARA 10 cm. 1x100', 100, './img/productos/', '20200225142914.jpg', 7, 13, 1),
(58, 'CUCHARA SOPA 1X50 ', 50, './img/productos/', '20200225143142.jpg', 9, 13, 1),
(59, 'CUCHARA HELADO  COLORES  1x1000 ', 1000, './img/productos/', '20200225143316.jpg', 5, 13, 1),
(60, 'CUCHARA HELADO LARGA  1x100', 100, './img/productos/', '20200225143441.jpg', 14, 13, 1),
(61, 'CUCHARA BLANCA 1x100 ', 100, './img/productos/', '20200226105603.jpg', 8, 13, 1),
(62, 'CUCHILLO BLANCO 1x100 ', 100, './img/productos/', '20200226105133.jpg', 8, 13, 1),
(63, 'TENEDOR BLANCO 1x100 ', 100, './img/productos/', '20200225143645.jpg', 8, 13, 1),
(64, 'CUCHARA REFORZADA 1x100 ', 100, './img/productos/', '', 0, 13, 0),
(65, 'CUCHILLO REFORZADO 1x100 ', 100, './img/productos/', '', 0, 13, 0),
(66, 'TENEDOR REFORZADO 1x100 ', 100, './img/productos/', '', 0, 13, 0),
(67, 'CUCHILLO TRANSPARENTE 1x100 ', 100, './img/productos/', '', 0, 13, 0),
(68, 'TENEDOR TRANSPARENTE 1X100', 100, './img/productos/', '', 0, 13, 0),
(69, 'PALO SUSHI ECO 1X100', 100, './img/productos/', '20200226104726.jpg', 16, 13, 1),
(70, 'PLATO PEQUEÑO 15CM 1X25', 25, './img/productos/', '20200226103744.jpg', 26, 13, 1),
(71, 'PLATO MEDIANO 17CM 1X25', 25, './img/productos/', '20200226103954.jpg', 26, 13, 1),
(72, 'PLATO GRANDE 21,5CM 1X25', 25, './img/productos/', '20200226103102.jpg', 47, 13, 1),
(73, 'VASO BLANCO 120cc. (4OZ)  1X50 1x2400', 50, './img/productos/', '20200226152929.jpg', 14, 15, 1),
(74, 'VASO TRANSP. 200cc. (7OZ) 1X50 1X6000', 50, './img/productos/', '20200509233017.jpg', 14, 15, 1),
(75, 'VASO TRANSP. 300cc. (10 OZ) 1X50 1X2500', 50, './img/productos/', '20200509233050.jpg', 13, 15, 1),
(76, 'TAPA TRANSP. 300cc. (10 OZ) 1X50 1X2000', 50, './img/productos/', '20200630101846.png', 19, 15, 1),
(77, 'VASO TRANSP. 350cc. (12OZ) 1X50 1X4000', 50, './img/productos/', '20200509233117.jpg', 18, 15, 1),
(78, 'TAPA TRANSP. 350cc. (12OZ) 1X50', 50, './img/productos/', '20200630101902.png', 21, 15, 1),
(79, 'VASO TRANSP. 500cc.TUC (16OZ) 1X50 1X', 50, './img/productos/', '20200509233149.jpg', 29, 15, 1),
(80, 'VASO TRANSP. 540CC. (18OZ) 1X50 1X1000', 50, './img/productos/', '20200630102751.png', 27, 15, 1),
(81, 'TAPA 500cc. (16OZ) 1X50 1X1200', 50, './img/productos/', '20200226153726.jpg', 25, 15, 1),
(82, 'BLANCO 300cc.', 50, './img/productos/', '20200626173730.png', 13, 15, 1),
(83, 'VASO BEIGE. 300CC. (10 OZ) 1X50 1X2000', 50, './img/productos/', '20200226153913.jpg', 19, 15, 1),
(84, 'VASO TERMICO 120CC. (4OZ) 1X20 1X2000', 50, './img/productos/', '20200226154147.jpg', 20, 15, 1),
(85, 'TAPA TERMICO  120CC. (4OZ) 1X50 1X1000', 0, './img/productos/', '', 0, 15, 0),
(86, 'VASO TERMICO 180cc. (6OZ) 1X20 1X2000', 20, './img/productos/', '20200509233222.jpg', 19, 15, 1),
(87, 'TAPA TERMICO  180CC. (6OZ) 1X50  1X1000', 0, './img/productos/', '', 0, 15, 0),
(88, 'VASO TERMICO 240cc. (8OZ) 1X25 1X1000', 25, './img/productos/', '20200509233302.jpg', 18, 15, 1),
(89, 'TAPA TERMICO 240CC. (8OZ) 1X50 1X1000', 0, './img/productos/', '', 0, 15, 0),
(90, 'VASO TERMICO 300cc. (10OZ) 1X25  1X1000 ', 25, './img/productos/', '20200509233325.jpg', 20, 15, 1),
(91, 'TAPA TERMICO 300CC. (10OZ) 1X50  1X1000', 50, './img/productos/', '', 0, 15, 0),
(92, 'VASO POLIPAPEL 120CC. (4OZ) 1X50 1X1000', 50, './img/productos/', '20200226154531.jpg', 15, 15, 1),
(93, 'VASO POLIPAPEL 180cc. (6OZ) 1X50 1X1000', 50, './img/productos/', '20200626174437.png', 22, 15, 1),
(94, 'TAPA POLIPAPEL 180cc. (6OZ) 1X50 1X1000', 50, './img/productos/', '20200630103229.png', 30, 15, 1),
(95, 'VASO POLIPAPEL 240cc. (8OZ) 1X50 1X1000', 50, './img/productos/', '20200626174710.png', 28, 15, 1),
(96, 'TAPA POLIPAPEL 240CC. (8OZ) 1X50 1X1000', 50, './img/productos/', '20200626175206.png', 20, 15, 1),
(97, 'VASO POLIPAPEL 300 CC (10OZ) 1X50 1X1000 ', 50, './img/productos/', '20200630103145.png', 33, 15, 1),
(98, 'VASO POLIPAPEL 360cc. (12OZ) 1X50 1X1000 ', 50, './img/productos/', '20200626174146.png', 49, 15, 1),
(99, 'TAPA POLIP. 300/360cc. (10/12OZ) 1X50 1X1000 ', 50, './img/productos/', '20200626175619.png', 21, 15, 1),
(100, 'COLLERIN VASO POLIPAPEL', 50, './img/productos/', '20200226154837.jpg', 24, 15, 1),
(101, 'VASO CUPULA 12OZ. 1X50 1X1000', 50, './img/productos/', '20200630100444.png', 65, 15, 1),
(102, 'TAPA CUPULA 12OZ. 1X100 1X1000', 100, './img/productos/', '20200630095558.png', 22, 15, 1),
(103, 'VASO CUPULA 16OZ. 1X50 1X1000', 50, './img/productos/', '20200630100519.png', 65, 15, 1),
(104, 'TAPA CUPULA 16OZ. 1X100 1X1000', 100, './img/productos/', '20200630100342.png', 35, 15, 1),
(105, 'TAPA DOMINGO D 80', 0, './img/productos/', '', 0, 15, 0),
(106, 'TAPA DOMINGO D 90', 0, './img/productos/', '', 0, 15, 0),
(107, 'TAPA DOMINGO D 100', 0, './img/productos/', '', 0, 15, 0),
(108, 'GUANTE LATEX S 1x100 1x1000', 100, './img/productos/', '20200226110332.jpg', 900, 14, 1),
(109, 'GUANTE LATEX M 1x100 1x1000', 100, './img/productos/', '20200626110835.png', 900, 14, 1),
(110, 'GUANTE LATEX L 1x100 1x1000', 100, './img/productos/', '20200626110942.png', 900, 14, 1),
(111, 'GUANTE LATEX LARGO S', 1, './img/productos/', '20200626112105.jpg', 900, 14, 1),
(112, 'GUANTE LATEX LARGO M', 1, './img/productos/', '20200626112131.jpg', 900, 14, 1),
(113, 'GUANTE LATEX LARGO L ', 1, './img/productos/', '20200626112154.jpg', 900, 14, 1),
(114, 'GUANTE LATEX M 1x100 SIN POLVO', 0, './img/productos/', '', 0, 14, 0),
(115, 'GUANTE LATEX L 1x100 SIN POLVO', 0, './img/productos/', '', 0, 14, 0),
(116, 'GUANTE NITRILO S 1X100 1x1000', 100, './img/productos/', '20200226110724.jpg', 126, 14, 1),
(117, 'GUANTE NITRILO M 1X100 1x1000', 100, './img/productos/', '20200626130421.png', 126, 14, 1),
(118, 'GUANTE NITRILO L 1X100 1x1000', 100, './img/productos/', '20200626130852.png', 126, 14, 1),
(119, 'GUANTE NITRILO INDUS. S', 1, './img/productos/', '20200626131129.png', 1192, 14, 1),
(120, 'GUANTE NITRILO INDUS. M', 1, './img/productos/', '20200626131325.png', 1192, 14, 1),
(121, 'GUANTE NITRILO INDUS. L', 1, './img/productos/', '20200626131636.png', 1192, 14, 1),
(122, 'GUANTE VINILO S 1x100 1x1000', 100, './img/productos/', '20200226110904.jpg', 102, 14, 1),
(123, 'GUANTE VINILO M 1x100 1x1000', 100, './img/productos/', '20200626124818.png', 102, 14, 1),
(124, 'GUANTE VINILO L 1x100 1x1000', 100, './img/productos/', '20200626123541.png', 102, 14, 1),
(125, 'GUANTE TACO 1X100', 100, './img/productos/', '20200226111101.jpg', 7, 14, 1),
(126, 'MASCARILLA 1x50 1x1000', 50, './img/productos/', '20200226111314.jpg', 258, 14, 1),
(127, 'GORRO CLIP 1x100 1x1000', 100, './img/productos/', '20200226144150.jpg', 31, 14, 1),
(128, 'GORRO REDECILLA 1x100 1x1000', 100, './img/productos/', '20200226144407.jpg', 51, 14, 1),
(129, 'CUBRE CALZADO AZUL 1X100 1x1000', 100, './img/productos/', '20200626125435.png', 19, 14, 1),
(130, 'CUBRE CALZADO ANTIDESLIZANTE 1X100 1x1000', 100, './img/productos/', '20200626130134.png', 37, 14, 1),
(131, 'MANGUILLA BLANCA 1X100 1x1000', 100, './img/productos/', '20200226144630.jpg', 20, 14, 1),
(132, 'BOMBILLA NEGRA 1X500', 500, './img/productos/', '20200226150439.jpg', 6, 14, 1),
(133, 'BOMBILLA FLEXIBLE 1X500', 500, './img/productos/', '20200226145349.jpg', 6, 14, 1),
(134, 'BOMBILLA COLOR 1X500', 500, './img/productos/', '20200226150104.jpg', 6, 14, 1),
(135, 'BOMBILLA NEO 1X500', 500, './img/productos/', '20200226145618.jpg', 6, 14, 1),
(136, 'BOMBILLA ENVASADA 1X500', 500, './img/productos/', '20200226150614.jpg', 7, 14, 1),
(137, 'BOMBILLA PAPEL NEGRA 1X200 ', 200, './img/productos/', '20200226150215.jpg', 12, 14, 1),
(138, 'BROCHETA BAMBOO 1X200', 200, './img/productos/', '20200626152953.jpg', 9, 14, 1),
(139, 'PALILLOS SUSHI BAMBOO 1X100 PAR', 100, './img/productos/', '20200626131710.png', 0, 14, 0),
(140, 'REVOLVEDOR MADERA CHICO 1X1000', 1000, './img/productos/', '20200626134145.png', 3, 14, 1),
(141, 'REVOLVEDOR MADERA GRANDE 1X500', 500, './img/productos/', '20200626134633.png', 6, 14, 1),
(142, 'COTONA POLIETILENO C/BROCHES 1X10', 10, './img/productos/', '20200226151513.jpg', 624, 14, 1),
(143, 'PECHERA PVC BLANCA', 1, './img/productos/', '20200226151243.jpg', 2081, 14, 1),
(144, 'C-1 SIN TAPA 1X1000', 0, './img/productos/', '', 0, 4, 0),
(145, 'C-5 TAPA 1x1000', 20, './img/productos/', '20200222232750.jpg', 37, 4, 1),
(146, 'C-10 TAPA 1x1000 ', 20, './img/productos/', '20200222233419.jpg', 44, 4, 1),
(147, 'C-10 TAPA 1x1000 XL', 20, './img/productos/', '20200222233453.jpg', 55, 4, 1),
(148, 'C-10 TAPA BOPS 1x1000', 20, './img/productos/', '20200222233656.jpg', 58, 4, 1),
(149, 'C-18 TAPA 1x600', 20, './img/productos/', '20200222233854.jpg', 73, 4, 1),
(150, 'C-18 SIN TAPA 1X500', 20, './img/productos/', '20200222233916.jpg', 63, 4, 1),
(151, 'C-18 TAPA BOPS 1x600', 20, './img/productos/', '20200222234136.jpg', 87, 4, 1),
(152, 'C-20 TAPA 1x800 ', 20, './img/productos/', '20200623131634.png', 108, 4, 1),
(153, 'C-24 TAPA 1x600', 20, './img/productos/', '20200623132111.png', 123, 4, 1),
(154, 'C-25 TAPA 1x20 1x600', 20, './img/productos/', '20200623132133.png', 96, 4, 1),
(155, 'C-30 TAPA 1x20 1x600', 20, './img/productos/', '20200222234333.jpg', 123, 4, 1),
(156, 'C-40 TAPA 1x20 1x400', 20, './img/productos/', '20200222234908.jpg', 202, 4, 1),
(157, 'ALUMINIO R-40 TAPA', 20, './img/productos/', '20200222235538.jpg', 58, 4, 0),
(158, 'ALUMINIO R-50 TAPA', 20, './img/productos/', '20200222235817.jpg', 75, 4, 0),
(159, 'ALUMINIO R-80 TAPA', 20, './img/productos/', '20200623131239.jpg', 75, 4, 1),
(160, 'ALUMINIO R-80 TAPA BOPS', 20, './img/productos/', '20200623131142.jpg', 135, 4, 1),
(161, 'ESTUCHE ENSALADA 242 ', 0, './img/productos/', '', 0, 5, 0),
(162, 'ESTUCHE HIPOCALORICO 243 RITESA 1x350', 50, './img/productos/', '20200624090956.png', 106, 5, 1),
(163, 'ESTUCHE HIPOCALORICO 243 1x200', 200, './img/productos/', '20200624094153.png', 91, 5, 1),
(164, 'ESTUCHE HIPOCALORICO 244 1X300', 50, './img/productos/', '20200223000933.jpg', 133, 5, 1),
(165, 'ESTUCHE HIPOCALORICO 054 1X400 244 AA', 50, './img/productos/', '20200624092306.png', 102, 5, 1),
(166, 'ESTUCHE HIPOCALORICO 090 1X800 ENV. RECT ', 50, './img/productos/', '20200624144832.png', 68, 5, 1),
(167, 'ESTUCHE HIPOCALORICO 247 RITESA 1X350', 50, './img/productos/', '20200223001313.jpg', 117, 5, 1),
(168, 'ESTUCHE HIPOCALORICO 247 1X140', 50, './img/productos/', '20200624091540.png', 104, 5, 1),
(169, 'ESTUCHE HIPOCALORICO 7190 1x350', 0, './img/productos/', '20200223001551.jpg', 0, 5, 0),
(170, 'POTE HERMETICO 161 1x1000', 50, './img/productos/', '20200223001824.jpg', 52, 5, 1),
(171, 'POTE MICRO. C/TAPA 600CC 1X600', 0, './img/productos/', '', 0, 5, 0),
(172, 'MARMITA MICROONDEABLE 850CC 1X600', 100, './img/productos/', '20200624095344.png', 95, 5, 1),
(173, 'POTE VISAGRA 40-08 1x600', 50, './img/productos/', '20200624085543.png', 36, 5, 1),
(174, 'POTE VISAGRA 40-12 1x540', 50, './img/productos/', '20200223002627.jpg', 44, 5, 1),
(175, 'POTE VISAGRA 40-16 1x480', 50, './img/productos/', '20200624090354.png', 59, 5, 1),
(176, 'POCILLO DESGUSTACION 1X500', 500, './img/productos/', '20200623180300.png', 7, 5, 1),
(177, 'POCILLO 1/2 OZ 1X100 ', 100, './img/productos/', '20200623161505.png', 12, 5, 1),
(178, 'TAPA 1/2 OZ 1X100', 100, './img/productos/', '20200623144433.png', 12, 5, 1),
(179, 'POCILLO 1 OZ 1X100', 100, './img/productos/', '20200623150904.png', 11, 5, 1),
(180, 'TAPA 1 OZ 1X100', 100, './img/productos/', '20200623151059.png', 11, 5, 1),
(181, 'POCILLO 1,5 OZ   1X50 1X2500', 50, './img/productos/', '20200623152931.jpg', 12, 5, 1),
(182, 'TAPA 1,5 OZ 1X50 1X2500', 50, './img/productos/', '20200623151153.png', 12, 5, 1),
(183, 'POCILLO 2 OZ 1X50 1X2500', 50, './img/productos/', '20200623153000.png', 10, 5, 1),
(184, 'TAPA 2 OZ 1X50 1X2500', 50, './img/productos/', '20200623151239.png', 10, 5, 1),
(185, 'POCILLO 2,5 OZ 1X100', 100, './img/productos/', '20200623153257.png', 15, 5, 1),
(186, 'TAPA 2,5 OZ 1X100', 100, './img/productos/', '20200623153334.png', 16, 5, 1),
(187, 'POTE 250 (7OZ)', 50, './img/productos/', '20200623160018.png', 36, 5, 1),
(188, 'TAPA POTE 200 Y 250CC.', 50, './img/productos/', '20200623160039.png', 21, 5, 1),
(189, 'POTE 16 OZ (1/2 LT)', 50, './img/productos/', '20200623160800.png', 70, 5, 1),
(190, 'POTE 32 OZ (1 LT)', 50, './img/productos/', '20200223005256.jpg', 131, 5, 1),
(191, 'TAPA 16 Y 32OZ. (250 Y 500CC)', 50, './img/productos/', '20200623160144.png', 35, 5, 1),
(192, 'COPA GARZA 200 cc. ', 25, './img/productos/', '20200223015255.jpg', 78, 5, 1),
(193, 'COPA GARZA 300 cc.', 25, './img/productos/', '20200624090704.png', 87, 5, 1),
(194, 'COPA GELATERIA 200cc. 1X800', 50, './img/productos/', '20200223015846.jpg', 29, 5, 1),
(195, 'COPA SUNDAE 200cc.', 20, './img/productos/', '20200223015702.jpg', 94, 5, 1),
(196, 'POTE AVION 250CC C/TAPA ', 50, './img/productos/', '20200223010906.jpg', 37, 5, 1),
(197, 'POTE MICRO. SIN D. 1x300', 50, './img/productos/', '20200624090103.png', 119, 5, 1),
(198, 'POTE MICRO. CON D. 1x300', 50, './img/productos/', '20200223004225.jpg', 119, 5, 1),
(199, 'TAPA POTE MICRO. 1x300', 50, './img/productos/', '20200624085849.png', 105, 5, 1),
(200, 'POTE MIEL 1KG.', 50, './img/productos/', '20200624093119.png', 117, 5, 1),
(201, 'TAPA POTE MIEL 1KG.', 50, './img/productos/', '20200624093839.png', 49, 5, 1),
(202, 'POCILLO CEREAL', 50, './img/productos/', '20200623181708.png', 17, 5, 1),
(203, 'COPA RUMBA MINI C/TAPA 1X300', 50, './img/productos/', '20200223020051.jpg', 87, 5, 1),
(204, 'COPA RUMBA MULTIUSO 1X300', 50, './img/productos/', '20200223020109.jpg', 79, 5, 1),
(205, 'COPON VENECIA C/BASE 550CC 1X552', 50, './img/productos/', '20200623181307.png', 143, 5, 1),
(206, 'ESTUCHE 142 PET 1X100 1X400', 100, './img/productos/', '20200223003728.jpg', 98, 5, 1),
(207, 'ESTUCHE 143 PET 1X100', 100, './img/productos/', '20200624091913.png', 106, 5, 1),
(208, 'ESTUCHE 401 A 1x350', 50, './img/productos/', '20200624085019.png', 134, 5, 1),
(209, 'ESTUCHE 401 AA 1x350', 50, './img/productos/', '20200223003250.jpg', 134, 5, 1),
(210, 'ESTUCHE 401 AB 1x350', 25, './img/productos/', '20200223003429.jpg', 134, 5, 1),
(211, 'ESTUCHE 401 ABB', 50, './img/productos/', '20200623180625.png', 134, 5, 1),
(212, 'ESTUCHE 401 B', 0, './img/productos/', '', 0, 5, 0),
(213, 'BANDEJA 267 A', 0, './img/productos/', '', 0, 5, 0),
(214, 'BOWL 32 OZ  TRANSP.', 50, './img/productos/', '20200623175902.png', 190, 5, 1),
(215, 'ETIQUETA 22MM X 32MM SIN COLOR 15000UND', 15000, './img/productos/', '20200624114420.png', 3, 7, 1),
(216, 'ETIQUETA 30MM X 30MM SIN COLOR 12000UND', 12000, './img/productos/', '20200624114557.png', 4, 7, 1),
(217, 'ETIQUETA 30MM X 50MM SIN COLOR 8000UND', 80000, './img/productos/', '20200523215752.jpg', 5, 7, 1),
(218, 'ETIQUETA 40MM X 60MM SIN COLOR 4000UND', 4000, './img/productos/', '20200624115046.png', 5, 7, 1),
(219, 'ETIQUETA 50MM X 50MM SIN COLOR 5000UND', 5000, './img/productos/', '20200523215856.jpg', 6, 7, 1),
(220, 'ETIQUETA 50MM X 100MM SIN COLOR 5000UND', 5000, './img/productos/', '20200523220000.jpg', 8, 7, 1),
(221, 'ETIQUETA 70MM X 100MM SIN COLOR', 0, './img/productos/', '20200523220100.jpg', 0, 7, 0),
(222, 'ETIQUETA 90MM X 100MM SIN COLOR', 0, './img/productos/', '', 0, 7, 0),
(223, 'ETIQUETA 100MM X 100MM SIN COLOR 2500UND ', 2500, './img/productos/', '20200624115430.png', 15, 7, 1),
(224, 'ETIQUETA 150MM X 100MM SIN COLOR', 0, './img/productos/', '', 0, 7, 0),
(225, 'ROLLO PAPEL TERMICO 57 X 40MTS. 1X10', 10, './img/productos/', '20200624115647.png', 517, 7, 1),
(226, 'ROLLO PAPEL TERMICO 80 X 80MTS. 1X10', 10, './img/productos/', '20200624115815.png', 1129, 7, 1),
(227, 'ROLLO PAPEL BOND 57 X 41MTS. 1X10', 10, './img/productos/', '20200624120725.png', 353, 7, 1),
(228, 'ALUMINIO 7,5 MTS.', 0, './img/productos/', '', 0, 8, 0),
(229, 'ALUMINIO 40 MTS. 1X12', 1, './img/productos/', '20200225103857.jpg', 2308, 8, 1),
(230, 'ALUMINIO 100 MTS. 1X6', 1, './img/productos/', '20200225103031.jpg', 5040, 8, 1),
(231, 'ALUMINIO 300 MTS.', 0, './img/productos/', '', 0, 8, 0),
(232, 'FILMS PVC 30 MTS. ', 0, './img/productos/', '', 0, 8, 0),
(233, 'FILMS PVC 100 MTS.', 0, './img/productos/', '', 0, 8, 0),
(234, 'FILMS PVC 300 MTS. 1X6', 1, './img/productos/', '20200225104422.jpg', 4682, 8, 1),
(235, 'FILMS ECO 300 MTS. 1X12', 1, './img/productos/', '20200523220333.jpg', 3651, 8, 1),
(236, 'FILMS PVC 1400 MTS. 30cm.', 1, './img/productos/', '20200523220413.jpg', 17755, 8, 1),
(237, 'FILMS PVC 1400 MTS. 38cm.', 1, './img/productos/', '20200523220445.jpg', 21615, 8, 1),
(238, 'FILMS PVC 1400 MTS. 45cm.', 1, './img/productos/', '20200523220520.jpg', 25559, 8, 1),
(239, 'FILMS PALETIZADOR 2KG. 1X6', 1, './img/productos/', '20200225102500.jpg', 4869, 8, 1),
(240, 'SERVILLETA INSTITUCIONAL 36X300GR.', 1, './img/productos/', '20200624145517.png', 1152, 9, 1),
(241, 'SERVILLETA LUNCH  20X500', 1, './img/productos/', '20200225121000.jpg', 745, 9, 1),
(242, 'SERVILLETA COCKTAIL 24X24 8x300 1X2400', 2400, './img/productos/', '20200225121422.jpg', 4, 9, 1),
(243, 'SERVILLETA COKTAIL 30x30 60x70  4200UN', 4200, './img/productos/', '20200225121609.jpg', 7, 9, 1),
(244, 'SERVILLETA COCKTAIL BLANCA 40X40 1X1200', 1200, './img/productos/', '20200225121901.jpg', 22, 9, 1),
(245, 'SERVILLETA COCKTAIL NEGRA 40X40 1X1200', 50, './img/productos/', '20200624145747.png', 35, 9, 1),
(246, 'SERVILLETA 36 PTES. 10X20 9000 UN.', 9000, './img/productos/', 'default_image.jpg', 2, 9, 1),
(247, 'TOALLA INTERFOLIADA 18X250 UN.', 1, './img/productos/', '20200624150348.png', 1164, 9, 1),
(248, 'TOALLA INTERFOLIADA 20X200 UN.', 1, './img/productos/', '20200624150139.png', 1053, 9, 1),
(249, 'TOALLA ECO PREPICADA 12,6 MTS.  1x24', 24, './img/productos/', '20200624150625.png', 369, 9, 1),
(250, 'TOALLA JUMBO 1 x 120 MTS ECO. 1x4', 1, './img/productos/', '20200225114955.jpg', 1681, 9, 1),
(251, 'TOALLA TIPO 200MTS 1x2', 1, './img/productos/', '20200225115321.jpg', 2400, 9, 1),
(252, 'TOALLA JUMBO 1 x 250 MTS ', 1, './img/productos/', '20200624152703.png', 2948, 9, 1),
(253, 'TOALLA JUMBO 1 x 280 MTS', 1, './img/productos/', '20200624152723.png', 3265, 9, 1),
(254, 'TOALLA TIPO 300 MTS 32  1x6', 1, './img/productos/', '20200225115655.jpg', 3662, 9, 1),
(255, 'TOALLA TIPO 300 MTS 36 1x6', 1, './img/productos/', '20200624130627.png', 3825, 9, 1),
(256, 'HIGIENICO 48x30 MTS CLARA. 1x48', 1, './img/productos/', '20200225115922.jpg', 248, 9, 1),
(257, 'HIGIENICO 48x50 MTS ECO. 1x48', 1, './img/productos/', '20200624153104.png', 217, 9, 1),
(258, 'HIGIENICO IND. TIPO 300 MTS. 1x6', 1, './img/productos/', '20200225120117.jpg', 1490, 9, 1),
(259, 'HIGIENICO IND. TIPO 500 MTS. 1x6', 1, './img/productos/', '20200225120256.jpg', 1955, 9, 1),
(260, 'HIGIENICO ECOLOGICO 500 MTS. 1x6', 1, './img/productos/', '20200225120527.jpg', 1869, 9, 1),
(261, 'SABANILLA 48CMX25MTS. 1x2', 1, './img/productos/', '20200225120733.jpg', 2294, 9, 1),
(262, 'PAÑO ROLLO 1000 UN.', 1, './img/productos/', '20200624154424.png', 25200, 9, 1),
(263, 'PAÑO 6 ROLLOS 120UN. C/U', 0, './img/productos/', '', 0, 9, 0),
(264, 'PAPA FRITA 11X10 1x50', 50, './img/productos/', '20200625181850.png', 5, 10, 1),
(265, 'KRAFT TIPO EMPANADA 1x1000', 1000, './img/productos/', '20200625102507.png', 6, 10, 1),
(266, 'KRAFT TIPO-100 1x1000', 1000, './img/productos/', '20200625112906.png', 7, 10, 1),
(267, 'KRAFT TIPO-200 1x1000', 1000, './img/productos/', '20200625103041.png', 12, 10, 1),
(268, 'KRAFT TIPO-300 1x1000', 1000, './img/productos/', '20200625113929.png', 15, 10, 1),
(269, 'KRAFT TIPO-400 1x500 ', 500, './img/productos/', '20200625120715.png', 19, 10, 1),
(270, 'KRAFT TIPO-400 SANDWICH 1x500', 500, './img/productos/', '20200625103703.png', 16, 10, 1),
(271, 'KRAFT TIPO-400 PAN 1x500', 500, './img/productos/', '20200625104736.png', 20, 10, 1),
(272, 'KRAFT TIPO-500 1x500', 500, './img/productos/', '20200625105458.png', 24, 10, 1),
(273, 'KRAFT TIPO-600 1x500', 500, './img/productos/', '20200625111249.png', 37, 10, 1),
(274, 'KRAFT TIPO-700 1x500', 500, './img/productos/', '20200625114922.png', 34, 10, 1),
(275, 'KRAFT TIPO-700 PAN 1x500', 500, './img/productos/', '20200625110438.png', 36, 10, 1),
(276, 'KRAFT TIPO-750 1x500', 500, './img/productos/', '20200625115828.png', 30, 10, 1),
(277, 'KRAFT TIPO-750 PAN 1x500', 500, './img/productos/', '20200625112159.png', 35, 10, 1),
(278, 'SAQ. BCO. OCTAVO 0.125 1x1000', 1000, './img/productos/', '20200624161009.png', 5, 10, 1),
(279, 'SAQ. BCO. CUARTO 0.25 1x1000', 1000, './img/productos/', '20200624161141.png', 5, 10, 1),
(280, 'SAQ. BCO. MEDIO 0.50 1x1000', 1000, './img/productos/', '20200624161305.png', 9, 10, 1),
(281, 'ROLLO ENV. 35-230MT. RO-20', 1, './img/productos/', '20200624175646.png', 5909, 10, 1),
(282, 'ROLLO ENV. 35-230MT. RO-40', 1, './img/productos/', '20200624180548.png', 3128, 10, 1),
(283, 'ROLLO ENV. 35-230MT. RO-57', 1, './img/productos/', '20200624181103.png', 7936, 10, 1),
(284, 'RESMA BEIGE-35GR 75X100X400', 400, './img/productos/', '20200625165859.png', 58, 10, 1),
(285, 'RESMA ANTIGRASA 75X100X500', 500, './img/productos/', '20200625152145.jpg', 97, 10, 1),
(286, 'KRAFT PARA SANDWICH 14.5X13 1X1000', 1000, './img/productos/', '20200625104208.png', 10, 10, 1),
(287, 'KRAFT 8 LTS. CORTO 80 GR.1X200', 200, './img/productos/', '20200625165712.png', 81, 10, 1),
(288, 'KRAFT 8 LTS. 80GR. 1X200', 200, './img/productos/', '20200625162541.png', 95, 10, 1),
(289, 'KRAFT BOLSA 21 LTS. 26X17X40', 25, './img/productos/', '20200625163334.png', 86, 10, 1),
(290, 'CONO DE PAPA CHICO', 100, './img/productos/', '20200625151743.png', 6, 10, 1),
(291, 'CONO DE PAPA MEDIANO', 100, './img/productos/', '20200625151801.png', 6, 10, 1),
(292, 'CONO DE PAPA GRANDE', 100, './img/productos/', '20200625151821.png', 6, 10, 1),
(293, 'CLORO AL 5%  APROXIMADO A 5LT.', 1, './img/productos/', '20200623101249.JPG', 3326, 12, 1),
(294, 'CLORO AL 10%  APROXIMADO A 5LT.', 1, './img/productos/', '', 7788, 12, 0),
(295, 'CLORO GEL APROXIMADO A 5LT.', 1, './img/productos/', '20200623092554.jpg', 6669, 12, 1),
(296, 'CLORO GEL APROXIMADO A 900CC.', 1, './img/productos/', '20200630150533.png', 1540, 12, 1),
(297, 'LAVALOZA PREMIUM  APROXIMADO A 5LT.', 1, './img/productos/', 'default_image.jpg', 3893, 12, 1),
(298, 'LAVALOZA  APROXIMADO A 2LTS 1X8', 1, './img/productos/', '20200626101704.png', 1121, 12, 1),
(299, 'DESENGRASANTE  ECO APROXIMADO A 5LT.', 1, './img/productos/', '20200626103010.png', 5264, 12, 1),
(300, 'MANTENEDOR MULTI.  MANZANA  APROXIMADO A 5LT.', 1, './img/productos/', '20200623093326.jpg', 4525, 12, 1),
(301, 'MANTENEDOR MULTI.  NARANJA  APROXIMADO A 5LT.', 0, './img/productos/', '', 0, 12, 0),
(302, 'MANTENEDOR MULTI.  LAVANDA. APROXIMADO A 5LT.', 1, './img/productos/', '20200623093305.jpg', 4525, 12, 1),
(303, 'MANTENEDOR MULTI.  PRIMAVERA  APROXIMADO A 5LT.', 1, './img/productos/', '20200623093401.jpg', 4525, 12, 1),
(304, 'MANTENEDOR MULTI.  FRESH APROXIMADO A 5LT.', 0, './img/productos/', '', 0, 12, 0),
(305, 'MANTENEDOR DESINFECTANTE APROXIMADO A 5LT.', 0, './img/productos/', '', 0, 12, 0),
(306, 'MANTENEDOR PISO FLOTANTE  1LT.', 0, './img/productos/', '', 0, 12, 0),
(307, 'MANTENEDOR PISO  APROXIMADO A 2LTS 1X8', 1, './img/productos/', '20200630154629.png', 1469, 12, 1),
(308, 'DETERGENTE PREMIUM  APROXIMADO A 5LT.', 1, './img/productos/', '20200623092625.jpg', 4900, 12, 1),
(309, 'DETERGENTE ALFOMBRA  1 LT.', 0, './img/productos/', '', 0, 12, 0),
(310, 'DETERGENTE LIQUIDO APROXIMADO A 3LTS', 1, './img/productos/', '20200630155105.png', 1063, 12, 1),
(311, 'JABON GLICERINA   1x5LT.', 1, './img/productos/', '20200623093018.jpg', 5441, 12, 1),
(312, 'JABON MECANICO  APROXIMADO A 5LT.', 1, './img/productos/', '20200623092908.jpg', 4602, 12, 1),
(313, 'CERA AUTOBRILLO NEGRA APROXIMADO A 5LT.', 1, './img/productos/', '20200623092506.jpg', 14570, 12, 1),
(314, 'CERA AUTOBRILLO ROJA  APROXIMADO A 5LT.', 1, './img/productos/', '20200623092524.jpg', 14570, 12, 1),
(315, 'CERA AUTOBRILLO INCOLORA APROXIMADO A 5LT.', 1, './img/productos/', '20200630155451.png', 14570, 12, 1),
(316, 'DESODORANTE AMBIELTAL  1LT.', 0, './img/productos/', '', 0, 12, 0),
(317, 'LUSTRA MUEBLES  APROXIMADO A 5LT.', 1, './img/productos/', '20200623093201.jpg', 7859, 12, 1),
(318, 'LIMPIA VIDRIOS APROXIMADO A 5LT.', 1, './img/productos/', '20200623093143.jpg', 5198, 12, 1),
(319, 'LIMPIA VIDRIOS TRANSP.  APROXIMADO A 5LT.', 1, './img/productos/', '20200630160027.png', 4680, 12, 1),
(320, 'ABRILLANTADOR PISO FLOTANTE APROXIMADO A 5LT.', 1, './img/productos/', '20200623090853.jpg', 12400, 12, 1),
(321, 'ELIMINADOR DE SARRO  APROXIMADO A 5LT.', 1, './img/productos/', '20200623092725.jpg', 4398, 12, 1),
(322, 'SUAVISANTE  APROXIMADO A 5LT.', 1, './img/productos/', '20200623093542.jpg', 4500, 12, 1),
(323, 'SANITIZANTE AMONIO-CUATERNARIO MENTA APROXIMADO A ', 1, './img/productos/', '20200623093443.jpg', 10383, 12, 1),
(324, 'LIMPIADOR CREMA  APROXIMADO A 750CC.', 1, './img/productos/', '20200630145923.png', 1628, 12, 1),
(325, 'ALCOHOL GEL APROXIMADO A 5LT.', 1, './img/productos/', '20200623095108.jpg', 27200, 12, 1),
(326, 'ATRAPA POLVO APROXIMADO A 5LT.', 0, './img/productos/', '', 0, 12, 0),
(327, 'DISGREGANTE FECAL APROXIMADO A 5LT.', 1, './img/productos/', '20200623092704.jpg', 10663, 12, 1),
(328, 'LIMPIA AZULEJOS APROXIMADO A 5LT.', 0, './img/productos/', '', 0, 12, 0),
(330, 'SILICONA LIQUIDA APROXIMADO A 5LT.', 1, './img/productos/', '20200623093517.jpg', 10865, 12, 1),
(331, 'RENOVADOR DE GOMA APROXIMADO A 5LT.', 1, './img/productos/', '20200623093417.jpg', 5910, 12, 1),
(332, 'LIMPIA ALFOMBRAS  APROXIMADO A 5LT.', 1, './img/productos/', '20200623092948.jpg', 3488, 12, 1),
(333, 'PLATO CARTON N°1', 100, './img/productos/', '20200509233352.jpg', 13, 3, 1),
(334, 'PLATO CARTON N°2 1x100 1x1000', 100, './img/productos/', '20200509233418.jpg', 21, 3, 1),
(335, 'CAJA DE PAPAS N°0   1x100', 100, './img/productos/', '20200509233442.jpg', 46, 3, 1),
(336, 'CAJA DE PAPAS N°1    1x100', 100, './img/productos/', '20200509233508.jpg', 52, 3, 1),
(337, 'CAJA DE PAPAS N°2    1x100', 100, './img/productos/', '20200509233534.jpg', 59, 3, 1),
(338, 'CAJA DE PAPAS Nº3   1x100 1X500', 100, './img/productos/', '20200623102700.JPG', 66, 3, 1),
(339, 'PORTA COMPLETO CH. CARTON   1x100', 100, './img/productos/', '20200222002859.jpg', 15, 3, 1),
(340, 'PORTA COMPLETO G. CARTON 1x100', 100, './img/productos/', '20200509233622.jpg', 17, 3, 1),
(341, 'CAJA DE POLLO BLANCA   1x100 ', 100, './img/productos/', '20200509233644.jpg', 115, 3, 1),
(342, 'CAJA POLLO CAFE ECOLOGICA 1X100', 0, './img/productos/', '', 0, 3, 0),
(343, 'CARTUCHO POLLO CON HUINCHA 1x100', 100, './img/productos/', '20200623103428.jpg', 108, 3, 1),
(344, 'CARTUCHO POLLO SIN HUINCHA', 0, './img/productos/', '20200222003902.jpg', 0, 3, 0),
(345, 'CANASTO 0 1x100', 100, './img/productos/', '20200509233727.jpg', 21, 3, 1),
(346, 'CANASTO 00 1x100', 100, './img/productos/', '20200623103633.JPG', 28, 3, 1),
(347, 'CANASTO 1 OVALADO 1x200', 200, './img/productos/', '20200509233753.jpg', 36, 3, 1),
(348, 'CANASTO 2 OVALADO 1x200', 200, './img/productos/', '20200509233822.jpg', 34, 3, 1),
(349, 'BLONDA RECTANGULAR 5 1x100', 100, './img/productos/', '20200222005653.jpg', 40, 3, 1),
(350, 'BLONDA RECTANGULAR 7 1x100', 100, './img/productos/', '20200222005710.jpg', 38, 3, 1),
(351, 'BLONDA RECTANGULAR 8 1x100', 100, './img/productos/', '20200222005725.jpg', 49, 3, 1),
(352, 'BLONDA RECTANGULAR 9 1x100', 100, './img/productos/', '20200222005741.jpg', 46, 3, 1),
(353, 'BLONDA RECTANGULAR 10 1x100', 100, './img/productos/', '20200222005757.jpg', 56, 3, 1),
(354, 'BLONDA RECTANGULAR 15 1x100', 100, './img/productos/', '20200222005818.jpg', 58, 3, 1),
(355, 'BLONDA RECTANGULAR 17 1x100', 100, './img/productos/', '20200222005840.jpg', 60, 3, 1),
(356, 'BLONDA RECTANGULAR 19 1x100', 100, './img/productos/', '20200222005902.jpg', 66, 3, 1),
(357, 'BLONDA RECTANGULAR 21 1x100', 100, './img/productos/', '20200222005920.jpg', 88, 3, 1),
(358, 'BLONDA REDONDA 7 1x100', 100, './img/productos/', '20200523220621.jpg', 55, 3, 1),
(359, 'BLONDA REDONDA 12 1x100', 100, './img/productos/', '20200622171700.JPG', 60, 3, 1),
(360, 'BLONDA REDONDA 16 1x100', 100, './img/productos/', '20200622172133.JPG', 59, 3, 1),
(361, 'BLONDA REDONDA 18 1x100', 100, './img/productos/', '20200523220835.jpg', 63, 3, 1),
(362, 'BLONDA REDONDA 20 1x100', 100, './img/productos/', '20200523220907.jpg', 63, 3, 1),
(363, 'BLONDA REDONDA 24 1x100', 100, './img/productos/', '20200222011104.jpg', 67, 3, 1),
(364, 'BLONDA REDONDA 26 1x100', 100, './img/productos/', '20200523220937.jpg', 67, 3, 1),
(365, 'BLONDA BRAZO 5 1x100', 100, './img/productos/', '20200623111402.png', 57, 3, 1),
(366, 'BANDEJA BRAZO 5 1x200', 200, './img/productos/', '20200623110235.jpg', 49, 3, 1),
(367, 'BANDEJA RECTANGULAR 1 1X200', 200, './img/productos/', '20200509233903.jpg', 11, 3, 1),
(368, 'BANDEJA RECTANGULAR 2 1X200', 200, './img/productos/', '20200509233927.jpg', 15, 3, 1),
(369, 'BANDEJA RECTANGULAR 3 1X200', 200, './img/productos/', '20200509233958.jpg', 17, 3, 1),
(370, 'BANDEJA RECTANGULAR 4 1X200', 200, './img/productos/', '20200509234017.jpg', 21, 3, 1),
(371, 'BANDEJA RECTANGULAR 5 1x100', 200, './img/productos/', '20200509234037.jpg', 26, 3, 1),
(372, 'BANDEJA RECTANGULAR 6 1x100', 200, './img/productos/', '20200509234150.jpg', 30, 3, 1),
(373, 'BANDEJA RECTANGULAR 7 1x100', 100, './img/productos/', '20200509234208.jpg', 34, 3, 1),
(374, 'BANDEJA RECTANGULAR 8 1x100', 200, './img/productos/', '20200509234227.jpg', 44, 3, 1),
(375, 'BANDEJA RECTANGULAR 9 1x100', 100, './img/productos/', '20200509234343.jpg', 46, 3, 1),
(376, 'BANDEJA RECTANGULAR 10 1x100', 100, './img/productos/', '20200509234425.jpg', 54, 3, 1),
(377, 'BANDEJA RECTANGULAR 11 1x100', 100, './img/productos/', '20200509234451.jpg', 63, 3, 1),
(378, 'BANDEJA RECTANGULAR 12 1x100', 100, './img/productos/', '20200509234515.jpg', 96, 3, 1),
(379, 'BANDEJA RECTANGULAR 13 1x100', 100, './img/productos/', '20200222012338.jpg', 132, 3, 1),
(380, 'BANDEJA RECTANGULAR 14 1x100', 100, './img/productos/', '20200222012407.jpg', 183, 3, 1),
(381, 'BANDEJA REDONDA 1 1x200', 200, './img/productos/', '20200509234543.jpg', 21, 3, 1),
(382, 'BANDEJA REDONDA 2 1x200', 200, './img/productos/', '20200509234628.jpg', 29, 3, 1),
(383, 'BANDEJA REDONDA 3 1x100', 100, './img/productos/', '20200509234656.jpg', 40, 3, 1),
(384, 'BANDEJA REDONDA 4 1x100', 100, './img/productos/', '20200509234717.jpg', 57, 3, 1),
(385, 'BANDEJA REDONDA 5 1x100', 100, './img/productos/', '20200509234747.jpg', 60, 3, 1),
(386, 'BANDEJA REDONDA 6 1x100', 100, './img/productos/', '20200509234810.jpg', 98, 3, 1),
(387, 'BANDEJA REDONDA 7 1x50', 50, './img/productos/', '20200509234826.jpg', 117, 3, 1),
(388, 'BANDEJA REDONDA 8 1x50', 50, './img/productos/', '20200509234849.jpg', 168, 3, 1),
(389, 'BANDEJA REDONDA 9 1x100', 100, './img/productos/', '20200509234910.jpg', 189, 3, 1),
(390, 'BANDEJA REDONDA 10 1x100', 100, './img/productos/', '20200509234933.jpg', 219, 3, 1),
(391, 'TIRA CARTON BLANCO 4X126 1X10KG', 10, './img/productos/', '20200222224606.jpg', 2064, 3, 1),
(392, 'TIRA CARTON BLANCO 7X126 1X10KG', 10, './img/productos/', '20200509234951.jpg', 2064, 3, 1),
(393, 'CÁPSULA BLANCA 0 NACIONAL  1x1000', 1000, './img/productos/', '20200623114520.png', 3, 3, 1),
(394, 'CÁPSULA BLANCA 3 NACIONAL ', 0, './img/productos/', '', 0, 3, 0),
(395, 'CÁPSULA BLANCA 10 NACIONAL', 0, './img/productos/', '', 0, 3, 0),
(396, 'CÁPSULA BLANCA 11-I IMPORTADA 1X1000', 1000, './img/productos/', '20200509235023.jpg', 4, 3, 1),
(397, 'CÁPSULA BLANCA 12-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623114425.png', 5, 3, 1),
(398, 'CÁPSULA BLANCA 13 NACIONAL ', 0, './img/productos/', '', 0, 3, 0),
(399, 'CÁPSULA BLANCA HONDA 7 NACIONAL ', 0, './img/productos/', '', 0, 3, 0),
(400, 'CÁPSULA BLANCA 1-I IMPORTADA 1X1000', 1000, './img/productos/', '20200523221048.jpg', 2, 3, 1),
(401, 'CÁPSULA BLANCA 2-I IMPORTADA 1X1000', 1000, './img/productos/', '20200523221120.jpg', 2, 3, 1),
(402, 'CÁPSULA BLANCA 3-I IMPORTADA 1X1000', 1000, './img/productos/', '20200523221152.jpg', 2, 3, 1),
(403, 'CÁPSULA BLANCA 4-I IMPORTADA 1X1000', 1000, './img/productos/', '20200523221221.jpg', 4, 3, 1),
(404, 'CÁPSULA BLANCA 5-I IMPORTADA 1X1000', 1000, './img/productos/', '20200523221301.jpg', 3, 3, 1),
(405, 'CÁPSULA BLANCA 6-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623121258.png', 3, 3, 1),
(406, 'CÁPSULA BLANCA 7-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623121316.png', 3, 3, 1),
(407, 'CÁPSULA BLANCA 8-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623122029.png', 4, 3, 1),
(408, 'CÀPSULA BLANCA 9-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623122014.png', 5, 3, 1),
(409, 'CÁPSULA BLANCA 15-I IMPORTADA 1X1000', 1000, './img/productos/', '20200623115401.png', 8, 3, 1),
(410, 'CAJA DE PIZZA MINI 1X100', 100, './img/productos/', '20200509235050.jpg', 60, 3, 1),
(411, 'CAJA PIZZA CHICA DELIVERY 1X50', 50, './img/productos/', '20200623122600.png', 207, 3, 1),
(412, 'CAJA PIZZA MEDIANA DELIVERY 1X50', 50, './img/productos/', '20200623122959.png', 296, 3, 1),
(413, 'CAJA PIZZA GRANDE DELIVERY 1X50', 50, './img/productos/', '20200623123017.png', 361, 3, 1),
(414, 'CAJA TORTA CHICA BLANCA 1X50', 50, './img/productos/', '20200623123325.png', 329, 3, 1),
(415, 'CAJA TORTA GRANDE BLANCA 1X50', 50, './img/productos/', '20200509235152.jpg', 493, 3, 1),
(416, 'CAJA TORTA EXT. GRANDE BLANCA', 50, './img/productos/', '20200509235212.jpg', 790, 3, 1),
(417, 'CAJA TORTA GIGANTE BLANCA 1X50', 50, './img/productos/', '20200623124052.png', 800, 3, 1),
(418, 'TARTALETA/PIZZA CHICA/MED. BLANCA 1x50', 50, './img/productos/', '20200222231245.jpg', 263, 3, 1),
(419, 'TARTALETA/PIZZA GRAND. BLANCA 1x50', 50, './img/productos/', '20200222231320.jpg', 352, 3, 1),
(420, 'CAJA COMPLETO 2UN. 1x100', 100, './img/productos/', '20200509235241.jpg', 28, 3, 1),
(421, 'CAJA COMPLETO 4UN. 1x100', 100, './img/productos/', '20200222231659.jpg', 36, 3, 1),
(422, 'CAJA COMPLETO XL 1x100', 100, './img/productos/', '20200509235301.jpg', 29, 3, 1),
(423, 'DISPENSADOR JABON Y ALCOHOL GEL 800CC.', 1, './img/productos/', '20200523221335.jpg', 19800, 6, 1),
(424, 'DISPENSADOR JABON 1000 CC', 1, './img/productos/', '20200223021932.jpg', 9310, 6, 0),
(425, 'SERVILLETERO LUNCH ECO', 1, './img/productos/', '20200225085528.jpg', 2210, 6, 0),
(426, 'SERVILLETERO NEW LUNCH', 0, './img/productos/', '20200225085528.jpg', 4250, 6, 1),
(427, 'DISPENSADOR TOALLA ANTIBACTERIAL', 1, './img/productos/', '20200523221400.jpg', 48000, 6, 1),
(428, 'DISPENSADOR HIGIENICO ANTIBACTERIAL', 1, './img/productos/', '20200523221435.jpg', 17500, 6, 1),
(429, 'DISENSADOR JABON ECO', 1, './img/productos/', '20200225090655.jpg', 2625, 6, 1),
(430, 'SECADOR MANO 1200 W.', 0, './img/productos/', '', 0, 6, 0),
(431, 'SECADOR MANO 1800 W.', 1, './img/productos/', '20200225092927.jpg', 62700, 6, 1),
(432, 'DISPENSADOR AUTO SPRAY', 0, './img/productos/', '', 0, 6, 0),
(433, 'CONTENEDOR 50 LTS. RECICLAJE DOBLE', 1, './img/productos/', '20200223021413.jpg', 17920, 6, 1),
(434, 'CONTENEDOR 50 LTS. CON PEDAL ', 1, './img/productos/', '20200225092248.jpg', 15008, 6, 1),
(435, 'CONTENEDOR 120 LTS. CON PEDAL', 0, './img/productos/', '20200623170754.png', 38384, 6, 1),
(436, 'CONTENEDOR 120 LTS', 0, './img/productos/', '20200623170816.png', 30521, 6, 1),
(437, 'CONTENEDOR 240 LTS', 1, './img/productos/', '20200523221543.jpg', 47243, 6, 1),
(438, 'CONTENEDOR 1100 LTS', 1, './img/productos/', '20200523221614.jpg', 270655, 6, 1),
(439, 'LOCKER 1 CUERPO 3 PUERTAS ', 1, './img/productos/', '20200523221638.jpg', 62983, 6, 1),
(440, 'PAÑO  ESPONJA  UN.', 1, './img/productos/', '20200220232116.jpg', 409, 1, 1),
(441, 'PAÑO MULTIUSO', 1, './img/productos/', '20200220232214.jpg', 320, 1, 1),
(442, 'PAÑO ECO', 1, './img/productos/', '20200220232613.jpg', 770, 1, 1),
(443, 'PAÑO NARANJO', 1, './img/productos/', '20200220232346.jpg', 197, 1, 1),
(444, 'PAÑO COTTON 70X40', 1, './img/productos/', '20200509235325.jpg', 686, 1, 1),
(445, 'PAÑAL TELA', 1, './img/productos/', '20200509235345.jpg', 3220, 1, 1),
(446, 'TRAPERO AMARILLO ECO ', 1, './img/productos/', '20200227101442.jpg', 748, 1, 1),
(447, 'TRAPERO ALGODON  EXT.', 1, './img/productos/', '20200227101642.jpg', 841, 1, 1),
(448, 'TRAPERO  MICRO-FIBRA 50x70', 1, './img/productos/', '20200227101859.jpg', 790, 1, 1),
(449, 'ESPONJA ECO.', 1, './img/productos/', '20200221095144.jpg', 140, 1, 1),
(450, 'ESPUMITA', 1, './img/productos/', '20200221095308.jpg', 201, 1, 1),
(451, 'ESPUMITA CON VIRUTILLA', 1, './img/productos/', '20200630164854.png', 253, 1, 1),
(452, 'VIRUTILLA ECO.', 1, './img/productos/', '20200302222625.jpg', 140, 1, 1),
(453, 'VIRUTILLA DORADA', 1, './img/productos/', '20200221100138.jpg', 308, 1, 1),
(454, 'VIRUTILLA PARRILERA', 1, './img/productos/', '20200227102134.jpg', 983, 1, 1),
(455, 'FIBRA ABRASIVA ', 1, './img/productos/', '20200227102356.jpg', 140, 1, 1),
(456, 'PASTILLA DESODORANTE 40 Gr.', 1, './img/productos/', '20200227102803.jpg', 224, 1, 1),
(457, 'TAPETE LISO ', 1, './img/productos/', '20200221100941.jpg', 1804, 1, 1),
(458, 'RECARGA AROMA TAHITI', 1, './img/productos/', '20200227105609.jpg', 2310, 1, 1),
(459, 'RECARGA AROMA VAINILLA', 1, './img/productos/', '20200227105746.jpg', 2310, 1, 1),
(460, 'RECARGA AROMA HAWAIAN GINGER', 1, './img/productos/', '20200227104225.jpg', 2310, 1, 1),
(461, 'RECARGA AROMA FRUTOS ROJOS ', 1, './img/productos/', '20200227105922.jpg', 2310, 1, 1),
(462, 'AEROSOL HAWAIAN GINGER', 1, './img/productos/', '20200227110212.jpg', 1362, 1, 1),
(463, 'AEROSOL AMOURS', 1, './img/productos/', '20200227110423.jpg', 1362, 1, 1),
(464, 'AEROSOL TAHITI', 1, './img/productos/', '20200227110752.jpg', 1362, 1, 1),
(465, 'AEROSOL PARAISO FLORAL', 1, './img/productos/', '20200227110946.jpg', 1362, 1, 1),
(466, 'AEROSOL MANZANA CANELA', 1, './img/productos/', '20200227111136.jpg', 1362, 1, 1),
(467, 'AEROSOL LAVANDA', 1, './img/productos/', '20200227111319.jpg', 1362, 1, 1),
(468, ' MATA TODO INSECTO 360CC.', 1, './img/productos/', '20200221101616.jpg', 2592, 1, 1),
(469, 'LYSOFORM  360CM.', 1, './img/productos/', '20200221101846.jpg', 2442, 1, 1),
(470, 'ESCOBILLON ECO', 1, './img/productos/', '20200221102311.jpg', 1232, 1, 1),
(471, 'ESCOBILLON MUNICIPAL C/MANGO', 1, './img/productos/', '20200221103607.jpg', 4867, 1, 1),
(472, 'BARRE AGUA 22\"', 1, './img/productos/', '20200221103750.jpg', 5880, 1, 1),
(473, 'PALA ECO', 1, './img/productos/', '20200221104022.jpg', 590, 1, 1),
(474, 'PORTA PIEL 14', 1, './img/productos/', '20200630161707.png', 2100, 1, 1),
(475, 'REPUESTO PIEL 14', 1, './img/productos/', '20200630161748.png', 1820, 1, 1),
(476, 'PORTA PIEL 18', 1, './img/productos/', '20200630161334.png', 2030, 1, 1),
(477, 'REPUESTO PIEL 18', 1, './img/productos/', '20200630131050.png', 2030, 1, 1),
(478, 'MOPA ESCOBILLON', 1, './img/productos/', '20200227111840.jpg', 952, 1, 1),
(479, 'MOPA 16OZ.', 1, './img/productos/', '20200227112011.jpg', 1512, 1, 1),
(480, 'MOPA 24 OZ.', 1, './img/productos/', '20200227112150.jpg', 2705, 1, 1),
(481, 'MOPA SECA 24\"', 1, './img/productos/', '20200227112409.jpg', 3150, 1, 0),
(482, 'MOPA SECA 36\"', 1, './img/productos/', '20200221105331.jpg', 3786, 1, 0),
(483, 'MOPA SECA 24\"', 1, './img/productos/', '20200227112615.jpg', 3150, 1, 0),
(484, 'MOPA SECA 36\"', 1, './img/productos/', '20200227113102.jpg', 3786, 1, 0),
(485, 'HORQUILLA 24', 1, './img/productos/', '20200227113251.jpg', 2100, 1, 1),
(486, 'HORQUILLA 36', 1, './img/productos/', '20200302222956.jpg', 2590, 1, 1),
(487, 'P45 MOPA SECA 24', 1, './img/productos/', '20200429182529.jpg', 3150, 1, 1),
(488, 'PORTA MOPA JANITO ALUM.', 1, './img/productos/', '20200227123755.jpg', 3640, 1, 1),
(489, 'PORTA MOPA GARRA ALUM.', 1, './img/productos/', '20200227123955.jpg', 3290, 1, 1),
(490, 'SEÑAL PISO MOJADO', 1, './img/productos/', '20200221230006.jpg', 3500, 1, 1),
(491, 'MANGO PARA GUIA', 1, './img/productos/', '20200630125634.jpg', 1540, 1, 1),
(492, 'GUIA GOMA 35CM', 1, './img/productos/', '20200630132130.png', 2103, 1, 1),
(493, 'REPUESTO GOMA 35CM.', 1, './img/productos/', '20200630132013.png', 2381, 1, 1),
(494, 'GUIA GOMA 45CM', 1, './img/productos/', '20200630131426.png', 2800, 1, 1),
(495, 'REPUESTO GOMA 45CM.', 1, './img/productos/', '20200630131837.png', 2260, 1, 1),
(496, 'GATILLO SIMPLE', 1, './img/productos/', '20200227124128.jpg', 0, 1, 0),
(497, 'GATILLO REFORZADO', 1, './img/productos/', '20200227124249.jpg', 1108, 1, 1),
(498, 'ENVASE POLIETILENO 1LT', 1, './img/productos/', '20200221230459.jpg', 520, 1, 1),
(499, 'ENVASE 500CC', 1, './img/productos/', '20200509235437.jpg', 326, 1, 1),
(500, 'ENVASE 700CC', 1, './img/productos/', '20200302223536.jpg', 550, 1, 1),
(501, 'ENVASE DX. 1LT.', 1, './img/productos/', '', 0, 1, 0),
(502, 'CARRO ESTRUJADOR 20 LTS.', 1, './img/productos/', '20200302223150.jpg', 15520, 1, 1),
(503, 'CARRO ESTRUJADOR 33 LTS.', 1, './img/productos/', '20200302223259.jpg', 36850, 1, 1),
(504, 'DISCO PULIDOR DE PISO 17', 1, './img/productos/', '20200302223419.jpg', 3284, 1, 1),
(505, 'CUCHARA  MADERA  1x100', 100, './img/productos/', '20200626102221.png', 23, 13, 1),
(506, 'CUCHILLO MADERA   1x100', 100, './img/productos/', '20200626101914.png', 23, 13, 1),
(507, 'TENEDOR  MADERA 1x100', 23, './img/productos/', '20200626175812.png', 23, 13, 1),
(508, 'PLATO 7 COMPOSTABLE 20X50', 50, './img/productos/', '20200626181429.png', 57, 13, 1),
(509, 'PLATO 9 COMPOSTABLE 10X50', 50, './img/productos/', '20200630090550.png', 69, 13, 1),
(510, 'PLATO 10 COMPOSTABLE 10X50', 50, './img/productos/', '20200630090532.png', 101, 13, 1),
(511, 'BOWL OVALADO COMPOSTABLE 18OZ  6X50', 50, './img/productos/', '20200630091014.png', 88, 13, 1),
(512, 'BOWL REDONDO COMPOSTABLE 32OZ  4X50', 50, './img/productos/', '20200626182850.png', 115, 13, 1),
(513, 'VASO POLIPAPEL 6,5 OZ BLANCO 1X1000', 1000, './img/productos/', '6.5oz.png', 34, 15, 1),
(514, 'VASO POLIPAPEL 8 OZ BLANCO 50X20', 50, './img/productos/', '8oz.png', 45, 15, 1),
(515, 'OVEROL DESECHABLE BLANCO T S 1X5', 1, './img/productos/', '20200626154329.png', 5400, 14, 1),
(516, 'OVEROL DESECHABLE BLANCO T M 1X5', 1, './img/productos/', '20200626154544.png', 5400, 14, 1),
(517, 'OVEROL DESECHABLE BLANCO T L 1X5', 1, './img/productos/', '20200626154633.png', 5400, 14, 1),
(518, 'OVEROL DESECHABLE BLANCO T XL 1X5', 1, './img/productos/', '20200626154714.png', 5400, 14, 1),
(519, 'TRAJE PARA FUMIGAR T L ', 1, './img/productos/', '20200626133112.png', 7200, 14, 1),
(520, 'TRAJE PARA FUMIGAR T XL ', 1, './img/productos/', '20200626133325.png', 7200, 14, 1),
(521, 'TRAJE PARA FUMIGAR T XXL', 1, './img/productos/', '20200626133509.png', 7200, 14, 1),
(522, 'LENTE UVEX CLARO XV100 Z87.1', 1, './img/productos/', '20200626164612.png', 1120, 14, 1),
(523, 'LENTE UVEX GRIS XV101 Z87.1', 1, './img/productos/', '20200626171333.png', 1120, 14, 1),
(524, 'CINTA ADHESIVA CAFE 100 MTS', 1, './img/productos/', '20200523221748.jpg', 682, 8, 1),
(525, 'CINTA ADHESIVA TRANSPARENTE 100MTS ', 1, './img/productos/', '20200523221821.jpg', 770, 8, 1),
(526, 'KRAFT  8 LTS. CORTO 80GR.  CON MANILLA 1X400', 400, './img/productos/', '20200625164607.png', 84, 10, 1),
(527, 'SHAMPOO PARA AUTOS APROXIMADO A 5LT.', 1, './img/productos/', '20200623093505.jpg', 6216, 12, 1),
(528, 'BANDEJA RECTANGULAR 15 1X100', 100, './img/productos/', '20200623125038.png', 398, 3, 1),
(529, 'ESPONJA SALVAUÑAS VERDE ', 1, './img/productos/', '20200630132338.png', 220, 1, 1),
(530, 'MOPA SECA 24', 1, './img/productos/', '20200509123518.jpg', 0, 1, 0),
(531, 'MOPA SECA 36', 1, './img/productos/', '20200509123614.jpg', 0, 1, 0),
(532, 'MOPA SECA 36', 1, './img/productos/', '20200509123715.jpg', 0, 1, 0),
(533, 'MANGO PARA HORQUILLA ALUM.', 1, './img/productos/', '20200630132946.png', 3321, 1, 1),
(534, 'GATILLO SIMPLE', 1, './img/productos/', '20200509124221.jpg', 0, 1, 0),
(535, 'ENVASE DX. 1LT.', 1, './img/productos/', '20200509124256.jpg', 0, 1, 0),
(536, 'PAÑO PRUEBA', 1, './img/productos/', '20200510130243.jpg', 0, 1, 0),
(537, 'MASCARILLA REUTILIZABLE 1X5', 1, './img/productos/', '20200521111912.jpg', 2700, 14, 1),
(538, 'P46 MOPA SECA 36', 1, './img/productos/', '20200526220921.jpg', 3786, 1, 1),
(539, 'z&z', 0, './img/productos/', '20200616105240.php', 0, 2, 0),
(540, 'DISPENSADOR DE JABÓN Y ALCOHOL GEL 800CC', 1, './img/productos/', '20200625155659.jpeg', 0, 6, 0),
(541, 'DESENGRASANTE PREMIUM APROXIMADO 5LT', 1, './img/productos/', 'default_image.jpg', 6050, 12, 1),
(542, 'ROLLO PAPEL TERMICO 60 X 60MTS. 1X10', 10, './img/productos/', 'default_image.jpg', 1148, 7, 1),
(543, 'ALCOHOL 70% APROXIMADO A 5LT', 1, './img/productos/', 'default_image.jpg', 19484, 12, 1),
(544, 'ALCOHOL SPRAY 70% 1LT', 1, './img/productos/', '70_litro.png', 6558, 12, 1),
(545, 'MASCARILLA NK95', 10, './img/productos/', 'kn95.png', 1980, 14, 1),
(546, 'TERMOMETRO DIGITAL', 1, './img/productos/', 'termometro_digital.png', 49000, 14, 1),
(547, 'FILMS PVC 300MTS. 45CM', 1, './img/productos/', 'default_image.jpg', 6983, 8, 1),
(548, 'ESCUDO FACIAL RECTANGULAR 1X5', 5, './img/productos/', 'careta.png', 2450, 14, 1),
(549, 'TORTA MEDIANA 23CM 1X70', 70, './img/productos/', 'torta-mediana.png', 245, 5, 1),
(550, 'TORTA GRANDE 26CM 1X70', 70, './img/productos/', 'torta-grande.png', 289, 5, 1),
(551, 'TARTALETA CHICA 23CM 1X70', 70, './img/productos/', 'tartaleta_chica.png', 227, 5, 1),
(552, 'TARTALETA MEDIANA 25CM 1X70', 70, './img/productos/', 'tartaleta_mediana.png', 268, 5, 1),
(553, 'BRAZO DE REINA 14,5CM * 25,5CM 1X114', 114, './img/productos/', 'cupula_brazo_reina.png', 212, 5, 1),
(554, 'MASCARILLA 1X50 1X1000', 50, './img/productos/', 'mascarilla1x50.png', 258, 14, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion`
--
ALTER TABLE `administracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cambio_precios`
--
ALTER TABLE `cambio_precios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido` (`pedido`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `familia` (`familia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administracion`
--
ALTER TABLE `administracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cambio_precios`
--
ALTER TABLE `cambio_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=555;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`familia`) REFERENCES `familia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

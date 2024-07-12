-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2024 a las 23:29:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsas`
--

CREATE TABLE `bolsas` (
  `id_bolsas` int(11) NOT NULL,
  `nombre_bolsas` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cantidad_bolsas_adquiridas` int(10) NOT NULL,
  `numero_sachets` int(10) NOT NULL,
  `cantidad_minima` int(10) NOT NULL,
  `precio_compra_unidad` double NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_usuario_modificado` int(10) NOT NULL,
  `fecha_creado` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `fecha_modificado` datetime DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bolsas`
--

INSERT INTO `bolsas` (`id_bolsas`, `nombre_bolsas`, `cantidad_bolsas_adquiridas`, `numero_sachets`, `cantidad_minima`, `precio_compra_unidad`, `id_usuario`, `id_usuario_modificado`, `fecha_creado`, `fecha_modificado`, `estado`) VALUES
(1, 'BOLSA N1', 2, 30, 2, 55, 1, 1, '2024-07-08 10:20:33.774000', '2024-07-08 11:36:29', 1),
(2, 'BOLSA N2', 3, 20, 1, 80, 1, 0, '2024-07-08 10:25:40.376167', NULL, 1),
(3, 'BOLSA N3', 2, 20, 2, 100, 1, 1, '2024-07-08 11:48:51.982474', '2024-07-08 11:49:06', 1),
(4, 'BOLSA N4', 1, 20, 2, 100, 1, 0, '2024-07-09 11:48:01.364242', NULL, 1),
(5, 'BOLSA N5', 1, 20, 5, 100, 1, 0, '2024-07-09 17:59:59.217902', NULL, 1),
(6, 'BOLSA N2', 5, 24, 2, 240, 1, 0, '2024-07-10 10:27:52.334607', NULL, 1),
(7, 'BOLSA N7', 10, 24, 2, 200, 1, 0, '2024-07-10 10:28:39.931303', NULL, 1),
(8, 'N8', 120, 25, 12, 10, 1, 0, '2024-07-10 10:49:16.216337', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box`
--

CREATE TABLE `box` (
  `id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `image`, `name`, `description`, `created_at`) VALUES
(1, NULL, 'BEBIDAS', NULL, '2024-06-27 17:15:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `short` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` int(11) NOT NULL,
  `val` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
(1, 'company_name', 'Nombre de la empresa', 2, 'CROWN Coffee'),
(2, 'title', 'Titulo del Sistema', 2, 'INVENTSYS'),
(3, 'ticket_title', 'Titulo en el Ticket', 2, 'CROWN COFFEE'),
(4, 'admin_email', 'Email Administracion', 2, ''),
(5, 'report_image', 'Imagen en Reportes', 4, 'logoISYS.png'),
(6, 'imp-name', 'Nombre Impuesto', 2, 'IVA'),
(7, 'imp-val', 'Valor Impuesto (%)', 2, '0'),
(8, 'currency', 'Simbolo de Moneda', 2, 'Bs.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d`
--

CREATE TABLE `d` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `d`
--

INSERT INTO `d` (`id`, `name`) VALUES
(1, 'Entregado'),
(2, 'Pendiente'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `f`
--

CREATE TABLE `f` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `f`
--

INSERT INTO `f` (`id`, `name`) VALUES
(1, 'Efectivo'),
(2, 'Deposito'),
(3, 'Cheque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation`
--

CREATE TABLE `operation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `stock_destination_id` int(11) DEFAULT NULL,
  `operation_from_id` int(11) DEFAULT NULL,
  `q` float NOT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL,
  `operation_type_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `is_draft` tinyint(1) NOT NULL DEFAULT 0,
  `is_traspase` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `id_bolsa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `operation`
--

INSERT INTO `operation` (`id`, `product_id`, `stock_id`, `stock_destination_id`, `operation_from_id`, `q`, `price_in`, `price_out`, `operation_type_id`, `sell_id`, `status`, `is_draft`, `is_traspase`, `created_at`, `id_bolsa`) VALUES
(1, 1, 1, NULL, NULL, 10, 7, 15, 1, 2, 1, 0, 0, '2024-06-27 17:22:49', NULL),
(2, 2, 1, NULL, NULL, 10, 8, 14, 1, 2, 1, 0, 0, '2024-06-27 17:22:49', NULL),
(3, 1, 1, NULL, NULL, 4, 7, 15, 1, 3, 1, 0, 0, '2024-06-27 18:04:07', NULL),
(4, 1, 1, NULL, NULL, 1, 7, 15, 1, 4, 1, 0, 0, '2024-06-27 18:23:51', NULL),
(5, 1, 1, NULL, NULL, 1, 7, 15, 1, 5, 1, 0, 0, '2024-06-27 18:27:52', NULL),
(6, 1, 1, NULL, NULL, 1, 7, 15, 1, 6, 1, 0, 0, '2024-06-27 18:30:08', NULL),
(7, 1, 1, NULL, NULL, 16, 7, 15, 2, 7, 1, 0, 0, '2024-07-08 11:53:04', NULL),
(8, 7, 1, NULL, NULL, 100000, 10, 18, 1, NULL, 1, 0, 0, '2024-07-09 09:18:31', NULL),
(9, 8, 1, NULL, NULL, 100000, 10, 19, 1, NULL, 1, 0, 0, '2024-07-09 09:27:05', NULL),
(11, 7, 1, NULL, NULL, 2, 10, 18, 2, 9, 1, 0, 0, '2024-07-09 09:49:11', NULL),
(12, 8, 1, NULL, NULL, 3, 10, 19, 2, 10, 1, 0, 0, '2024-07-09 11:17:35', NULL),
(15, 10, 1, NULL, NULL, 10, 12, 20, 2, 13, 1, 0, 0, '2024-07-09 11:52:14', NULL),
(16, 10, 1, NULL, NULL, 8, 12, 20, 2, 14, 1, 0, 0, '2024-07-09 11:53:20', NULL),
(17, 10, 1, NULL, NULL, 1, 12, 20, 1, 15, 1, 0, 0, '2024-07-09 11:59:49', NULL),
(18, 1, 1, NULL, NULL, 4, 7, 15, 1, 22, 1, 0, 0, '2024-07-11 12:29:47', NULL),
(25, 1, 1, NULL, NULL, 4, 100, 100, 1, 28, 1, 0, 0, '2024-07-11 15:17:40', 4),
(26, 1, 1, NULL, NULL, 4, 100, 100, 1, 28, 1, 0, 0, '2024-07-11 15:17:40', 3),
(27, 1, 1, NULL, NULL, 18, 55, 55, 1, 28, 1, 0, 0, '2024-07-11 15:17:40', 1),
(28, 1, 1, NULL, NULL, 4, 7, 15, 1, 29, 1, 0, 0, '2024-07-11 15:19:07', NULL),
(29, 1, 1, NULL, NULL, 23, 55, 0, 1, NULL, 1, 0, 0, '2024-07-12 09:20:56', 1),
(32, 1, 1, NULL, NULL, 2, 100, 0, 1, NULL, 1, 0, 0, '2024-07-12 09:21:26', 3),
(33, 2, 1, NULL, NULL, 1, 8, 14, 1, NULL, 1, 0, 0, '2024-07-12 09:22:46', NULL),
(41, 1, 1, NULL, NULL, 4, 100, 0, 1, NULL, 1, 0, 0, '2024-07-12 11:46:24', 5),
(42, 1, 1, NULL, NULL, 2, 55, 55, 1, 30, 1, 0, 0, '2024-07-12 11:50:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_type`
--

CREATE TABLE `operation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `operation_type`
--

INSERT INTO `operation_type` (`id`, `name`) VALUES
(1, 'entrada'),
(2, 'salida'),
(3, 'entrada-pendiente'),
(4, 'salida-pendiente'),
(5, 'devolucion'),
(6, 'traspaso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p`
--

CREATE TABLE `p` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `p`
--

INSERT INTO `p` (`id`, `name`) VALUES
(1, 'Pagado'),
(2, 'Pendiente'),
(3, 'Cancelado'),
(4, 'Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `val` double DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`) VALUES
(1, 'Cargo'),
(2, 'Abono');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `is_active_access` tinyint(1) NOT NULL DEFAULT 0,
  `has_credit` tinyint(1) NOT NULL DEFAULT 0,
  `credit_limit` double DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `image`, `no`, `name`, `lastname`, `company`, `address1`, `address2`, `phone1`, `phone2`, `email1`, `email2`, `is_active_access`, `has_credit`, `credit_limit`, `password`, `kind`, `created_at`) VALUES
(1, NULL, '1023456789', 'Rudy', 'Manzaneda', NULL, 'Torres OLAM PISO 7D', NULL, '69059481', NULL, 'rudy.manzaneda@gmail.com', NULL, 0, 0, NULL, NULL, 2, '2024-07-11 11:53:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `price_out` double DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `inventary_min` int(11) NOT NULL DEFAULT 10,
  `price_in` float NOT NULL,
  `price_out` float DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `presentation` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `expire_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `kind` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `image`, `code`, `barcode`, `name`, `description`, `inventary_min`, `price_in`, `price_out`, `unit`, `presentation`, `user_id`, `category_id`, `brand_id`, `width`, `height`, `weight`, `expire_at`, `created_at`, `kind`, `is_active`) VALUES
(1, NULL, 'CAF?-1', '', 'CAF? EJEMPLO', '', 1, 7, 15, '', '', 1, 1, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 1, 1),
(2, NULL, 'CAF?-2', '', 'CAF? EJEMPLO 2', '', 1, 8, 14, '', '', 1, 1, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 1, 1),
(7, '', 'ABC-001', '', 'EJEMPLO 1', 'EJEMPLO 1', 100000, 10, 20, 'TAZAS', '', 1, 1, NULL, 0, 0, 0, '0000-00-00', '2024-07-09 09:13:21', 1, 1),
(8, '', 'ABC-002', '', 'EJEMPLO  2', 'EJEMPLO 2', 100000, 10, 19, 'TAZAS', '', 1, 1, NULL, 0, 0, 0, '0000-00-00', '2024-07-09 09:26:23', 1, 1),
(9, '', 'ABC-003', '', 'EJEMPLO 3', 'EJEMPLO 3', 100000, 10, 20, 'TAZAS', '', 1, 1, NULL, 0, 0, 0, '0000-00-00', '2024-07-09 09:31:56', 1, 1),
(10, '', 'ABC-004', '', 'EJEMPLO 4', 'EJEMPLO 4', 100000, 12, 20, 'TAZAS', '', 1, 1, NULL, 0, 0, 0, '0000-00-00', '2024-07-09 11:51:36', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_bolsas`
--

CREATE TABLE `producto_bolsas` (
  `id_producto_bolsas` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `id_bolsa` int(10) NOT NULL,
  `numero_sachets_utilizado` int(10) NOT NULL,
  `fecha_creado` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` int(1) NOT NULL,
  `id_usuario_registro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto_bolsas`
--

INSERT INTO `producto_bolsas` (`id_producto_bolsas`, `id_producto`, `id_bolsa`, `numero_sachets_utilizado`, `fecha_creado`, `estado`, `id_usuario_registro`) VALUES
(9, 7, 1, 1, '2024-07-09 09:13:21', 1, 1),
(10, 7, 2, 1, '2024-07-09 09:13:21', 1, 1),
(11, 7, 3, 1, '2024-07-09 09:13:21', 1, 1),
(12, 8, 1, 1, '2024-07-09 09:26:23', 1, 1),
(13, 8, 2, 1, '2024-07-09 09:26:23', 1, 1),
(14, 8, 3, 1, '2024-07-09 09:26:23', 1, 1),
(15, 9, 1, 1, '2024-07-09 09:31:56', 1, 1),
(16, 9, 2, 1, '2024-07-09 09:31:56', 1, 1),
(17, 9, 3, 1, '2024-07-09 09:31:56', 1, 1),
(18, 10, 4, 1, '2024-07-09 11:51:36', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saving`
--

CREATE TABLE `saving` (
  `id` int(11) NOT NULL,
  `concept` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `date_at` date DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell`
--

CREATE TABLE `sell` (
  `id` int(11) NOT NULL,
  `invoice_code` varchar(255) DEFAULT NULL,
  `invoice_file` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `sell_from_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT 2,
  `box_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `f_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT 0,
  `stock_to_id` int(11) DEFAULT NULL,
  `stock_from_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sell`
--

INSERT INTO `sell` (`id`, `invoice_code`, `invoice_file`, `comment`, `ref_id`, `sell_from_id`, `person_id`, `user_id`, `operation_type_id`, `box_id`, `p_id`, `d_id`, `f_id`, `total`, `cash`, `iva`, `discount`, `is_draft`, `stock_to_id`, `stock_from_id`, `status`, `created_at`) VALUES
(1, '', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 0, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-06-27 17:22:00'),
(2, '', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 1, 1, 1, 15, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-06-27 17:22:49'),
(3, '', NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 1, 1, 1, 28, NULL, NULL, NULL, 0, 1, NULL, 1, '0000-00-00 00:00:00'),
(4, '', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 1, 1, 1, 7, NULL, NULL, NULL, 0, 1, NULL, 1, '0000-00-00 00:00:00'),
(5, '', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 1, 1, 1, 7, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-06-27 00:00:00'),
(6, '', NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 1, 1, 1, 7, NULL, NULL, NULL, 0, 1, NULL, 1, '0000-00-00 00:00:00'),
(7, '', NULL, '', 1, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 240, 240, 0, 0, 0, 1, NULL, 1, '2024-07-08 00:00:00'),
(9, '', NULL, '', 2, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 36, 36, 0, 0, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(10, '', NULL, '', 3, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 57, 57, 0, 0, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(11, '', NULL, '', 4, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 300, 300, 0, 0, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(13, '', NULL, '', 5, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 200, 200, 0, 0, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(14, '', NULL, '', 6, NULL, NULL, 1, 2, NULL, 1, 1, NULL, 160, 160, 0, 0, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(15, '', NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 1, 1, 1, 12, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-09 00:00:00'),
(16, '1233', NULL, NULL, 10, NULL, NULL, 1, 1, NULL, 2, 2, 2, 800, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(17, '1233', NULL, NULL, 11, NULL, NULL, 1, 1, NULL, 2, 1, 1, 965, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(18, '1233', NULL, NULL, 12, NULL, 1, 1, 1, NULL, 2, 1, 1, 1130, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(19, '1233', NULL, NULL, 13, NULL, 1, 1, 1, NULL, 1, 1, 1, 1185, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(20, '1233', NULL, NULL, 14, NULL, 1, 1, 1, NULL, 1, 1, 1, 14, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(21, '1233', NULL, NULL, 15, NULL, 1, 1, 1, NULL, 1, 1, 1, 1295, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(22, '1233', NULL, NULL, 16, NULL, 1, 1, 1, NULL, 1, 1, 1, 28, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(23, '1233', NULL, NULL, 17, NULL, 1, 1, 1, NULL, 1, 1, 1, 1405, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(24, '1233', NULL, NULL, 18, NULL, 1, 1, 1, NULL, 1, 1, 1, 1515, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(25, '1233', NULL, NULL, 19, NULL, 1, 1, 1, NULL, 1, 1, 1, 1625, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(26, '1233', NULL, NULL, 20, NULL, 1, 1, 1, NULL, 1, 1, 1, 1680, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(27, '1233', NULL, NULL, 21, NULL, 1, 1, 1, NULL, 1, 1, 1, 1735, NULL, NULL, NULL, 0, 1, NULL, 1, '2023-05-14 00:00:00'),
(28, '1233', NULL, NULL, 22, NULL, 1, 1, 1, NULL, 1, 1, 1, 1790, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-01-11 00:00:00'),
(29, '12333', NULL, NULL, 23, NULL, 1, 1, 1, NULL, 1, 1, 1, 28, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-11 00:00:00'),
(30, '12333', NULL, NULL, 24, NULL, 1, 1, 1, NULL, 1, 1, 1, 110, NULL, NULL, NULL, 0, 1, NULL, 1, '2024-07-12 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spend`
--

CREATE TABLE `spend` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_principal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `name`, `address`, `phone`, `email`, `is_principal`) VALUES
(1, 'Principal', 'Calle España N°  esquina  Bolivar', '72239344', 'principal@gmail.com', 1),
(2, 'Almacen 1', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_insumo`
--

CREATE TABLE `tipo_insumo` (
  `id_tipo_insumo` int(11) NOT NULL,
  `nombre_tipo_insumo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_insumo`
--

INSERT INTO `tipo_insumo` (`id_tipo_insumo`, `nombre_tipo_insumo`) VALUES
(1, 'Producto'),
(2, 'Materia Prima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `kind` int(11) NOT NULL DEFAULT 1,
  `stock_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `comision`, `status`, `kind`, `stock_id`, `created_at`) VALUES
(1, 'Administrador', '', NULL, 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, NULL, 1, 1, NULL, '2024-06-17 18:25:50'),
(2, 'VENDEDOR', 'DE SUCURSAL', 'vendedor1', 'vendedor1@gmail.com', '4e5dd14ad252bd309088d4d1037633346131fda9', '', NULL, 1, 3, 1, '2024-06-17 18:27:04'),
(3, 'ENCARGADO', 'DE ALMACEN', 'almacenista1', 'almacenista1@gmail.com', '4368b486fefcf44b13f718a43e3cb5cc2f4c0e16', '', NULL, 1, 2, 1, '2024-06-17 18:28:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xx`
--

CREATE TABLE `xx` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `xx`
--

INSERT INTO `xx` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `yy`
--

CREATE TABLE `yy` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `yy`
--

INSERT INTO `yy` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bolsas`
--
ALTER TABLE `bolsas`
  ADD PRIMARY KEY (`id_bolsas`),
  ADD KEY `bolsas_FK` (`id_usuario`);

--
-- Indices de la tabla `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short` (`short`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `d`
--
ALTER TABLE `d`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `f`
--
ALTER TABLE `f`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `stock_destination_id` (`stock_destination_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `sell_id` (`sell_id`);

--
-- Indices de la tabla `operation_type`
--
ALTER TABLE `operation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `p`
--
ALTER TABLE `p`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `sell_id` (`sell_id`),
  ADD KEY `payment_type_id` (`payment_type_id`);

--
-- Indices de la tabla `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `producto_bolsas`
--
ALTER TABLE `producto_bolsas`
  ADD PRIMARY KEY (`id_producto_bolsas`),
  ADD KEY `producto_bolsas_product_FK` (`id_producto`),
  ADD KEY `producto_bolsas_bolsas_FK` (`id_bolsa`);

--
-- Indices de la tabla `saving`
--
ALTER TABLE `saving`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `box_id` (`box_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `spend`
--
ALTER TABLE `spend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `box_id` (`box_id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_insumo`
--
ALTER TABLE `tipo_insumo`
  ADD PRIMARY KEY (`id_tipo_insumo`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `xx`
--
ALTER TABLE `xx`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `yy`
--
ALTER TABLE `yy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bolsas`
--
ALTER TABLE `bolsas`
  MODIFY `id_bolsas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `box`
--
ALTER TABLE `box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `d`
--
ALTER TABLE `d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `f`
--
ALTER TABLE `f`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `p`
--
ALTER TABLE `p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `producto_bolsas`
--
ALTER TABLE `producto_bolsas`
  MODIFY `id_producto_bolsas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `saving`
--
ALTER TABLE `saving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sell`
--
ALTER TABLE `sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `spend`
--
ALTER TABLE `spend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_insumo`
--
ALTER TABLE `tipo_insumo`
  MODIFY `id_tipo_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `xx`
--
ALTER TABLE `xx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `yy`
--
ALTER TABLE `yy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bolsas`
--
ALTER TABLE `bolsas`
  ADD CONSTRAINT `bolsas_FK` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`stock_destination_id`) REFERENCES `stock` (`id`),
  ADD CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `operation_ibfk_4` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  ADD CONSTRAINT `operation_ibfk_5` FOREIGN KEY (`sell_id`) REFERENCES `sell` (`id`);

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`sell_id`) REFERENCES `sell` (`id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`);

--
-- Filtros para la tabla `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `price_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `producto_bolsas`
--
ALTER TABLE `producto_bolsas`
  ADD CONSTRAINT `producto_bolsas_bolsas_FK` FOREIGN KEY (`id_bolsa`) REFERENCES `bolsas` (`id_bolsas`),
  ADD CONSTRAINT `producto_bolsas_product_FK` FOREIGN KEY (`id_producto`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `p` (`id`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `d` (`id`),
  ADD CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`),
  ADD CONSTRAINT `sell_ibfk_4` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_type` (`id`),
  ADD CONSTRAINT `sell_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sell_ibfk_6` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `spend`
--
ALTER TABLE `spend`
  ADD CONSTRAINT `spend_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

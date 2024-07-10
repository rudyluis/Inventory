-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-06-2024 a las 10:39:12
-- Versión del servidor: 8.0.37-cll-lve
-- Versión de PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `eizyatlt_venta_celulares`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box`
--

CREATE TABLE `box` (
  `id` int NOT NULL,
  `stock_id` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int NOT NULL,
  `short` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` int NOT NULL,
  `val` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
(1, 'company_name', 'Nombre de la empresa', 2, 'CCHECA V3'),
(2, 'title', 'Titulo del Sistema', 2, 'INVENTSYS'),
(3, 'ticket_title', 'Titulo en el Ticket', 2, 'INVENTSYS'),
(4, 'admin_email', 'Email Administracion', 2, ''),
(5, 'report_image', 'Imagen en Reportes', 4, ''),
(6, 'imp-name', 'Nombre Impuesto', 2, 'IVA'),
(7, 'imp-val', 'Valor Impuesto (%)', 2, '0'),
(8, 'currency', 'Simbolo de Moneda', 2, 'Bs.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d`
--

CREATE TABLE `d` (
  `id` int NOT NULL,
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
  `id` int NOT NULL,
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
  `id` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation`
--

CREATE TABLE `operation` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `stock_destination_id` int DEFAULT NULL,
  `operation_from_id` int DEFAULT NULL,
  `q` float NOT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL,
  `operation_type_id` int NOT NULL,
  `sell_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `is_traspase` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_type`
--

CREATE TABLE `operation_type` (
  `id` int NOT NULL,
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
  `id` int NOT NULL,
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
  `id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `sell_id` int DEFAULT NULL,
  `person_id` int NOT NULL,
  `val` double DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int NOT NULL,
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
  `id` int NOT NULL,
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
  `is_active_access` tinyint(1) NOT NULL DEFAULT '0',
  `has_credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_limit` double DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `kind` int DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `price`
--

CREATE TABLE `price` (
  `id` int NOT NULL,
  `price_out` double DEFAULT '0',
  `product_id` int NOT NULL,
  `stock_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `inventary_min` int NOT NULL DEFAULT '10',
  `price_in` float NOT NULL,
  `price_out` float DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `presentation` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `expire_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `kind` int NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saving`
--

CREATE TABLE `saving` (
  `id` int NOT NULL,
  `concept` varchar(255) DEFAULT NULL,
  `description` text,
  `amount` float DEFAULT NULL,
  `date_at` date DEFAULT NULL,
  `kind` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell`
--

CREATE TABLE `sell` (
  `id` int NOT NULL,
  `invoice_code` varchar(255) DEFAULT NULL,
  `invoice_file` varchar(255) DEFAULT NULL,
  `comment` text,
  `ref_id` int DEFAULT NULL,
  `sell_from_id` int DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `operation_type_id` int DEFAULT '2',
  `box_id` int DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  `d_id` int DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `stock_to_id` int DEFAULT NULL,
  `stock_from_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spend`
--

CREATE TABLE `spend` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `box_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id` int NOT NULL,
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
(1, 'Principal', NULL, NULL, NULL, 1),
(2, 'Almacen 1', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `comision` float DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `kind` int NOT NULL DEFAULT '1',
  `stock_id` int DEFAULT NULL,
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
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `yy`
--

CREATE TABLE `yy` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `box`
--
ALTER TABLE `box`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `d`
--
ALTER TABLE `d`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `f`
--
ALTER TABLE `f`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `p`
--
ALTER TABLE `p`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `price`
--
ALTER TABLE `price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `saving`
--
ALTER TABLE `saving`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sell`
--
ALTER TABLE `sell`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `spend`
--
ALTER TABLE `spend`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `xx`
--
ALTER TABLE `xx`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `yy`
--
ALTER TABLE `yy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

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

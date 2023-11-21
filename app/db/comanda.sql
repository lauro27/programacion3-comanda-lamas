-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 08:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comanda`
--

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `cod_mesa` varchar(6) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `dir_foto` text COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`id`, `cod_mesa`, `estado`, `dir_foto`) VALUES
(2, 'jxsa4', 'cerrada', ''),
(3, 'ittea', 'cerrada', ''),
(4, '3z57a', 'cerrada', ''),
(5, 'ii5mb', 'cerrada', ''),
(6, 'a7raj', 'cerrada', ''),
(7, '45cjb', 'cerrada', ''),
(8, 'ueib5', 'cerrada', '');

-- --------------------------------------------------------

--
-- Table structure for table `operaciones`
--

CREATE TABLE `operaciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `operacion` text COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `operaciones`
--

INSERT INTO `operaciones` (`id`, `id_usuario`, `fecha`, `operacion`) VALUES
(1, 1, '2022-02-22 00:48:07', 'Inicio de sesion'),
(2, 0, '2022-02-22 02:33:32', 'Inicio de sesion'),
(3, 1, '2022-02-22 02:34:47', 'Agrega producto'),
(4, 0, '2023-11-20 03:55:40', 'Inicio de sesion'),
(5, 0, '2023-11-20 04:01:41', 'Inicio de sesion'),
(6, 1, '2023-11-20 04:08:34', 'Inicio de sesion'),
(7, 1, '2023-11-20 04:19:02', 'busca todos los usuarios'),
(8, 1, '2023-11-20 04:19:51', 'busca usuario'),
(9, 1, '2023-11-20 04:20:25', 'busca usuario'),
(10, 1, '2023-11-20 04:20:58', 'busca usuario'),
(11, 1, '2023-11-20 04:23:48', 'creando usuario - ERROR'),
(12, 1, '2023-11-20 04:23:54', 'creando usuario'),
(13, 1, '2023-11-20 04:24:43', 'busca usuario'),
(14, 1, '2023-11-20 05:32:45', 'Agrega producto'),
(15, 1, '2023-11-20 05:32:51', 'Agrega producto'),
(16, 1, '2023-11-20 05:33:24', 'Busca todas las mesas'),
(17, 1, '2023-11-20 05:39:56', 'Busca mesa'),
(18, 1, '2023-11-20 05:40:10', 'Busca mesa'),
(19, 1, '2023-11-20 05:41:43', 'Busca mesa'),
(20, 1, '2023-11-20 05:42:37', 'Busca mesa'),
(21, 1, '2023-11-20 05:42:53', 'Busca mesa'),
(22, 1, '2023-11-20 16:37:03', 'Agrega mesa'),
(23, 0, '2023-11-21 10:16:30', 'Inicio de sesion'),
(24, 0, '2023-11-21 10:16:56', 'Inicio de sesion'),
(25, 1, '2023-11-21 10:17:21', 'busca todos los usuarios'),
(26, 1, '2023-11-21 10:20:29', 'Busca todos los pedidos'),
(27, 1, '2023-11-21 10:32:18', 'Busca todos los pedidos'),
(28, 1, '2023-11-21 10:39:40', 'Agrega mesa'),
(29, 1, '2023-11-21 10:40:21', 'Agrega mesa'),
(30, 1, '2023-11-21 11:04:14', 'Agrega mesa'),
(31, 1, '2023-11-21 11:06:55', 'Agrega mesa'),
(32, 1, '2023-11-21 11:07:46', 'Agrega mesa'),
(33, 1, '2023-11-21 11:08:41', 'Agrega mesa'),
(34, 1, '2023-11-21 11:08:50', 'Busca todas las mesas'),
(35, 1, '2023-11-21 11:09:47', 'Verificar productos de pedido'),
(36, 1, '2023-11-21 11:12:57', 'Verificar productos de pedido'),
(37, 1, '2023-11-21 11:13:02', 'Agrega mesa'),
(38, 1, '2023-11-21 11:27:21', 'Busca todas las mesas'),
(39, 1, '2023-11-21 11:34:20', 'modificado estado de mesa'),
(40, 1, '2023-11-21 11:34:48', 'modificado estado de mesa'),
(41, 1, '2023-11-21 13:01:48', 'modificado estado de mesa - ERROR'),
(42, 1, '2023-11-21 13:02:01', 'modificado estado de mesa - ERROR'),
(43, 1, '2023-11-21 13:02:26', 'modificado estado de mesa - ERROR'),
(44, 1, '2023-11-21 13:02:53', 'modificado estado de mesa'),
(45, 1, '2023-11-21 13:07:13', 'Busca todas las mesas'),
(46, 1, '2023-11-21 13:08:06', 'Busca mesa'),
(47, 1, '2023-11-21 13:11:44', 'Agrega producto'),
(48, 1, '2023-11-21 13:12:21', 'Agrega producto'),
(49, 1, '2023-11-21 13:33:40', 'creando usuario'),
(50, 1, '2023-11-21 13:33:57', 'creando usuario'),
(51, 1, '2023-11-21 13:34:12', 'creando usuario'),
(52, 1, '2023-11-21 13:38:36', 'busca todos los usuarios'),
(53, 1, '2023-11-21 14:17:37', 'Nuevo pedido'),
(54, 1, '2023-11-21 14:18:34', 'Nuevo pedido'),
(55, 1, '2023-11-21 14:19:17', 'Verificar productos de pedido'),
(56, 1, '2023-11-21 14:19:23', 'Busca todos los pedidos'),
(57, 1, '2023-11-21 14:26:27', 'Busca todos los pedidos'),
(58, 1, '2023-11-21 14:26:48', 'Verificar productos de pedido'),
(59, 1, '2023-11-21 14:40:17', 'Inicio de sesion'),
(60, 1, '2023-11-21 14:40:34', 'Inicio de sesion'),
(61, 1, '2023-11-21 14:40:52', 'busca todos los usuarios'),
(62, 1, '2023-11-21 14:41:10', 'Inicio de sesion'),
(63, 1, '2023-11-21 14:42:19', 'Busca todos los pedidos'),
(64, 7, '2023-11-21 14:42:50', 'Verificar productos de pedido'),
(65, 7, '2023-11-21 14:42:56', 'Busca todos los pedidos'),
(66, 5, '2023-11-21 14:43:26', 'Verificar productos de pedido'),
(67, 5, '2023-11-21 14:44:55', 'Verificar productos de pedido'),
(68, 5, '2023-11-21 14:45:44', 'Verificar productos de pedido'),
(69, 5, '2023-11-21 14:46:03', 'Verificar productos de pedido'),
(70, 5, '2023-11-21 14:46:48', 'Verificar productos de pedido'),
(71, 5, '2023-11-21 14:46:53', 'Verificar productos de pedido'),
(72, 5, '2023-11-21 14:47:07', 'Verificar productos de pedido'),
(73, 5, '2023-11-21 14:51:50', 'Preparando pedido'),
(74, 5, '2023-11-21 14:51:56', 'Verificar productos de pedido'),
(75, 5, '2023-11-21 14:53:53', 'Pedido listo'),
(76, 5, '2023-11-21 14:53:58', 'Verificar productos de pedido'),
(77, 5, '2023-11-21 14:54:06', 'Busca todos los pedidos'),
(78, 5, '2023-11-21 14:54:32', 'Inicio de sesion'),
(79, 4, '2023-11-21 14:56:13', 'Entrega pedido'),
(80, 4, '2023-11-21 14:56:17', 'Busca todos los pedidos'),
(81, 4, '2023-11-21 15:22:07', 'Nuevo pedido'),
(82, 4, '2023-11-21 15:28:28', 'Cancelar pedido'),
(83, 4, '2023-11-21 15:31:20', 'Busca todos los pedidos'),
(84, 5, '2023-11-21 15:36:39', 'Preparando pedido'),
(85, 5, '2023-11-21 15:41:04', 'Busca todos los pedidos listos - ERROR'),
(86, 1, '2023-11-21 15:41:19', 'Busca todos los pedidos listos'),
(87, 1, '2023-11-21 15:41:54', 'Nuevo pedido'),
(88, 1, '2023-11-21 15:41:57', 'Nuevo pedido'),
(89, 1, '2023-11-21 15:52:28', 'Busca mesa'),
(90, 1, '2023-11-21 15:54:27', 'Preparando pedido'),
(91, 5, '2023-11-21 15:55:01', 'Preparando pedido'),
(92, 5, '2023-11-21 15:58:06', 'Preparando pedido'),
(93, 5, '2023-11-21 15:59:11', 'Pedido listo'),
(94, 5, '2023-11-21 15:59:22', 'Pedido listo'),
(95, 5, '2023-11-21 16:00:53', 'Pedido listo'),
(96, 5, '2023-11-21 16:01:16', 'Pedido listo'),
(97, 5, '2023-11-21 16:06:13', 'Pedido listo'),
(98, 5, '2023-11-21 16:09:35', 'Pedido listo - ERROR'),
(99, 5, '2023-11-21 16:10:14', 'Pedido listo - ERROR'),
(100, 6, '2023-11-21 16:10:54', 'Preparando pedido'),
(101, 6, '2023-11-21 16:11:01', 'Pedido listo'),
(102, 1, '2023-11-21 16:11:37', 'Busca todos los pedidos listos'),
(103, 1, '2023-11-21 16:11:56', 'Entrega pedido'),
(104, 1, '2023-11-21 16:12:05', 'Entrega pedido'),
(105, 5, '2023-11-21 16:13:03', 'Verificar productos de pedido'),
(106, 5, '2023-11-21 16:13:11', 'Pedido listo'),
(107, 1, '2023-11-21 16:13:32', 'Entrega pedido'),
(108, 1, '2023-11-21 16:16:02', 'Traer cuenta de mesa'),
(109, 1, '2023-11-21 16:16:26', 'Traer cuenta de mesa'),
(110, 1, '2023-11-21 16:16:44', 'Busca todas las mesas'),
(111, 1, '2023-11-21 16:18:22', 'Cierra mesa');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_cliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `estimado` datetime DEFAULT NULL,
  `hora_inicio` datetime NOT NULL,
  `hora_entrega` datetime DEFAULT NULL,
  `cod_mesa` varchar(6) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cod_pedido` varchar(6) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_usuario`, `nombre_cliente`, `id_producto`, `estado`, `estimado`, `hora_inicio`, `hora_entrega`, `cod_mesa`, `cod_pedido`) VALUES
(1, 1, 'Pedro', 1, 'pagado', '2023-11-21 14:24:37', '2023-11-21 14:17:37', '2023-11-21 14:53:53', 'jxsa4', '1u6v7'),
(2, 1, 'Pedro', 2, 'pagado', '2023-11-21 14:20:34', '2023-11-21 14:18:34', '2023-11-21 15:59:11', 'jxsa4', 'r7314'),
(3, 4, 'Pedro', 2, 'cancelado', NULL, '2023-11-21 15:22:07', NULL, 'jxsa4', 'jb0s8'),
(4, 1, 'Pedro', 3, 'pagado', '2023-11-21 15:43:54', '2023-11-21 15:41:54', '2023-11-21 16:11:01', 'jxsa4', 'sch5p'),
(5, 1, 'Pedro', 4, 'pagado', '2023-11-21 15:43:57', '2023-11-21 15:41:57', '2023-11-21 16:13:11', 'jxsa4', 'dqlzl');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precio` float NOT NULL,
  `sector` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `sector`) VALUES
(1, 'Empanada de carne', 20, 'cocina'),
(2, 'Milanesa a caballo', 1500, 'cocina'),
(3, 'Daikiri', 5000, 'vinos'),
(4, 'Hamburguesa de garbanzo', 5000, 'cocina');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `clave` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `rol` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `rol`, `fecha_baja`) VALUES
(1, 'socio1', '$2y$10$oh7YTzyCiNwBPnHBVQPWZ.L7zEKzKz2pPSPUitb7ZBy9Po2vhnDm.', 'socio', NULL),
(2, 'socio2', '$2y$10$PyZCkhqxL70R96wp4iEfnuCKrpLX/rrWXSFLFeEI/DEJhWNmTDBii', 'socio', NULL),
(3, 'socio3', '$2y$10$M2lWBSN8e7OQ84YQbHta2uGWrWYPAZ0kIcw29pgbIEojyTC4XETsG', 'socio', NULL),
(4, 'Valentino', '$2y$10$cW9vFNOmJWXZYiwhIJjbG.h0myVaJFBowNa.hwG1Zqg6H/hWBK3uC', 'mozo', NULL),
(5, 'Chef', '$2y$10$MM.qWH19GcteXW41JLQVqu1cpC7lwJVWhHFI2fF7hEEnFh61zEPe6', 'cocinero', NULL),
(6, 'Bartender', '$2y$10$UQ9aoQJTlSFL2vIJTz4NnuNAJ.0Fgt6vWn4Es9/0NrKOMZPrazi3q', 'bartender', NULL),
(7, 'Cervecero', '$2y$10$aOtaj5ZyV9BjG/0yREElXO9qFKgnmAz/djYDbb96mKzrqqUjYV.I2', 'cervecero', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2025 a las 21:17:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_piscicola`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentacion`
--

CREATE TABLE `alimentacion` (
  `id` int(11) NOT NULL,
  `id_pez` int(11) DEFAULT NULL,
  `tipo_alimento` varchar(100) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alimentacion`
--

INSERT INTO `alimentacion` (`id`, `id_pez`, `tipo_alimento`, `cantidad`, `fecha`) VALUES
(1, 1, 'Pellets', 5, '2025-03-26'),
(2, 2, 'Harina de pescado', 4, '2025-03-26'),
(3, 3, 'Pellets', 6, '2025-03-27'),
(4, 4, 'Granos', 5, '2025-03-27'),
(5, 1, 'Pellets', 5, '2025-03-26'),
(6, 2, 'Harina de pescado', 4, '2025-03-26'),
(7, 3, 'Pellets', 6, '2025-03-27'),
(8, 4, 'Granos', 5, '2025-03-27'),
(9, 1, 'Pellets', 5, '2025-03-26'),
(10, 2, 'Harina de pescado', 4, '2025-03-26'),
(11, 3, 'Pellets', 6, '2025-03-27'),
(12, 4, 'Granos', 5, '2025-03-27'),
(19, NULL, 'Pellets flotantes', 20.5, '2025-03-25'),
(22, NULL, 'Harina de pescado', 15, '2025-03-26'),
(33, NULL, 'Alimento balanceado', 18.3, '2025-03-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cosecha`
--

CREATE TABLE `cosecha` (
  `id` int(11) NOT NULL,
  `id_estanque` int(11) DEFAULT NULL,
  `cantidad_cosechada` int(11) DEFAULT NULL,
  `peso_total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cosecha`
--

INSERT INTO `cosecha` (`id`, `id_estanque`, `cantidad_cosechada`, `peso_total`, `fecha`) VALUES
(1, 3, 180, 216, '2025-03-27'),
(2, 7, 500, 900, '2025-02-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estanques`
--

CREATE TABLE `estanques` (
  `id` int(11) NOT NULL,
  `id_propietario` int(11) DEFAULT NULL,
  `nombre_estanque` varchar(50) NOT NULL,
  `capacidad` float DEFAULT NULL,
  `ubicacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estanques`
--

INSERT INTO `estanques` (`id`, `id_propietario`, `nombre_estanque`, `capacidad`, `ubicacion`) VALUES
(1, 1, 'Estanque 1', 5000, 'Sector A'),
(2, 1, 'Estanque 2', 7000, 'Sector B'),
(3, 2, 'Estanque 3', 6000, 'Sector C'),
(4, 1, 'Estanque 1', 5000, 'Sector A'),
(5, 1, 'Estanque 2', 7000, 'Sector B'),
(6, 2, 'Estanque 3', 6000, 'Sector C'),
(7, 1, 'Estanque 1', 5000, 'Sector A'),
(8, 1, 'Estanque 2', 7000, 'Sector B'),
(9, 2, 'Estanque 3', 6000, 'Sector C'),
(11, NULL, 'Estanque Los Nogales', 2000, 'Finca El Refugio, Boyacá'),
(22, NULL, 'Estanque Azul', 1500, 'Vereda La Primavera, Antioquia'),
(33, NULL, 'Estanque La Cascada', 1800, 'Zona Rural, Valle del Cauca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peces`
--

CREATE TABLE `peces` (
  `id` int(11) NOT NULL,
  `id_estanque` int(11) DEFAULT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `peso_promedio` float DEFAULT NULL,
  `estado` enum('Crecimiento','Listo para cosecha','Vendido','Muerto') DEFAULT 'Crecimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peces`
--

INSERT INTO `peces` (`id`, `id_estanque`, `especie`, `cantidad`, `peso_promedio`, `estado`) VALUES
(1, 1, 'Tilapia', 200, 0.5, 'Crecimiento'),
(2, 1, 'Trucha', 150, 0.8, 'Crecimiento'),
(3, 2, 'Tilapia', 250, 0.6, 'Crecimiento'),
(4, 3, 'Carpa', 180, 1.2, 'Listo para cosecha'),
(5, 1, 'Tilapia', 200, 0.5, 'Crecimiento'),
(6, 1, 'Trucha', 150, 0.8, 'Crecimiento'),
(7, 2, 'Tilapia', 250, 0.6, 'Crecimiento'),
(8, 3, 'Carpa', 180, 1.2, 'Listo para cosecha'),
(9, 1, 'Tilapia', 200, 0.5, 'Crecimiento'),
(10, 1, 'Trucha', 150, 0.8, 'Crecimiento'),
(11, 2, 'Tilapia', 250, 0.6, 'Crecimiento'),
(12, 3, 'Carpa', 180, 1.2, 'Listo para cosecha'),
(18, NULL, 'Tilapia Roja', 500, 0.8, 'Crecimiento'),
(22, NULL, 'Bagre', 300, 1.2, 'Listo para cosecha'),
(33, NULL, 'Trucha', 400, 0.9, 'Crecimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `nombre`, `contacto`, `direccion`) VALUES
(1, 'Carlos López', 'carlos@email.com', 'Finca El Paraíso, Vereda La Esperanza'),
(2, 'Ana Gómez', 'ana@email.com', 'Granja Los Lagos, Zona Norte'),
(3, 'Carlos López', 'carlos@email.com', 'Finca El Paraíso, Vereda La Esperanza'),
(4, 'Ana Gómez', 'ana@email.com', 'Granja Los Lagos, Zona Norte'),
(5, 'Carlos Lopez', 'carlos@email.com', 'Finca El Paraiso, Vereda La Esperanza'),
(6, 'Ana Gomez', 'ana@email.com', 'Granja Los Lagos, Zona Norte'),
(7, 'Juan Pérez', '3204567890', 'Calle 10 #15-20, Bogotá'),
(8, 'María Rodríguez', '3109876543', 'Carrera 5 #12-34, Medellín'),
(9, 'Carlos Gómez', '3001234567', 'Avenida 7 #8-56, Cali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reproduccion`
--

CREATE TABLE `reproduccion` (
  `id` int(11) NOT NULL,
  `id_madre` int(11) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `fecha_reproduccion` date DEFAULT NULL,
  `id_cria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reproduccion`
--

INSERT INTO `reproduccion` (`id`, `id_madre`, `id_padre`, `fecha_reproduccion`, `id_cria`) VALUES
(1, 1, 2, '2025-03-20', NULL),
(2, 3, 4, '2025-03-22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud`
--

CREATE TABLE `salud` (
  `id` int(11) NOT NULL,
  `id_pez` int(11) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salud`
--

INSERT INTO `salud` (`id`, `id_pez`, `tipo`, `descripcion`, `fecha`) VALUES
(1, 1, 'Vacunacion', 'Vacuna contra parasitos', '2025-03-25'),
(2, 2, 'Desparasitacion', 'Tratamiento antiparasitario', '2025-03-26'),
(3, 3, 'Antibiotico', 'Antibiotico para infeccion cutanea', '2025-03-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_estanque` int(11) DEFAULT NULL,
  `comprador` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_estanque`, `comprador`, `cantidad`, `precio_total`, `fecha_venta`) VALUES
(1, 3, 'Supermercado Los Rios', 150, 3000.00, '2025-03-28'),
(2, NULL, 'Supermercado PezMar', 200, 500000.00, '2025-03-20'),
(3, NULL, 'Restaurante Mar Azul', 150, 375000.00, '2025-03-22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pez` (`id_pez`);

--
-- Indices de la tabla `cosecha`
--
ALTER TABLE `cosecha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estanque` (`id_estanque`);

--
-- Indices de la tabla `estanques`
--
ALTER TABLE `estanques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_propietario` (`id_propietario`);

--
-- Indices de la tabla `peces`
--
ALTER TABLE `peces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estanque` (`id_estanque`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reproduccion`
--
ALTER TABLE `reproduccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_madre` (`id_madre`),
  ADD KEY `id_padre` (`id_padre`),
  ADD KEY `id_cria` (`id_cria`);

--
-- Indices de la tabla `salud`
--
ALTER TABLE `salud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pez` (`id_pez`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estanque` (`id_estanque`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `cosecha`
--
ALTER TABLE `cosecha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estanques`
--
ALTER TABLE `estanques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `peces`
--
ALTER TABLE `peces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reproduccion`
--
ALTER TABLE `reproduccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salud`
--
ALTER TABLE `salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`id_pez`) REFERENCES `peces` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cosecha`
--
ALTER TABLE `cosecha`
  ADD CONSTRAINT `cosecha_ibfk_1` FOREIGN KEY (`id_estanque`) REFERENCES `estanques` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `estanques`
--
ALTER TABLE `estanques`
  ADD CONSTRAINT `estanques_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `peces`
--
ALTER TABLE `peces`
  ADD CONSTRAINT `peces_ibfk_1` FOREIGN KEY (`id_estanque`) REFERENCES `estanques` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reproduccion`
--
ALTER TABLE `reproduccion`
  ADD CONSTRAINT `reproduccion_ibfk_1` FOREIGN KEY (`id_madre`) REFERENCES `peces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reproduccion_ibfk_2` FOREIGN KEY (`id_padre`) REFERENCES `peces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reproduccion_ibfk_3` FOREIGN KEY (`id_cria`) REFERENCES `peces` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `salud`
--
ALTER TABLE `salud`
  ADD CONSTRAINT `salud_ibfk_1` FOREIGN KEY (`id_pez`) REFERENCES `peces` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_estanque`) REFERENCES `estanques` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

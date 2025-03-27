-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2025 a las 14:15:04
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

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
-- Estructura de tabla para la tabla `alimentación`
--

CREATE TABLE `alimentación` (
  `id` int(11) NOT NULL,
  `peces_id` int(11) NOT NULL,
  `tipo_alimento` varchar(100) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cosecha (registro de producción)`
--

CREATE TABLE `cosecha (registro de producción)` (
  `id` int(11) NOT NULL,
  `estanques_id` int(11) NOT NULL,
  `cantidad_cosechada` int(11) DEFAULT NULL,
  `peso_total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estanques`
--

CREATE TABLE `estanques` (
  `id` int(11) NOT NULL,
  `propietarios_id` int(11) NOT NULL,
  `nombre_estanque` varchar(50) NOT NULL,
  `capacidad` float DEFAULT NULL,
  `ubicacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peces`
--

CREATE TABLE `peces` (
  `id` int(11) NOT NULL,
  `estanques_id` int(11) NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `peso_promedio` float DEFAULT NULL,
  `estado` enum('Crecimiento','Listo para cosecha','Vendido','Muerto') DEFAULT 'Crecimiento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pez`
--

CREATE TABLE `pez` (
  `idpez` int(11) NOT NULL,
  `sexo` enum('Marcho','Hembra') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reproducción`
--

CREATE TABLE `reproducción` (
  `id` int(11) NOT NULL,
  `fecha_reproduccion` date DEFAULT NULL,
  `peces_id` int(11) NOT NULL,
  `pez_idpez` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud (vacunación y tratamientos)`
--

CREATE TABLE `salud (vacunación y tratamientos)` (
  `id` int(11) NOT NULL,
  `peces_id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `estanques_id` int(11) NOT NULL,
  `comprador` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentación`
--
ALTER TABLE `alimentación`
  ADD PRIMARY KEY (`id`,`peces_id`),
  ADD KEY `fk_alimentación_peces1_idx` (`peces_id`),
  ADD KEY `fk_alimentación_peces_idx` (`peces_id`);

--
-- Indices de la tabla `cosecha (registro de producción)`
--
ALTER TABLE `cosecha (registro de producción)`
  ADD PRIMARY KEY (`id`,`estanques_id`),
  ADD KEY `fk_cosecha (registro de producción)_estanques1_idx` (`estanques_id`);

--
-- Indices de la tabla `estanques`
--
ALTER TABLE `estanques`
  ADD PRIMARY KEY (`id`,`propietarios_id`);

--
-- Indices de la tabla `peces`
--
ALTER TABLE `peces`
  ADD PRIMARY KEY (`id`,`estanques_id`),
  ADD KEY `fk_peces_estanques1_idx` (`estanques_id`),
  ADD KEY `fk_peces_estanques_idx` (`estanques_id`);

--
-- Indices de la tabla `pez`
--
ALTER TABLE `pez`
  ADD PRIMARY KEY (`idpez`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reproducción`
--
ALTER TABLE `reproducción`
  ADD PRIMARY KEY (`id`,`peces_id`,`pez_idpez`),
  ADD KEY `fk_reproducción_peces1_idx` (`peces_id`),
  ADD KEY `fk_reproducción_pez1_idx` (`pez_idpez`);

--
-- Indices de la tabla `salud (vacunación y tratamientos)`
--
ALTER TABLE `salud (vacunación y tratamientos)`
  ADD PRIMARY KEY (`id`,`peces_id`),
  ADD KEY `fk_salud (vacunación y tratamientos)_peces1_idx` (`peces_id`),
  ADD KEY `fk_salud (vacunación y tratamientos)_peces_idx` (`peces_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`,`estanques_id`),
  ADD KEY `fk_ventas_estanques1_idx` (`estanques_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentación`
--
ALTER TABLE `alimentación`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cosecha (registro de producción)`
--
ALTER TABLE `cosecha (registro de producción)`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estanques`
--
ALTER TABLE `estanques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peces`
--
ALTER TABLE `peces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pez`
--
ALTER TABLE `pez`
  MODIFY `idpez` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reproducción`
--
ALTER TABLE `reproducción`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salud (vacunación y tratamientos)`
--
ALTER TABLE `salud (vacunación y tratamientos)`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

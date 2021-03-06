-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2016 a las 07:50:45
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sapch`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_salidas`
--

CREATE TABLE IF NOT EXISTS `entradas_salidas` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `hr_entrada` time NOT NULL,
  `hr_salida` time DEFAULT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) NOT NULL,
  `log` text NOT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE IF NOT EXISTS `ninos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `genero` char(1) NOT NULL,
  `id_villa` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos_salidas`
--

CREATE TABLE IF NOT EXISTS `ninos_salidas` (
  `id_nino` bigint(20) NOT NULL,
  `id_salida` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_externo`
--

CREATE TABLE IF NOT EXISTS `personal_externo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `empresa` varchar(120) NOT NULL,
  `genero` char(1) NOT NULL,
  `id_tipo_pe` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE IF NOT EXISTS `salidas` (
  `id` bigint(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hr_salida` time NOT NULL,
  `hr_regreso` time DEFAULT NULL,
  `motivo` text NOT NULL,
  `lugar` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_personal_externo`
--

CREATE TABLE IF NOT EXISTS `tipo_personal_externo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo_usuario` varchar(2) NOT NULL,
  `num_empleado` int(8) NOT NULL,
  `genero` char(1) NOT NULL,
  `contrasena` varchar(120) NOT NULL,
  `id_area` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `tipo_usuario`, `num_empleado`, `genero`, `contrasena`, `id_area`) VALUES
(1, 'Palmira Lopez', 'A', 1, 'F', 'palmira', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `villas`
--

CREATE TABLE IF NOT EXISTS `villas` (
  `id` bigint(20) NOT NULL,
  `numero` int(2) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE IF NOT EXISTS `visitas` (
  `id` bigint(20) NOT NULL,
  `hr_entrada` time NOT NULL,
  `hr_salida` time DEFAULT NULL,
  `motivo` text NOT NULL,
  `fecha` date NOT NULL,
  `agendada` tinyint(1) NOT NULL,
  `id_pe` bigint(20) NOT NULL,
  `id_nino` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entradas_salidas`
--
ALTER TABLE `entradas_salidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_villa` (`id_villa`);

--
-- Indices de la tabla `ninos_salidas`
--
ALTER TABLE `ninos_salidas`
  ADD UNIQUE KEY `id_niño` (`id_nino`),
  ADD UNIQUE KEY `id_salida` (`id_salida`);

--
-- Indices de la tabla `personal_externo`
--
ALTER TABLE `personal_externo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_tipo_pe` (`id_tipo_pe`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_personal_externo`
--
ALTER TABLE `tipo_personal_externo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `villas`
--
ALTER TABLE `villas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_niño` (`id_nino`),
  ADD KEY `id_per` (`id_pe`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `entradas_salidas`
--
ALTER TABLE `entradas_salidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ninos`
--
ALTER TABLE `ninos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personal_externo`
--
ALTER TABLE `personal_externo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_personal_externo`
--
ALTER TABLE `tipo_personal_externo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `villas`
--
ALTER TABLE `villas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas_salidas`
--
ALTER TABLE `entradas_salidas`
  ADD CONSTRAINT `entradas_salidas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD CONSTRAINT `ninos_ibfk_1` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id`);

--
-- Filtros para la tabla `ninos_salidas`
--
ALTER TABLE `ninos_salidas`
  ADD CONSTRAINT `ninos_salidas_ibfk_1` FOREIGN KEY (`id_nino`) REFERENCES `ninos` (`id`),
  ADD CONSTRAINT `ninos_salidas_ibfk_2` FOREIGN KEY (`id_salida`) REFERENCES `salidas` (`id`);

--
-- Filtros para la tabla `personal_externo`
--
ALTER TABLE `personal_externo`
  ADD CONSTRAINT `personal_externo_ibfk_1` FOREIGN KEY (`id_tipo_pe`) REFERENCES `tipo_personal_externo` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`id_nino`) REFERENCES `ninos` (`id`),
  ADD CONSTRAINT `visitas_ibfk_3` FOREIGN KEY (`id_pe`) REFERENCES `personal_externo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

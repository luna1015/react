-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2023 a las 23:31:24
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador cita',
  `id_cliente_fk` int(10) UNSIGNED NOT NULL COMMENT 'Identificador cliente',
  `id_esteticista_fk` int(10) UNSIGNED NOT NULL COMMENT 'Identificador esteticista',
  `id_servicio_fk` int(10) UNSIGNED NOT NULL COMMENT 'Identificador servicio',
  `costo_cita` float NOT NULL COMMENT 'Costo del servicio',
  `fecha_cita` date NOT NULL COMMENT 'Fecha de la cita',
  `hora_inicio_cita` varchar(15) NOT NULL COMMENT 'Hora de inicio de la cita',
  `hora_fin_cita` varchar(15) NOT NULL COMMENT 'Hora de finalizacion de la cita',
  `estado_cita` varchar(10) NOT NULL COMMENT 'Estado de la cita: asignada, rechazada o terminada',
  `eliminado_cita` tinyint(1) NOT NULL COMMENT 'Eliminado: Si (1) y No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `id_cliente_fk`, `id_esteticista_fk`, `id_servicio_fk`, `costo_cita`, `fecha_cita`, `hora_inicio_cita`, `hora_fin_cita`, `estado_cita`, `eliminado_cita`) VALUES
(1, 1, 1, 1, 60000, '2023-07-14', '11:00', '13:00', '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) UNSIGNED NOT NULL COMMENT 'Identificador cliente',
  `numero_documento_cliente` varchar(15) NOT NULL COMMENT 'Numero de documento',
  `tipo_documento_cliente` varchar(20) NOT NULL COMMENT 'Tipo documento',
  `nombre_cliente` varchar(80) NOT NULL COMMENT 'Nombre cliente',
  `apellidos_cliente` varchar(80) NOT NULL COMMENT 'Apellido cliente',
  `fecha_nacimiento_cliente` date NOT NULL COMMENT 'Fecha nacimiento cliente',
  `direccion_cliente` varchar(127) DEFAULT NULL COMMENT 'Direccion cliente',
  `celular_cliente` varchar(20) DEFAULT NULL COMMENT 'Celular cliente',
  `email_cliente` varchar(80) DEFAULT NULL COMMENT 'Correo electronico cliente',
  `activo_cliente` tinyint(1) DEFAULT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_cliente` tinyint(1) DEFAULT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `numero_documento_cliente`, `tipo_documento_cliente`, `nombre_cliente`, `apellidos_cliente`, `fecha_nacimiento_cliente`, `direccion_cliente`, `celular_cliente`, `email_cliente`, `activo_cliente`, `eliminado_cliente`) VALUES
(1, '333777', 'CC', 'José', 'García', '2013-07-09', 'Nose', '777', 'sisas@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esteticista`
--

CREATE TABLE `esteticista` (
  `id_esteticista` int(10) UNSIGNED NOT NULL COMMENT 'Identificador esteticista',
  `numero_documento_esteticista` varchar(20) NOT NULL COMMENT 'Numero documento esteticista',
  `tipo_documento_esteticista` varchar(20) NOT NULL COMMENT 'Tipo documento',
  `nombre_esteticista` varchar(80) NOT NULL COMMENT 'Nombre esteticista',
  `apellidos_esteticista` varchar(80) NOT NULL COMMENT 'Apellido esteticista',
  `fecha_nacimiento_esteticista` date DEFAULT NULL,
  `direccion_esteticista` varchar(127) DEFAULT NULL COMMENT 'Direccion esteticista',
  `celular_esteticista` varchar(20) DEFAULT NULL COMMENT 'Celular esteticista',
  `email_esteticista` varchar(80) DEFAULT NULL COMMENT 'Correo electronico esteticista',
  `activo_esteticista` tinyint(1) DEFAULT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_esteticista` tinyint(1) DEFAULT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `esteticista`
--

INSERT INTO `esteticista` (`id_esteticista`, `numero_documento_esteticista`, `tipo_documento_esteticista`, `nombre_esteticista`, `apellidos_esteticista`, `fecha_nacimiento_esteticista`, `direccion_esteticista`, `celular_esteticista`, `email_esteticista`, `activo_esteticista`, `eliminado_esteticista`) VALUES
(1, '1234567', 'CC', 'Pepito', 'Perez', '2013-07-11', 'Calle 20', '555', 'nose@gmail.com', 1, 0),
(2, '777555', 'CC', 'Lola', 'Castro', '2013-07-10', 'Carrera 15', '555', 'nose@gmail.com', 1, 0),
(3, '1', 'CC', 'cxdcdcd', 'zz', '2023-07-21', 'Calle 20', '1', 'nose@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id_funcion` int(10) UNSIGNED NOT NULL COMMENT 'Identificador funcion',
  `id_esteticista_fk` int(10) UNSIGNED NOT NULL COMMENT 'Identificador esteticista',
  `nombre_funcion` varchar(80) NOT NULL COMMENT 'Nombre de la funcion realizada',
  `descripcion_funcion` varchar(127) DEFAULT NULL COMMENT 'Descripcion de la funcion',
  `activo_funcion` tinyint(1) UNSIGNED NOT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_funcion` tinyint(1) UNSIGNED NOT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`id_funcion`, `id_esteticista_fk`, `nombre_funcion`, `descripcion_funcion`, `activo_funcion`, `eliminado_funcion`) VALUES
(1, 1, 'Funcion 1', 'Descripción función.', 1, 0),
(2, 2, 'Función 2', 'Descripción función 2.', 1, 0),
(11, 1, 'cxdcdcd', 'ddd', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id_rol` int(10) UNSIGNED NOT NULL COMMENT 'Identificador rol',
  `nombre_rol` varchar(20) NOT NULL COMMENT 'Nombre rol',
  `descripcion_rol` varchar(80) NOT NULL COMMENT 'Descripcion rol',
  `activo_rol` tinyint(1) NOT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_rol` tinyint(1) UNSIGNED NOT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`id_rol`, `nombre_rol`, `descripcion_rol`, `activo_rol`, `eliminado_rol`) VALUES
(1, 'administrador', 'Gestion del sistema.', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del servicio',
  `nombre_servicio` varchar(80) NOT NULL COMMENT 'Nombre del servicio',
  `descripcion_servicio` varchar(127) DEFAULT NULL COMMENT 'Descripcion del servicio',
  `tarifa_servicio` float UNSIGNED DEFAULT NULL COMMENT 'Tarifa del servicio',
  `activo_servicio` tinyint(1) UNSIGNED NOT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_servicio` tinyint(1) UNSIGNED NOT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre_servicio`, `descripcion_servicio`, `tarifa_servicio`, `activo_servicio`, `eliminado_servicio`) VALUES
(1, 'Masaje relajante', 'Cuerpo entero.', 80000, 1, 0),
(2, 'Masaje reductor', 'Abdomen y gluteos.', 65000, 1, 0),
(62, 'cxdcdcd', 'xxx', 7, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_sistema`
--

CREATE TABLE `usuario_sistema` (
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'Identificador usuario',
  `nombre_usuario` varchar(80) NOT NULL COMMENT 'Nombre completo usuario',
  `id_rol_fk` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del rol de usuario',
  `apellidos_usuario` varchar(80) NOT NULL COMMENT 'Apellidos uusario',
  `user_usuario` varchar(80) NOT NULL COMMENT 'Login usuario',
  `password_usuario` varchar(80) NOT NULL COMMENT 'Clave del usuario',
  `activo_usuario` tinyint(1) UNSIGNED NOT NULL COMMENT 'Activo: Si (1) No (0)',
  `eliminado_usuario` tinyint(1) UNSIGNED NOT NULL COMMENT 'Eliminado: Si (1) No (0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_sistema`
--

INSERT INTO `usuario_sistema` (`id_usuario`, `nombre_usuario`, `id_rol_fk`, `apellidos_usuario`, `user_usuario`, `password_usuario`, `activo_usuario`, `eliminado_usuario`) VALUES
(1, 'Claudia Milena', 1, 'Pulido Rodriguez', 'admin', '12345', 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD UNIQUE KEY `iu_cita_est_fecha_hora` (`id_esteticista_fk`,`fecha_cita`,`hora_inicio_cita`),
  ADD KEY `fk_cita_id_cliente` (`id_cliente_fk`),
  ADD KEY `fk_cita_id_esteticista` (`id_esteticista_fk`),
  ADD KEY `fk_cita_id_servicio` (`id_servicio_fk`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `fk_cliente_id_tipo_documento` (`tipo_documento_cliente`);

--
-- Indices de la tabla `esteticista`
--
ALTER TABLE `esteticista`
  ADD PRIMARY KEY (`id_esteticista`),
  ADD KEY `fk_esteticista_id_tipo_documento` (`tipo_documento_esteticista`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id_funcion`),
  ADD KEY `fk_funcion_id_esteticista` (`id_esteticista_fk`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_id_rol` (`id_rol_fk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador cita', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador cliente', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `esteticista`
--
ALTER TABLE `esteticista`
  MODIFY `id_esteticista` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador esteticista', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `id_funcion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador funcion', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  MODIFY `id_rol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador rol', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del servicio', AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador usuario', AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `fk_cita_id_cliente` FOREIGN KEY (`id_cliente_fk`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_cita_id_esteticista` FOREIGN KEY (`id_esteticista_fk`) REFERENCES `esteticista` (`id_esteticista`),
  ADD CONSTRAINT `fk_cita_id_servicio` FOREIGN KEY (`id_servicio_fk`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fk_funcion_id_esteticista` FOREIGN KEY (`id_esteticista_fk`) REFERENCES `esteticista` (`id_esteticista`);

--
-- Filtros para la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  ADD CONSTRAINT `fk_usuario_id_rol` FOREIGN KEY (`id_rol_fk`) REFERENCES `rol_usuario` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

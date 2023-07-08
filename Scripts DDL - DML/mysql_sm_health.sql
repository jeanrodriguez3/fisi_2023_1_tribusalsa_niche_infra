-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 16:21:03
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
-- Base de datos: `mysql_sm_health`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `cita_id` int(10) UNSIGNED NOT NULL,
  `horarios_horario_id` int(10) UNSIGNED NOT NULL,
  `medicos_medico_id` int(10) UNSIGNED NOT NULL,
  `especialidades_especialidad_id` int(10) UNSIGNED NOT NULL,
  `usuarios_usuario_id` int(10) UNSIGNED NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `especialidad_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`especialidad_id`, `nombre`) VALUES
(1, 'Medicina general'),
(2, 'Dermatología'),
(3, 'Oftalmología'),
(4, 'Ginecología'),
(5, 'Cirugía plástica'),
(6, 'Traumatología'),
(7, 'Neumología'),
(8, 'Cardiología'),
(9, 'Psicología'),
(10, 'Odontología'),
(11, 'Fisioterapia'),
(12, 'Obstetricia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `horario_id` int(10) UNSIGNED NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `disponibilidad` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`horario_id`, `hora_inicio`, `hora_fin`, `disponibilidad`) VALUES
(1, '08:00:00', '09:00:00', 1),
(2, '09:00:00', '10:00:00', 1),
(3, '10:00:00', '11:00:00', 1),
(4, '11:00:00', '12:00:00', 1),
(5, '14:00:00', '15:00:00', 1),
(6, '15:00:00', '16:00:00', 1),
(7, '16:00:00', '17:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `medico_id` int(10) UNSIGNED NOT NULL,
  `especialidades_especialidad_id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`medico_id`, `especialidades_especialidad_id`, `nombre_completo`, `dni`) VALUES
(1, 1, 'Juan Perez Gomez', '45789623'),
(2, 2, 'Maria Lopez Martinez', '60928751'),
(3, 3, 'Luis Torres Sanchez', '51243698'),
(4, 4, 'Ana Gonzalez Rodriguez', '69872354'),
(5, 5, 'Carlos Ramirez Jimenez', '62139874'),
(6, 6, 'Laura Sanchez Ruiz', '45687239'),
(7, 7, 'Pedro Martinez Herrera', '60984312'),
(8, 8, 'Sofia Herrera Garcia', '53219847'),
(9, 9, 'Javier Castro Torres', '61234587'),
(10, 10, 'Isabella Gomez Lopez', '50987234'),
(11, 11, 'Diego Silva Rojas', '48765432'),
(12, 12, 'Valentina Rojas Martinez', '61293847'),
(13, 1, 'Gabriel Vargas Morales', '53214567'),
(14, 2, 'Andrea Castro Silva', '61287453'),
(15, 3, 'Daniel Mendoza Rojas', '45738912'),
(16, 4, 'Fernanda Sanchez Gomez', '60981237'),
(17, 5, 'Sebastian Medina Lopez', '49876123'),
(18, 6, 'Valeria Torres Garcia', '51237894'),
(19, 7, 'Maximiliano Rodriguez Herrera', '60984327'),
(20, 8, 'Camila Martinez Rojas', '53213467'),
(21, 9, 'Emilio Gonzalez Ruiz', '69873421'),
(22, 10, 'Isabella Morales Sanchez', '45678123'),
(23, 11, 'Lucas Lopez Torres', '50982317'),
(24, 12, 'Catalina Silva Martinez', '48765321'),
(25, 1, 'Diego Soto Herrera', '53216784'),
(26, 2, 'Carolina Perez Rojas', '61239874'),
(27, 3, 'Sebastian Castro Martinez', '45762138'),
(28, 4, 'Valeria Rojas Garcia', '60981234'),
(29, 5, 'Mateo Lopez Sanchez', '48763521'),
(30, 6, 'Isabella Torres Lopez', '51238794'),
(31, 7, 'Emilia Gonzalez Martinez', '60984321'),
(32, 8, 'Gabriel Silva Rojas', '49876132'),
(33, 9, 'Camila Martinez Ruiz', '53219874'),
(34, 10, 'Maximiliano Morales Sanchez', '45781236'),
(35, 11, 'Valeria Sanchez Torres', '69872314'),
(36, 12, 'Lucas Rojas Garcia', '61234578');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos_has_horarios`
--

CREATE TABLE `medicos_has_horarios` (
  `medicos_medico_id` int(10) UNSIGNED NOT NULL,
  `horarios_horario_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos_has_horarios`
--

INSERT INTO `medicos_has_horarios` (`medicos_medico_id`, `horarios_horario_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre_completo`, `fecha_nacimiento`, `correo`, `contrasena`, `telefono`) VALUES
(1, 'Juan Perez Gomez', '1990-04-15', 'juanperez@gmail.com', 'ABCD1234', '912345678'),
(2, 'Maria Rodriguez Lopez', '1985-08-27', 'mariarodriguez@gmail.com', '1a2b3c4d', '917654321'),
(3, 'Pedro Gomez Perez', '1992-03-10', 'pedrogomez@gmail.com', 'Password123', '919876543'),
(4, 'Ana Lopez Ramirez', '1988-07-05', 'analopez@gmail.com', 'SecurePass', '913210987'),
(5, 'Luis Ramirez Gomez', '1995-01-18', 'luisramirez@gmail.com', 'Random987', '919999888');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`cita_id`),
  ADD KEY `citas_FKIndex1` (`usuarios_usuario_id`),
  ADD KEY `citas_FKIndex2` (`especialidades_especialidad_id`),
  ADD KEY `citas_FKIndex3` (`medicos_medico_id`),
  ADD KEY `citas_FKIndex4` (`horarios_horario_id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`especialidad_id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`horario_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`medico_id`),
  ADD KEY `medicos_FKIndex1` (`especialidades_especialidad_id`);

--
-- Indices de la tabla `medicos_has_horarios`
--
ALTER TABLE `medicos_has_horarios`
  ADD PRIMARY KEY (`medicos_medico_id`,`horarios_horario_id`),
  ADD KEY `medicos_has_horarios_FKIndex1` (`medicos_medico_id`),
  ADD KEY `medicos_has_horarios_FKIndex2` (`horarios_horario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `cita_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `especialidad_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `horario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `medico_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarios_usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`especialidades_especialidad_id`) REFERENCES `especialidades` (`especialidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`medicos_medico_id`) REFERENCES `medicos` (`medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`horarios_horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidades_especialidad_id`) REFERENCES `especialidades` (`especialidad_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicos_has_horarios`
--
ALTER TABLE `medicos_has_horarios`
  ADD CONSTRAINT `medicos_has_horarios_ibfk_1` FOREIGN KEY (`medicos_medico_id`) REFERENCES `medicos` (`medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `medicos_has_horarios_ibfk_2` FOREIGN KEY (`horarios_horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

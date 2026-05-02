-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 02-05-2026 a las 16:43:57
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
-- Base de datos: `shieldsecurity`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `importe_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` enum('ACTIVO','FINALIZADO','CANCELADO','SUSPENDIDO') NOT NULL DEFAULT 'ACTIVO',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id_contrato`, `id_usuario`, `id_plan`, `fecha_inicio`, `fecha_fin`, `importe_total`, `estado`, `fecha_creacion`) VALUES
(1, 4, 3, '2025-06-01', '2026-05-31', 15588.00, 'ACTIVO', '2026-05-01 18:56:41'),
(2, 7, 3, '2025-09-15', '2026-09-14', 15588.00, 'ACTIVO', '2026-05-01 18:56:41'),
(3, 8, 3, '2026-01-10', '2027-01-09', 15588.00, 'ACTIVO', '2026-05-01 18:56:41'),
(4, 5, 2, '2025-04-01', '2026-03-31', 5988.00, 'ACTIVO', '2026-05-01 18:56:41'),
(5, 6, 2, '2025-11-01', '2026-10-31', 5988.00, 'ACTIVO', '2026-05-01 18:56:41'),
(6, 9, 2, '2025-07-20', '2026-07-19', 5988.00, 'ACTIVO', '2026-05-01 18:56:41'),
(7, 11, 2, '2026-02-01', '2027-01-31', 5988.00, 'ACTIVO', '2026-05-01 18:56:41'),
(8, 10, 1, '2025-08-01', '2026-07-31', 2388.00, 'ACTIVO', '2026-05-01 18:56:41'),
(9, 12, 1, '2024-03-01', '2025-02-28', 2388.00, 'FINALIZADO', '2026-05-01 18:56:41'),
(10, 13, 1, '2026-03-01', '2027-02-28', 2388.00, 'ACTIVO', '2026-05-01 18:56:41'),
(11, 14, 1, '2025-12-01', '2026-11-30', 2388.00, 'ACTIVO', '2026-05-01 18:56:41'),
(12, 15, 1, '2026-04-15', '2026-04-30', 2388.00, 'CANCELADO', '2026-05-01 18:56:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` varchar(20) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `estado_pago` enum('PENDIENTE','PAGADA','VENCIDA','ANULADA') NOT NULL DEFAULT 'PENDIENTE',
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `numero_factura`, `id_contrato`, `fecha_emision`, `fecha_vencimiento`, `importe`, `estado_pago`, `fecha_pago`) VALUES
(1, 'F-2026-0001', 1, '2026-02-01', '2026-02-28', 1299.00, 'PAGADA', '2026-02-15'),
(2, 'F-2026-0002', 1, '2026-03-01', '2026-03-31', 1299.00, 'PAGADA', '2026-03-12'),
(3, 'F-2026-0003', 1, '2026-04-01', '2026-04-30', 1299.00, 'PAGADA', '2026-04-10'),
(4, 'F-2026-0004', 2, '2026-03-01', '2026-03-31', 1299.00, 'PAGADA', '2026-03-20'),
(5, 'F-2026-0005', 2, '2026-04-01', '2026-04-30', 1299.00, 'PAGADA', '2026-04-18'),
(6, 'F-2026-0006', 2, '2026-05-01', '2026-05-31', 1299.00, 'PENDIENTE', NULL),
(7, 'F-2026-0007', 3, '2026-03-10', '2026-04-09', 1299.00, 'PAGADA', '2026-03-25'),
(8, 'F-2026-0008', 3, '2026-04-10', '2026-05-09', 1299.00, 'PAGADA', '2026-04-20'),
(9, 'F-2026-0009', 4, '2026-03-01', '2026-03-31', 499.00, 'PAGADA', '2026-03-15'),
(10, 'F-2026-0010', 4, '2026-04-01', '2026-04-30', 499.00, 'VENCIDA', NULL),
(11, 'F-2026-0011', 5, '2026-03-01', '2026-03-31', 499.00, 'PAGADA', '2026-03-10'),
(12, 'F-2026-0012', 5, '2026-04-01', '2026-04-30', 499.00, 'PAGADA', '2026-04-08'),
(13, 'F-2026-0013', 6, '2026-04-20', '2026-05-19', 499.00, 'PENDIENTE', NULL),
(14, 'F-2026-0014', 7, '2026-03-01', '2026-03-31', 499.00, 'PAGADA', '2026-03-05'),
(15, 'F-2026-0015', 7, '2026-04-01', '2026-04-30', 499.00, 'PAGADA', '2026-04-04'),
(16, 'F-2026-0016', 8, '2026-03-01', '2026-03-31', 199.00, 'PAGADA', '2026-03-22'),
(17, 'F-2026-0017', 8, '2026-04-01', '2026-04-30', 199.00, 'VENCIDA', NULL),
(18, 'F-2024-0050', 9, '2024-12-01', '2024-12-31', 199.00, 'PAGADA', '2024-12-15'),
(19, 'F-2025-0001', 9, '2025-01-01', '2025-01-31', 199.00, 'PAGADA', '2025-01-12'),
(20, 'F-2026-0018', 10, '2026-04-01', '2026-04-30', 199.00, 'PAGADA', '2026-04-15'),
(21, 'F-2026-0019', 11, '2026-03-01', '2026-03-31', 199.00, 'PAGADA', '2026-03-09'),
(22, 'F-2026-0020', 11, '2026-04-01', '2026-04-30', 199.00, 'PAGADA', '2026-04-07'),
(23, 'F-2026-0021', 12, '2026-04-15', '2026-05-14', 199.00, 'ANULADA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_admin_asignado` int(11) DEFAULT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `severidad` enum('BAJA','MEDIA','ALTA','CRITICA') NOT NULL,
  `estado` enum('ABIERTA','EN_PROCESO','RESUELTA','CERRADA') NOT NULL DEFAULT 'ABIERTA',
  `fecha_apertura` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `id_contrato`, `id_tipo`, `id_admin_asignado`, `titulo`, `descripcion`, `severidad`, `estado`, `fecha_apertura`, `fecha_cierre`) VALUES
(1, 1, 1, 2, 'Campaña de phishing dirigida a empleados', 'Se detectaron correos suplantando al departamento de RRHH solicitando cambio de contraseña.', 'ALTA', 'EN_PROCESO', '2026-04-22 09:15:00', NULL),
(2, 1, 6, 3, 'Intento de acceso no autorizado al servidor de banca', 'Múltiples intentos fallidos de login desde IP extranjera detectados durante la madrugada.', 'ALTA', 'RESUELTA', '2026-03-10 02:30:00', '2026-03-10 04:45:00'),
(3, 2, 7, NULL, 'CVE-2026-0123 detectada en servidor web', 'Vulnerabilidad de severidad media reportada por escáner automatizado en Apache.', 'MEDIA', 'ABIERTA', '2026-04-28 11:00:00', NULL),
(4, 2, 4, 2, 'Ataque DDoS mitigado', 'Pico de tráfico de 12 Gbps mitigado por firewall. Servicio mantuvo disponibilidad.', 'ALTA', 'RESUELTA', '2026-04-05 17:20:00', '2026-04-05 18:10:00'),
(5, 3, 2, 3, 'Malware detectado en estación de trabajo', 'EICAR-like detectado en el equipo del Dr. García. Equipo aislado y limpiado.', 'ALTA', 'RESUELTA', '2026-04-12 08:45:00', '2026-04-12 13:20:00'),
(6, 4, 1, 2, 'Phishing masivo a alumnos', 'Detectada campaña de correos haciéndose pasar por la secretaría académica.', 'MEDIA', 'EN_PROCESO', '2026-04-25 10:00:00', NULL),
(7, 5, 8, 3, 'Configuración insegura de bucket S3', 'Bucket de imágenes de producto encontrado con permisos públicos de escritura.', 'BAJA', 'RESUELTA', '2026-03-18 14:00:00', '2026-03-18 16:30:00'),
(8, 6, 7, NULL, 'Vulnerabilidad en panel de seguimiento de envíos', 'Endpoint sin rate-limiting, posible enumeración de pedidos.', 'MEDIA', 'ABIERTA', '2026-04-29 16:30:00', NULL),
(9, 7, 5, 2, 'Posible fuga de datos en API de clientes', 'Anomalía detectada: descargas masivas desde una cuenta interna fuera del horario habitual.', 'CRITICA', 'EN_PROCESO', '2026-04-30 22:10:00', NULL),
(10, 8, 1, 3, 'Phishing dirigido al notario', 'Correo simulando ser de un cliente solicitando datos de poderes notariales.', 'MEDIA', 'RESUELTA', '2026-03-22 09:30:00', '2026-03-22 11:00:00'),
(11, 10, 2, 2, 'Malware en servidor de gestión de cultivos', 'Troyano detectado en servidor Linux, posible vector vía credenciales SSH débiles.', 'ALTA', 'EN_PROCESO', '2026-04-26 07:45:00', NULL),
(12, 11, 3, 3, 'Ransomware contenido en estación aislada', 'Equipo de marketing infectado con ransomware. Aislado a tiempo, sin propagación.', 'CRITICA', 'RESUELTA', '2026-02-14 13:00:00', '2026-02-14 19:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `nombre_plan` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio_mensual` decimal(10,2) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `nombre_plan`, `descripcion`, `precio_mensual`, `activo`) VALUES
(1, 'Escudo Básico', 'Protección esencial para pequeñas empresas que empiezan con la ciberseguridad.', 199.00, 1),
(2, 'Centinela Pro', 'Vigilancia activa, firewall gestionado y soporte prioritario para PYMES.', 499.00, 1),
(3, 'Fortaleza Enterprise', 'Seguridad integral con SLA, cifrado y gestor dedicado para grandes empresas.', 1299.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_servicio`
--

CREATE TABLE `plan_servicio` (
  `id_plan` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan_servicio`
--

INSERT INTO `plan_servicio` (`id_plan`, `id_servicio`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
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
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `rol_descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `rol_descripcion`) VALUES
(1, 'master', 'Control total del sistema'),
(2, 'administrador', 'Gestiona clientes, contratos, incidencias'),
(3, 'cliente', 'Acceso limitado a sus propios datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio_base` decimal(10,2) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `descripcion`, `precio_base`, `activo`) VALUES
(1, 'Auditoría de seguridad inicial', 'Revisión completa del estado de seguridad de la empresa.', 500.00, 1),
(2, 'Análisis de vulnerabilidades básico', 'Escaneo automatizado de vulnerabilidades en sistemas y red.', 400.00, 1),
(3, 'Informe de riesgos', 'Documento con los riesgos detectados y recomendaciones.', 200.00, 1),
(4, 'Soporte por email 24/7', 'Atención de consultas por correo electrónico todos los días.', 100.00, 1),
(5, 'Monitorización 24/7 de amenazas', 'Vigilancia continua de la infraestructura desde el SOC.', 600.00, 1),
(6, 'Firewall gestionado', 'Configuración y mantenimiento del firewall perimetral.', 300.00, 1),
(7, 'Soporte prioritario', 'Atención telefónica prioritaria con tiempos de respuesta cortos.', 200.00, 1),
(8, 'Cifrado de datos corporativos', 'Protección mediante cifrado de los datos sensibles del cliente.', 500.00, 1),
(9, 'Gestor de cuenta dedicado', 'Persona de contacto fija para coordinar todos los servicios.', 400.00, 1),
(10, 'SLA garantizado', 'Acuerdo de nivel de servicio con compromiso de disponibilidad.', 300.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_incidencia`
--

CREATE TABLE `tipo_incidencia` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `severidad_default` enum('BAJA','MEDIA','ALTA','CRITICA') NOT NULL DEFAULT 'MEDIA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_incidencia`
--

INSERT INTO `tipo_incidencia` (`id_tipo`, `nombre`, `descripcion`, `severidad_default`) VALUES
(1, 'Phishing', 'Correos o mensajes fraudulentos que intentan obtener credenciales o datos sensibles.', 'MEDIA'),
(2, 'Malware', 'Software malicioso detectado en equipos o servidores del cliente.', 'ALTA'),
(3, 'Ransomware', 'Cifrado de archivos por software malicioso con petición de rescate.', 'CRITICA'),
(4, 'Ataque DDoS', 'Ataque de denegación de servicio que satura los recursos del cliente.', 'ALTA'),
(5, 'Fuga de datos', 'Exposición o filtración no autorizada de información confidencial.', 'CRITICA'),
(6, 'Acceso no autorizado', 'Intento o consecución de acceso a sistemas sin las credenciales adecuadas.', 'ALTA'),
(7, 'Vulnerabilidad detectada', 'Hallazgo de una vulnerabilidad explotable en sistemas del cliente.', 'MEDIA'),
(8, 'Configuración insegura', 'Detección de parámetros mal configurados que exponen el sistema.', 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT current_timestamp(),
  `cif` varchar(9) DEFAULT NULL,
  `nombre_empresa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `password`, `nombre_usuario`, `apellido_usuario`, `telefono`, `id_rol`, `activo`, `fecha_alta`, `cif`, `nombre_empresa`) VALUES
(1, 'richard@shieldsecurity.com', 'master2026', 'Richard', 'Suarez', '123123123', 1, 0, '2026-05-01 17:26:29', NULL, NULL),
(2, 'liz@shieldsecurity.com', 'admin123', 'Liz', 'Martín García', '910222001', 2, 0, '2026-05-01 17:34:07', NULL, NULL),
(3, 'test@shieldsecurity.com', 'admin123', 'Tester', 'Ruiz Pérez', '910222002', 2, 0, '2026-05-01 17:34:07', NULL, NULL),
(4, 'it@bancoatlas.es', 'cliente123', 'Pedro', 'Hernández García', '910333001', 3, 0, '2026-05-01 17:34:44', 'B12345678', 'Banco Atlas'),
(5, 'cto@eduplus.com', 'cliente123', 'Sara', 'Vidal Moreno', '930333002', 3, 0, '2026-05-01 17:34:44', 'B23456789', 'EduPlus'),
(6, 'seguridad@retailmax.es', 'cliente123', 'Javier', 'Núñez Costa', '932333003', 3, 0, '2026-05-01 17:34:44', 'B34567890', 'RetailMax'),
(7, 'ciso@technova.com', 'cliente123', 'Laura', 'Gómez Ruiz', '910333004', 3, 0, '2026-05-01 17:34:44', 'B45678901', 'TechNova'),
(8, 'it@medicareplus.es', 'cliente123', 'Alberto', 'Sanz Ortega', '917333005', 3, 0, '2026-05-01 17:34:44', 'B56789012', 'MediCare Plus'),
(9, 'sistemas@logipro.com', 'cliente123', 'Carmen', 'Delgado Aguilar', '935333006', 3, 0, '2026-05-01 17:34:44', 'B67890123', 'LogiPro'),
(10, 'admin@notariacentral.es', 'cliente123', 'Roberto', 'Iglesias Marín', '912333007', 3, 0, '2026-05-01 17:34:44', 'B78901234', 'NotaríaCentral'),
(11, 'infosec@finsecure.com', 'cliente123', 'Patricia', 'Torres Lozano', '910333008', 3, 0, '2026-05-01 17:34:44', 'B89012345', 'FinSecure'),
(12, 'it@automotrizib.es', 'cliente123', 'Daniel', 'Cano Bravo', '963333009', 3, 0, '2026-05-01 17:34:44', 'B90123450', 'AutoMotriz Ibérica'),
(13, 'sistemas@agrotech.es', 'cliente123', 'Marta', 'Reyes Navarro', '953333010', 3, 0, '2026-05-01 17:34:44', 'B11223344', 'AgroTech'),
(14, 'ops@cloudgate.io', 'cliente123', 'Francisco', 'Méndez Pinto', '910333011', 3, 0, '2026-05-01 17:34:44', 'B22334455', 'CloudGate'),
(15, 'admin@hosteltotal.es', 'cliente123', 'Beatriz', 'Serrano Lima', '971333012', 3, 0, '2026-05-01 17:34:44', 'B33445566', 'HostelTotal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_factura` (`numero_factura`),
  ADD KEY `id_contrato` (`id_contrato`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_contrato` (`id_contrato`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_admin_asignado` (`id_admin_asignado`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`),
  ADD UNIQUE KEY `nombre_plan` (`nombre_plan`);

--
-- Indices de la tabla `plan_servicio`
--
ALTER TABLE `plan_servicio`
  ADD PRIMARY KEY (`id_plan`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tipo_incidencia`
--
ALTER TABLE `tipo_incidencia`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cif` (`cif`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_incidencia`
--
ALTER TABLE `tipo_incidencia`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`);

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`),
  ADD CONSTRAINT `incidencia_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_incidencia` (`id_tipo`),
  ADD CONSTRAINT `incidencia_ibfk_3` FOREIGN KEY (`id_admin_asignado`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `plan_servicio`
--
ALTER TABLE `plan_servicio`
  ADD CONSTRAINT `plan_servicio_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  ADD CONSTRAINT `plan_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

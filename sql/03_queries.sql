-- =====================================================================
-- ShieldSecurity - Proyecto Intermodular DAW
-- Modulo: Bases de Datos (0484)
-- Script 03: Consultas
--
-- Consultas representativas que demuestran el modelo en funcionamiento.
-- Cubren: listados, busquedas, JOINs, GROUP BY y estadisticas.
-- =====================================================================

USE shieldsecurity;


-- =====================================================================
-- LISTADOS
-- =====================================================================

-- 1. Listado de todos los clientes (rol = 3) ordenados por empresa
SELECT id_usuario, nombre_empresa, cif, email, telefono
FROM usuario
WHERE id_rol = 3
ORDER BY nombre_empresa;


-- 2. Listado de empleados (administradores y master) con su rol
SELECT u.id_usuario, u.nombre_usuario, u.apellido_usuario, u.email, r.nombre AS rol
FROM usuario u
JOIN rol r ON u.id_rol = r.id_rol
WHERE u.id_rol IN (1, 2)
ORDER BY r.nombre, u.apellido_usuario;


-- 3. Catalogo completo de servicios activos ordenados por precio
SELECT id_servicio, nombre, precio_base, descripcion
FROM servicio
WHERE activo = TRUE
ORDER BY precio_base DESC;


-- =====================================================================
-- BUSQUEDAS
-- =====================================================================

-- 4. Buscar clientes cuya empresa contenga la palabra "Cloud"
SELECT id_usuario, nombre_empresa, cif, email
FROM usuario
WHERE nombre_empresa LIKE '%Cloud%';


-- 5. Buscar servicios cuyo nombre contenga "soporte"
SELECT id_servicio, nombre, precio_base
FROM servicio
WHERE nombre LIKE '%oporte%';


-- =====================================================================
-- JOINS  (consultas que cruzan varias tablas)
-- =====================================================================

-- 6. Servicios incluidos en cada plan (JOIN sobre la intermedia plan_servicio)
SELECT p.id_plan, p.nombre_plan AS plan, s.id_servicio, s.nombre AS servicio
FROM plan p
JOIN plan_servicio ps ON p.id_plan = ps.id_plan
JOIN servicio s        ON ps.id_servicio = s.id_servicio
ORDER BY p.id_plan, s.id_servicio;


-- 7. Contratos activos con cliente y plan asociados
SELECT c.id_contrato,
       u.nombre_empresa AS cliente,
       p.nombre_plan    AS plan,
       c.fecha_inicio,
       c.fecha_fin,
       c.importe_total,
       c.estado
FROM contrato c
JOIN usuario u ON c.id_usuario = u.id_usuario
JOIN plan p    ON c.id_plan    = p.id_plan
WHERE c.estado = 'ACTIVO'
ORDER BY c.fecha_inicio DESC;


-- 8. Facturas de cada cliente con su contrato (JOIN multiple)
SELECT u.nombre_empresa AS cliente,
       f.numero_factura,
       f.fecha_emision,
       f.importe,
       f.estado_pago
FROM factura f
JOIN contrato c ON f.id_contrato = c.id_contrato
JOIN usuario u  ON c.id_usuario  = u.id_usuario
ORDER BY u.nombre_empresa, f.fecha_emision;


-- =====================================================================
-- ESTADISTICAS Y GROUP BY
-- =====================================================================

-- 9. Numero de usuarios por rol
SELECT r.nombre AS rol, COUNT(*) AS total
FROM usuario u
JOIN rol r ON u.id_rol = r.id_rol
GROUP BY r.nombre;


-- 10. Numero de contratos por estado
SELECT estado, COUNT(*) AS total
FROM contrato
GROUP BY estado
ORDER BY total DESC;


-- 11. Numero de facturas por estado de pago
SELECT estado_pago, COUNT(*) AS total, SUM(importe) AS importe_total
FROM factura
GROUP BY estado_pago
ORDER BY importe_total DESC;


-- 12. Numero de incidencias por severidad y estado
SELECT severidad, estado, COUNT(*) AS total
FROM incidencia
GROUP BY severidad, estado
ORDER BY severidad, estado;

-- 13. Plan mas contratado
SELECT p.nombre_plan AS plan, COUNT(c.id_contrato) AS total_contratos
FROM plan p
LEFT JOIN contrato c ON p.id_plan = c.id_plan
GROUP BY p.id_plan, p.nombre_plan
ORDER BY total_contratos DESC;


-- =====================================================================
-- CONSULTAS DE NEGOCIO ESPECIFICAS
-- =====================================================================

-- 14. Clientes con facturas vencidas
SELECT DISTINCT u.nombre_empresa, u.email, u.telefono,
       COUNT(f.id_factura) AS facturas_vencidas,
       SUM(f.importe)      AS importe_pendiente
FROM usuario u
JOIN contrato c ON u.id_usuario = c.id_usuario
JOIN factura f  ON c.id_contrato = f.id_contrato
WHERE f.estado_pago = 'VENCIDA'
GROUP BY u.id_usuario, u.nombre_empresa, u.email, u.telefono
ORDER BY importe_pendiente DESC;


-- 15. Incidencias criticas sin asignar
SELECT i.id_incidencia, i.titulo, i.fecha_apertura,
       u.nombre_empresa AS cliente
FROM incidencia i
JOIN contrato c ON i.id_contrato = c.id_contrato
JOIN usuario u  ON c.id_usuario = u.id_usuario
WHERE i.severidad = 'CRITICA'
  AND i.id_admin_asignado IS NULL
  AND i.estado IN ('ABIERTA','EN_PROCESO');


-- 16. Incidencias asociadas a cada cliente
SELECT u.nombre_empresa AS cliente,
       c.id_contrato,
       i.id_incidencia,
       i.titulo,
       i.estado
FROM usuario u
JOIN contrato c   ON u.id_usuario  = c.id_usuario
JOIN incidencia i ON c.id_contrato = i.id_contrato
ORDER BY u.nombre_empresa, i.fecha_apertura DESC;

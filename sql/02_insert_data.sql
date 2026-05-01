-- =====================================================================
-- ShieldSecurity - Proyecto Intermodular DAW
-- Modulo: Bases de Datos (0484)
-- Script 02: Insercion de datos de ejemplo
-- =====================================================================

USE shieldsecurity;


-- ---------------------------------------------------------------------
-- ROLES (catalogo)
-- ---------------------------------------------------------------------
INSERT INTO rol (id_rol, nombre, rol_descripcion) VALUES
  (1, 'master',        'Control total del sistema'),
  (2, 'administrador', 'Gestiona clientes, contratos, incidencias'),
  (3, 'cliente',       'Acceso limitado a sus propios datos');


-- ---------------------------------------------------------------------
-- USUARIOS  (1 master, 2 administradores, 12 clientes = 15 total)
-- ---------------------------------------------------------------------

-- Master (id_usuario = 1)
INSERT INTO usuario (email, password, nombre_usuario, apellido_usuario, telefono, id_rol) VALUES
  ('richard@shieldsecurity.com', 'admin', 'Richard', 'Suarez', '123123123', 1);

-- Administradores (id_usuario = 2, 3)
INSERT INTO usuario (email, password, nombre_usuario, apellido_usuario, telefono, id_rol) VALUES
  ('liz@shieldsecurity.com',  'admin123', 'Liz',    'Martin Garcia', '910222001', 2),
  ('test@shieldsecurity.com', 'admin123', 'Tester', 'Ruiz Perez',    '910222002', 2);

-- Clientes (id_usuario = 4 a 15)
INSERT INTO usuario (email, password, nombre_usuario, apellido_usuario, telefono, id_rol, cif, nombre_empresa) VALUES
  ('it@bancoatlas.es',         'cliente123', 'Pedro',     'Hernandez Garcia', '910333001', 3, 'B12345678', 'Banco Atlas'),
  ('cto@eduplus.com',          'cliente123', 'Sara',      'Vidal Moreno',     '930333002', 3, 'B23456789', 'EduPlus'),
  ('seguridad@retailmax.es',   'cliente123', 'Javier',    'Nunez Costa',      '932333003', 3, 'B34567890', 'RetailMax'),
  ('ciso@technova.com',        'cliente123', 'Laura',     'Gomez Ruiz',       '910333004', 3, 'B45678901', 'TechNova'),
  ('it@medicareplus.es',       'cliente123', 'Alberto',   'Sanz Ortega',      '917333005', 3, 'B56789012', 'MediCare Plus'),
  ('sistemas@logipro.com',     'cliente123', 'Carmen',    'Delgado Aguilar',  '935333006', 3, 'B67890123', 'LogiPro'),
  ('admin@notariacentral.es',  'cliente123', 'Roberto',   'Iglesias Marin',   '912333007', 3, 'B78901234', 'NotariaCentral'),
  ('infosec@finsecure.com',    'cliente123', 'Patricia',  'Torres Lozano',    '910333008', 3, 'B89012345', 'FinSecure'),
  ('it@automotrizib.es',       'cliente123', 'Daniel',    'Cano Bravo',       '963333009', 3, 'B90123450', 'AutoMotriz Iberica'),
  ('sistemas@agrotech.es',     'cliente123', 'Marta',     'Reyes Navarro',    '953333010', 3, 'B11223344', 'AgroTech'),
  ('ops@cloudgate.io',         'cliente123', 'Francisco', 'Mendez Pinto',     '910333011', 3, 'B22334455', 'CloudGate'),
  ('admin@hosteltotal.es',     'cliente123', 'Beatriz',   'Serrano Lima',     '971333012', 3, 'B33445566', 'HostelTotal');


-- ---------------------------------------------------------------------
-- SERVICIOS (10 servicios atomicos)
-- ---------------------------------------------------------------------
INSERT INTO servicio (nombre, descripcion, precio_base) VALUES
  ('Auditoria de seguridad inicial',      'Revision completa del estado de seguridad de la empresa.',          500.00),
  ('Analisis de vulnerabilidades basico', 'Escaneo automatizado de vulnerabilidades en sistemas y red.',       400.00),
  ('Informe de riesgos',                  'Documento con los riesgos detectados y recomendaciones.',           200.00),
  ('Soporte por email 24/7',              'Atencion de consultas por correo electronico todos los dias.',      100.00),
  ('Monitorizacion 24/7 de amenazas',     'Vigilancia continua de la infraestructura desde el SOC.',           600.00),
  ('Firewall gestionado',                 'Configuracion y mantenimiento del firewall perimetral.',            300.00),
  ('Soporte prioritario',                 'Atencion telefonica prioritaria con tiempos de respuesta cortos.',  200.00),
  ('Cifrado de datos corporativos',       'Proteccion mediante cifrado de los datos sensibles del cliente.',   500.00),
  ('Gestor de cuenta dedicado',           'Persona de contacto fija para coordinar todos los servicios.',      400.00),
  ('SLA garantizado',                     'Acuerdo de nivel de servicio con compromiso de disponibilidad.',    300.00);


-- ---------------------------------------------------------------------
-- PLANES COMERCIALES
-- ---------------------------------------------------------------------
INSERT INTO plan (nombre_plan, descripcion, precio_mensual) VALUES
  ('Escudo Basico',        'Proteccion esencial para pequenas empresas que empiezan con la ciberseguridad.',  199.00),
  ('Centinela Pro',        'Vigilancia activa, firewall gestionado y soporte prioritario para PYMES.',        499.00),
  ('Fortaleza Enterprise', 'Seguridad integral con SLA, cifrado y gestor dedicado para grandes empresas.',   1299.00);


-- ---------------------------------------------------------------------
-- PLAN_SERVICIO  (que servicios incluye cada plan)
-- ---------------------------------------------------------------------
INSERT INTO plan_servicio (id_plan, id_servicio) VALUES
  -- Escudo Basico (4 servicios)
  (1, 1), (1, 2), (1, 3), (1, 4),
  -- Centinela Pro (los 4 del Basico + 3 nuevos)
  (2, 1), (2, 2), (2, 3), (2, 4),
  (2, 5), (2, 6), (2, 7),
  -- Fortaleza Enterprise (los 7 del Pro + 3 nuevos)
  (3, 1), (3, 2), (3, 3), (3, 4),
  (3, 5), (3, 6), (3, 7),
  (3, 8), (3, 9), (3, 10);


-- ---------------------------------------------------------------------
-- TIPO_INCIDENCIA (8 tipos)
-- ---------------------------------------------------------------------
INSERT INTO tipo_incidencia (nombre, descripcion, severidad_default) VALUES
  ('Phishing',                 'Correos o mensajes fraudulentos que intentan obtener credenciales o datos sensibles.', 'MEDIA'),
  ('Malware',                  'Software malicioso detectado en equipos o servidores del cliente.',                    'ALTA'),
  ('Ransomware',               'Cifrado de archivos por software malicioso con peticion de rescate.',                  'CRITICA'),
  ('Ataque DDoS',              'Ataque de denegacion de servicio que satura los recursos del cliente.',                'ALTA'),
  ('Fuga de datos',            'Exposicion o filtracion no autorizada de informacion confidencial.',                   'CRITICA'),
  ('Acceso no autorizado',     'Intento o consecucion de acceso a sistemas sin las credenciales adecuadas.',           'ALTA'),
  ('Vulnerabilidad detectada', 'Hallazgo de una vulnerabilidad explotable en sistemas del cliente.',                   'MEDIA'),
  ('Configuracion insegura',   'Deteccion de parametros mal configurados que exponen el sistema.',                     'BAJA');


-- ---------------------------------------------------------------------
-- CONTRATOS  (12 contratos: 3 Fortaleza, 4 Pro, 5 Basico)
-- ---------------------------------------------------------------------
INSERT INTO contrato (id_usuario, id_plan, fecha_inicio, fecha_fin, importe_total, estado) VALUES
  -- FORTALEZA ENTERPRISE (1.299/mes x 12 = 15.588)
  (4,  3, '2025-06-01', '2026-05-31', 15588.00, 'ACTIVO'),      -- Banco Atlas
  (7,  3, '2025-09-15', '2026-09-14', 15588.00, 'ACTIVO'),      -- TechNova
  (8,  3, '2026-01-10', '2027-01-09', 15588.00, 'ACTIVO'),      -- MediCare Plus
  -- CENTINELA PRO (499/mes x 12 = 5.988)
  (5,  2, '2025-04-01', '2026-03-31', 5988.00,  'ACTIVO'),      -- EduPlus
  (6,  2, '2025-11-01', '2026-10-31', 5988.00,  'ACTIVO'),      -- RetailMax
  (9,  2, '2025-07-20', '2026-07-19', 5988.00,  'ACTIVO'),      -- LogiPro
  (11, 2, '2026-02-01', '2027-01-31', 5988.00,  'ACTIVO'),      -- FinSecure
  -- ESCUDO BASICO (199/mes x 12 = 2.388)
  (10, 1, '2025-08-01', '2026-07-31', 2388.00,  'ACTIVO'),      -- NotariaCentral
  (12, 1, '2024-03-01', '2025-02-28', 2388.00,  'FINALIZADO'),  -- AutoMotriz (no renovo)
  (13, 1, '2026-03-01', '2027-02-28', 2388.00,  'ACTIVO'),      -- AgroTech
  (14, 1, '2025-12-01', '2026-11-30', 2388.00,  'ACTIVO'),      -- CloudGate
  (15, 1, '2026-04-15', '2026-04-30', 2388.00,  'CANCELADO');   -- HostelTotal


-- ---------------------------------------------------------------------
-- FACTURAS  (22 facturas con estados variados)
-- ---------------------------------------------------------------------
INSERT INTO factura (numero_factura, id_contrato, fecha_emision, fecha_vencimiento, importe, estado_pago, fecha_pago) VALUES
  -- Banco Atlas (contrato 1)
  ('F-2026-0001', 1, '2026-02-01', '2026-02-28', 1299.00, 'PAGADA',     '2026-02-15'),
  ('F-2026-0002', 1, '2026-03-01', '2026-03-31', 1299.00, 'PAGADA',     '2026-03-12'),
  ('F-2026-0003', 1, '2026-04-01', '2026-04-30', 1299.00, 'PAGADA',     '2026-04-10'),
  -- TechNova (contrato 2)
  ('F-2026-0004', 2, '2026-03-01', '2026-03-31', 1299.00, 'PAGADA',     '2026-03-20'),
  ('F-2026-0005', 2, '2026-04-01', '2026-04-30', 1299.00, 'PAGADA',     '2026-04-18'),
  ('F-2026-0006', 2, '2026-05-01', '2026-05-31', 1299.00, 'PENDIENTE',  NULL),
  -- MediCare Plus (contrato 3)
  ('F-2026-0007', 3, '2026-03-10', '2026-04-09', 1299.00, 'PAGADA',     '2026-03-25'),
  ('F-2026-0008', 3, '2026-04-10', '2026-05-09', 1299.00, 'PAGADA',     '2026-04-20'),
  -- EduPlus (contrato 4)
  ('F-2026-0009', 4, '2026-03-01', '2026-03-31', 499.00,  'PAGADA',     '2026-03-15'),
  ('F-2026-0010', 4, '2026-04-01', '2026-04-30', 499.00,  'VENCIDA',    NULL),
  -- RetailMax (contrato 5)
  ('F-2026-0011', 5, '2026-03-01', '2026-03-31', 499.00,  'PAGADA',     '2026-03-10'),
  ('F-2026-0012', 5, '2026-04-01', '2026-04-30', 499.00,  'PAGADA',     '2026-04-08'),
  -- LogiPro (contrato 6)
  ('F-2026-0013', 6, '2026-04-20', '2026-05-19', 499.00,  'PENDIENTE',  NULL),
  -- FinSecure (contrato 7)
  ('F-2026-0014', 7, '2026-03-01', '2026-03-31', 499.00,  'PAGADA',     '2026-03-05'),
  ('F-2026-0015', 7, '2026-04-01', '2026-04-30', 499.00,  'PAGADA',     '2026-04-04'),
  -- NotariaCentral (contrato 8)
  ('F-2026-0016', 8, '2026-03-01', '2026-03-31', 199.00,  'PAGADA',     '2026-03-22'),
  ('F-2026-0017', 8, '2026-04-01', '2026-04-30', 199.00,  'VENCIDA',    NULL),
  -- AutoMotriz (contrato 9, FINALIZADO)
  ('F-2024-0050', 9, '2024-12-01', '2024-12-31', 199.00,  'PAGADA',     '2024-12-15'),
  ('F-2025-0001', 9, '2025-01-01', '2025-01-31', 199.00,  'PAGADA',     '2025-01-12'),
  -- AgroTech (contrato 10)
  ('F-2026-0018', 10, '2026-04-01', '2026-04-30', 199.00, 'PAGADA',     '2026-04-15'),
  -- CloudGate (contrato 11)
  ('F-2026-0019', 11, '2026-03-01', '2026-03-31', 199.00, 'PAGADA',     '2026-03-09'),
  ('F-2026-0020', 11, '2026-04-01', '2026-04-30', 199.00, 'PAGADA',     '2026-04-07'),
  -- HostelTotal (contrato 12, CANCELADO)
  ('F-2026-0021', 12, '2026-04-15', '2026-05-14', 199.00, 'ANULADA',    NULL);


-- ---------------------------------------------------------------------
-- INCIDENCIAS  (12 incidencias variadas)
-- ---------------------------------------------------------------------
INSERT INTO incidencia (id_contrato, id_tipo, id_admin_asignado, titulo, descripcion, severidad, estado, fecha_apertura, fecha_cierre) VALUES
  -- Banco Atlas (contrato 1)
  (1, 1, 2, 'Campana de phishing dirigida a empleados',
            'Se detectaron correos suplantando al departamento de RRHH solicitando cambio de contrasena.',
            'ALTA', 'EN_PROCESO', '2026-04-22 09:15:00', NULL),
  (1, 6, 3, 'Intento de acceso no autorizado al servidor de banca',
            'Multiples intentos fallidos de login desde IP extranjera detectados durante la madrugada.',
            'ALTA', 'RESUELTA', '2026-03-10 02:30:00', '2026-03-10 04:45:00'),
  -- TechNova (contrato 2)
  (2, 7, NULL, 'CVE-2026-0123 detectada en servidor web',
              'Vulnerabilidad de severidad media reportada por escaner automatizado en Apache.',
              'MEDIA', 'ABIERTA', '2026-04-28 11:00:00', NULL),
  (2, 4, 2, 'Ataque DDoS mitigado',
            'Pico de trafico de 12 Gbps mitigado por firewall. Servicio mantuvo disponibilidad.',
            'ALTA', 'RESUELTA', '2026-04-05 17:20:00', '2026-04-05 18:10:00'),
  -- MediCare Plus (contrato 3)
  (3, 2, 3, 'Malware detectado en estacion de trabajo',
            'EICAR-like detectado en el equipo del Dr. Garcia. Equipo aislado y limpiado.',
            'ALTA', 'RESUELTA', '2026-04-12 08:45:00', '2026-04-12 13:20:00'),
  -- EduPlus (contrato 4)
  (4, 1, 2, 'Phishing masivo a alumnos',
            'Detectada campana de correos haciendose pasar por la secretaria academica.',
            'MEDIA', 'EN_PROCESO', '2026-04-25 10:00:00', NULL),
  -- RetailMax (contrato 5)
  (5, 8, 3, 'Configuracion insegura de bucket S3',
            'Bucket de imagenes de producto encontrado con permisos publicos de escritura.',
            'BAJA', 'RESUELTA', '2026-03-18 14:00:00', '2026-03-18 16:30:00'),
  -- LogiPro (contrato 6)
  (6, 7, NULL, 'Vulnerabilidad en panel de seguimiento de envios',
              'Endpoint sin rate-limiting, posible enumeracion de pedidos.',
              'MEDIA', 'ABIERTA', '2026-04-29 16:30:00', NULL),
  -- FinSecure (contrato 7)
  (7, 5, 2, 'Posible fuga de datos en API de clientes',
            'Anomalia detectada: descargas masivas desde una cuenta interna fuera del horario habitual.',
            'CRITICA', 'EN_PROCESO', '2026-04-30 22:10:00', NULL),
  -- NotariaCentral (contrato 8)
  (8, 1, 3, 'Phishing dirigido al notario',
            'Correo simulando ser de un cliente solicitando datos de poderes notariales.',
            'MEDIA', 'RESUELTA', '2026-03-22 09:30:00', '2026-03-22 11:00:00'),
  -- AgroTech (contrato 10)
  (10, 2, 2, 'Malware en servidor de gestion de cultivos',
             'Troyano detectado en servidor Linux, posible vector via credenciales SSH debiles.',
             'ALTA', 'EN_PROCESO', '2026-04-26 07:45:00', NULL),
  -- CloudGate (contrato 11)
  (11, 3, 3, 'Ransomware contenido en estacion aislada',
             'Equipo de marketing infectado con ransomware. Aislado a tiempo, sin propagacion.',
             'CRITICA', 'RESUELTA', '2026-02-14 13:00:00', '2026-02-14 19:30:00');

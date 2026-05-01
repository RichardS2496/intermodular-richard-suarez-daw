-- =====================================================================
-- ShieldSecurity - Proyecto Intermodular DAW
-- Modulo: Bases de Datos (0484)
-- Script 01: Creacion de tablas
-- =====================================================================

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS shieldsecurity
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_spanish_ci;

USE shieldsecurity;


-- ---------------------------------------------------------------------
-- 1) ROL  (catalogo de privilegios: 1=master, 2=administrador, 3=cliente)
-- ---------------------------------------------------------------------
CREATE TABLE rol (
    id_rol INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    rol_descripcion VARCHAR(255)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 2) USUARIO  (todos los usuarios del sistema)
-- ---------------------------------------------------------------------
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    id_rol INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_alta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cif VARCHAR(9) UNIQUE,
    nombre_empresa VARCHAR(100),
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 3) PLAN  (catalogo de planes comerciales)
-- ---------------------------------------------------------------------
CREATE TABLE plan (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plan VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    precio_mensual DECIMAL(10,2) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 4) SERVICIO  (catalogo de servicios atomicos)
-- ---------------------------------------------------------------------
CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 5) PLAN_SERVICIO  (intermedia N:M entre plan y servicio)
-- ---------------------------------------------------------------------
CREATE TABLE plan_servicio (
    id_plan INT NOT NULL,
    id_servicio INT NOT NULL,
    PRIMARY KEY (id_plan, id_servicio),
    FOREIGN KEY (id_plan) REFERENCES plan(id_plan),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 6) CONTRATO  (un cliente firma un contrato basado en un plan)
-- ---------------------------------------------------------------------
CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_plan INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    importe_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('ACTIVO','FINALIZADO','CANCELADO','SUSPENDIDO') NOT NULL DEFAULT 'ACTIVO',
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_plan) REFERENCES plan(id_plan)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 7) FACTURA  (cobros asociados a un contrato)
-- ---------------------------------------------------------------------
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    id_contrato INT NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    estado_pago ENUM('PENDIENTE','PAGADA','VENCIDA','ANULADA') NOT NULL DEFAULT 'PENDIENTE',
    fecha_pago DATE,
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 8) TIPO_INCIDENCIA  (catalogo de tipos de incidencias)
-- ---------------------------------------------------------------------
CREATE TABLE tipo_incidencia (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    severidad_default ENUM('BAJA','MEDIA','ALTA','CRITICA') NOT NULL DEFAULT 'MEDIA'
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 9) INCIDENCIA  (incidencia real reportada bajo un contrato)
-- ---------------------------------------------------------------------
CREATE TABLE incidencia (
    id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    id_tipo INT NOT NULL,
    id_admin_asignado INT,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    severidad ENUM('BAJA','MEDIA','ALTA','CRITICA') NOT NULL,
    estado ENUM('ABIERTA','EN_PROCESO','RESUELTA','CERRADA') NOT NULL DEFAULT 'ABIERTA',
    fecha_apertura DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME,
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato),
    FOREIGN KEY (id_tipo) REFERENCES tipo_incidencia(id_tipo),
    FOREIGN KEY (id_admin_asignado) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB;

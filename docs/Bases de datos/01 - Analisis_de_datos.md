# Análisis de datos — ShieldSecurity

Documento que recoge el análisis previo del negocio antes de empezar el diseño de la base de datos. Identifica qué empresa se va a modelar, qué información maneja, qué entidades existen y cómo se relacionan entre sí.

---

## 1. La empresa

**ShieldSecurity** es una empresa ficticia dedicada a la **ciberseguridad** que ofrece servicios de protección a otras empresas. Su modelo de negocio se basa en la venta de **planes comerciales cerrados** que agrupan distintos servicios técnicos (auditoría, monitorización, firewall gestionado, formación, etc.) bajo una cuota mensual.

Los clientes de ShieldSecurity son **empresas** (no particulares) que necesitan proteger su infraestructura, sus datos o cumplir con normativas de seguridad. Cada cliente firma un contrato sobre un plan, recibe los servicios incluidos en él y paga mensualmente mediante facturas.

Cuando ocurre una incidencia de seguridad bajo el ámbito de un contrato (un intento de phishing, un malware detectado, un ataque DDoS…) el cliente la reporta al sistema de ShieldSecurity y un administrador interno se encarga de atenderla y resolverla.

---

## 2. Información que gestiona el negocio

ShieldSecurity necesita gestionar la siguiente información para operar:

- **Usuarios del sistema**, diferenciados por rol:
  - **Master**: dirección de ShieldSecurity, control total.
  - **Administrador**: empleados que gestionan a los clientes y atienden las incidencias.
  - **Cliente**: empresas que contratan los servicios.
- **Catálogo de servicios** que la empresa sabe prestar, cada uno con un precio de referencia.
- **Catálogo de planes comerciales**, que agrupan varios servicios y se venden con un precio mensual cerrado.
- **Contratos** firmados entre cliente y ShieldSecurity, indicando el plan contratado, las fechas de vigencia y el estado actual.
- **Facturas** generadas mensualmente sobre cada contrato, con su importe, fecha de emisión, vencimiento y estado de pago.
- **Tipos de incidencia** estandarizados (phishing, malware, ransomware, etc.) que sirven para clasificar las incidencias reales.
- **Incidencias** reportadas bajo un contrato, con su título, descripción, severidad, estado, fecha de apertura y, si procede, el administrador asignado para resolverla.

---

## 3. Entidades identificadas

A partir del análisis anterior se identifican **nueve entidades** que serán las que modelaremos en la base de datos.

| Entidad             | Qué representa                                                                                          |
| ------------------- | ------------------------------------------------------------------------------------------------------- |
| **Rol**             | Catálogo de privilegios del sistema (master, administrador, cliente).                                   |
| **Usuario**         | Persona o empresa con acceso al sistema, sea cliente o empleado.                                        |
| **Plan**            | Producto comercial cerrado que se vende a cliente (Escudo Básico, Centinela Pro, Fortaleza Enterprise). |
| **Servicio**        | Servicio atómico que ShieldSecurity sabe prestar.                                                       |
| **Plan_Servicio**   | Tabla intermedia que indica qué servicios incluye cada plan.                                            |
| **Contrato**        | Acuerdo firmado entre un cliente y ShieldSecurity, basado en un plan.                                   |
| **Factura**         | Cobro asociado a un contrato.                                                                           |
| **Tipo_Incidencia** | Catálogo de tipos de incidencia de seguridad.                                                           |
| **Incidencia**      | Incidencia real reportada bajo un contrato.                                                             |

---

## 4. Catálogos de referencia

### 4.1 Roles del sistema

| ID  | Rol           | Descripción                                 |
| --- | ------------- | ------------------------------------------- |
| 1   | Master        | Control total del sistema.                  |
| 2   | Administrador | Gestiona clientes, contratos e incidencias. |
| 3   | Cliente       | Acceso limitado a sus propios datos.        |

### 4.2 Planes comerciales

| Plan                     | Precio mensual | Servicios incluidos                                                                          |
| ------------------------ | -------------- | -------------------------------------------------------------------------------------------- |
| **Escudo Básico**        | 199,00 €       | Auditoría inicial, análisis de vulnerabilidades, informe de riesgos, soporte por email 24/7. |
| **Centinela Pro**        | 499,00 €       | Todo lo del Básico + monitorización 24/7, firewall gestionado, soporte prioritario.          |
| **Fortaleza Enterprise** | 1.299,00 €     | Todo lo del Pro + cifrado de datos, gestor de cuenta dedicado, SLA garantizado.              |

### 4.3 Tipos de incidencia

Phishing, Malware, Ransomware, Ataque DDoS, Fuga de datos, Acceso no autorizado, Vulnerabilidad detectada, Configuración insegura.

---

## 5. Relaciones entre entidades

A nivel conceptual, las relaciones que existen entre las entidades son:

- Cada **rol** **agrupa** a muchos **usuarios**.
- Un **usuario** con rol cliente **firma** muchos **contratos** a lo largo del tiempo.
- Un **plan** **define** muchos **contratos** distintos (varios clientes pueden tener el mismo plan).
- Un **plan** **incluye** muchos **servicios** y un **servicio** puede formar parte de muchos **planes** (relación de muchos a muchos).
- Un **contrato** **genera** muchas **facturas** mensuales.
- Un **contrato** **registra** muchas **incidencias** durante su vigencia.
- Un **tipo de incidencia** **clasifica** muchas **incidencias** reales.
- Un **usuario** con rol administrador **atiende** muchas **incidencias** asignadas.

### Particularidad: el doble papel de la entidad Usuario

La entidad **Usuario** participa en relaciones distintas según su rol:

- Como **cliente**, firma contratos y bajo esos contratos se registran sus incidencias.
- Como **administrador**, atiende incidencias que le son asignadas.
- Como **master**, normalmente no participa en ninguna de estas relaciones de forma directa.
  La misma tabla Usuario aparece, por tanto, en dos roles distintos cuando se trata con incidencias: el cliente afectado (vía su contrato) y el administrador que la resuelve (vía el campo de asignación).

---

## 6. Conclusión del análisis

El negocio modelado es lo suficientemente representativo para demostrar todos los conceptos relevantes de bases de datos relacionales: claves primarias simples y compuestas, claves foráneas, relaciones uno a muchos y muchos a muchos, catálogos de referencia, entidades con doble papel, restricciones de unicidad y datos nullables condicionales. El siguiente paso es plasmar este análisis en un **diagrama Entidad-Relación**.

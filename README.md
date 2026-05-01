# ShieldSecurity – Web Corporativa

> Proyecto desarrollado para el módulo **Lenguajes de Marcas y Sistemas de Gestión de Información (0373)** del ciclo formativo de **Desarrollo de Aplicaciones Web (DAW)**.

**Autor:** Richard Suarez
**Repositorio:** [github.com/RichardS2496/0373-Lenguajes_de_marcas](https://github.com/RichardS2496/0373-Lenguajes_de_marcas)
**Demo en producción:** [intermodular-shieldsecurity.netlify.app](https://intermodular-shieldsecurity.netlify.app/)

---

## Qué es

**ShieldSecurity** es la web corporativa de una empresa ficticia de ciberseguridad. Funciona como **escaparate digital** de la marca: presenta los servicios que ofrece, transmite confianza al visitante y centraliza el contacto con potenciales clientes.

El proyecto es una **landing corporativa multipágina** compuesta por:

- Una página principal con la propuesta de valor, servicios destacados, sección "Nosotros" y contacto.
- Una sección de **blog** con artículos sobre seguridad digital.
- Una **plantilla de post individual** para mostrar el contenido de cada artículo.
  La web está desplegada en producción y es completamente navegable desde cualquier dispositivo.

## Qué problema resuelve

La mayoría de **autónomos, pequeñas empresas y usuarios particulares** no saben qué nivel de protección informática tienen ni a quién acudir cuando sospechan de una amenaza. Las webs del sector suelen estar pensadas para perfiles muy técnicos: lenguaje complejo, jerga sin explicar y diseños intimidantes que alejan al usuario no especializado.

ShieldSecurity ataca tres frentes:

1. **Visibilidad y confianza** — una web seria y profesional que comunica que la empresa sabe de lo que habla.
2. **Información comprensible** — los servicios se explican en lenguaje sencillo, sin jerga, para que cualquier persona entienda qué contrata.
3. **Punto de contacto único** — un formulario centraliza las consultas para que ningún cliente potencial se pierda.

## Para quién está pensado

- **Autónomos y pequeñas empresas** que manejan datos sensibles (clientes, facturación, contraseñas) y no disponen de un departamento de IT.
- **Usuarios particulares** preocupados por la seguridad de sus dispositivos, sus cuentas y su privacidad online.
- **Equipos internos de PYMEs** que necesitan formación básica en buenas prácticas de ciberseguridad.
  Perfil tipo de usuario final: una persona con nivel digital medio, que entra a la web buscando una solución clara y rápida, no un manual técnico.

## Qué tecnologías utiliza

| Capa                 | Tecnología             | Uso                                                                                                  |
| -------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------- |
| Maquetación          | **HTML5**              | Estructura semántica de todas las páginas (`header`, `nav`, `main`, `section`, `article`, `footer`). |
| Estilos              | **CSS3**               | Layouts con Flexbox y Grid, diseño responsive, variables CSS y enfoque mobile-first.                 |
| Control de versiones | **Git + GitHub**       | Gestión del código, historial de cambios y colaboración.                                             |
| Despliegue           | **Netlify**            | Publicación automática de la web en producción a partir del repositorio.                             |
| Editor               | **Visual Studio Code** | Entorno de desarrollo con Live Server para previsualización local.                                   |

> Al tratarse de un proyecto del módulo de **Lenguajes de Marcas**, el foco está en HTML semántico y CSS, sin frameworks ni dependencias externas.

## Páginas incluidas

| Página | Archivo            | Descripción                                          |
| ------ | ------------------ | ---------------------------------------------------- |
| Inicio | `index.html`       | Landing principal con servicios, nosotros y contacto |
| Blog   | `blog.html`        | Listado de artículos del blog                        |
| Post   | `blog/post_1.html` | Artículo individual del blog                         |

La navegación principal incluye los enlaces a **Inicio**, **Blog**, **Servicios**, **Nosotros** y **Contacto**.

## Qué sé hacer gracias a este proyecto

Este proyecto demuestra que sé:

- **Estructurar un proyecto web multipágina** desde cero, con una arquitectura de archivos clara y pensada para crecer.
- **Maquetar con HTML5 semántico**, aplicando correctamente las etiquetas para mejorar accesibilidad y SEO.
- **Estilar con CSS3 moderno** combinando Flexbox y Grid según el caso, y centralizando paleta y tipografías con variables CSS.
- **Aplicar diseño responsive** real con enfoque mobile-first, no solo añadiendo media queries al final.
- **Trabajar con Git y GitHub** de forma profesional: commits descriptivos, ramas y un README cuidado.
- **Desplegar una web en producción** con Netlify y mantenerla actualizada desde el repositorio.
- **Documentar un proyecto** de forma clara para que cualquier persona pueda entenderlo, ejecutarlo y valorarlo.
- **Pensar en el usuario final** y no solo en el código: lenguaje accesible, jerarquía visual coherente y un diseño que invita a contactar.

---

## Cómo ejecutar el proyecto en local

No requiere servidor ni instalación de dependencias. Pasos:

1. Clona o descarga el repositorio:
   ```bash
   git clone https://github.com/RichardS2496/0373-Lenguajes_de_marcas.git
   ```
2. Abre el archivo `index.html` con tu navegador (doble clic o arrastrar al navegador).
3. Navega entre las páginas a través del menú principal.
   > Para una experiencia óptima con rutas relativas, se recomienda usar la extensión **Live Server** de Visual Studio Code o cualquier servidor local equivalente.

## Estado del proyecto

Versión inicial funcional, completamente desplegada y navegable. Posibles próximas mejoras:

- Podría optimizar la renderización de elementos del blog y dejar a un lado los elementos estáticos.
- Mejora de rendimiento Web
- Optimizar SEO con metaetiquetas, Open Graph y sitemap.
- Validación del formulario de contacto con JavaScript.

## Bases de Datos (No vinculada)

- Ubicación Analisis técnico y diagramas enÑ docs/bases_de_datos
- Scripts utilizados para la creación de tablas, inserción de datos y consultas ubicados en /sql

## Contacto

**Richard Suarez** — Estudiante de 1.º DAW

- GitHub: [@RichardS2496](https://github.com/RichardS2496)
- Email: richardmsc24@gmail.com

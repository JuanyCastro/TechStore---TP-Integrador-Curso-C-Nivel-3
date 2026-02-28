# 🛒 TechStore – E-Commerce Web App (Catálogo)

Proyecto desarrollado como Trabajo Práctico Integrador para el Curso de C# Nivel 3 dictado por Maxi Programa. Consiste en una plataforma web completa para la visualización y administración de un catálogo de artículos tecnológicos, reutilizando y escalando las capas de **Dominio** y **Negocio** construidas previamente en el Nivel 2.

El objetivo principal de este proyecto es consolidar el desarrollo backend y frontend con tecnologías del ecosistema Microsoft, implementando el patrón de arquitectura en capas, manejo de sesiones, seguridad por roles y peticiones asíncronas.

---

## 🚀 Características principales

- **Gestión de Usuarios y Roles:** Sistema de registro y login seguro. Diferenciación de vistas y permisos entre usuarios estándar y administradores.
- **Catálogo Abierto y Detalle:** Grilla de productos disponible para invitados (sin registro) con un buscador en tiempo real y filtros combinados por Categoría y Marca.
- **Panel de Administración (Backoffice):** Acceso restringido para el CRUD completo (Alta, Baja y Modificación) de artículos en la base de datos.
- **Sistema de Favoritos Interactivo:** Implementación de corazones dinámicos (❤️/🤍) actualizados en tiempo real mediante `UpdatePanel` (AJAX) sin necesidad de recargar la página.
- **Gestión de Perfiles:** Panel "Mi Perfil" con validación de expresiones regulares (Regex) y subida de imágenes de avatar personalizadas al servidor, con un sistema de respaldo (UI-Avatars) para usuarios sin foto.
- **Validación de Datos:** Validaciones estrictas tanto del lado del cliente como del servidor para asegurar la integridad de precios, códigos y formatos.

---

## 🛠️ Tecnologías utilizadas

- **C# .NET Framework (4.8)**
- **ASP.NET Web Forms**
- **SQL Server (ADO.NET - Arquitectura Conectada)**
- **HTML5, CSS3 y Bootstrap 5**
- **AJAX (UpdatePanel & ScriptManager)**
- **Visual Studio**

---

## 📂 Estructura del proyecto

El sistema está construido bajo una arquitectura lógica de 3 capas:

```text
TPFinalNivel3_Castro/
│
├── dominio/                // Entidades principales (Articulo, Usuario, Categoria, Marca)
│
├── negocio/                // Lógica de acceso a datos (AccesoDatos), servicios y validaciones
│
└── TPFinalNivel3_Castro/   // Capa de Presentación (Web Forms)
    │
    ├── Images/             // Almacenamiento local de avatares de usuario (/Perfiles)
    ├── Default.aspx        // Catálogo principal y filtros de búsqueda
    ├── Detalle.aspx        // Vista pública de información del producto
    ├── Error.aspx          // Pantalla amigable para manejo de excepciones globales
    ├── FormularioArticulo.aspx // Formulario de ABM de productos (Solo Admin)
    ├── ListaArticulos.aspx // Grilla de administración del catálogo (Solo Admin)
    ├── Login.aspx          // Autenticación de usuarios
    ├── MiPerfil.aspx       // Gestión de cuenta de usuario y actualización de avatar
    ├── MisFavoritos.aspx   // Gestión de artículos guardados por el usuario (AJAX)
    ├── Registro.aspx       // Creación de nuevas cuentas de usuario
    ├── Site.Master         // Plantilla principal (Navegación y lógica de sesión/seguridad)
    ├── Global.asax         // Configuración de eventos de ciclo de vida de la aplicación
    └── Web.config          // Configuración global y cadena de conexión a SQL Server
```

---

## 🔑 Configuración inicial

1. Clonar el repositorio y abrir el archivo de solución (`.sln`) en Visual Studio.
2. Ejecutar el script SQL proporcionado en el curso para generar la base de datos y sus tablas (`ARTICULOS`, `USERS`, `FAVORITOS`, etc.) en tu instancia local de SQL Server.
3. Configurar la cadena de conexión en el archivo `Web.config` apuntando a tu servidor local:

```xml
<appSettings>
  <add key="cadenaConexion" value="server=.\SQLEXPRESS; database=TU_BASE_DE_DATOS; integrated security=true" />
</appSettings>
```

---

## 🌐 Despliegue (Deploy)

La aplicación está preparada para ser desplegada en entornos de hosting con soporte para Windows Server e IIS. Actualmente se encuentra publicada y funcional para demostración.

🔗 **[TechStore](http://techstore-net.somee.com)**

---

## 👤 Autor

Proyecto desarrollado por **Juan Castro** como parte del Trabajo Práctico Integrador para el Nivel 3 de C#.
Estudiante de la Tecnicatura Universitaria en Programación (UTN).
En búsqueda de mi primera oportunidad profesional en el sector IT.

[![GitHub](https://img.shields.io/badge/GitHub-JuanyCastro-black?style=flat-square&logo=github)](https://github.com/JuanyCastro)

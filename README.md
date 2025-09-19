# 🌍 App Flutter con GraphQL y REST API

Esta es una aplicación Flutter que implementa dos formas diferentes de consumir datos desde APIs: **GraphQL** y **REST API**. El proyecto fue desarrollado como ejercicio práctico para demostrar y comparar ambas tecnologías en una misma aplicación.

## 📱 Funcionalidades de la aplicación

La aplicación presenta una pantalla inicial donde el usuario puede elegir entre dos modos de funcionamiento:

### 🔗 **Modo GraphQL - Consulta de Países** 
- Utiliza la API GraphQL `https://countries.trevorblades.com/graphql`
- Muestra información completa de países: bandera (emoji), nombre nativo, capital, moneda oficial
- Lista los idiomas oficiales de cada país con sus códigos
- Permite consultar países aleatorios mediante un botón flotante
- Implementa pull-to-refresh para actualizar los datos
- Manejo de estados de carga y errores

### 🌐 **Modo REST API - Perfiles de Usuarios**
- Consume la API REST `https://randomuser.me/api/`
- Genera y muestra perfiles de usuarios aleatorios
- Incluye foto de perfil, nombre completo, email, teléfono y ubicación
- Botón de recarga para generar nuevos usuarios
- Manejo de errores de red y carga de imágenes
- Fallback a avatar con inicial cuando la imagen no carga

## ✨ Características técnicas implementadas

- 🎯 **Navegación dual**: Pantalla de selección inicial entre modos GraphQL y REST
- 🔄 **Gestión de estado reactiva**: Implementada con GetX para manejar la lógica de negocio
- 📱 **Interface Material Design**: UI moderna y consistente con las guías de Material 3
- ⚡ **Controladores especializados**: Separación de lógica para países (GraphQL) y usuarios (REST)
- 🛡️ **Manejo robusto de errores**: Pantallas de error personalizadas con opciones de reintento
- 🎨 **Experiencia de usuario fluida**: Animaciones de carga, pull-to-refresh y navegación intuitiva
- 🏗️ **Arquitectura modular**: Separación clara entre servicios GraphQL y REST

## 🏗️ Estructura del proyecto

El proyecto está organizado en una arquitectura modular que separa claramente las responsabilidades:

```
lib/
├── config/
│   └── graphql_config.dart      # Configuración del cliente GraphQL con Hive cache
├── controllers/
│   └── country_controller.dart  # Lógica de negocio para el manejo de países
├── models/
│   ├── country.dart            # Modelo de datos para países con idiomas
│   └── user.dart               # Modelo de usuario para GraphQL
├── rest/
│   ├── models/
│   │   └── user.dart           # Modelo específico para usuarios de RandomUser API
│   ├── services/
│   │   └── api_service.dart    # Servicio HTTP para llamadas REST
│   ├── screens/
│   │   └── user_list_screen.dart # Pantalla de visualización de usuarios
│   └── widgets/
│       └── error_message.dart   # Widget reutilizable para mostrar errores
├── services/
│   ├── country_service.dart    # Servicio GraphQL para consultas de países
│   └── user_service.dart       # Servicio GraphQL para usuarios (no utilizado actualmente)
├── screens/
│   └── home_screen.dart        # Pantalla principal del modo GraphQL
└── main.dart                   # Punto de entrada y pantalla de selección de modo
```

## 🚀 Cómo ejecutar el proyecto

### Requisitos previos
- Flutter SDK versión 3.7.0 o superior
- Dart SDK
- Emulador Android/iOS o dispositivo físico conectado

### Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/JulianMbp/app_flutter_graphql.git
   cd app_flutter_graphql
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 🛠️ Dependencias y tecnologías

| Paquete | Función en el proyecto | Versión |
|---------|------------------------|---------|
| **flutter** | Framework para desarrollo multiplataforma | SDK 3.7.0+ |
| **graphql_flutter** | Cliente GraphQL con soporte para cache y subscripciones | ^5.1.2 |
| **get** | Gestión de estado, inyección de dependencias y navegación | ^4.7.2 |
| **http** | Cliente HTTP para realizar peticiones REST | ^1.3.0 |
| **cupertino_icons** | Iconos de estilo iOS para la interfaz | ^1.0.8 |

## 📡 APIs implementadas

### API GraphQL - Información de Países
- **URL**: `https://countries.trevorblades.com/graphql`
- **Funcionalidad**: Consulta datos detallados de países del mundo
- **Datos obtenidos**: Nombre, nombre nativo, capital, emoji de bandera, moneda, idiomas oficiales

**Query utilizada en el proyecto:**
```graphql
query GetCountry($code: ID!) {
  country(code: $code) {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}
```

**Query para obtener códigos de países:**
```graphql
query GetCountryCodes {
  countries {
    code
  }
}
```

### API REST - Generador de Usuarios
- **URL**: `https://randomuser.me/api/`
- **Funcionalidad**: Genera perfiles de usuarios ficticios con datos realistas
- **Datos obtenidos**: Nombre, apellido, email, teléfono, foto, ubicación

**Endpoint usado:**
```
GET https://randomuser.me/api/?results=1
```

**Respuesta de ejemplo:**
```json
{
  "results": [
    {
      "name": {
        "first": "John",
        "last": "Doe"
      },
      "email": "john.doe@example.com",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/1.jpg"
      },
      "phone": "+1-234-567-8900",
      "location": {
        "city": "New York",
        "country": "United States"
      }
    }
  ]
}
```

## 🎮 Flujo de uso de la aplicación

### Pantalla inicial
Al abrir la aplicación, se presenta una pantalla con dos botones principales:
- **"Abrir GraphQL"**: Lleva al modo de consulta de países
- **"Abrir REST"**: Lleva al modo de generación de usuarios

### Modo GraphQL - Países
1. Se carga automáticamente información de Brasil (BR) como país por defecto
2. La pantalla muestra:
   - Emoji de la bandera del país
   - Nombre oficial y nombre nativo
   - Capital del país
   - Moneda oficial
   - Lista de idiomas oficiales con sus códigos
3. **Botón "Random Country"**: Genera un país aleatorio
4. **Pull-to-refresh**: Deslizar hacia abajo actualiza el país actual
5. **Manejo de errores**: Si falla la conexión, se muestra un mensaje con opción de reintento

### Modo REST - Usuarios
1. Se genera automáticamente un usuario aleatorio al cargar
2. La pantalla muestra:
   - Foto de perfil (avatar circular)
   - Nombre completo del usuario
   - Dirección de email
   - Número de teléfono
   - Ubicación (ciudad y país)
3. **Botón de actualizar**: Icono flotante para generar un nuevo usuario
4. **Fallback de imagen**: Si la foto no carga, se muestra un avatar con la inicial del nombre

## 🔄 Comparación técnica: GraphQL vs REST

Esta aplicación permite experimentar directamente las diferencias entre ambos paradigmas:

| Característica | Implementación GraphQL | Implementación REST |
|----------------|------------------------|---------------------|
| **Consulta de datos** | Query específica solicitando solo campos necesarios | Endpoint fijo que devuelve estructura completa |
| **Cache** | Cache automático proporcionado por graphql_flutter con Hive | Sin cache implementado, datos siempre actuales |
| **Tipado** | Esquema fuertemente tipado, errores detectables en desarrollo | Tipado basado en modelos Dart creados manualmente |
| **Flexibilidad** | Una sola URL con múltiples queries posibles | Múltiples endpoints para diferentes recursos |
| **Manejo de errores** | Errores específicos por campo en la respuesta GraphQL | Códigos de estado HTTP tradicionales |
| **Tamaño de respuesta** | Exactamente los datos solicitados | Estructura fija que puede incluir datos innecesarios |

## 🤝 Contribuir al proyecto

Si deseas contribuir a este proyecto educativo:

1. Haz fork del repositorio
2. Crea una rama para tu funcionalidad (`git checkout -b feature/nueva-funcionalidad`)
3. Realiza tus cambios y commits (`git commit -m 'Añadir nueva funcionalidad'`)
4. Sube tu rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto se distribuye bajo la Licencia MIT.

## 👨‍💻 Desarrollador

**Julian MBP** - [GitHub](https://github.com/JulianMbp)

---

⭐ **¡Dale una estrella al repositorio si te resulta útil para aprender sobre GraphQL y REST APIs en Flutter!**

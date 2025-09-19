# 🌍 Flutter GraphQL & REST API Demo App

Una aplicación Flutter moderna que demuestra la integración tanto de **GraphQL** como de **APIs REST**, construida como ejercicio educativo para comparar y contrastar ambas tecnologías de consumo de datos.

## 📱 ¿Qué hace esta aplicación?

Esta aplicación es un **demo interactivo** que permite al usuario explorar dos paradigmas diferentes de consumo de APIs:

### 🔗 **Modo GraphQL** 
- **Consulta información de países** utilizando la API GraphQL de Trevor Blades
- Muestra detalles como bandera, capital, moneda e idiomas
- Permite generar países aleatorios
- Utiliza el patrón de consultas precisas de GraphQL

### 🌐 **Modo REST API**
- **Consulta perfiles de usuarios** desde RandomUser.me API
- Muestra avatares, nombres, emails y información de contacto
- Genera usuarios aleatorios con cada actualización
- Implementa el patrón tradicional REST

## ✨ Características principales

- 🎯 **Interfaz dual**: Selector inicial para elegir entre GraphQL y REST
- 🔄 **Actualización en tiempo real**: Pull-to-refresh y botones de recarga
- 📱 **Diseño responsivo**: UI moderna con Material Design
- ⚡ **Estado reactivo**: Gestión de estado con GetX
- 🛡️ **Manejo de errores**: Pantallas de error y reintentos automáticos
- 🎨 **UX intuitiva**: Navegación fluida entre modos

## 🏗️ Arquitectura del proyecto

```
lib/
├── config/
│   └── graphql_config.dart      # Configuración cliente GraphQL
├── controllers/
│   └── country_controller.dart  # Controlador GetX para países
├── models/
│   ├── country.dart            # Modelo de datos país
│   └── user.dart               # Modelo de datos usuario (GraphQL)
├── rest/
│   ├── models/
│   │   └── user.dart           # Modelo de datos usuario (REST)
│   ├── services/
│   │   └── api_service.dart    # Servicio HTTP para REST API
│   ├── screens/
│   │   └── user_list_screen.dart
│   └── widgets/
│       └── error_message.dart
├── services/
│   ├── country_service.dart    # Servicio GraphQL para países
│   └── user_service.dart       # Servicio GraphQL para usuarios
├── screens/
│   └── home_screen.dart        # Pantalla principal GraphQL
└── main.dart                   # Punto de entrada y selector de modo
```

## 🚀 Instalación y configuración

### Prerrequisitos
- Flutter SDK (3.7.0 o superior)
- Dart SDK
- Un emulador Android/iOS o dispositivo físico

### Pasos de instalación

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/JulianMbp/app_flutter_graphql.git
   cd app_flutter_graphql
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 🛠️ Tecnologías utilizadas

| Tecnología | Propósito | Versión |
|------------|-----------|---------|
| **Flutter** | Framework UI multiplataforma | SDK 3.7.0+ |
| **Dart** | Lenguaje de programación | - |
| **graphql_flutter** | Cliente GraphQL | ^5.1.2 |
| **GetX** | Gestión de estado y navegación | ^4.7.2 |
| **HTTP** | Cliente REST para peticiones HTTP | ^1.3.0 |
| **Hive** | Cache local para GraphQL | (via graphql_flutter) |

## 📡 APIs utilizadas

### GraphQL - Países
- **Endpoint**: `https://countries.trevorblades.com/graphql`
- **Propósito**: Obtener información detallada de países
- **Tipo de datos**: Países, idiomas, monedas, capitales

**Consulta de ejemplo:**
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

### REST API - Usuarios
- **Endpoint**: `https://randomuser.me/api/`
- **Propósito**: Generar perfiles de usuarios aleatorios
- **Tipo de datos**: Usuarios con avatares, nombres, contactos

**Endpoint de ejemplo:**
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

## 🎮 Cómo usar la aplicación

1. **Pantalla inicial**: Selecciona entre "Abrir GraphQL" o "Abrir REST"

2. **Modo GraphQL (Países)**:
   - Ve información detallada del país mostrado
   - Pulsa el botón flotante "Random Country" para obtener un país aleatorio
   - Desliza hacia abajo para actualizar (pull-to-refresh)

3. **Modo REST (Usuarios)**:
   - Ve el perfil del usuario generado aleatoriamente
   - Pulsa el botón de actualizar para obtener un nuevo usuario
   - La aplicación muestra avatar, nombre, email y ubicación

## 🔄 Comparación GraphQL vs REST

| Aspecto | GraphQL | REST |
|---------|---------|------|
| **Estructura de consulta** | Consultas específicas y flexibles | Endpoints fijos predefinidos |
| **Sobre-fetch/Under-fetch** | Solicita exactamente los datos necesarios | Puede traer datos innecesarios |
| **Caching** | Cache automático con Hive | Gestión manual de cache |
| **Tipado** | Fuertemente tipado con esquemas | Depende de la documentación |
| **Complejidad** | Curva de aprendizaje más pronunciada | Más simple y directo |

## 🤝 Contribuciones

Este es un proyecto educativo, pero las contribuciones son bienvenidas:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👨‍💻 Autor

**Julian MBP** - [GitHub](https://github.com/JulianMbp)

---

**¿Te gustó este proyecto?** ⭐ Dale una estrella al repositorio para apoyar el desarrollo de más contenido educativo sobre Flutter y APIs.

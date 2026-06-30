# Reel Vault

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Reel Vault es una aplicación móvil de películas desarrollada en Flutter. Utiliza Riverpod para la gestión de estado e inyección de dependencias, Hive para la persistencia local de favoritos y la API de Gemini para la recomendación inteligente de contenido en base al lenguaje natural.

---

## Arquitectura del Proyecto

El código está organizado bajo una estructura MVVM (Model-View-ViewModel) por features. Esto mantiene los componentes de cada funcionalidad (datos, lógica de estado y vistas) agrupados y auto-contenidos, facilitando la escalabilidad del proyecto.

### Estructura de carpetas:

```text
lib/
├── app/                  # Configuración global de MaterialApp y router
├── core/                 # Componentes compartidos transversales (red, tema, etc.)
├── features/             # Módulos o características de la app
│   ├── home/             # Vista principal, carrusel y listado por categorías
│   ├── movie_detail/     # Detalle de película, reparto, recomendaciones y tráiler
│   ├── navigation/       # Shell de navegación y navegación por pestañas (tabs)
│   ├── search/           # Buscador interactivo e integración con Gemini
│   └── watchlist/        # Persistencia local de favoritos con Hive
└── shared/               # Widgets y utilidades comunes
```

---

## Funcionalidades Clave

### 1. Pantalla de Inicio
* Carrusel superior con películas destacadas del día.
* Listas horizontales agrupadas por categorías.

### 2. Detalle de Película
* Sinopsis, lista de actores principales y recomendaciones de películas similares.
* **Tráiler**: Integración de reproductor de YouTube. Si un vídeo restringe la reproducción embebida (error `sameAsNotEmbeddable`), se muestra una opción alternativa para abrir el enlace en la aplicación oficial de YouTube o en el navegador mediante `url_launcher`.
* **Botón de retroceso**: Ubicado de forma flotante para que permanezca visible y funcional incluso cuando se reproduce el vídeo nativo en pantalla.

### 3. Búsqueda y Asistente de Cine
* **Búsqueda**: Buscador en tiempo real con debounce de 500ms para controlar la tasa de peticiones a la API.
* **Historial**: Historial local con las últimas 5 búsquedas realizadas.
* **Recomendaciones con IA**: Integra el modelo `gemini-3.5-flash` para interpretar búsquedas del usuario en lenguaje natural y recomendar hasta 5 películas reales en paralelo utilizando TMDb.

### 4. Lista de Favoritos (Watchlist)
* Guarda las películas localmente en una caja de Hive (`watchlist_movies`).
* Almacenamiento rápido en formato JSON String.
* Sincronización instantánea entre la pantalla de detalles y la pestaña de favoritos mediante notifiers de Riverpod.

---

## Configuración y Variables de Entorno

El buscador inteligente requiere acceso a la API de Gemini. 

1. Copia el archivo de ejemplo para configurar tus variables locales:
   ```sh
   cp .env.example .env
   ```
2. Define tu API Key en el archivo `.env`:
   ```env
   GEMINI_API_KEY=tu_api_key_de_gemini
   ```

El proyecto inyecta estas variables utilizando la opción de compilación `--dart-define-from-file=.env`. Esto ya está preconfigurado en las configuraciones de ejecución de VS Code (`launch.json`).

---

## Comandos Útiles

### Ejecutar la aplicación
Para levantar la aplicación cargando las claves del entorno:

```sh
flutter run --dart-define-from-file=.env
```

### Ejecutar pruebas
Para correr la suite de pruebas unitarias:

```sh
flutter test
```

### Análisis de código
Para correr el analizador de código y verificar que cumpla con las reglas del linter del proyecto:

```sh
flutter analyze
```

# Reel Vault

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Reel Vault es una aplicación de películas moderna desarrollada en Flutter.

---

## 📢 Transición de Arquitectura: MVVM por Features 🚀

> [!IMPORTANT]
> A partir de este punto en el historial de Git, se ha decidido transicionar de una estructura de **Clean Architecture tradicional** a una arquitectura **MVVM (Model-View-ViewModel) organizada por Features (características)**.

Esta decisión tiene como objetivos:
- **Reducir la sobrecarga (boilerplate):** Evitar la creación excesiva de capas intermedias (como casos de uso puros innecesarios) cuando un repositorio directamente puede proveer los datos al ViewModel.
- **Mejorar la cohesión local:** Mantener todo lo relacionado con una funcionalidad (`data`, `presentation/viewmodels`, y `views`) agrupado dentro de una misma carpeta bajo `lib/features/`.
- **Facilitar el mantenimiento:** Facilitar la navegación en el proyecto al tener código auto-contenido por característica.

### Estructura de Carpetas Sugerida

Bajo este enfoque MVVM por features, la estructura se organiza de la siguiente manera:

```text
lib/
├── app/                  # Configuración global de la aplicación (MaterialApp)
├── core/                 # Componentes transversales del sistema (compartidos)
│   ├── constants/        # Constantes globales
│   ├── network/          # Cliente HTTP (DioClient), excepciones globales
│   ├── router/           # Configuración de navegación
│   └── theme/            # Tema visual de la aplicación
├── features/             # Características autónomas del negocio
│   ├── home/             # Ejemplo: Feature de Inicio
│   │   ├── data/         # Modelos (DTOs), fuentes de datos (DataSources) y Repositorios locales de la feature
│   │   └── presentation/ # Vistas (Views), componentes visuales (Widgets) y ViewModels (Providers/Notifiers de Riverpod)
│   ├── movie_detail/     # Feature de Detalle de Película
│   ├── search/           # Feature de Búsqueda
│   ├── tv_detail/        # Feature de Detalle de Series de TV
│   └── watchlist/        # Feature de Lista de Seguimiento
└── shared/               # Widgets o utilidades visuales reutilizables entre múltiples features
```

---

## Gestión de Estado: Riverpod 🌊

El proyecto utiliza **Riverpod** para la inyección de dependencias y la gestión del estado (actuando como el motor del ViewModel en el patrón MVVM).

### Ejemplo de flujo MVVM con Riverpod:
1. **Model**: Representa los datos (`Movie` y `MovieDto`).
2. **ViewModel**: Un `Notifier` o `FutureProvider` de Riverpod que expone el estado y los métodos necesarios para la vista.
3. **View**: Un `ConsumerWidget` que escucha el provider de Riverpod y repinta la interfaz cuando el estado cambia.

---

## Comenzando 🚀

### Ejecución
Para iniciar el proyecto en modo de desarrollo:

```sh
flutter run
```

### Ejecutar Pruebas Unitarias 🧪
Para ejecutar la suite de pruebas unitarias:

```sh
flutter test
```

Para verificar que el formateo y las reglas del analizador estático estén correctas:

```sh
flutter analyze
```

[coverage_badge]: coverage_badge.svg
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

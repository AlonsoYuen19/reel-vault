# Pautas de Desarrollo de Reel Vault (Estándar Profesional / Mid-Level)

Este documento define las reglas de calidad y diseño para el desarrollo del proyecto Reel Vault, alineadas con los estándares de agencias de desarrollo Flutter profesionales.

## Reglas de Arquitectura y Código

1. **Arquitectura y Estructura:**
   - Mantener la separación de responsabilidades en capas (Data, Domain, Presentation) estructurada por características (*Feature-First*).
   - Utilizar inyección de dependencias a través de Riverpod de manera consistente.
   - Todo componente o widget debe ser reutilizable y modular.

2. **Integración con Servicios y APIs:**
   - Las conexiones de red y consumo de APIs (TMDb, Gemini AI) deben estar aisladas en repositorios y fuentes de datos (*DataSources*).
   - Modelar los datos con tipado estricto y evitar el uso de `dynamic` o `Map` en las capas superiores.

3. **Calidad de UI/UX:**
   - La interfaz debe ser fluida, responsiva y manejar con elegancia los estados de carga, error y datos vacíos.

4. **Testing y Calidad:**
   - Toda lógica de negocio (ViewModels, Notifiers, Repositorios) debe contar con pruebas unitarias para asegurar su robustez.
   - Las pruebas deben mockear las dependencias externas (red, bases de datos) para ser independientes y repetibles.

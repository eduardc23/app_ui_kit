# App UI Kit Showcase

Este proyecto es una aplicación de ejemplo para demostrar y probar los componentes del paquete `app_ui_kit`.

## Propósito

El objetivo de este ejemplo es proporcionar un "Showcase" o catálogo visual de todos los átomos, moléculas y tokens definidos en el sistema de diseño. Permite a los desarrolladores visualizar cómo se ven y se comportan los componentes en modo claro y oscuro.

## Secciones Incluidas

- **Typography:** Muestra la escala tipográfica y variantes de `AppText`.
- **Radius & Shadows:** Visualización de los tokens de bordes y elevaciones.
- **Buttons:** Diferentes estados y variantes de `AppButton`.
- **Text Fields:** Inputs de texto con validaciones y estilos.
- **Chips & Cards:** Componentes de información y contenedores.
- **Icons & Loaders:** Catálogo de iconografía y estados de carga.
- **Range Sliders:** Ejemplos de selectores de rango.
- **Molecules:** Componentes complejos como `AppEmptyState`.

## Cómo ejecutarlo

Asegúrate de estar en la carpeta `example` y ejecuta:

```bash
flutter run
```

## Estructura del Proyecto

- `lib/main.dart`: Punto de entrada que configura el `MaterialApp` con `AppTheme`.
- `lib/src/screens/design_system_screen.dart`: Pantalla principal que organiza las secciones.
- `lib/src/screens/sections/`: Contiene cada una de las categorías del showcase de forma modular.

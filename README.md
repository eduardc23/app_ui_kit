# Eventix App UI Kit

<div align="center">

**El design system centralizado de Eventix — consistente, escalable y listo para modo claro y oscuro.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/Licencia-MIT-green.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-eduardc23-181717?logo=github)](https://github.com/eduardc23)

</div>

---

## ¿Qué es esto?

Paquete de Flutter pensado para centralizar el design system de **Eventix**, una app de reservas. Su objetivo es ofrecer una base reutilizable, consistente y escalable para construir pantallas con la misma identidad visual, sin duplicar estilos ni componentes en cada feature.

El kit está organizado con una arquitectura simple y práctica basada en **diseño atómico**: desde átomos como botones, textos, inputs y tarjetas, hasta moléculas como tarjetas de evento, formularios reutilizables y estados vacíos.

---

## Tabla de contenidos

- [¿Qué problema resuelve?](#qué-problema-resuelve)
- [Qué incluye](#qué-incluye)
- [Instalación](#instalación)
- [Inicialización requerida](#inicialización-requerida)
- [Uso básico](#uso-básico)
- [Changelog](#changelog)
- [Licencia y Autor](#licencia-y-autor)

---

## ¿Qué problema resuelve?

Sin un sistema centralizado, cada pantalla termina repitiendo lo mismo:

| Problema | Consecuencia |
|---|---|
| Colores y tipografías sueltas | Inconsistencia visual entre pantallas |
| Espaciados y radios duplicados | Código difícil de mantener |
| Botones e inputs con estilos propios | Regresiones visuales al escalar |
| Sin reglas de accesibilidad compartidas | Experiencia fragmentada |

Este paquete evita ese desorden al concentrar todo en una **capa única y reutilizable**.

---

## Qué incluye

### Tokens de diseño
> Los valores fundamentales de la identidad visual de Eventix.

`Colores` · `Espaciado` · `Radios` · `Sombras` · `Tipografía` · `Duraciones` · `Opacidades`

---

### Temas globales

```dart
AppTheme.light   // Tema claro
AppTheme.dark    // Tema oscuro
```

---

### Átomos

Componentes base sin dependencias internas:

| Widget | Descripción |
|---|---|
| `AppButton` | Botones con variantes (primary, secondary, etc.) |
| `AppText` | Texto con variantes tipográficas del sistema |
| `AppTextField` | Input de texto estilizado |
| `AppChip` | Chips de selección o etiqueta |
| `AppCard` | Tarjeta base con elevación y radio |
| `AppLoader` | Indicadores de carga |
| `AppRangeSlider` | Slider de rango doble |
| `AppIcon` / `AppImage` | Iconos e imágenes base |

---

### Moléculas

Componentes compuestos que combinan átomos:

| Widget | Descripción |
|---|---|
| `EventCard` | Tarjeta completa de evento |
| `MetadataRow` | Filas de metadatos para tarjetas |
| `FormField` | Campos reutilizables de formulario |
| `EmptyState` | Estados vacíos ilustrados |

---

### Utilidades

- Extensiones de spacing para `BuildContext`
- Helpers de fecha y hora
- Soporte base para internacionalización (`AppIntl`)

---

## Instalación

### Opción 1 — Dependencia local

Ideal para desarrollo desde este mismo repositorio:

```yaml
dependencies:
  app_ui_kit:
    path: ../
```

```bash
flutter pub get
```

### Opción 2 — Desde GitHub

Una vez publicado en el repositorio remoto:

```yaml
dependencies:
  app_ui_kit:
    git:
      url: https://github.com/eduardc23/app_ui_kit.git
      ref: v1.0.0
```

```bash
flutter pub get
```

---

## Inicialización requerida

> **Importante:** el paquete incluye soporte de internacionalización que **debe inicializarse antes de `runApp`**. Si omites este paso, obtendrás errores en tiempo de ejecución al usar helpers de fecha y hora.

Llama a `AppIntl.initialize()` en tu `main()`:

```dart
import 'package:flutter/material.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIntl.initialize(); // ← requerido
  runApp(const MyApp());
}
```

Internamente, `AppIntl` utiliza `initializeDateFormatting()` del paquete `intl` para cargar los datos de localización:

```dart
import 'package:intl/date_symbol_data_local.dart';

abstract final class AppIntl {
  static Future<void> initialize() async {
    await initializeDateFormatting();
  }
}
```

---

## Uso básico

Importa el paquete y aplica el tema en tu `MaterialApp`. El sistema de diseño se integra naturalmente con los widgets de Flutter, potenciando la consistencia mediante tokens.

```dart
import 'package:flutter/material.dart';
import 'package:app_ui_kit/app_ui_kit.dart'; // ← Importación del kit

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIntl.initialize(); // ← Inicialización requerida para intl
  runApp(const EventixApp());
}

class EventixApp extends StatelessWidget {
  const EventixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventix',
      theme: AppTheme.light,       // ← Uso del tema claro del sistema
      darkTheme: AppTheme.dark,    // ← Uso del tema oscuro del sistema
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppText: widget de texto que usa tokens de tipografía automáticamente
        title: const AppText('Eventix UI Kit', variant: AppTextVariant.titleLarge),
      ),
      body: SingleChildScrollView(
        // AppSpacing: tokens de espaciado para mantener consistencia
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              'Próximos Eventos',
              variant: AppTextVariant.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            
            // AppTextField: input estilizado con los estados del design system
            AppTextField(
              label: 'Buscar',
              hint: 'Conciertos, teatro, deportes...',
              prefixIcon: const Icon(Icons.search),
            ),
            const SizedBox(height: AppSpacing.md),

            // AppChip: componentes para filtros o etiquetas
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                AppChip.filter(label: 'Música', selected: true, onSelected: (_) {}),
                AppChip.filter(label: 'Arte', onSelected: (_) {}),
                AppChip.filter(label: 'Tech', onSelected: (_) {}),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            // AppCard: contenedor base con elevación y radios predefinidos
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Rock en la Ciudad',
                    variant: AppTextVariant.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  const AppText(
                    'Vive una noche inolvidable con las mejores bandas.',
                    variant: AppTextVariant.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // AppButton: botones con variantes (primary, secondary, etc.)
                      AppButton.primary(
                        label: 'Comprar Entradas',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Changelog

Consulta el archivo [`CHANGELOG.md`](CHANGELOG.md) para ver el historial de cambios y versiones.

---

## Licencia y Autor

| | |
|---|---|
| **Autor** | [Eduard](https://github.com/eduardc23) |
| **Licencia** | [MIT](LICENSE) |

Este proyecto está bajo la **Licencia MIT** — puedes usarlo, modificarlo y distribuirlo libremente con atribución.

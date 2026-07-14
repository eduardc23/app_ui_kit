# Changelog

---

## [2.0.0] - 2025-07-13

### Breaking changes

#### `AppRangeSlider`: eliminado el parámetro `enabled`
El parámetro `enabled` ha sido eliminado. El estado deshabilitado ahora se
controla exclusivamente pasando `null` como valor de `onChanged`, alineándose
con el comportamiento estándar de los widgets de Material.

```dart
// Antes
AppRangeSlider(
  values: _range,
  onChanged: _handleChange,
  enabled: false, // ← ya no existe
)
 
// Ahora
AppRangeSlider(
  values: _range,
  onChanged: null, // null deshabilita el slider
)
```
 
---

### Added

#### `AppRangeSlider`: nuevos asserts de validación
Se añaden tres asserts en el constructor para detectar combinaciones inválidas
de parámetros en tiempo de desarrollo:

- `min < max` — evita rangos invertidos o de tamaño cero.
- `values.start <= values.end` — previene un rango seleccionado invertido que
  antes pasaba silenciosamente y crasheaba en runtime con un error críptico de
  Flutter.
- `divisions == null || divisions > 0` — distingue explícitamente entre slider
  continuo (`null`) y discreto (entero positivo); `0` producía comportamiento
  indefinido.
#### `AppTextField`: nuevos asserts de validación
Se añaden dos asserts en el constructor para capturar combinaciones
incompatibles de parámetros:

- `controller == null || initialValue == null` — usar ambos a la vez es un
  error de Flutter; el assert lo expone en tiempo de desarrollo.
- `errorText == null || validator == null` — tener ambos activos genera
  comportamiento ambiguo en la validación del formulario.
#### `AppTextField`: comportamiento por defecto en `onTapOutside`
Cuando no se provee un callback `onTapOutside`, el campo ahora cierra el
teclado automáticamente al tocar fuera de él. Antes el foco permanecía activo
y el teclado no se ocultaba a menos que el consumidor lo gestionara
manualmente.

```dart
// Comportamiento anterior: el consumidor debía proveer esto siempre
onTapOutside: (_) => FocusScope.of(context).unfocus(),
 
// Comportamiento nuevo: incluido por defecto cuando onTapOutside es null
onTapOutside: widget.onTapOutside ?? (_) => FocusScope.of(context).unfocus(),
```

#### `AppChip` / `ChipThemeData`: color de label con `WidgetStateColor`
El `labelStyle` del `ChipThemeData` ahora usa `WidgetStateColor.resolveWith`
para gestionar los colores del label según el estado del chip (normal,
seleccionado, deshabilitado). Esto elimina la necesidad de que el átomo
`AppChip` calcule y pase manualmente el color del texto en su `build`,
delegando esa responsabilidad al tema.

Estados cubiertos por el resolver:
- **Disabled** → `scheme.onSurface` con opacidad `AppOpacity.disabledSurface`
- **Selected** → `scheme.onPrimary`
- **Default** → `scheme.onSurface`
#### App de ejemplo renovada
La aplicación de ejemplo ha sido completamente reescrita con un showcase
organizado por categorías que exhibe todos los componentes del design system.
 
---

### Fixed

#### `AppTextField`: `minLines` ignoraba `obscureText`
Cuando `obscureText: true` y `minLines` era mayor que `1`, Flutter lanzaba
una excepción de layout en runtime porque los campos de contraseña no admiten
múltiples líneas. Ahora `minLines` se fuerza a `1` cuando `obscureText` es
`true`, igual que ya se hacía con `maxLines`.

```dart
// Antes — minLines no se forzaba, crash en runtime
maxLines: widget.obscureText ? 1 : widget.maxLines,
minLines: widget.minLines,
 
// Ahora — comportamiento consistente
maxLines: widget.obscureText ? 1 : widget.maxLines,
minLines: widget.obscureText ? 1 : widget.minLines,
```

#### `AppImage`: placeholder y error crashaban en layouts horizontales
Los widgets `_placeholder` y `_error` usaban `width ?? double.infinity` dentro
de un `SizedBox`. En contextos de tamaño ilimitado (como `ListView` o
`PageView` horizontal con scroll direction horizontal), pasar `double.infinity`
como ancho en un widget que forma parte del árbol de medición causaba una
excepción de layout de Flutter. Ahora el `Container` respeta el valor `null`
de `width` y deja que el widget padre imponga las restricciones de tamaño.

```dart
// Antes — crash en ListView/PageView horizontal
child: SizedBox(
  width: width ?? double.infinity, // ← doble.infinito en layouts acotados
  height: height,
  ...
)
 
// Ahora — Container delega las restricciones al padre
Container(
  width: width,   // null = ocupa el espacio disponible del padre
  height: height,
  ...
)
```

#### `AppImage.network`: loader no se mostraba cuando la imagen estaba cacheada
El `loadingBuilder` solo intercepta bytes durante la descarga HTTP. Si la
imagen ya estaba en caché de disco o memoria, Flutter la entregaba
instantáneamente y `loadingProgress` pasaba directo a `null` sin pasar por
ningún estado intermedio, por lo que el placeholder nunca se renderizaba.

Se migra a `frameBuilder`, que opera a nivel de frames renderizados y funciona
independientemente del caché:

- `wasSynchronouslyLoaded == true` → imagen disponible al instante (ej. caché
  en memoria), se devuelve `child` directamente sin ningún flash de placeholder.
- `frame == null` → todavía no hay ningún frame listo (descarga o decodificación
  en curso), se muestra el placeholder.
- `frame != null` → imagen lista para pintar, se devuelve `child`.
  Este comportamiento es más predecible que `loadingBuilder` para el caso de uso
  de "mostrar un loader mientras la imagen no está disponible", ya que funciona
  en todos los escenarios (descarga inicial, caché de disco, caché de memoria) y
  no requiere gestionar el objeto `ImageChunkEvent`.

```dart
// Antes — invisible con caché, usa bytes HTTP
loadingBuilder: (context, child, loadingProgress) =>
    loadingProgress == null ? child : _placeholder(context),
 
// Ahora — funciona siempre, usa frames renderizados
frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
  if (wasSynchronouslyLoaded || frame != null) return child;
  return _placeholder(context);
},
```
 
---

### Refactored

#### `AppChip`: build simplificado
El átomo `AppChip` ya no necesita leer el `ColorScheme` ni calcular el color
del label manualmente. El build ahora construye directamente un `Text` plano
y deja que el `ChipThemeData` gestione todos los colores vía
`WidgetStateColor`. Esto reduce el acoplamiento del átomo al tema y hace el
widget más fácil de mantener.

#### Tokens: unificación de barrel files
Se elimina el barrel file secundario `app_tokens.dart`. Cada módulo expone
ahora un único barrel file con su propio nombre (`tokens.dart`, `atoms.dart`,
`molecules.dart`), siguiendo una convención consistente en todo el
paquete.

#### Rename interno de la carpeta del design system
La carpeta `lib/src/desing_system` ha sido renombrada. Este cambio es un detalle de implementación interno y **no afecta
a los consumidores del paquete**, cuya única interfaz pública sigue siendo:

```dart
import 'package:app_ui_kit/app_ui_kit.dart';
```

El barrel file raíz re-exporta todo lo necesario y no ha cambiado su contrato.

#### Imports internos: uso de rutas específicas
Los archivos internos del paquete ahora importan únicamente el archivo que
necesitan en lugar del barrel file público raíz. Esto reduce los tiempos de
compilación incremental y evita dependencias circulares latentes.

```dart
// Antes
import 'package:flutter/material.dart';
import '../../../../app_ui_kit.dart';
 
// Ahora
import 'package:flutter/material.dart';
import '../../tokens/tokens.dart';
```
 
---

## 1.0.0

Lanzamiento inicial del **Eventix App UI Kit**. Un sistema de diseño completo y escalable para aplicaciones de Flutter.

### Design Tokens
*   **Colores**: Sistema de color semántico con soporte para modo claro y oscuro.
*   **Tipografía**: Escala tipográfica basada en la fuente *Inter* y roles de Material Design 3.
*   **Espaciado**: Sistema de espaciado basado en una rejilla de 8px.
*   **Bordes y Radios**: Tokens para consistencia en la curvatura de componentes.
*   **Sombras y Elevación**: Definiciones para profundidad visual.
*   **Utilidades de Opacidad y Duración**: Tokens para estados y animaciones.

### Tematización
*   `AppTheme.light`: Tema claro predefinido.
*   `AppTheme.dark`: Tema oscuro predefinido.
*   Soporte nativo para `ThemeMode.system`.

### Átomos (Componentes Base)
*   `AppButton`: Botones con variantes (primary, secondary).
*   `AppText`: Widget para tipografía consistente.
*   `AppTextField`: Entradas de texto estilizadas con soporte de validación.
*   `AppChip`: Etiquetas interactivas y filtros.
*   `AppCard`: Contenedores con elevación y radios del sistema.
*   `AppLoader`: Indicadores de progreso circulares.
*   `AppRangeSlider`: Selector de rangos dobles.
*   `AppIcon` y `AppImage`: Helpers para visualización de recursos.

### Moléculas (Componentes Compuestos)
*   `EventCard`: Tarjeta optimizada para mostrar información de eventos.
*   `MetadataRow`: Fila estructurada para datos como fecha, ubicación o precio.
*   `EmailField`: Campo especializado para emails con configuración de teclado.
*   `PasswordField`: Campo de contraseña con gestión interna de visibilidad (toggle).
*   `UsernameField`: Campo optimizado para nombres de usuario con restricciones de formato.
*   `EmptyState`: Estados de vista vacía con ilustraciones y mensajes.

### Utilidades y Localización
*   `AppIntl`: Sistema de inicialización para internacionalización y formateo de fechas.
*   Extensiones de espaciado sobre double (para tokens de diseño)
*   Helpers de fecha y hora localizados.

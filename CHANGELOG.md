# Changelog

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
*   `AppButton`: Botones con variantes (primary, secondary, outline, ghost, danger).
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
*   `FormField`: Wrappers para campos de formulario con etiquetas y errores.
*   `EmptyState`: Estados de vista vacía con ilustraciones y mensajes.

### Utilidades y Localización
*   `AppIntl`: Sistema de inicialización para internacionalización y formateo de fechas.
*   Extensiones de `BuildContext` para acceso rápido a tokens de espaciado y tema.
*   Helpers de fecha y hora localizados.

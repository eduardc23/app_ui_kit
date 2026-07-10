/// Modelo de datos para la molécula [EventCard].
///
/// Contiene toda la información necesaria para renderizar una tarjeta de evento,
/// incluyendo la imagen, el nombre, la ubicación, la fecha y el precio.
class EventCardData {
  const EventCardData({
    required this.imageUrl,
    required this.name,
    required this.venueName,
    required this.date,
    required this.price,
    this.isFree = false,
  });

  /// URL de la imagen de portada del evento.
  final String imageUrl;

  /// Nombre del evento.
  final String name;

  /// Nombre del lugar / venue.
  final String venueName;

  /// Fecha y hora del evento.
  final DateTime date;

  /// Precio base de la entrada (en la moneda local).
  final String price;

  /// Si es true, muestra "Gratis" en lugar del precio.
  final bool isFree;
}

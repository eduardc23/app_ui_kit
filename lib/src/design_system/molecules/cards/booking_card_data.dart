/// Modelo de datos para las moléculas de reserva ([BookingCard] y [PastBookingCard]).
///
/// Contiene la información de una reserva confirmada por el usuario.
class BookingCardData {
  const BookingCardData({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.tickets,
    required this.totalPrice,
  });

  /// URL de la imagen del evento reservado.
  final String imageUrl;

  /// Título del evento.
  final String title;

  /// Fecha y hora del evento.
  final DateTime date;

  /// Cantidad de entradas compradas.
  final int tickets;

  /// Precio total de la reserva.
  final double totalPrice;
}

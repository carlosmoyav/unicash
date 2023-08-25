class Respuesta {
  final Map<String, dynamic>? data;
  final String? message;
  final bool error;

  Respuesta({
    this.data,
    this.message,
    this.error = false,
  });
}

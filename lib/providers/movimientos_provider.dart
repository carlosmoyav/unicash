import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unicash/controllers/billetera_controller.dart';
import 'package:unicash/models/transaccion.dart';

part 'movimientos_provider.g.dart';

@riverpod
FutureOr<String?> addMovimiento(
    AddMovimientoRef ref,
    String categoria,
    String monto,
    String tipo,
    DateTime fecha,
    String descripcion,
    String metodoPago) async {
  final dia =
      fecha.day.toString().length == 1 ? '0${fecha.day}' : fecha.day.toString();
  final mes = fecha.month.toString().length == 1
      ? '0${fecha.month}'
      : fecha.month.toString();
  final fechaParseada = '${fecha.year}-$mes-${dia}';
  final response = await BilleteraController().agregarMovimiento({
    "categoria": categoria,
    "monto": monto,
    "tipo": tipo,
    "fecha": fechaParseada,
    "descripcion": descripcion,
    "metodoPago": metodoPago,
  });

  if (response.error) {
    return response.message;
  }
  return null;
}

@riverpod
Future<List<Transaction>> obtenerAllTransaccions(
    ObtenerAllTransaccionsRef ref) async {
  final response = await BilleteraController().obtenerAllTransacciones();
  if (response.error) {
    throw Exception(response.message);
  }
  final movimentos = response.data!['movimientos'] as List;
  return movimentos.map((e) => Transaction.fromJson(e)).toList();
}

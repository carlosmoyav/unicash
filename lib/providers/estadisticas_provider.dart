import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unicash/models/transaccion.dart';

import '../controllers/billetera_controller.dart';

part 'estadisticas_provider.g.dart';

@riverpod
Future<List<Transaction>> obtenerEstadisticas(ObtenerEstadisticasRef ref,
    {required String tipo, required String rango}) async {
  final rangoParseado = switch (rango) {
    'Semana' => 'semana',
    'Mes' => 'mes',
    'Año' => 'anual',
    _ => 'semana',
  };
  final response =
      await BilleteraController().obtenerEstadisticas(tipo, rangoParseado);
  if (response.error) {
    throw Exception(response.message);
  }
  final movimentos = response.data!['movimientos'] as List;
  return movimentos.map((e) => Transaction.fromJson(e)).toList();
}

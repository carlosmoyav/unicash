import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unicash/controllers/billetera_controller.dart';
import 'package:unicash/models/transaccion.dart';
import 'package:unicash/models/user_info.dart';
import 'package:unicash/utils/persistencia.dart';

part 'home_provider.g.dart';

@riverpod
FutureOr<UserInfo> obtenerHome(ObtenerHomeRef ref) async {
  final response = await BilleteraController().obtenerBilletera();
  if (response.error) {
    throw Exception(response.message);
  }
  final prefs = Persistencia();
  final data = response.data!;
  final transaccionesJson = data['movimientos'] as List;
  return UserInfo(
      name: prefs.nombres,
      totalBalance: '\$${data["balanceTotal"]}',
      inflow: '\$${data["billetera"]["ingresos"]}',
      outflow: '\$${data["billetera"]["gastos"]}',
      transactions:
          transaccionesJson.map((e) => Transaction.fromJson(e)).toList());
}

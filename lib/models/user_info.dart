import 'package:unicash/extensions/date.dart';
import 'package:unicash/models/transaccion.dart';

class UserInfo {
  final String name;
  final String totalBalance;
  final String inflow;
  final String outflow;
  final List<Transaction> transactions;
  const UserInfo(
      {required this.name,
      required this.totalBalance,
      required this.inflow,
      required this.outflow,
      required this.transactions});

  List<Transaction> transaccionesHoy() {
    final hoy = DateTime.now();

    return transactions
        .where((element) => hoy.isSameDate(DateTime.parse(element.date)))
        .toList();
  }

  List<Transaction> transaccionesAyer() {
    final hoy = DateTime.now();

    return transactions
        .where((element) => hoy.isYesterday(DateTime.parse(element.date)))
        .toList();
  }
}

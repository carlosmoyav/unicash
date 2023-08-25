import 'package:unicash/models/tipos_categorias.dart';
import 'package:unicash/models/tipos_transaccion.dart';
import 'package:intl/intl.dart';

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final double amount;
  final String date;

  const Transaction(this.categoryType, this.transactionType,
      this.itemCategoryName, this.itemName, this.amount, this.date);

  factory Transaction.fromJson(Map<String, dynamic> json) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.parse(json['fecha']));

    return Transaction(
      ItemCategoryType.fromString(json['categoria']),
      TransactionType.fromString(json['tipo']),
      json['tipo'],
      json['descripcion'],
      double.parse(json['monto'].toString()),
      formattedDate,
    );
  }
}

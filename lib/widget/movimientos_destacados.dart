import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/models/tipos_categorias.dart';
import 'package:unicash/models/transaccion.dart';
import 'package:unicash/models/types.dart';
import 'package:unicash/widget/item_movimiento_destacado.dart';

class MovimientosDestacados extends HookConsumerWidget {
  const MovimientosDestacados(
      {required this.tipoMovimiento, super.key, required this.transacciones});
  final List<Transaction> transacciones;
  final String tipoMovimiento;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ascendente = useState(false);

    final movimientos = movimientosDestacados(transacciones, ascendente.value)
        .map((e) => ItemMovimientoDestacado(
              movimiento: e,
            ))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${tipoMovimiento}s Destacados',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(
                  Icons.swap_vert,
                  size: 25,
                ),
                onPressed: () {
                  ascendente.value = !ascendente.value;
                },
                color: Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: movimientos.isEmpty
              ? const Center(child: Text('No hay movimientos'))
              : Column(children: movimientos),
        )
      ],
    );
  }
}

List<MovimientoDestacado> movimientosDestacados(
    List<Transaction> transacciones, bool ascendente) {
  final Set categorias = <ItemCategoryType>{};
  for (var element in transacciones) {
    categorias.add(element.categoryType);
  }
  final List<MovimientoDestacado> movimientos = [];
  for (var element in categorias) {
    double monto = 0;
    for (var transaccion in transacciones) {
      if (transaccion.categoryType == element) {
        monto += transaccion.amount;
      }
    }
    movimientos.add((itemCategoryName: element, monto: monto));
  }
  if (ascendente) {
    movimientos.sort((a, b) => a.monto.compareTo(b.monto));
  } else {
    movimientos.sort((a, b) => b.monto.compareTo(a.monto));
  }
  return movimientos;
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unicash/models/transaccion.dart';

class Chart extends HookConsumerWidget {
  const Chart({required this.transacciones, super.key});
  final List<Transaction> transacciones;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<Transaction, String>>[
          SplineSeries<Transaction, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: transacciones,
            xValueMapper: (Transaction sales, _) => sales.date,
            yValueMapper: (Transaction sales, _) => sales.amount,
          )
        ],
      ),
    );
  }
}

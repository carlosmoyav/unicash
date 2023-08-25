import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/models/tipos_transaccion.dart';
import 'package:unicash/providers/estadisticas_provider.dart';
import 'package:unicash/widget/async_value_widget.dart';
import 'package:unicash/widget/movimientos_destacados.dart';

import '../widget/chart.dart';

class Statistics extends HookConsumerWidget {
  const Statistics({super.key});

  static const List<String> rango = [
    'Semana',
    'Mes',
    'Año',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rangoSeleccionado = useState(0);
    final tipoMostrar = useState(TransactionType.ingreso);
    final transaccionesFuture = ref.watch(obtenerEstadisticasProvider(
        rango: rango[rangoSeleccionado.value],
        tipo: tipoMostrar.value.toString()));
    final botonTipo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: switch (tipoMostrar.value) {
          TransactionType.gasto => InkWell(
              onTap: () {
                tipoMostrar.value = TransactionType.ingreso;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Gastos',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          TransactionType.ingreso => InkWell(
              onTap: () {
                tipoMostrar.value = TransactionType.gasto;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Ingreso',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_upward_sharp,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
        },
      ),
    );
    return Scaffold(
      body: AsyncValueWidget(
          value: transaccionesFuture,
          data: (transacciones) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Estadisticas",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(rango.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    rangoSeleccionado.value = index;
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: rangoSeleccionado.value == index
                                          ? const Color.fromARGB(
                                              255, 47, 125, 121)
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      rango[index],
                                      style: TextStyle(
                                        color: rangoSeleccionado.value == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        botonTipo,
                        const SizedBox(height: 20),
                        Chart(
                          transacciones: transacciones,
                        ),
                        const SizedBox(height: 20),
                        MovimientosDestacados(
                            tipoMovimiento: tipoMostrar.value.toString(),
                            transacciones: transacciones),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

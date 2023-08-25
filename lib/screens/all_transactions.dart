import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/movimientos_provider.dart';
import 'package:unicash/utils/constants.dart';
import 'package:unicash/widget/async_value_widget.dart';
import 'package:unicash/widget/transaction_item_tile.dart';

class AllTransactions extends HookConsumerWidget {
  const AllTransactions({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaccionesFuture = ref.watch(obtenerAllTransaccionsProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Todas las transacciones'),
        ),
        body: SafeArea(
          child: AsyncValueWidget(
              value: transaccionesFuture,
              data: (transacciones) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...transacciones.map((transaction) =>
                            TransactionItemTile(transaction: transaction)),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}

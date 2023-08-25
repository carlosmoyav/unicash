import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/home_provider.dart';
import 'package:unicash/screens/all_transactions.dart';
import 'package:unicash/utils/constants.dart';
import 'package:unicash/widget/async_value_widget.dart';
import 'package:unicash/widget/income_expense_card.dart';
import '../data/userInfo.dart';
import '../widget/transaction_item_tile.dart';

class HomeScreenTab extends HookConsumerWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataFuture = ref.watch(obtenerHomeProvider);
    return AsyncValueWidget(
        value: userDataFuture,
        data: (userData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: defaultSpacing * 4,
                  ),
                  ListTile(
                    title: Text("Hola, ${userData.name}!"),
                    leading: const ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(defaultRadius)),
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          userData.totalBalance,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: fontSizeHeading,
                                  fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: defaultSpacing / 2,
                        ),
                        Text(
                          "Balance Total",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: fontSubHeading),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing * 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: IncomeExpenseCard(
                              expenseData: ExpenseData(
                                  "Ingresos",
                                  userData.inflow,
                                  Icons.arrow_upward_rounded))),
                      const SizedBox(
                        width: defaultSpacing,
                      ),
                      Expanded(
                          child: IncomeExpenseCard(
                              expenseData: ExpenseData(
                                  "Gastos",
                                  "-${userData.outflow}",
                                  Icons.arrow_downward_rounded)))
                    ],
                  ),
                  const SizedBox(
                    height: defaultSpacing * 2,
                  ),
                  Visibility(
                    visible: userData.transactions.isNotEmpty,
                    replacement: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Text('No hay transacciones recenientes'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Transacciones Recientes",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Visibility(
                          visible: userData.transaccionesHoy().isNotEmpty,
                          child: Column(
                            children: [
                              const Text(
                                "Hoy",
                                style: TextStyle(color: fontSubHeading),
                              ),
                              ...userData.transaccionesHoy().map(
                                  (transaction) => TransactionItemTile(
                                      transaction: transaction)),
                              const SizedBox(
                                height: defaultSpacing,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: userData.transaccionesAyer().isNotEmpty,
                          child: Column(
                            children: [
                              const Text(
                                "Ayer",
                                style: TextStyle(color: fontSubHeading),
                              ),
                              ...userData.transaccionesAyer().map(
                                  (transaction) => TransactionItemTile(
                                      transaction: transaction)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllTransactions()));
                        },
                        child: const Text('Ver todas las transacciones')),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:unicash/utils/constants.dart';
import 'package:unicash/widget/income_expense_card.dart';
import '../data/userInfo.dart';
import '../widget/transaction_item_tile.dart';

class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: Text("Hola, ${userdata.name}!"),
              leading: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultRadius)),
                child: Image.asset(
                    "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/perfil_logo.png"),
              ),
              trailing: Icon(Icons.notifications_none),
            ),
            const SizedBox(
              height: defaultSpacing,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "${userdata.totalBalance}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: fontSizeHeading, fontWeight: FontWeight.w800),
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
                        expenseData: ExpenseData("Ingresos",
                            "${userdata.inflow}", Icons.arrow_upward_rounded))),
                const SizedBox(
                  width: defaultSpacing,
                ),
                Expanded(
                    child: IncomeExpenseCard(
                        expenseData: ExpenseData(
                            "Gastos",
                            "-${userdata.outflow}",
                            Icons.arrow_downward_rounded)))
              ],
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            Text(
              "Transacciones Recientes",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const Text(
              "Hoy",
              style: TextStyle(color: fontSubHeading),
            ),
            ...userdata.transactions.map(
                (transaction) => TransactionItemTile(transaction: transaction)),
            const SizedBox(
              height: defaultSpacing,
            ),
            const Text(
              "Ayer",
              style: TextStyle(color: fontSubHeading),
            ),
            ...transactions2.map(
                (transaction) => TransactionItemTile(transaction: transaction)),
          ],
        ),
      ),
    );
  }
}

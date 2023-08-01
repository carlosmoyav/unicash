enum TransactionType { outflow, inflow }

enum ItemCategoryType { fashion, grocery, payment }

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

  get transactions2 => null;
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  const Transaction(this.categoryType, this.transactionType,
      this.itemCategoryName, this.itemName, this.amount, this.date);
}

const List<Transaction> transactions1 = [
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, "zapatos",
      "puma", "\$54,50", "Oct, 23"),
  Transaction(ItemCategoryType.grocery, TransactionType.outflow, "Comida",
      "Hamburguesa", "\$15,40", "Oct, 23")
];
const List<Transaction> transactions2 = [
  Transaction(ItemCategoryType.payment, TransactionType.inflow, "Pago",
      "Licencia", "\$54,50", "Oct, 22"),
  Transaction(ItemCategoryType.payment, TransactionType.outflow, "Pago",
      "Spotify", "\$15,40", "Oct, 22"),
  Transaction(ItemCategoryType.payment, TransactionType.inflow, "Pago",
      "Licencia", "\$54,50", "Oct, 22"),
  Transaction(ItemCategoryType.payment, TransactionType.outflow, "Pago",
      "Spotify", "\$15,40", "Oct, 22"),
  Transaction(ItemCategoryType.payment, TransactionType.inflow, "Pago",
      "Licencia", "\$54,50", "Oct, 22"),
  Transaction(ItemCategoryType.payment, TransactionType.outflow, "Pago",
      "Spotify", "\$15,40", "Oct, 22")
];

const userdata = UserInfo(
    name: "Carlos",
    totalBalance: "\$4,659.00",
    inflow: "\$4,000.00",
    outflow: "\$300.00",
    transactions: transactions1);

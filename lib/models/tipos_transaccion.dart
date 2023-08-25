enum TransactionType {
  ingreso,
  gasto;

  @override
  String toString() {
    switch (this) {
      case TransactionType.ingreso:
        return 'Ingreso';
      case TransactionType.gasto:
        return 'Gasto';
    }
  }

  static TransactionType fromString(String type) {
    switch (type) {
      case "Ingreso":
        return TransactionType.ingreso;
      case "Gasto":
        return TransactionType.gasto;
      default:
        return TransactionType.gasto;
    }
  }
}

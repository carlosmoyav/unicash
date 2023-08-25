enum ItemCategoryType {
  pagos,
  alimentacion,
  transporte,
  regalo,
  educacion,
  ropa,
  salud,
  vivienda;

  @override
  String toString() {
    switch (this) {
      case ItemCategoryType.pagos:
        return 'Pagos';
      case ItemCategoryType.alimentacion:
        return 'Alimentación';
      case ItemCategoryType.transporte:
        return 'Transporte';
      case ItemCategoryType.regalo:
        return 'Regalo';
      case ItemCategoryType.educacion:
        return 'Educación';
      case ItemCategoryType.ropa:
        return 'Ropa';
      case ItemCategoryType.salud:
        return 'Salud';
      case ItemCategoryType.vivienda:
        return 'Vivienda';
    }
  }

  static ItemCategoryType fromString(String type) {
    switch (type) {
      case "Pagos":
        return ItemCategoryType.pagos;
      case "Alimentación":
        return ItemCategoryType.alimentacion;
      case "Transporte":
        return ItemCategoryType.transporte;
      case "Regalo":
        return ItemCategoryType.regalo;
      case "Educación":
        return ItemCategoryType.educacion;
      case "Ropa":
        return ItemCategoryType.ropa;
      case "Salud":
        return ItemCategoryType.salud;
      case "Vivienda":
        return ItemCategoryType.vivienda;
      default:
        return ItemCategoryType.pagos;
    }
  }
}

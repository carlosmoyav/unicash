import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unicash/models/tipos_categorias.dart';
import 'package:unicash/models/types.dart';
import 'package:unicash/utils/constants.dart';

class ItemMovimientoDestacado extends StatelessWidget {
  final MovimientoDestacado movimiento;

  const ItemMovimientoDestacado({Key? key, required this.movimiento})
      : super(key: key);

  Color getRandomBgColor() {
    return Color(Random().nextInt(0XFF000000));
  }

  @override
  Widget build(BuildContext context) {
    final iconoCategoria = Icon(switch (movimiento.itemCategoryName) {
      ItemCategoryType.alimentacion => Icons.food_bank,
      ItemCategoryType.educacion => Icons.school,
      ItemCategoryType.pagos => Icons.payments,
      ItemCategoryType.regalo => Icons.card_giftcard_outlined,
      ItemCategoryType.ropa => Icons.people,
      ItemCategoryType.salud => Icons.health_and_safety,
      ItemCategoryType.transporte => Icons.car_rental,
      ItemCategoryType.vivienda => Icons.house,
    });

    return Container(
        margin: const EdgeInsets.symmetric(vertical: defaultSpacing / 2),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.zero,
                  blurRadius: 10,
                  spreadRadius: 4)
            ],
            color: background,
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius))),
        child: ListTile(
            leading: Container(
                padding: const EdgeInsets.all(defaultSpacing / 2),
                decoration: BoxDecoration(
                    color: getRandomBgColor(),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultRadius / 2))),
                child: iconoCategoria),
            title: Text(
              movimiento.itemCategoryName.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: fontHeading,
                  fontSize: fontSizeTitle,
                  fontWeight: FontWeight.w700),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${movimiento.monto}",
                ),
              ],
            )));
  }
}

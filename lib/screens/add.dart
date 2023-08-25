import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/models/tipos_categorias.dart';
import 'package:unicash/models/tipos_transaccion.dart';
import 'package:unicash/providers/home_provider.dart';
import 'package:unicash/providers/movimientos_provider.dart';
import 'package:unicash/providers/pagina_actual_provider.dart';

class AddTransactionScreen extends HookConsumerWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController();
    final commentController = useTextEditingController();
    final transactionType = useState('Ingreso');
    final selectedDate = useState(DateTime.now());
    final selectedCategory = useState('Pagos');
    final paymentMethod = useState<String?>(
        null); // Variable para guardar el método de pago seleccionado

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Ingreso'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: selectedCategory.value,
                onChanged: (newValue) {
                  selectedCategory.value = newValue!;
                },
                items: ItemCategoryType.values
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Categoría'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+\.?[0-9]{0,2}?$'))
                ],
                decoration: const InputDecoration(labelText: 'Monto'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tipo de Transacción:'),
                  DropdownButton<String>(
                    value: transactionType.value,
                    onChanged: (newValue) {
                      transactionType.value = newValue!;
                    },
                    items: TransactionType.values
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Fecha:'),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate.value,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate.value) {
                        selectedDate.value = picked;
                      }
                    },
                    child: Text(
                        '${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: commentController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Comentarios'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 'Tarjeta',
                    groupValue: paymentMethod.value,
                    onChanged: (value) {
                      paymentMethod.value = value;
                    },
                  ),
                  const Text('Tarjeta'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 'Efectivo',
                    groupValue: paymentMethod.value,
                    onChanged: (value) {
                      paymentMethod.value = value;
                    },
                  ),
                  const Text('Efectivo'),
                ],
              ),
              // const Spacer(),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedCategory.value.isEmpty ||
                          amountController.text.isEmpty ||
                          commentController.text.isEmpty ||
                          transactionType.value.isEmpty ||
                          paymentMethod.value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, ingrese todos los datos'),
                          ),
                        );
                        return;
                      }
                      final error = await ref.watch(addMovimientoProvider
                          .call(
                              selectedCategory.value,
                              amountController.text,
                              transactionType.value,
                              selectedDate.value,
                              commentController.text,
                              paymentMethod.value!)
                          .future);
                      if (context.mounted) {
                        if (error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error),
                            ),
                          );
                          return;
                        }

                        ref.invalidate(obtenerHomeProvider);
                        ref
                            .read(paginaActualProvider.notifier)
                            .cambiarPagina(0);
                      }

                      // Aquí puedes guardar los datos ingresados en la base de datos o donde desees.
                      // También puedes agregar validaciones y lógica adicional aquí.
                    },
                    child: const Text('Guardar'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

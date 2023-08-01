import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  String _transactionType = 'Ingreso';
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Pagos';
  String?
      _paymentMethod; // Variable para guardar el método de pago seleccionado

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Ingreso'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>[
                'Pagos',
                'Alimentación',
                'Transporte',
                'Regalo',
                'Educación',
                'Ropa',
                'Salud',
                'Vivienda',
                // Agrega más categorías aquí si es necesario
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Categoría'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tipo de Transacción:'),
                DropdownButton<String>(
                  value: _transactionType,
                  onChanged: (newValue) {
                    setState(() {
                      _transactionType = newValue!;
                    });
                  },
                  items: <String>['Ingreso', 'Gasto']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fecha:'),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Comentarios'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'Tarjeta',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String?;
                    });
                  },
                ),
                Text('Tarjeta'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'Efectivo',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value as String?;
                    });
                  },
                ),
                Text('Efectivo'),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes guardar los datos ingresados en la base de datos o donde desees.
                  // También puedes agregar validaciones y lógica adicional aquí.
                },
                child: Text('Guardar'),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

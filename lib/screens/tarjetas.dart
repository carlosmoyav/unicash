import 'package:flutter/material.dart';

class CreditCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjeta de Crédito'),
      ),
      body: Center(
        child: CreditCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes implementar la lógica para crear otra tarjeta
          // Por ejemplo, puedes mostrar un cuadro de diálogo o navegar a otra pantalla.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '**** **** **** 1234',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Nombre del Titular',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

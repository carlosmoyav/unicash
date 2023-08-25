import 'package:flutter/material.dart';

class Privacidad extends StatelessWidget {
  const Privacidad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacidad'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
              textAlign: TextAlign.justify,
              '''En UniCash, valoramos tu privacidad y nos comprometemos a proteger tus datos personales. Queremos que te sientas seguro al utilizar nuestra aplicación y entender cómo recopilamos, utilizamos y compartimos tu información. A continuación, te proporcionamos una visión general de nuestra política de privacidad:
      
      Recopilación de Datos: Solo recopilamos la información necesaria para brindarte una experiencia óptima dentro de la aplicación. Esto puede incluir datos como tu nombre, dirección de correo electrónico y transacciones financieras. No recopilamos información sensible, como contraseñas.
      
      Uso de Datos: Utilizamos tus datos para personalizar tu experiencia dentro de la aplicación, ofrecerte recomendaciones financieras y mejorar nuestros servicios en general. Nunca compartiremos tus datos personales con terceros con fines de marketing sin tu consentimiento expreso.
      
      Actualizaciones: Ocasionalmente, podemos actualizar nuestra política de privacidad para reflejar cambios en la ley o en nuestras prácticas. Te notificaremos sobre estos cambios y obtendremos tu consentimiento si es necesario.
      '''),
        ),
      ),
    );
  }
}

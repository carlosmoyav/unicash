import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca De'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
              textAlign: TextAlign.justify,
              '''En UniCash, estamos comprometidos a ayudarte a tomar el control de tus finanzas personales de manera fácil y efectiva. Nuestra aplicación fue creada con la visión de brindarte herramientas poderosas para administrar tus ingresos, gastos, inversiones y metas financieras.

Misión: Nuestra misión es empoderarte para tomar decisiones financieras informadas y lograr tus objetivos económicos a largo plazo. Creemos en la importancia de la educación financiera y en proporcionarte las herramientas adecuadas para lograr la estabilidad y el éxito financiero.

Equipo: UniCash fue desarrollada por un estudiante de la universidad Laica Eloy Alfaro de Manabí. Estamos dedicados a brindarte una experiencia de usuario excepcional y a mejorar constantemente nuestros servicios para satisfacer tus necesidades cambiantes.

Gracias por elegir Unicash para ayudarte en tu viaje hacia una mejor salud financiera.
      '''),
        ),
      ),
    );
  }
}

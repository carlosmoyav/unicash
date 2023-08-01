import 'package:flutter/material.dart';
import 'package:unicash/screens/main_screen_host.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unicash'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Aquí puedes implementar la lógica para "olvidar la contraseña"
                  },
                  child: Text(
                    'Olvidé mi contraseña',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para autenticar al usuario
                // Puedes utilizar los valores _emailController.text y _passwordController.text para obtener los datos ingresados por el usuario.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreenHost()),
                );
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para redirigir a la pantalla de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                '¿No tienes una cuenta? Regístrate aquí',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registro de Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Apellido',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _birthdateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Fecha de Nacimiento (YYYY-MM-DD)',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para registrar al nuevo usuario
                // Puedes utilizar los valores _emailController.text, _passwordController.text, _nameController.text,
                // _lastNameController.text y _birthdateController.text para obtener los datos ingresados por el usuario.

                String name = _nameController.text;
                String lastName = _lastNameController.text;
                String birthdate = _birthdateController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                // Aquí debes implementar la lógica para registrar al nuevo usuario utilizando los datos ingresados.
                // Por ejemplo, puedes enviar los datos a un servidor o almacenarlos en una base de datos local.

                // Una vez que se ha registrado el usuario con éxito, puedes redirigirlo a la pantalla de inicio de sesión:
                Navigator.pop(
                    context); // Esto regresará a la pantalla anterior (la pantalla de inicio de sesión).
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

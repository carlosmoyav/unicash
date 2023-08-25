import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/auth_provider.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final birthdateController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: birthdateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de Nacimiento (YYYY-MM-DD)',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Aquí puedes implementar la lógica para registrar al nuevo usuario
                    // Puedes utilizar los valores _emailController.text, _passwordController.text, _nameController.text,
                    // _lastNameController.text y _birthdateController.text para obtener los datos ingresados por el usuario.

                    if (nameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
                        birthdateController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, ingrese todos los datos'),
                        ),
                      );
                      return;
                    }

                    String name = nameController.text;
                    String lastName = lastNameController.text;
                    String birthdate = birthdateController.text;
                    String email = emailController.text;
                    String password = passwordController.text;

                    final error =
                        await ref.read(authProviderProvider.notifier).register(
                              nombres: name,
                              apellidos: lastName,
                              fechaNacimiento: birthdate,
                              email: email,
                              password: password,
                            );
                    if (context.mounted) {
                      if (error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                          ),
                        );
                        return;
                      }
                      Navigator.pop(context);
                    }

                    // Aquí debes implementar la lógica para registrar al nuevo usuario utilizando los datos ingresados.
                    // Por ejemplo, puedes enviar los datos a un servidor o almacenarlos en una base de datos local.

                    // Una vez que se ha registrado el usuario con éxito, puedes redirigirlo a la pantalla de inicio de sesión:
                    // Navigator.pop(
                    //     context); // Esto regresará a la pantalla anterior (la pantalla de inicio de sesión).
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/auth_provider.dart';
import 'package:unicash/screens/main_screen_host.dart';
import 'package:unicash/screens/register.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unicash'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Aquí puedes implementar la lógica para "olvidar la contraseña"
                      },
                      child: const Text(
                        'Olvidé mi contraseña',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Aquí puedes implementar la lógica para autenticar al usuario
                    // Puedes utilizar los valores _emailController.text y _passwordController.text para obtener los datos ingresados por el usuario.

                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Debes ingresar tu correo y contraseña'),
                        ),
                      );
                      return;
                    }

                    String email = emailController.text;
                    String password = passwordController.text;

                    final error =
                        await ref.read(authProviderProvider.notifier).login(
                              email: email,
                              password: password,
                            );
                    if (error != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                        ),
                      );
                      return;
                    }
                  },
                  child: const Text('Iniciar sesión'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Aquí puedes implementar la lógica para redirigir a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    '¿No tienes una cuenta? Regístrate aquí',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

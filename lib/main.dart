import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/auth_provider.dart';
import 'package:unicash/screens/login.dart';
import 'package:unicash/screens/main_screen_host.dart';
import 'package:unicash/utils/persistencia.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Persistencia prefs = Persistencia();
  await prefs.initPrefs();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogedIn = ref.watch(authProviderProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogedIn ? const MainScreenHost() : LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicash/providers/pagina_actual_provider.dart';
import 'package:unicash/screens/add.dart';
import 'package:unicash/screens/home_profile_tab.dart';
import 'package:unicash/screens/home_screen_tab.dart';
import 'package:unicash/screens/statistics.dart';
import 'package:unicash/utils/constants.dart';

class MainScreenHost extends ConsumerWidget {
  const MainScreenHost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(paginaActualProvider);
    return Scaffold(
      body: switch (currentIndex) {
        0 => const HomeScreenTab(),
        1 => const AddTransactionScreen(),
        2 => const Statistics(),
        3 => const HomeProfileTab(),
        _ => const HomeScreenTab(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(paginaActualProvider.notifier).cambiarPagina(index);
        },
        selectedItemColor: secondaryDark,
        unselectedItemColor: fontLight,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Añadir"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: "Estadisticas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

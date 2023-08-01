import 'package:flutter/material.dart';
import 'package:unicash/screens/add.dart';
import 'package:unicash/screens/home_profile_tab.dart';
import 'package:unicash/screens/home_screen_tab.dart';
import 'package:unicash/screens/statistics.dart';
import 'package:unicash/screens/tarjetas.dart';
import 'package:unicash/utils/constants.dart';

class MainScreenHost extends StatefulWidget {
  const MainScreenHost({Key? key}) : super(key: key);

  @override
  State<MainScreenHost> createState() => _MainScreenHostState();
}

class _MainScreenHostState extends State<MainScreenHost> {
  var currentIndex = 0;

  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
        return const HomeScreenTab();
      case 1:
        return CreditCardScreen();
      case 2:
        return AddTransactionScreen();
      case 3:
        return const Statistics();
      case 4:
        return const HomeProfileTab();
      default:
        return const HomeScreenTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildTabContent(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: secondaryDark,
        unselectedItemColor: fontLight,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Billetera"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Añadir"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: "Estadisticas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

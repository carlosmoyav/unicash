import 'package:flutter/material.dart';
import 'package:unicash/utils/constants.dart';

import '../widget/profile_account_info_tile.dart';

class HomeProfileTab extends StatelessWidget {
  const HomeProfileTab({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cerrar sesión'),
          content: Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para cerrar la sesión del usuario
                // Por ejemplo, puedes utilizar Firebase Authentication para cerrar la sesión.
                Navigator.pop(context); // Cierra el cuadro de diálogo
              },
              child: Text('Aceptar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el cuadro de diálogo
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: background,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: fontSubHeading,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: defaultSpacing),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'logout') {
                    _showLogoutDialog(context);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Text('Cerrar sesión'),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultSpacing,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(defaultRadius)),
                      child: Image.asset(
                        "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/carlosmoya.jpg",
                        width: 100,
                      ),
                    ),
                    Text(
                      "Carlos Moya",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800, color: fontHeading),
                    ),
                    Text(
                      "e1311582033@live.uleam.edu.ec",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: fontSubHeading),
                    ),
                    const Chip(
                      backgroundColor: primaryLight,
                      label: Text("Editar Perfil"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: defaultSpacing),
                    child: Text(
                      "General",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700, color: fontHeading),
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const GeneralAccountInfoTile(
                      title: "Mi Billetera",
                      subTitle: "Administra tu billetera guardada",
                      imageUrl:
                          "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/billetera_logo.png"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultSpacing),
                    child: Text(
                      "Cuenta",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: fontHeading,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing / 2,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl:
                          "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/person.png",
                      heading: "Mi Cuenta"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl:
                          "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/notificaciones.png",
                      heading: "Notificaciones"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl:
                          "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/privacidad.png",
                      heading: "Privacidad"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl:
                          "/Users/carlosmoya/Desktop/flutter/unicash/assets/icons/acerca_de.png",
                      heading: "Acerca De"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                ],
              ),
            )
          ],
        )));
  }
}

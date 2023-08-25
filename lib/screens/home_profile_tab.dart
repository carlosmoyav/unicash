import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unicash/models/types.dart';
import 'package:unicash/providers/auth_provider.dart';
import 'package:unicash/providers/perfil_provider.dart';
import 'package:unicash/screens/acerda_de.dart';
import 'package:unicash/screens/editar_perfil.dart';
import 'package:unicash/screens/privacidad.dart';
import 'package:unicash/utils/constants.dart';
import 'package:unicash/utils/persistencia.dart';

import '../widget/profile_account_info_tile.dart';

class HomeProfileTab extends HookConsumerWidget {
  const HomeProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = Persistencia();

    final usuario = useState<Usuario>((
      nombres: prefs.nombres,
      apellidos: prefs.apellidos,
      fechaNacimiento: prefs.fechaNacimiento,
      email: prefs.correo,
      imagenPerfilBase64: prefs.imagenPerfilBase64,
    ));

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: background,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: defaultSpacing),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'logout') {
                    _showLogoutDialog(context);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
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
                        child: InkWell(
                          onTap: () async {
                            if (await Permission.photos.request().isGranted) {
                              final ImagePicker picker = ImagePicker();

                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                                requestFullMetadata: false,
                              );
                              if (image != null) {
                                final resp = await ref.read(
                                    actualizarFotoPerfilProvider(image).future);
                                if (resp.error && context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(resp.message!),
                                  ));
                                } else {
                                  usuario.value = ((
                                    nombres: prefs.nombres,
                                    apellidos: prefs.apellidos,
                                    fechaNacimiento: prefs.fechaNacimiento,
                                    email: prefs.correo,
                                    imagenPerfilBase64:
                                        prefs.imagenPerfilBase64,
                                  ));
                                }
                              }
                            }
                          },
                          child: usuario.value.imagenPerfilBase64.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: size.width * 0.1,
                                )
                              : Image.memory(
                                  base64Decode(
                                      usuario.value.imagenPerfilBase64),
                                  width: size.width * 0.2,
                                  height: size.width * 0.2,
                                  fit: BoxFit.cover,
                                ),
                        )),
                    Text(
                      "${usuario.value.nombres} ${usuario.value.apellidos}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800, color: fontHeading),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      usuario.value.email,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: fontSubHeading),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final resp = await Navigator.push<Usuario?>(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EditarUsuarioPage()));
                        if (resp != null) {
                          usuario.value = resp;
                        }
                      },
                      child: const Chip(
                        backgroundColor: primaryLight,
                        label: Text("Editar Perfil"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAccountInfoTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const Privacidad();
                      }));
                    },
                    icono: Icons.security,
                    heading: "Privacidad"),
                const SizedBox(
                  height: defaultSpacing,
                ),
                ProfileAccountInfoTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const AcercaDe();
                      }));
                    },
                    icono: Icons.info_outline,
                    heading: "Acerca De"),
                const SizedBox(
                  height: defaultSpacing,
                ),
              ],
            )
          ],
        )));
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cierra el cuadro de diálogo
            },
            child: const Text('Cancelar'),
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el cuadro de diálogo
                  ref.read(authProviderProvider.notifier).logout();
                },
                child: const Text('Aceptar'),
              );
            },
          ),
        ],
      );
    },
  );
}

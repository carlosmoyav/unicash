import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unicash/controllers/perfil_controller.dart';
import 'package:unicash/models/response.dart';
import 'package:unicash/utils/persistencia.dart';

part 'perfil_provider.g.dart';

@riverpod
FutureOr<Respuesta> actualizarFotoPerfil(
    ActualizarFotoPerfilRef ref, XFile foto) async {
  final fotoBase64 = base64Encode(await foto.readAsBytes());

  final response = await PerfilController().actualizarFotoPerfil(fotoBase64);

  if (response.error) {
    return response;
  }
  final data = response.data!;
  print(data);
  final prefs = Persistencia();
  prefs.nombres = data['usuario']['nombres'];
  prefs.apellidos = data['usuario']['apellidos'];
  prefs.imagenPerfilBase64 = data['usuario']['imagenPerfil'];
  prefs.fechaNacimiento = data['usuario']['fechaNacimiento'];
  prefs.correo = data['usuario']['correo'];
  return response;
}

@riverpod
FutureOr<Respuesta> editarUsuario(EditarUsuarioRef ref, String nombres,
    String apellidos, String fechaNacimiento, String correo) async {
  final response = await PerfilController()
      .editarUsuario(nombres, apellidos, fechaNacimiento, correo);

  if (response.error) {
    return response;
  }
  final data = response.data!;
  final prefs = Persistencia();
  prefs.nombres = data['usuario']['nombres'];
  prefs.apellidos = data['usuario']['apellidos'];
  prefs.imagenPerfilBase64 = data['usuario']['imagenPerfil'];
  prefs.fechaNacimiento = data['usuario']['fechaNacimiento'];
  prefs.correo = data['usuario']['correo'];
  return response;
}

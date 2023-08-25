import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unicash/controllers/auth_controller.dart';
import 'package:unicash/utils/persistencia.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  bool build() {
    final prefs = Persistencia();
    if (prefs.token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void change(bool value) {
    state = value;
  }

  Future<String?> register({
    required String nombres,
    required String apellidos,
    required String fechaNacimiento,
    required String email,
    required String password,
  }) async {
    final response = await AuthController().register(
        nombres: nombres,
        apellidos: apellidos,
        fechaNacimiento: fechaNacimiento,
        email: email,
        password: password);

    if (response.error) {
      return response.message;
    }
    final prefs = Persistencia();

    final data = response.data!;

    prefs.nombres = data['usuario']['nombres'];
    prefs.apellidos = data['usuario']['apellidos'];
    prefs.imagenPerfilBase64 = data['usuario']['imagenPerfil'];
    prefs.fechaNacimiento = data['usuario']['fechaNacimiento'];
    prefs.correo = data['usuario']['correo'];
    prefs.token = data['token'];
    state = true;

    return null;
  }

  Future<String?> login(
      {required String email, required String password}) async {
    final response = await AuthController().login(email, password);

    if (response.error) {
      return response.message;
    }
    final prefs = Persistencia();

    final data = response.data!;

    prefs.nombres = data['usuario']['nombres'];
    prefs.apellidos = data['usuario']['apellidos'];
    prefs.imagenPerfilBase64 = data['usuario']['imagenPerfil'];
    prefs.fechaNacimiento = data['usuario']['fechaNacimiento'];
    prefs.correo = data['usuario']['correo'];
    prefs.token = data['token'];
    state = true;

    return null;
  }

  Future<void> logout() async {
    final prefs = Persistencia();
    await prefs.clear();
    state = false;
  }
}

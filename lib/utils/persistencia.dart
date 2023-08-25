import 'package:shared_preferences/shared_preferences.dart';

class Persistencia {
  static final Persistencia _instancia = Persistencia._internal();

  factory Persistencia() {
    return _instancia;
  }

  Persistencia._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get nombres {
    return _prefs.getString('nombres') ?? '';
  }

  set nombres(String nombres) {
    _prefs.setString('nombres', nombres);
  }

  String get apellidos {
    return _prefs.getString('apellidos') ?? '';
  }

  set apellidos(String apellidos) {
    _prefs.setString('apellidos', apellidos);
  }

  String get fechaNacimiento {
    return _prefs.getString('fechaNacimiento') ?? '';
  }

  set fechaNacimiento(String fechaNacimiento) {
    _prefs.setString('fechaNacimiento', fechaNacimiento);
  }

  String get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo(String correo) {
    _prefs.setString('correo', correo);
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String token) {
    _prefs.setString('token', token);
  }

  String get imagenPerfilBase64 {
    return _prefs.getString('imagenPerfilBase64') ?? '';
  }

  set imagenPerfilBase64(String imagenPerfilBase64) {
    _prefs.setString('imagenPerfilBase64', imagenPerfilBase64);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}

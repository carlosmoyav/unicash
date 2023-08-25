import 'package:dio/dio.dart';
import 'package:unicash/controllers/conexion.dart';
import 'package:unicash/models/response.dart';

class PerfilController {
  final dio = Conexion.dioConf;

  Future<Respuesta> actualizarFotoPerfil(String fotoBase64) async {
    try {
      final response = await dio.put('/usuarios', data: {
        'imagenPerfil': fotoBase64,
      });
      return Respuesta(
        data: response.data,
      );
    } on DioException catch (e) {
      return Respuesta(
        error: true,
        message:
            e.response?.data['message'].toString() ?? 'ha ocurrido un error',
        data: e.response?.data,
      );
    } catch (e) {
      return Respuesta(
        error: true,
        message: 'ha ocurrido un error',
      );
    }
  }

  Future<Respuesta> editarUsuario(String nombres, String apellidos,
      String fechaNacimiento, String correo) async {
    try {
      final response = await dio.patch('/usuarios', data: {
        "nombres": nombres,
        "apellidos": apellidos,
        "fechaNacimiento": fechaNacimiento,
        'correo': correo,
      });
      return Respuesta(
        data: response.data,
      );
    } on DioException catch (e) {
      return Respuesta(
        error: true,
        message:
            e.response?.data['message'].toString() ?? 'ha ocurrido un error',
        data: e.response?.data,
      );
    } catch (e) {
      return Respuesta(
        error: true,
        message: 'ha ocurrido un error',
      );
    }
  }
}

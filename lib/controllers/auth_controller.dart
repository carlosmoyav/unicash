import 'package:dio/dio.dart';
import 'package:unicash/controllers/conexion.dart';
import 'package:unicash/models/response.dart';

class AuthController {
  final dio = Conexion.dioConf;

  Future<Respuesta> register({
    required String nombres,
    required String apellidos,
    required String fechaNacimiento,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/autenticacion/registro',
        data: {
          'nombres': nombres,
          'apellidos': apellidos,
          'fechaNacimiento': fechaNacimiento,
          'correo': email,
          'contrasena': password,
        },
      );
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

  Future<Respuesta> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/autenticacion/login',
        data: {
          'correo': email,
          'contrasena': password,
        },
      );
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

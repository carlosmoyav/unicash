import 'package:dio/dio.dart';
import 'package:unicash/controllers/conexion.dart';
import 'package:unicash/models/response.dart';

class BilleteraController {
  final dio = Conexion.dioConf;

  Future<Respuesta> obtenerBilletera() async {
    try {
      final response = await dio.get(
        '/billeteras',
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

  Future<Respuesta> agregarMovimiento(Map<String, dynamic> payload) async {
    try {
      final response = await dio.post(
        '/billeteras/movimiento',
        data: payload,
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

  Future<Respuesta> obtenerAllTransacciones() async {
    try {
      final response = await dio.get(
        '/billeteras/movimientos',
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

  Future<Respuesta> obtenerEstadisticas(String tipo, String rango) async {
    try {
      final response =
          await dio.get('/billeteras/estadisticas', queryParameters: {
        'tipo': tipo,
        'rango': rango,
      });
      print(response.data);
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

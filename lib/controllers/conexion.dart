import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;

import 'package:unicash/utils/persistencia.dart';

@immutable
class Conexion {
  static String get backend => 'http://204.48.28.226:3000/api';
  static Map<String, String> get headerAuth {
    return {'authorization': 'Bearer ${Persistencia().token}'};
  }

  static Dio get dioConf => Dio(
        BaseOptions(
          baseUrl: backend,
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),

          // responseType: ResponseType.json,
          headers: headerAuth,
        ),
      )..interceptors.addAll(
          [],
        );

  const Conexion._();
}

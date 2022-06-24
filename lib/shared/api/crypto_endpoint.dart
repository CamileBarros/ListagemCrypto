import 'package:dio/dio.dart';

class CryptoEndpoint {
  final Dio _dio;

  CryptoEndpoint(this._dio);

  Future<Response> getAllCharacters() {
    return _dio.get("/");
  }
}

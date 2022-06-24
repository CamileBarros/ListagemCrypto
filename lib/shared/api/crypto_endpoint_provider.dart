import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:listagem_crypto/shared/api/crypto_endpoint.dart';

final CryptoEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://data.messari.io/api',
  ));
  return CryptoEndpoint(dio);
});

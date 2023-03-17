import 'package:dio/dio.dart';
import 'package:hafizh/core/network/api_interceptors.dart';

class DioHandler {
  final String baseUrl;

  DioHandler({required this.baseUrl});

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 30),
    );
    options.headers = _defaultHeader();
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }

  Dio get dio => _getDio();

  Map<String, dynamic> _defaultHeader() {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    return headers;
  }
}

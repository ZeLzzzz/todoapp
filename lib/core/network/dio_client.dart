import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.example.com/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        print('Request: ${options.method} ${options.path}');
        return handler.next(options);
      }),
    );
  }

  Dio get dio => _dio;
}

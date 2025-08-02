import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  final Dio _dio;

  DioClient._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: dotenv.get('API_BASE_URL'),
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

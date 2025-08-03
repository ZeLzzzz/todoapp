import 'package:dio/dio.dart';
import 'package:todoapp/core/utils/shared_prefs_util.dart';
import 'package:todoapp/data/models/login_response.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<LoginResponse> login(String email, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    final loginResponse = LoginResponse.fromJson(response.data);

    await SharedPrefsUtil.saveSession('token', loginResponse.token.token);
    return loginResponse;
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await _dio.post('/auth/register', data: {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  Future<void> logout() async {
    await _dio.delete('/auth/logout');
    await SharedPrefsUtil.clearSession('token');
  }
}

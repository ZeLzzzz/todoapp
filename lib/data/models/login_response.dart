import 'user_model.dart';

class AuthToken {
  final String token;

  AuthToken({required this.token});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['token'] ?? '',
    );
  }
}

class LoginResponse {
  final AuthToken token;
  final UserModel user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return LoginResponse(
      token: AuthToken.fromJson(data['token']),
      user: UserModel.fromJson(data['user']),
    );
  }
}

import 'auth_user.dart';

class AuthResponse {
  final String status;
  final String? message;
  final AuthUser? data;

  const AuthResponse({required this.status, this.message, this.data});

  bool get isSuccess => status.toLowerCase() == 'success';
}

class AuthUser {
  final String id;
  final String name;
  final String role;
  final String username;
  final String token;
  final String tokenExpiry;
  final String lastLogin;

  const AuthUser({
    required this.id,
    required this.name,
    required this.role,
    required this.username,
    required this.token,
    required this.tokenExpiry,
    required this.lastLogin,
  });
}

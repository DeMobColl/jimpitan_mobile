import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../entities/auth/auth_request.dart';
import '../../entities/auth/auth_response.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../../data/repositories/auth/auth_repository_impl.dart';
import '../../../data/local/auth/auth_local_source.dart';

class SilentAuthRefreshUseCase {
  final AuthRepository repository;
  final AuthLocalDataSource localDataSource;

  SilentAuthRefreshUseCase({
    required this.repository,
    required this.localDataSource,
  });

  /// Attempts to refresh authentication silently using stored credentials
  /// Returns AuthResponse if successful, null if credentials not available
  Future<AuthResponse?> call() async {
    // Get stored credentials
    final username = localDataSource.getStoredUsername();
    final password = localDataSource.getStoredPassword();

    // If no credentials stored, return null
    if (username == null || password == null) {
      return null;
    }

    // Attempt silent login with stored credentials
    try {
      final request = AuthRequest(username: username, password: password);
      final response = await repository.login(request);

      if (response.isSuccess) {
        return response;
      }

      return null;
    } catch (e) {
      // Silent failure - will be handled by caller
      return null;
    }
  }
}

final silentAuthRefreshUseCaseProvider = Provider<SilentAuthRefreshUseCase>((ref) {
  return SilentAuthRefreshUseCase(
    repository: ref.watch(authRepositoryProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

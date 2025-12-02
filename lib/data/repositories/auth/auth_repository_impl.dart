import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../remote/auth/auth_remote_source.dart';
import '../../local/auth/auth_local_source.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../domain/entities/auth/auth_request.dart';
import '../../../domain/entities/auth/auth_response.dart';
import '../../mappers/auth/auth_request_mapper.dart';
import '../../mappers/auth/auth_response_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AuthResponse> login(AuthRequest request) async {
    // Convert domain entity to data model
    final requestModel = AuthRequestMapper.toModel(request);

    // Call remote data source
    final responseModel = await remoteDataSource.login(requestModel);

    // Convert data model back to domain entity
    return AuthResponseMapper.toEntity(responseModel);
  }

  @override
  bool isUserLoggedIn() {
    return localDataSource.isUserLoggedIn();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

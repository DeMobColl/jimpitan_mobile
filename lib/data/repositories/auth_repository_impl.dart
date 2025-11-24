import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth/auth_model.dart';
import '../remote/auth/auth_remote_source.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthResponseModel> login(AuthRequestModel request) async {
    return await remoteDataSource.login(request);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
  );
});

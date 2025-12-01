import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jimpitan/core/const/app_const.dart';
import '../../../core/providers/dio_provider.dart';
import '../../models/auth/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(AuthRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthResponseModel> login(AuthRequestModel request) async {
    try {
      log('[AUTH] Attempting login for username: ${request.username}');

      final response = await dio.post(
        AppConst.baseUrl,
        data: request.toJson(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Accept': 'application/json'},
        ),
      );

      log('[AUTH] Response status: ${response.statusCode}');
      log('[AUTH] Response data: ${response.data}');

      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      log('[AUTH] DioException: ${e.message}');

      if (e.response != null) {
        log('[AUTH] Error status: ${e.response?.statusCode}');
        log('[AUTH] Error data: ${e.response?.data}');

        try {
          return AuthResponseModel.fromJson(e.response!.data);
        } catch (_) {
          return AuthResponseModel(
            status: 'error',
            message: 'Server error: ${e.response?.statusCode}',
          );
        }
      }

      return AuthResponseModel(
        status: 'error',
        message: 'Network error: ${e.message}',
      );
    } catch (e) {
      log('[AUTH] Unexpected error: $e');
      return AuthResponseModel(
        status: 'error',
        message: 'Unexpected error: $e',
      );
    }
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

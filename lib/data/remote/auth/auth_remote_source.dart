import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dio_provider.dart';
import '../../../core/helpers/callback_parser.dart';
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
      log('[AUTH] Attempting login for password: ${request.password}');

      // Use GET request with query parameters
      var response = await dio.get(
        'https://script.google.com/macros/s/AKfycbw5pqaREdIKGChIY7IUUbM2xRdZRiG0uYxzG_F9MJvXdOq7VpJH-9g5KRl6zu285OLTKg/exec',
        queryParameters: {
          'action': 'login',
          'username': request.username,
          'password': request.password,
        },
      );

      log('[AUTH] SUCCESS CODE: ${response.statusCode}');
      log('[AUTH] DATA: ${response.data}');

      try {
        // Use CallbackParser helper to handle callback wrapper
        final jsonMap = CallbackParser.parse(response.data);
        return AuthResponseModel.fromJson(jsonMap);
      } catch (parseError) {
        log('[AUTH] Failed to parse response as JSON: $parseError');
        if (response.statusCode == 200) {
          return const AuthResponseModel(
            status: 'success',
            message: 'Login successful (Parsing skipped)',
          );
        } else {
          return AuthResponseModel(
            status: 'error',
            message: 'Unexpected response format: ${response.data}',
          );
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('[AUTH] ERROR ${e.response?.statusCode}: ${e.response?.data}');
        try {
          return AuthResponseModel.fromJson(e.response!.data);
        } catch (_) {
          return AuthResponseModel(
            status: 'error',
            message: 'Server error: ${e.response?.statusCode}',
          );
        }
      } else {
        log('[AUTH] ERROR: ${e.message}');
        return AuthResponseModel(
          status: 'error',
          message: 'Network error: ${e.message}',
        );
      }
    } catch (e) {
      log('[AUTH] UNEXPECTED ERROR: $e');
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

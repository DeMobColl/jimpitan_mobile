import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jimpitan/core/const/app_const.dart';
import '../../../core/providers/dio_provider.dart';
import '../../models/input/input_nominal_model.dart';

abstract class InputRemoteDataSource {
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  );
}

class InputRemoteDataSourceImpl implements InputRemoteDataSource {
  final Dio dio;

  InputRemoteDataSourceImpl({required this.dio});

  @override
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  ) async {
    try {
      log('[API] Submitting input nominal: ${request.toJson()}');

      var response = await dio.post(
        AppConst.baseUrl,
        data: request.toJson(),
      );

      log('[API] SUCCESS CODE: ${response.statusCode}');
      log('[API] DATA: ${response.data}');

     return InputNominalResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        log('[AUTH] Error status: ${e.response?.statusCode}');
        log('[AUTH] Error data: ${e.response?.data}');

        try {
          return InputNominalResponseModel.fromJson(e.response!.data);
        } catch (_) {
          return InputNominalResponseModel(
            status: 'error',
            message: 'Server error: ${e.response?.statusCode}',
          );
        }
      }

      return InputNominalResponseModel(
        status: 'error',
        message: 'Network error: ${e.message}',
      );
    } catch (e) {
      log('[API] UNEXPECTED ERROR: $e');
      return InputNominalResponseModel(
        status: 'error',
        message: 'Unexpected error: $e',
      );
    }
  }
}

final inputRemoteDataSourceProvider = Provider<InputRemoteDataSource>((ref) {
  return InputRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

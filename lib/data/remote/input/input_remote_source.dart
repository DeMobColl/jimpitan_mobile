import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dio_provider.dart';
import '../../models/input/input_nominal_model.dart';

abstract class InputRemoteDataSource {
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  );
}

class InputRemoteDataSourceImpl implements InputRemoteDataSource {
  final Dio dio;

  // Google Apps Script URL
  static const String _scriptUrl =
      "https://script.google.com/macros/s/AKfycbyuodsQ0xhNObC3KAywYoSU9sUf8NBqB-wtUsET90b4QZhHWpeBXnBJfE5HoU2Og-P_tw/exec";

  InputRemoteDataSourceImpl({required this.dio});

  @override
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  ) async {
    try {
      log('[API] Submitting input nominal: ${request.toJson()}');

      final response = await dio.post(
        _scriptUrl,
        data: request.toJson(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Accept': 'application/json'},
          followRedirects: true,
        ),
      );

      log('[API] SUCCESS: ${response.data}');

      // Try to parse the actual JSON response from Google Apps Script
      try {
        return InputNominalResponseModel.fromJson(response.data);
      } catch (parseError) {
        log('[API] Failed to parse response as JSON: $parseError');
        // If parsing fails, assume success if we got a 200 response
        if (response.statusCode == 200) {
          return const InputNominalResponseModel(
            status: 'success',
            message: 'Data submitted successfully',
          );
        } else {
          return InputNominalResponseModel(
            status: 'error',
            message: 'Unexpected response format: ${response.data}',
          );
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('[API] ERROR ${e.response?.statusCode}: ${e.response?.data}');

        // Try to parse error response
        try {
          return InputNominalResponseModel.fromJson(e.response!.data);
        } catch (_) {
          return InputNominalResponseModel(
            status: 'error',
            message: 'Server error: ${e.response?.statusCode}',
          );
        }
      } else {
        log('[API] ERROR: ${e.message}');
        return InputNominalResponseModel(
          status: 'error',
          message: 'Network error: ${e.message}',
        );
      }
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

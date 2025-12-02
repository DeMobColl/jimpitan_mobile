import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jimpitan/core/const/app_const.dart';
import 'package:jimpitan/core/providers/dio_provider.dart';
import 'package:jimpitan/data/models/qr_scan_customer/request/qr_scan_customer_request_model.dart';
import 'package:jimpitan/data/models/qr_scan_customer/response/qr_scan_customer_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class QrScanCustomerRemoteDataSource {
  Future<QrScanCustomerResponseModel> scanQr(
    QrScanCustomerRequestModel request,
  );
}

class QrScanCustomerRemoteDataSourceImpl
    implements QrScanCustomerRemoteDataSource {
  final Dio dio;

  QrScanCustomerRemoteDataSourceImpl({required this.dio});

  @override
  Future<QrScanCustomerResponseModel> scanQr(
    QrScanCustomerRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        AppConst.baseUrl,
        data: request.toJson(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {'Accept': 'application/json'},
        ),
      );

      return QrScanCustomerResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        log('[QR SCAN] DioException: ${e.message}');
        log('[QR SCAN] Error status: ${e.response?.statusCode}');
        log('[QR SCAN] Error data: ${e.response?.data}');

        try {
          return QrScanCustomerResponseModel.fromJson(e.response!.data);
        } catch (_) {
          return QrScanCustomerResponseModel(
            status: 'error',
            data: null,
            user: null,
          );
        }
      }

      return QrScanCustomerResponseModel(
        status: 'error',
        data: null,
        user: null,
      );
    } catch (e) {
      return QrScanCustomerResponseModel(
        status: 'error',
        data: null,
        user: null,
      );
    }
  }
}

final qrScanCustomerRemoteDataSource = Provider<QrScanCustomerRemoteDataSource>(
  (ref) {
    return QrScanCustomerRemoteDataSourceImpl(dio: ref.watch(dioProvider));
  },
);

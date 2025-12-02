import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jimpitan/data/mappers/qr_scan_customer/qr_scan_customer_request_mapper.dart';
import 'package:jimpitan/data/mappers/qr_scan_customer/qr_scan_customer_response_mapper.dart';
import 'package:jimpitan/data/remote/qr_scan/qr_scan_remote_source.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_response.dart';
import 'package:jimpitan/domain/repositories/qr_scan_customer/qr_scan_customer_repository.dart';

class QrScanCustomerImpl implements QrScanCustomerRepository {
  final QrScanCustomerRemoteDataSource remoteDataSource;

  QrScanCustomerImpl({required this.remoteDataSource});

  @override
  Future<QrScanCustomerResponse> scanQr(QrScanCustomerRequest request) async {
    final requestModel = QrScanCustomerRequestMapper.toModel(request);

    final responseModel = await remoteDataSource.scanQr(requestModel);

    return QrScanCustomerResponseMapper.toEntity(responseModel);
  }

}

final qrScanCustomerRepositoryProvider = Provider<QrScanCustomerRepository>((ref) {
    return QrScanCustomerImpl(
      remoteDataSource: ref.watch(qrScanCustomerRemoteDataSource),
    );
  });

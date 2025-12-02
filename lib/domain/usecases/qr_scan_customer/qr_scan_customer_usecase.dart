import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jimpitan/data/repositories/qr_scan_customer/qr_scan_customer_impl.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_response.dart';
import 'package:jimpitan/domain/repositories/qr_scan_customer/qr_scan_customer_repository.dart';

class QrScanCustomerUsecase {
  final QrScanCustomerRepository repository;

  QrScanCustomerUsecase({required this.repository});

  Future<QrScanCustomerResponse> call(QrScanCustomerRequest request) {
    return repository.scanQr(request);
  }
}

final qrScanCustomerUsecaseProvider = Provider<QrScanCustomerUsecase>((ref) {
  return QrScanCustomerUsecase(
    repository: ref.watch(qrScanCustomerRepositoryProvider),
  );
});

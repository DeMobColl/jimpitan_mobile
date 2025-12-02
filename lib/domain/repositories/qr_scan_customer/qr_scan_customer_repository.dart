import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import 'package:jimpitan/domain/entities/qr_scan_customer/qr_scan_customer_response.dart';

abstract class QrScanCustomerRepository {
  Future<QrScanCustomerResponse> scanQr(QrScanCustomerRequest request);
}

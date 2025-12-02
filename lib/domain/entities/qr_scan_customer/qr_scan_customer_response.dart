import 'qr_scan_customer_data.dart';
import 'qr_scan_customer_user.dart';

class QrScanCustomerResponse {
  final String status;
  final QrScanCustomerData? data;
  final QrScanCustomerUser? user;

  const QrScanCustomerResponse({required this.status, this.data, this.user});

  bool get isSuccess => status.toLowerCase() == 'success';
}

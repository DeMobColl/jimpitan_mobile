import '../../../domain/entities/qr_scan_customer/qr_scan_customer_request.dart';
import '../../models/qr_scan_customer/request/qr_scan_customer_request_model.dart';

class QrScanCustomerRequestMapper {
  static QrScanCustomerRequestModel toModel(QrScanCustomerRequest entity) {
    return QrScanCustomerRequestModel(
      action: entity.action,
      mobileToken: entity.mobileToken,
      qrHash: entity.qrHash,
    );
  }

  static QrScanCustomerRequest toEntity(QrScanCustomerRequestModel model) {
    return QrScanCustomerRequest(
      action: model.action,
      mobileToken: model.mobileToken,
      qrHash: model.qrHash,
    );
  }
}

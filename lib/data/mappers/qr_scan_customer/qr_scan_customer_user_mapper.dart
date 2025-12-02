import '../../../domain/entities/qr_scan_customer/qr_scan_customer_user.dart'
    as entity;
import '../../models/qr_scan_customer/response/qr_scan_customer_response_model.dart';

class QrScanCustomerUserMapper {
  static entity.QrScanCustomerUser toEntity(QrScanCustomerUser model) {
    return entity.QrScanCustomerUser(
      id: model.id ?? '',
      name: model.name ?? '',
    );
  }

  static QrScanCustomerUser toModel(entity.QrScanCustomerUser entity) {
    return QrScanCustomerUser(id: entity.id, name: entity.name);
  }
}

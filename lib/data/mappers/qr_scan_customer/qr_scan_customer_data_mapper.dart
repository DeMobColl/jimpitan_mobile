import '../../../domain/entities/qr_scan_customer/qr_scan_customer_data.dart'
    as entity;
import '../../models/qr_scan_customer/response/qr_scan_customer_response_model.dart';

class QrScanCustomerDataMapper {
  static entity.QrScanCustomerData toEntity(QrScanCustomerData model) {
    return entity.QrScanCustomerData(
      id: model.id ?? '',
      block: model.block ?? '',
      name: model.name ?? '',
      qrHash: model.qrHash ?? '',
      createdAt: model.createdAt ?? '',
      totalDeposit: model.totalDeposit ?? 0,
      lastTransaction: model.lastTransaction ?? '',
    );
  }

  static QrScanCustomerData toModel(entity.QrScanCustomerData entity) {
    return QrScanCustomerData(
      id: entity.id,
      block: entity.block,
      name: entity.name,
      qrHash: entity.qrHash,
      createdAt: entity.createdAt,
      totalDeposit: entity.totalDeposit,
      lastTransaction: entity.lastTransaction,
    );
  }
}

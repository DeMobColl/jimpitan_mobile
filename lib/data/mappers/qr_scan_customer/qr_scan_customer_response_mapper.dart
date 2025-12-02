import '../../../domain/entities/qr_scan_customer/qr_scan_customer_response.dart';
import '../../models/qr_scan_customer/response/qr_scan_customer_response_model.dart';
import 'qr_scan_customer_data_mapper.dart';
import 'qr_scan_customer_user_mapper.dart';

class QrScanCustomerResponseMapper {
  static QrScanCustomerResponse toEntity(QrScanCustomerResponseModel model) {
    return QrScanCustomerResponse(
      status: model.status ?? '',
      data: model.data != null
          ? QrScanCustomerDataMapper.toEntity(model.data!)
          : null,
      user: model.user != null
          ? QrScanCustomerUserMapper.toEntity(model.user!)
          : null,
    );
  }

  static QrScanCustomerResponseModel toModel(QrScanCustomerResponse entity) {
    return QrScanCustomerResponseModel(
      status: entity.status,
      data: entity.data != null
          ? QrScanCustomerDataMapper.toModel(entity.data!)
          : null,
      user: entity.user != null
          ? QrScanCustomerUserMapper.toModel(entity.user!)
          : null,
    );
  }
}

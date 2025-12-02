class QrScanCustomerRequest {
  final String action;
  final String mobileToken;
  final String qrHash;

  const QrScanCustomerRequest({
    required this.action,
    required this.mobileToken,
    required this.qrHash,
  });
}

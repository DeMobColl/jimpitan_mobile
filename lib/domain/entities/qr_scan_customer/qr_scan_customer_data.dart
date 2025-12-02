class QrScanCustomerData {
  final String id;
  final String block;
  final String name;
  final String qrHash;
  final String createdAt;
  final int totalDeposit;
  final String lastTransaction;

  const QrScanCustomerData({
    required this.id,
    required this.block,
    required this.name,
    required this.qrHash,
    required this.createdAt,
    required this.totalDeposit,
    required this.lastTransaction,
  });
}

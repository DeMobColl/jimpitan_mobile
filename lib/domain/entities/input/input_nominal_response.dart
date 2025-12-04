class InputNominalResponse {
  final String status;
  final String? message;
  final InputNominalData? data;

  const InputNominalResponse({required this.status, this.message, this.data});

  bool get isSuccess => status.toLowerCase() == 'success';
}

class InputNominalData {
  final String txid;
  final String timestamp;
  final String customerId;
  final String blok;
  final String nama;
  final int nominal;
  final String petugas;
  final String userId;

  const InputNominalData({
    required this.txid,
    required this.timestamp,
    required this.customerId,
    required this.blok,
    required this.nama,
    required this.nominal,
    required this.petugas,
    required this.userId,
  });
}

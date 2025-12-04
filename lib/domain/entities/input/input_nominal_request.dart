class InputNominalRequest {
  final String action;
  final String mobileToken;
  final String customerId;
  final String id;
  final String nama;
  final int nominal;

  const InputNominalRequest({
    this.action = 'mobileSubmitTransaction',
    required this.mobileToken,
    required this.customerId,
    required this.id,
    required this.nama,
    required this.nominal,
  });
}

class InputNominalResponse {
  final String status;
  final String? message;
  final Map<String, dynamic>? data;

  const InputNominalResponse({required this.status, this.message, this.data});

  bool get isSuccess => status.toLowerCase() == 'success';
}

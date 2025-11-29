import '../entities/input/input_nominal_request.dart';
import '../entities/input/input_nominal_response.dart';

abstract class InputRepository {
  Future<InputNominalResponse> submitInputNominal(InputNominalRequest request);
}

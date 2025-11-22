import '../../data/models/input/input_nominal_model.dart';

abstract class InputRepository {
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  );
}

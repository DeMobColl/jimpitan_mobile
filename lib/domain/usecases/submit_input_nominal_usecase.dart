import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/input/input_nominal_model.dart';
import '../../data/repositories/input_repository_impl.dart';
import '../repositories/input_repository.dart';

class SubmitInputNominalUseCase {
  final InputRepository repository;

  SubmitInputNominalUseCase({required this.repository});

  Future<InputNominalResponseModel> call(InputNominalRequestModel request) {
    return repository.submitInputNominal(request);
  }
}

final submitInputNominalUseCaseProvider = Provider<SubmitInputNominalUseCase>((
  ref,
) {
  return SubmitInputNominalUseCase(
    repository: ref.watch(inputRepositoryProvider),
  );
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/input/input_repository_impl.dart';
import '../../repositories/input/input_repository.dart';
import '../../entities/input/input_nominal_request.dart';
import '../../entities/input/input_nominal_response.dart';

class SubmitInputNominalUseCase {
  final InputRepository repository;

  SubmitInputNominalUseCase({required this.repository});

  Future<InputNominalResponse> call(InputNominalRequest request) {
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

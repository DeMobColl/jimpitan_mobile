import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/input/input_nominal_request.dart';
import '../../domain/entities/input/input_nominal_response.dart';
import '../../domain/usecases/input/submit_input_nominal_usecase.dart';

part 'input_controller.g.dart';

// Input controller using AsyncNotifier for built-in async state management
@riverpod
class InputNominalController extends _$InputNominalController {
  @override
  FutureOr<InputNominalResponse?> build() {
    // Initial state is null (no submission yet)
    return null;
  }

  Future<void> submitInputNominal({
    required String mobileToken,
    required String customerId,
    required String id,
    required String nama,
    required int nominal,
  }) async {
    // Set loading state
    state = const AsyncValue.loading();

    // Create request
    final request = InputNominalRequest(
      mobileToken: mobileToken,
      customerId: customerId,
      id: id,
      nama: nama,
      nominal: nominal,
    );

    // Execute use case and update state
    state = await AsyncValue.guard(() async {
      final submitInputNominalUseCase = ref.read(
        submitInputNominalUseCaseProvider,
      );
      return await submitInputNominalUseCase(request);
    });
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }
}

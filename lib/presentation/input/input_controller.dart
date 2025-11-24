import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/input/input_nominal_model.dart';
import '../../domain/usecases/submit_input_nominal_usecase.dart';

part 'input_controller.freezed.dart';
part 'input_controller.g.dart';

// State classes
@freezed
class InputNominalState with _$InputNominalState {
  const factory InputNominalState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSuccess,
  }) = _InputNominalState;
}

// Input controller
@riverpod
class InputNominalController extends _$InputNominalController {
  @override
  InputNominalState build() {
    return const InputNominalState();
  }

  Future<void> submitInputNominal({
    required String nama,
    required String nominal,
    required String petugas,
    required String username,
  }) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    try {
      const uuid = Uuid();
      final request = InputNominalRequestModel(
        id: uuid.v4(),
        nama: nama,
        nominal: nominal,
        waktu: DateTime.now().toLocal().toString(),
        petugas: petugas,
        username: username,
      );

      final submitInputNominalUseCase = ref.read(
        submitInputNominalUseCaseProvider,
      );
      final response = await submitInputNominalUseCase(request);

      if (response.isSuccess) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? 'Submission failed',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void resetState() {
    state = const InputNominalState();
  }
}

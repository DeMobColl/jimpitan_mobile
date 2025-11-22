import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/input/input_nominal_model.dart';
import '../../domain/usecases/submit_input_nominal_usecase.dart';

// State classes
class InputNominalState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const InputNominalState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  InputNominalState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return InputNominalState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

// Input controller
class InputNominalController extends StateNotifier<InputNominalState> {
  final SubmitInputNominalUseCase submitInputNominalUseCase;

  InputNominalController({required this.submitInputNominalUseCase})
    : super(const InputNominalState());

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

// Provider
final inputNominalControllerProvider =
    StateNotifierProvider<InputNominalController, InputNominalState>((ref) {
      return InputNominalController(
        submitInputNominalUseCase: ref.watch(submitInputNominalUseCaseProvider),
      );
    });

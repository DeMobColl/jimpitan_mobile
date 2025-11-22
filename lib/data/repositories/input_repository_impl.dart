import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/input/input_nominal_model.dart';
import '../remote/input/input_remote_source.dart';
import '../../domain/repositories/input_repository.dart';

class InputRepositoryImpl implements InputRepository {
  final InputRemoteDataSource remoteDataSource;

  InputRepositoryImpl({required this.remoteDataSource});

  @override
  Future<InputNominalResponseModel> submitInputNominal(
    InputNominalRequestModel request,
  ) async {
    return await remoteDataSource.submitInputNominal(request);
  }
}

final inputRepositoryProvider = Provider<InputRepository>((ref) {
  return InputRepositoryImpl(
    remoteDataSource: ref.watch(inputRemoteDataSourceProvider),
  );
});

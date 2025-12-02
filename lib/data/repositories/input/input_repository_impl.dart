import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../remote/input/input_remote_source.dart';
import '../../../domain/repositories/input/input_repository.dart';
import '../../../domain/entities/input/input_nominal_request.dart';
import '../../../domain/entities/input/input_nominal_response.dart';
import '../../mappers/input/input_nominal_request_mapper.dart';
import '../../mappers/input/input_nominal_response_mapper.dart';

class InputRepositoryImpl implements InputRepository {
  final InputRemoteDataSource remoteDataSource;

  InputRepositoryImpl({required this.remoteDataSource});

  @override
  Future<InputNominalResponse> submitInputNominal(
    InputNominalRequest request,
  ) async {
    // Convert domain entity to data model
    final requestModel = InputNominalRequestMapper.toModel(request);

    // Call remote data source
    final responseModel = await remoteDataSource.submitInputNominal(
      requestModel,
    );

    // Convert data model back to domain entity
    return InputNominalResponseMapper.toEntity(responseModel);
  }
}

final inputRepositoryProvider = Provider<InputRepository>((ref) {
  return InputRepositoryImpl(
    remoteDataSource: ref.watch(inputRemoteDataSourceProvider),
  );
});

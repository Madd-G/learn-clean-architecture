import 'dart:io';
import 'package:dio/dio.dart';
import 'package:learn_clean_architecture/features/destinationList/data/models/destination.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/destination.dart';
import '../../domain/repository/destination_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/destination_api_service.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationApiService _destinationApiService;
  final AppDatabase _appDatabase;

  DestinationRepositoryImpl(this._destinationApiService, this._appDatabase);

  @override
  Future<DataState<List<DestinationModel>>> getDestination() async {
    try {
      final httpResponse = await _destinationApiService.getDestination();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<DestinationModel>> getSavedDestination() async {
    return _appDatabase.destinationDao.getDestination();
  }

  @override
  Future<void> removeDestination(DestinationEntity destinationEntity) {
    return _appDatabase.destinationDao
        .deleteDestination(DestinationModel.fromEntity(destinationEntity));
  }

  @override
  Future<void> saveDestination(DestinationEntity destinationEntity) {
    return _appDatabase.destinationDao
        .insertDestination(DestinationModel.fromEntity(destinationEntity));
  }
}

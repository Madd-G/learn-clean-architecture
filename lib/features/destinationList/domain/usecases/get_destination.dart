import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/destination.dart';
import '../repository/destination_repository.dart';

class GetDestinationUseCase
    implements UseCase<DataState<List<DestinationEntity>>, void> {
  final DestinationRepository _destinationRepository;

  GetDestinationUseCase(this._destinationRepository);

  @override
  Future<DataState<List<DestinationEntity>>> call({void params}) {
    return _destinationRepository.getDestination();
  }
}

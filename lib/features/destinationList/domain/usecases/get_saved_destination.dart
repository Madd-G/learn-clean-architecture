import 'package:learn_clean_architecture/features/destinationList/domain/repository/destination_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/destination.dart';

class GetSavedDestinationUseCase
    implements UseCase<List<DestinationEntity>, void> {
  final DestinationRepository _destinationRepository;

  GetSavedDestinationUseCase(this._destinationRepository);

  @override
  Future<List<DestinationEntity>> call({void params}) {
    return _destinationRepository.getSavedDestination();
  }
}

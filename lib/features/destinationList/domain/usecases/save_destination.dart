import 'package:learn_clean_architecture/features/destinationList/domain/repository/destination_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/destination.dart';

class SaveDestinationUseCase implements UseCase<void, DestinationEntity> {
  final DestinationRepository _destinationRepository;

  SaveDestinationUseCase(this._destinationRepository);

  @override
  Future<void> call({DestinationEntity? params}) {
    return _destinationRepository.saveDestination(params!);
  }
}

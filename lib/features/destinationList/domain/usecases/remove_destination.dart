import 'package:learn_clean_architecture/features/destinationList/domain/repository/destination_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/destination.dart';

class RemoveDestinationUseCase implements UseCase<void, DestinationEntity> {
  final DestinationRepository _destinationRepository;

  RemoveDestinationUseCase(this._destinationRepository);

  @override
  Future<void> call({DestinationEntity? params}) {
    return _destinationRepository.removeDestination(params!);
  }
}

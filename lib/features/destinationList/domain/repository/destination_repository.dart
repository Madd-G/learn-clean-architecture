import '../../../../core/resources/data_state.dart';
import '../entities/destination.dart';

abstract class DestinationRepository {
  // API methods
  Future<DataState<List<DestinationEntity>>> getDestination();

  // Database methods
  Future<List<DestinationEntity>> getSavedDestination();

  Future<void> saveDestination(DestinationEntity destinationEntity);

  Future<void> removeDestination(DestinationEntity destinationEntity);
}

import 'package:floor/floor.dart';
import '../../models/destination.dart';

@dao
abstract class DestinationDao {
  @Insert()
  Future<void> insertDestination(DestinationModel destinationModel);

  @delete
  Future<void> deleteDestination(DestinationModel destinationModel);

  @Query('SELECT * FROM destinations')
  Future<List<DestinationModel>> getDestination();
}

import 'package:equatable/equatable.dart';
import '../../../../domain/entities/destination.dart';

abstract class LocalDestinationEvent extends Equatable {
  final DestinationEntity? destination;

  const LocalDestinationEvent({this.destination});

  @override
  List<Object> get props => [destination!];
}

class GetSavedDestination extends LocalDestinationEvent {
  const GetSavedDestination();
}

class RemoveDestination extends LocalDestinationEvent {
  const RemoveDestination(DestinationEntity destinationEntity)
      : super(destination: destinationEntity);
}

class SaveDestination extends LocalDestinationEvent {
  const SaveDestination(DestinationEntity destinationEntity)
      : super(destination: destinationEntity);
}

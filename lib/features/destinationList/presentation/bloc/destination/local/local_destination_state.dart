import 'package:equatable/equatable.dart';
import '../../../../domain/entities/destination.dart';

abstract class LocalDestinationState extends Equatable {
  final List<DestinationEntity>? destinations;

  const LocalDestinationState({this.destinations});

  @override
  List<Object> get props => [destinations!];
}

class LocalDestinationLoading extends LocalDestinationState {
  const LocalDestinationLoading();
}

class LocalDestinationDone extends LocalDestinationState {
  const LocalDestinationDone(List<DestinationEntity> destinationEntities)
      : super(destinations: destinationEntities);
}

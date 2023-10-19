import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../domain/entities/destination.dart';

abstract class RemoteDestinationState extends Equatable {
  final List<DestinationEntity>? destinations;
  final DioError? error;

  const RemoteDestinationState({this.destinations, this.error});

  @override
  List<Object> get props => [destinations!, error!];
}

class RemoteDestinationLoading extends RemoteDestinationState {
  const RemoteDestinationLoading();
}

class RemoteDestinationDone extends RemoteDestinationState {
  const RemoteDestinationDone(List<DestinationEntity> destination)
      : super(destinations: destination);
}

class RemoteDestinationError extends RemoteDestinationState {
  const RemoteDestinationError(DioError error) : super(error: error);
}

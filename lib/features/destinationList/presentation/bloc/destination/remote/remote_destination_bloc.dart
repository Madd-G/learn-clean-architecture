import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/bloc/destination/remote/remote_destination_event.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/bloc/destination/remote/remote_destination_state.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_destination.dart';

class RemoteDestinationBloc
    extends Bloc<RemoteDestinationEvent, RemoteDestinationState> {
  final GetDestinationUseCase _getDestinationUseCase;

  RemoteDestinationBloc(this._getDestinationUseCase)
      : super(const RemoteDestinationLoading()) {
    on<GetDestination>(onGetDestination);
  }

  void onGetDestination(
      GetDestination event, Emitter<RemoteDestinationState> emit) async {
    final dataState = await _getDestinationUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteDestinationDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteDestinationError(dataState.error!));
    }
  }
}

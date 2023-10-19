import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/get_saved_destination.dart';
import '../../../../domain/usecases/remove_destination.dart';
import '../../../../domain/usecases/save_destination.dart';
import 'local_destination_event.dart';
import 'local_destination_state.dart';

class LocalDestinationBloc
    extends Bloc<LocalDestinationEvent, LocalDestinationState> {
  final GetSavedDestinationUseCase _getSavedDestinationUseCase;
  final SaveDestinationUseCase _saveDestinationUseCase;
  final RemoveDestinationUseCase _removeDestinationUseCase;

  LocalDestinationBloc(this._getSavedDestinationUseCase,
      this._saveDestinationUseCase, this._removeDestinationUseCase)
      : super(const LocalDestinationLoading()) {
    on<GetSavedDestination>(onGetSavedDestination);
    on<RemoveDestination>(onRemoveDestination);
    on<SaveDestination>(onSaveDestination);
  }

  void onGetSavedDestination(
      GetSavedDestination event, Emitter<LocalDestinationState> emit) async {
    final destinations = await _getSavedDestinationUseCase();
    emit(LocalDestinationDone(destinations));
  }

  void onRemoveDestination(RemoveDestination removeDestination,
      Emitter<LocalDestinationState> emit) async {
    await _removeDestinationUseCase(params: removeDestination.destination);
    final destinations = await _getSavedDestinationUseCase();
    emit(LocalDestinationDone(destinations));
  }

  void onSaveDestination(SaveDestination saveDestination,
      Emitter<LocalDestinationState> emit) async {
    await _saveDestinationUseCase(params: saveDestination.destination);
    final destinations = await _getSavedDestinationUseCase();
    emit(LocalDestinationDone(destinations));
  }
}

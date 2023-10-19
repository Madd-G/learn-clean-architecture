import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/destinationList/data/data_sources/local/app_database.dart';
import 'features/destinationList/data/data_sources/remote/destination_api_service.dart';
import 'features/destinationList/data/repository/destination_repository_impl.dart';
import 'features/destinationList/domain/repository/destination_repository.dart';
import 'features/destinationList/domain/usecases/get_destination.dart';
import 'features/destinationList/domain/usecases/get_saved_destination.dart';
import 'features/destinationList/domain/usecases/remove_destination.dart';
import 'features/destinationList/domain/usecases/save_destination.dart';
import 'features/destinationList/presentation/bloc/destination/local/local_destination_bloc.dart';
import 'features/destinationList/presentation/bloc/destination/remote/remote_destination_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<DestinationApiService>(DestinationApiService(sl()));

  sl.registerSingleton<DestinationRepository>(
      DestinationRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetDestinationUseCase>(GetDestinationUseCase(sl()));

  sl.registerSingleton<GetSavedDestinationUseCase>(
      GetSavedDestinationUseCase(sl()));

  sl.registerSingleton<SaveDestinationUseCase>(SaveDestinationUseCase(sl()));

  sl.registerSingleton<RemoveDestinationUseCase>(
      RemoveDestinationUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteDestinationBloc>(() => RemoteDestinationBloc(sl()));

  sl.registerFactory<LocalDestinationBloc>(
      () => LocalDestinationBloc(sl(), sl(), sl()));
}

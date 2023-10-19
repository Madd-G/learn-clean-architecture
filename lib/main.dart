import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/bloc/destination/remote/remote_destination_event.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/pages/home/destination_list_page.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/destinationList/presentation/bloc/destination/remote/remote_destination_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteDestinationBloc>(
      create: (context) => sl()..add(const GetDestination()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DestinationListPage()),
    );
  }
}

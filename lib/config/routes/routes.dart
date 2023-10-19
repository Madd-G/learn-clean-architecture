import 'package:flutter/material.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/pages/home/destination_list_page.dart';
import 'package:learn_clean_architecture/features/destinationList/presentation/pages/saved_destination/saved_destination.dart';
import '../../features/destinationList/domain/entities/destination.dart';
import '../../features/destinationList/presentation/pages/destination_detail/destination_detail_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DestinationListPage());

      case '/DestinationDetails':
        return _materialRoute(DestinationDetailsPage(
            destination: settings.arguments as DestinationEntity));

      case '/SavedDestination':
        return _materialRoute(const SavedDestination());

      default:
        return _materialRoute(const DestinationListPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

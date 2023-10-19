import 'package:floor/floor.dart';
import 'package:learn_clean_architecture/features/destinationList/data/data_sources/local/destination_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import '../../models/destination.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [DestinationModel])
abstract class AppDatabase extends FloorDatabase {
  DestinationDao get destinationDao;
}

import 'package:floor/floor.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/destination.dart';

@Entity(tableName: 'destinations', primaryKeys: ['id'])
class DestinationModel extends DestinationEntity {
  const DestinationModel({
    int? id,
    String? destinationName,
    String? description,
    String? image,
    String? location,
    String? address,
  }) : super(
          id: id,
          destinationName: destinationName,
          description: description,
          image: image,
          location: location,
          address: address,
        );

  factory DestinationModel.fromJson(Map<String, dynamic> map) {
    return DestinationModel(
      destinationName: map['name'] ?? "",
      description: map['description'] ?? "",
      image: map['image'] != null && map['image'] != ""
          ? map['image']
          : kDefaultImage,
      location: map['location'] ?? "",
      address: map['address'] ?? "",
    );
  }

  factory DestinationModel.fromEntity(DestinationEntity entity) {
    return DestinationModel(
      id: entity.id,
      destinationName: entity.destinationName,
      description: entity.description,
      image: entity.image,
      location: entity.location,
      address: entity.address,
    );
  }
}

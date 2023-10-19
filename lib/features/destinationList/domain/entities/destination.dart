// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DestinationEntity extends Equatable{
  final int? id;
  final String? destinationName;
  final String? description;
  final String? image;
  final String? location;
  final String? address;

  const DestinationEntity({
    this.id,
    this.destinationName,
    this.description,
    this.image,
    this.location,
    this.address,
  });

  @override
  List<Object?> get props => [id, destinationName, description, image, location, address];
}

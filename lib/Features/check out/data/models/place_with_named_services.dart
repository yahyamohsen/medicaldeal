import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';

class PlaceWithNamedServices extends Equatable {
  final PlaceModel placeModel;
  final List<ServiceModel> services;

  const PlaceWithNamedServices(this.placeModel, this.services);
  @override
  List<Object?> get props => [placeModel, services];
}

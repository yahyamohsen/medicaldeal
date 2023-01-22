import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';

class PlaceWithServices {
  final PlaceModel placeModel;
  List<int> servicesId;

  PlaceWithServices(this.placeModel, this.servicesId);
}

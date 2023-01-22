part of 'google_map_cubit.dart';

abstract class GoogleMapState {
  const GoogleMapState();
}

class GoogleMapInitial extends GoogleMapState {}

class GoogleMapLocationUpdated extends GoogleMapState {
  final LatLng latLng;
  final PlaceModel placeModel;

  const GoogleMapLocationUpdated(this.latLng, this.placeModel);
}

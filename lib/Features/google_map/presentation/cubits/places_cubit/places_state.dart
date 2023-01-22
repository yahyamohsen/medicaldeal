part of 'places_cubit.dart';

abstract class PlacesState extends Equatable {
  const PlacesState();

  @override
  List<Object> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesSuccess extends PlacesState {
  final List<PlaceWithNamedServices>? placesWithServices;
  final List<PlaceModel>? places;

  const PlacesSuccess({this.placesWithServices, this.places});
}

class PlacesFailure extends PlacesState {
  final String errMessage;

  const PlacesFailure(this.errMessage);
}

class PlacesNetworkFailure extends PlacesState {
  final String errMessage;

  const PlacesNetworkFailure(this.errMessage);
}

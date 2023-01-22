part of 'nearest_me_filter_cubit.dart';

abstract class NearestMeFilterState {
  const NearestMeFilterState();
}

class NearestMeFilterInitial extends NearestMeFilterState {}

class NearestMeFilterDataUpdated extends NearestMeFilterState {
  final Set<Marker> markers;

  NearestMeFilterDataUpdated(this.markers);
}

class NearestMeFilterPlaceUpdated extends NearestMeFilterState {
  final PlaceModel place;

  NearestMeFilterPlaceUpdated(this.place);
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/place_model.dart';

part 'nearest_me_filter_state.dart';

class NearestMeFilterCubit extends Cubit<NearestMeFilterState> {
  NearestMeFilterCubit() : super(NearestMeFilterInitial());

  Set<Marker>? markers = {};

  void updateMarkers(Set<Marker> data) {
    markers = {...data};
    emit(NearestMeFilterDataUpdated(
      markers!,
    ));
  }

  PlaceModel? placeModel;

  void updatePlace(PlaceModel place) {
    placeModel = place;
    emit(NearestMeFilterPlaceUpdated(place));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());

  void updateGoogleMapLocation(LatLng latLng, PlaceModel placeModel) {
    emit(
      GoogleMapLocationUpdated(latLng, placeModel),
    );
  }
}

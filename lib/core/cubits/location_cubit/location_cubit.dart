import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sart_up_project/core/models/permssion_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  getLocation() async {
    emit(LocationLoading());
    var isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (isServiceEnabled) {
      emit(LocationSuccess());
    } else {
      emit(
        const LocationFailure('Please Enbale Location Service'),
      );
    }
  }
}

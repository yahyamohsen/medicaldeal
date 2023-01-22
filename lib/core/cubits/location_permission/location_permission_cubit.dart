import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit() : super(LocationPermissionInitial());

  checkLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    switch (status) {
      case PermissionStatus.denied:
        emit(LocationPermissionDenied());
        break;
      case PermissionStatus.granted:
        emit(LocationPermissionGranted());
        break;
      case PermissionStatus.restricted:
        emit(LocationPermissionGranted());
        break;
      case PermissionStatus.limited:
        emit(LocationPermissionGranted());
        break;
      case PermissionStatus.permanentlyDenied:
        emit(LocationPermissionDeniedForEver());
        break;
    }
  }
}

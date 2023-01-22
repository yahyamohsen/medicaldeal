part of 'location_permission_cubit.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();

  @override
  List<Object> get props => [];
}

class LocationPermissionInitial extends LocationPermissionState {}

class LocationPermissionGranted extends LocationPermissionState {}

class LocationPermissionDeniedForEver extends LocationPermissionState {}

class LocationPermissionDenied extends LocationPermissionState {}

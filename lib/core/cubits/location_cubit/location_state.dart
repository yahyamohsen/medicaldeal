part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {}

class LocationFailure extends LocationState {
  final String errMessage;

  const LocationFailure(this.errMessage);
}

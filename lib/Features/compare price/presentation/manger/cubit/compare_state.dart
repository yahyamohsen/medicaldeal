part of 'compare_cubit.dart';

abstract class CompareState extends Equatable {
  const CompareState();

  @override
  List<Object> get props => [];
}

class CompareInitial extends CompareState {}

class CompareDataUpdated extends CompareState {
  final List<SelectedServiceModel> services;
  final PlaceWithNamedServices placeWithServices;
  const CompareDataUpdated(this.services, this.placeWithServices);

  @override
  List<Object> get props => [services];
}

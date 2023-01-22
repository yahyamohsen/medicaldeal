part of 'selected_services_cubit.dart';

abstract class SelectedServicesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectedServicesInitial extends SelectedServicesState {}

class SelectedServicesChange extends SelectedServicesState {
  final int numberOfSelectedServices;

  SelectedServicesChange(this.numberOfSelectedServices);

  @override
  List<Object?> get props => [numberOfSelectedServices];
}

class SelectedServiceCountChange extends SelectedServicesState {
  final int count;

  SelectedServiceCountChange(this.count);

  @override
  List<Object?> get props => [count];
}

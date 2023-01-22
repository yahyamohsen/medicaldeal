part of 'services_cubit.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  final List<ServiceModel>? services;
  final List<ServiceProviderModel>? serviceProviders;

  const ServicesSuccess({this.services, this.serviceProviders});
}

class ServicesFailure extends ServicesState {
  final String errMessage;

  const ServicesFailure(this.errMessage);
}

class ServicesNetWorkFailure extends ServicesState {}

part of 'service_provider_cubit.dart';

abstract class ServiceProviderState extends Equatable {
  const ServiceProviderState();

  @override
  List<Object> get props => [];
}

class ServiceProviderInitial extends ServiceProviderState {}

class ServiceProviderLoading extends ServiceProviderState {}

class ServiceProviderSuccess extends ServiceProviderState {
  final List<ServiceProviderModel> serviceProviders;

  const ServiceProviderSuccess(this.serviceProviders);
}

class ServiceProviderFailure extends ServiceProviderState {
  final String errMessage;

  const ServiceProviderFailure(this.errMessage);
}

class ServiceProviderNetworkFailure extends ServiceProviderState {
  final String errMessage;

  const ServiceProviderNetworkFailure(this.errMessage);
}

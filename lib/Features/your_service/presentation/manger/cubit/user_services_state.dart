part of 'user_services_cubit.dart';

abstract class UserServicesState {
  const UserServicesState();
}

class UserServicesInitial extends UserServicesState {}

class UserServicesLoading extends UserServicesState {}

class UserServicesSuccess extends UserServicesState {
  final List<UserServiceModel> userServices;

  const UserServicesSuccess(this.userServices);
}

class UserServicesFailure extends UserServicesState {
  final String errMessage;

  const UserServicesFailure(this.errMessage);
}

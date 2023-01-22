part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Success extends LoginState {}

class Failure extends LoginState {
  final String errMessage;

  const Failure(this.errMessage);
}

class NoInternetConnection extends LoginState {}

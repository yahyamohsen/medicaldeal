part of 'register_cubit_cubit.dart';

abstract class RegisterCubitState extends Equatable {
  const RegisterCubitState();

  @override
  List<Object> get props => [];
}

class RegisterCubitInitial extends RegisterCubitState {}

class Loading extends RegisterCubitState {}

class Success extends RegisterCubitState {}

class Failure extends RegisterCubitState {
  final String errMessage;

  const Failure(this.errMessage);
}

class NoInternetConnection extends RegisterCubitState {}

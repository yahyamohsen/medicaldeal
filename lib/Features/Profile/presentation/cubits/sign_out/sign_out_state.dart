part of 'sign_out_cubit.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

class SignOutInitial extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutFailure extends SignOutState {
  final String errMessage;

  const SignOutFailure(this.errMessage);
}

class SignOutSucess extends SignOutState {}

class SignOutNetworkFailure extends SignOutState {}

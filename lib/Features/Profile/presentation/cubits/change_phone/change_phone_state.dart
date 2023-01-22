part of 'change_phone_cubit.dart';

abstract class ChangePhoneState extends Equatable {
  const ChangePhoneState();

  @override
  List<Object> get props => [];
}

class ChangePhoneInitial extends ChangePhoneState {}

class ChangePhoneLoading extends ChangePhoneState {}

class ChangePhoneSuccess extends ChangePhoneState {}

class ChangePhoneFailure extends ChangePhoneState {
  final String errMessage;

  const ChangePhoneFailure(this.errMessage);
}

class ChangePhoneNetworkFailure extends ChangePhoneState {}

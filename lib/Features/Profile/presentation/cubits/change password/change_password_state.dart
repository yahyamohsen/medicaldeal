part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordFailure extends ChangePasswordState {
  final String errMessage;

  const ChangePasswordFailure(this.errMessage);
}

class ChangePasswordSuccess extends ChangePasswordState {}

class ChangePasswordNetWorkFailure extends ChangePasswordState {}

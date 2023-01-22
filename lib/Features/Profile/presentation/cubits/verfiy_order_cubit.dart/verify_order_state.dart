part of 'verify_order_cubit.dart';

abstract class VerifyOrderState extends Equatable {
  const VerifyOrderState();

  @override
  List<Object> get props => [];
}

class VerifyOrderInitial extends VerifyOrderState {}

class VerifyOrderLoading extends VerifyOrderState {}

class VerifyOrderSuccess extends VerifyOrderState {}

class VerifyOrderFailure extends VerifyOrderState {
  final String errMessgae;

  const VerifyOrderFailure(this.errMessgae);
}

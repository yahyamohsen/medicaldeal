part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutFailure extends CheckoutState {
  final String errMessage;

  const CheckoutFailure(this.errMessage);
}

class CheckoutNetworkFailure extends CheckoutState {
  final String errMessage;

  const CheckoutNetworkFailure(this.errMessage);
}

class CheckoutSuccess extends CheckoutState {}

part of 'validate_promo_code_cubit.dart';

abstract class ValidatePromoCodeState extends Equatable {
  const ValidatePromoCodeState();

  @override
  List<Object> get props => [];
}

class ValidatePromoCodeInitial extends ValidatePromoCodeState {}

class ValidatePromoCodeLoading extends ValidatePromoCodeState {}

class ValidatePromoCodeFailure extends ValidatePromoCodeState {
  final String errMessage;

  const ValidatePromoCodeFailure(this.errMessage);
}

class ValidatePromoCodeSuccess extends ValidatePromoCodeState {
  final PromoCodeModel promoCodeModel;

  const ValidatePromoCodeSuccess(this.promoCodeModel);
}

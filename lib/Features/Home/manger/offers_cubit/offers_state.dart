part of 'offers_cubit.dart';

abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersFailure extends OffersState {
  final String errMessage;

  const OffersFailure(this.errMessage);
}

class OffersSuccess extends OffersState {
  final List<OfferModel> offers;

  const OffersSuccess(this.offers);
}

part of 'add_pharmacy_order_cubit.dart';

abstract class AddPharmacyOrderState {
  const AddPharmacyOrderState();
}

class AddPharmacyOrderInitial extends AddPharmacyOrderState {}

class AddPharmacyOrderLoading extends AddPharmacyOrderState {}

class AddPharmacyOrderSuccess extends AddPharmacyOrderState {}

class AddPharmacyOrderFailure extends AddPharmacyOrderState {
  final String errMessage;

  AddPharmacyOrderFailure(this.errMessage);
}

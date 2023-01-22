part of 'contact_us_cubit.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {}

class ContactUsFailure extends ContactUsState {
  final String errMessage;

  const ContactUsFailure(this.errMessage);
}

class ContactUsNetworkFailure extends ContactUsState {}

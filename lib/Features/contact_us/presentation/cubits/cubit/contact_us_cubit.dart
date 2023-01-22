import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/contact_us/repositries/contact_us_repo.dart';

import '../../../../../core/Error/failures.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());

  final ContactUsRepo contactUsRepo;

  sendFeedBack(
      {required String title, required String description, File? image}) async {
    emit(ContactUsLoading());

    var result = await contactUsRepo.sendFeedBack(
        title: title, description: description, image: image);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ContactUsNetworkFailure());
      } else {
        emit(ContactUsFailure(failure.errMessage));
      }
    }, (r) {
      emit(ContactUsSuccess());
    });
  }
}

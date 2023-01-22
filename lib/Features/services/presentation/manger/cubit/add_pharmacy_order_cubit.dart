import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/Error/failures.dart';
import '../../../respositiries/services_repo.dart';

part 'add_pharmacy_order_state.dart';

class AddPharmacyOrderCubit extends Cubit<AddPharmacyOrderState> {
  AddPharmacyOrderCubit(this.servicesRepo) : super(AddPharmacyOrderInitial());

  final ServicesRepo servicesRepo;

  File? image;
  addPharmacyOrder() async {
    if (image != null) {
      emit(AddPharmacyOrderLoading());

      var result = await servicesRepo.addPharmacyOrder(image: image!);

      result.fold((failure) {
        if (failure is NetWorkFailure) {
          emit(AddPharmacyOrderFailure(failure.errMessage));
        } else {
          emit(AddPharmacyOrderFailure(failure.errMessage));
        }
      }, (r) {
        emit(AddPharmacyOrderSuccess());
      });
    } else {
      emit(AddPharmacyOrderFailure('Please add an image first'));
    }
  }
}

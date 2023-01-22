import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/Profile/repositories/profile_repo.dart';

import '../../../../../core/Error/failures.dart';

part 'change_phone_state.dart';

class ChangePhoneCubit extends Cubit<ChangePhoneState> {
  ChangePhoneCubit(this.profileRepo) : super(ChangePhoneInitial());

  late String currentPhone, newPhone;
  late final GlobalKey<FormState> formKey = GlobalKey();
  final ProfileRepo profileRepo;
  void changePhone() async {
    emit(ChangePhoneLoading());

    var result = await profileRepo.changePhoneNumber(
      currentPhone: currentPhone,
      newPhone: newPhone,
    );
    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ChangePhoneNetworkFailure());
      } else {
        emit(ChangePhoneFailure(failure.errMessage));
      }
    }, (r) {
      emit(ChangePhoneSuccess());
    });
  }
}

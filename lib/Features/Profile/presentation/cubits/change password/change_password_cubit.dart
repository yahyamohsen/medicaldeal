import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/Profile/repositories/profile_repo.dart';
import 'package:sart_up_project/core/Error/failures.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());

  final ProfileRepo profileRepo;
  final formKey = GlobalKey<FormState>();
  late String currentPassword, newPassword;
  void changePassword() async {
    emit(ChangePasswordLoading());

    var result = await profileRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(ChangePasswordNetWorkFailure());
      } else {
        emit(ChangePasswordFailure(failure.errMessage));
      }
    }, (r) {
      emit(ChangePasswordSuccess());
    });
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

import '../../../repositories/profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  String? name, email, phoneNumber;
  XFile? image;
  final ProfileRepo profileRepo;

  // TODO : Fix hardcoded String
  void editProfile() async {
    emit(EditProfileLoading());
    var userModel = UserModel.fromJson(Prefs.getObject(kUserModel));
    var result = await profileRepo.editProfile(
      email: email ?? (userModel.email ?? ''),
      image: image != null ? File(image!.path) : null,
      name: (name == null || (name?.isEmpty ?? true)) ? userModel.name! : name!,
      phone: userModel.phone!,
    );
    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(EditProfileNetWorkFailure());
      } else {
        emit(EditProfileFailure(failure.errMessage));
      }
    }, (r) {
      emit(EditProfileSuccess());
    });
  }
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, void>> editProfile({
    required String phone,
    required String name,
    required String? email,
    File? image,
  });

  Future<Either<Failure, void>> verfyOrder(
      {required String orderId, required String userId});
  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> changePhoneNumber(
      {required String currentPhone, required String newPhone});
}

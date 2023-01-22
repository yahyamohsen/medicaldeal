import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/Auth/models/token_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class IAuthRepo {
  Future<Either<Failure, void>> registerUser(
      {required String userName,
      required String phone,
      required String password});

  Future<Either<Failure, TokenModel>> loginUser(
      {required String password, required String phone});
}

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/Auth/models/token_model.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/Auth/repositories/auth_repo_interface.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/exceptions.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/api.dart';

class AuthRepoImpl implements IAuthRepo {
  final Api api;

  AuthRepoImpl(this.api);
  @override
  Future<Either<Failure, TokenModel>> loginUser(
      {required String password, required String phone}) async {
    try {
      Response response = await api.post(
        endPoint: 'auth/login',
        body: {
          'password': password,
          'phone': phone,
          'token':
              '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
        },
      );

      Prefs.saveObject(
        kUserModel,
        response.data['user'],
      );
      var tokenModle = TokenModel.fromJson(response.data);
      Prefs.saveObject(
        kUserModel,
        response.data['user'],
      );
      Prefs.prefs.setString(kToken, tokenModle.token);
      return right(tokenModle);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return left(
            ServerFailure.fromJson(e.response!.data),
          );
        }
        return left(
          ServerFailure(e.message),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, void>> registerUser({
    required String userName,
    required String phone,
    required String password,
  }) async {
    try {
      var response = await api.post(
        endPoint: 'auth/register',
        body: {
          'password': password,
          'phone': phone,
          // 'email': email,
          'name': userName,
          'token':
              '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
        },
      );
      Prefs.saveObject(
        kUserModel,
        response.data['user'],
      );

      var tokenModle = TokenModel.fromJson(response.data);

      Prefs.prefs.setString(kToken, tokenModle.token);
      return right(null);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return left(
            ServerFailure.fromJson(e.response!.data),
          );
        }
        return left(
          ServerFailure(e.message),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/Profile/repositories/profile_repo.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/exceptions.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

import '../../../core/utils/api.dart';
import '../../Auth/models/token_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final Api api;

  ProfileRepoImpl(this.api);
  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      var userModel =
          UserModel.fromJson(jsonDecode(Prefs.prefs.getString(kUserModel)!));
      await api.post(
        endPoint: 'changepassword',
        bearerToken: Prefs.prefs.getString(kToken),
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'phone': userModel.phone,
          'token':
              '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
        },
      );

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

  @override
  Future<Either<Failure, void>> editProfile(
      {required String phone,
      required String name,
      required String? email,
      File? image}) async {
    var user = UserModel.fromJson(Prefs.getObject(kUserModel));

    try {
      var userToken = Prefs.prefs.getString(kToken);
      if (image != null) {
        String imageUrl =
            await api.uploadServiceImage(image, userToken!, phone);
        user.photo = imageUrl;
        Prefs.saveObject(
          kUserModel,
          user.toJson(),
        );
      }
      var currentName = user.name;
      var currentEmail = user.email;
      if (currentName != name || currentEmail != email) {
        var response = await api.post(
          endPoint: 'editprofile',
          bearerToken: userToken,
          body: {
            'phone': phone,
            'name': name,
            'email': email,
            'token':
                '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
          },
        );

        Prefs.saveObject(
          kUserModel,
          response.data['user'],
        );
      }
      return right(null);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          debugPrint(e.response.toString());
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
  Future<Either<Failure, void>> signOut() async {
    try {
      var userToken = Prefs.prefs.getString(kToken);

      await api.post(
        endPoint: 'auth/signout',
        bearerToken: userToken,
      );

      return right(null);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          debugPrint(e.response.toString());
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
  Future<Either<Failure, void>> changePhoneNumber(
      {required String currentPhone, required String newPhone}) async {
    try {
      var userToken = Prefs.prefs.getString(kToken);

      await api.post(
        endPoint: 'changephone',
        bearerToken: userToken,
        body: {
          'phone': currentPhone,
          'new_phone': newPhone,
        },
      );

      return right(null);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          debugPrint(e.response.toString());
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
  Future<Either<Failure, void>> verfyOrder(
      {required String orderId, required String userId}) async {
    try {
      var userToken = Prefs.prefs.getString(kToken);
      var user = UserModel.fromJson(Prefs.getObject(kUserModel));

      await api.post(
        endPoint: 'verifyorder',
        bearerToken: userToken,
        body: {
          'user_id': userId,
          'order_id': orderId,
        },
      );

      return right(null);
    } on NetWorkException {
      return left(
        NetWorkFailure('NetWorkFailure'),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          debugPrint(e.response.toString());
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

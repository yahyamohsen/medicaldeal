import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:http_parser/http_parser.dart';

import 'package:sart_up_project/Features/contact_us/repositries/contact_us_repo.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../core/Error/exceptions.dart';

class ContactUsRepoImpl extends ContactUsRepo {
  final Api api;

  ContactUsRepoImpl(this.api);
  @override
  Future<Either<Failure, void>> sendFeedBack(
      {required String title, required String description, File? image}) async {
    FormData? form;
    try {
      if (image != null) {
        var fileName = image.path.split('/').last;
        form = FormData.fromMap({
          'attachment': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
            contentType: MediaType('image', 'png'),
          ),
          'token':
              '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
          'message': description,
          'title': title,
          'user_id': UserModel.fromJson(Prefs.getObject(kUserModel)).id,
        });
      }
      await api.post(
          endPoint: 'addContacts',
          body: form ??
              {
                'message': description,
                'title': title,
                'user_id': UserModel.fromJson(Prefs.getObject(kUserModel)).id,
                'token':
                    '?4dSEewI}6E)}c0];D9Ngzg^L*;4Ue}4De)A3((ms&G9fL-0r@g*7I[)YK+4!X2UP',
              },
          bearerToken: Prefs.prefs.getString(
            kToken,
          ));

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

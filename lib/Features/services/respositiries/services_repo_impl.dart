import 'dart:io';

import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/services/respositiries/services_repo.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../constants.dart';
import '../../../core/Error/exceptions.dart';
import '../../../core/singleton/shared_prefrence_singleton.dart';
import '../../Auth/models/user_model.dart';

class ServicesRepoImpl extends ServicesRepo {
  final Api api;

  ServicesRepoImpl(this.api);
  @override
  Future<Either<Failure, List<ServiceModel>>> fetchServices(
      {required String id}) async {
    try {
      Response response = await api.get(
        endPoint: 'getserviceslist?service_type_id=$id',
      );

      List<ServiceModel> services = [];

      for (var item in response.data) {
        services.add(ServiceModel.fromJson(item));
      }

      return right(services);
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
  Future<Either<Failure, List<ServiceProviderModel>>> fetchServiceByTypId(
      {required String id}) async {
    try {
      Response response = await api.get(
        endPoint: 'getServiceProviderbyTypeID?type_id=$id',
      );

      List<ServiceProviderModel> services = [];

      for (var item in response.data) {
        services.add(ServiceProviderModel.fromJson(item));
      }

      return right(services);
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
  Future<Either<Failure, List<ServiceModel>>> fetchMedicenesList() async {
    try {
      Response response = await api.get(
        endPoint: 'getMedicineList',
      );

      List<ServiceModel> services = [];

      for (var item in response.data) {
        services.add(ServiceModel.fromJson(item));
      }

      return right(services);
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
  Future<Either<Failure, void>> addPharmacyOrder({required File image}) async {
    try {
      var fileName = image.path.split('/').last;

      FormData form = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
          contentType: MediaType('image', 'png'),
        ),
        'user_id': UserModel.fromJson(Prefs.getObject(kUserModel)).id,
      });
      await api.post(
        bearerToken: Prefs.prefs.getString(kToken),
        endPoint: 'addMedicineOrderPhoto',
        body: form,
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
}

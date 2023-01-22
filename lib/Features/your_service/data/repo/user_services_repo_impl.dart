import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/your_service/data/models/order_details_model.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';

import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';

import 'package:dartz/dartz.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../core/Error/exceptions.dart';
import '../../../Home/date/models/offer_model.dart';
import 'user_services_repo.dart';

class UserServicesRepoImpl implements UserServicesRepo {
  final Api api;

  UserServicesRepoImpl(this.api);
  @override
  Future<Either<Failure, List<UserServiceModel>>> fetchUserServices(
      {required String userId}) async {
    try {
      Response response = await api.post(
        endPoint: 'getUserOrders',
        bearerToken: Prefs.prefs.getString(kToken),
        body:
            // {
            //   "user_id": int.parse(
            //     userId,
            //   ),
            // },
            {
          "user_id": userId,
        },
      );

      List<UserServiceModel> userServices = [];

      for (var item in response.data['data']) {
        userServices.add(UserServiceModel.fromJson(item));
      }

      return right(userServices);
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
  Future<Either<Failure, void>> deleteService(
      {required String userId, required String orderId}) async {
    try {
      Response response = await api.post(
        endPoint: 'cancelOrder',
        bearerToken: Prefs.prefs.getString(kToken),
        body: {
          "user_id": userId,
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
  Future<Either<Failure, List<OrderDetailsModel>>> fetchOrderDetails(
      {required String userId, required String orderId}) async {
    try {
      Response response = await api.post(
        endPoint: 'getOrderDetails',
        bearerToken: Prefs.prefs.getString(kToken),
        body: {
          "order_id": orderId,
          "user_id": userId,
        },
      );

      List<OrderDetailsModel> userServices = [];

      for (var item in response.data['data']) {
        userServices.add(OrderDetailsModel.fromJson(item));
      }

      return right(userServices);
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

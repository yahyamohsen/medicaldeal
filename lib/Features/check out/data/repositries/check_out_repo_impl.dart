import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/check%20out/data/models/check_out_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/check%20out/data/models/promo_code_model.dart';
import 'package:sart_up_project/Features/check%20out/data/repositries/check_out_repo.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../core/Error/exceptions.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final Api api;

  CheckoutRepoImpl(this.api);
  @override
  Future<Either<Failure, void>> addOrder(OrderModel checkoutModel) async {
    var body = {
      "user_id": UserModel.fromJson(Prefs.getObject(kUserModel)).id,
      "service_provider_id": checkoutModel.serviceProviderId,
      "services": checkoutModel.services,
      "amount": checkoutModel.amount,
      "total": checkoutModel.total
    };
    if (checkoutModel.promoCodeId != null) {
      body['promocode_id'] = checkoutModel.promoCodeId!;
    }
    try {
      Response response = await api.post(
        endPoint: 'addOrder',
        body: body,
        bearerToken: Prefs.prefs.getString(kToken),
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
  Future<Either<Failure, PromoCodeModel>> validatePromoCode(
      String promoCode) async {
    try {
      Response response = await api.post(
        endPoint: 'validatepromocode',
        body: {
          "user_id": UserModel.fromJson(Prefs.getObject(kUserModel)).id,
          'couponcode': promoCode,
        },
        bearerToken: Prefs.prefs.getString(kToken),
      );

      return right(
        PromoCodeModel.fromJson(
          response.data['message'],
        ),
      );
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

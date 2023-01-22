import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/Home/date/models/offer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/Home/date/repo/home_repo.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../core/Error/exceptions.dart';

class HomeRepoImpl implements HomeRepo {
  final Api api;

  HomeRepoImpl(this.api);
  @override
  Future<Either<Failure, List<OfferModel>>> fetchOffers() async {
    try {
      Response response = await api.get(
        endPoint: 'getoffers',
      );

      List<OfferModel> offers = [];

      for (var item in response.data['message']) {
        offers.add(OfferModel.fromJson(item));
      }

      return right(offers);
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

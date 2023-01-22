import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/repositries/service_provider_repo.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

import '../../../core/Error/exceptions.dart';
import '../../../core/utils/api.dart';

class ServiceProviderRepoImpl implements ServiceProviderRepo {
  final Api api;

  const ServiceProviderRepoImpl(this.api);
  @override
  Future<Either<Failure, List<BranchModel>>> getBranches({
    required int id,
  }) async {
    try {
      Response response = await api.get(
        endPoint: 'getbranches?service_provider_id=$id',
      );

      List<BranchModel> branches = [];

      for (var item in response.data) {
        branches.add(BranchModel.fromJson(item));
      }
      print(branches);
      return right(branches);
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
  Future<Either<Failure, List<ServiceProviderModel>>>
      getServiceProviders() async {
    try {
      Response response = await api.get(
        endPoint: 'getServiceProviderList',
      );

      List<ServiceProviderModel> serviceProviders = [];

      for (var item in response.data) {
        serviceProviders.add(ServiceProviderModel.fromJson(item));
      }

      return right(serviceProviders);
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
  Future<Either<Failure, List<ReviewModel>>> getReviews(
      {required String id}) async {
    try {
      Response response = await api.get(
        endPoint: 'getserviceproviderreviews?service_provider_id=$id',
      );

      List<ReviewModel> reviews = [];

      for (var item in response.data) {
        reviews.add(ReviewModel.fromJson(item));
      }

      return right(reviews);
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
  Future<Either<Failure, void>> addReview(
      {required ReviewModel reviewModel}) async {
    try {
      Response response = await api.post(
          endPoint: 'addReview',
          body: {
            'user_id': reviewModel.userId,
            'service_provider_id': reviewModel.serviceProviderId,
            'review_title': 'review titile',
            'review_comment': reviewModel.reviewComment,
            'rate': reviewModel.rate,
          },
          bearerToken: Prefs.prefs.getString(kToken));

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

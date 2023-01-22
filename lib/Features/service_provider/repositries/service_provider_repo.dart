import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class ServiceProviderRepo {
  Future<Either<Failure, List<BranchModel>>> getBranches({required int id});
  Future<Either<Failure, List<ServiceProviderModel>>> getServiceProviders();
  Future<Either<Failure, List<ReviewModel>>> getReviews({required String id});
  Future<Either<Failure, void>> addReview({required ReviewModel reviewModel});
}

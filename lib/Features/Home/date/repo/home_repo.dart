import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/Home/date/models/offer_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<OfferModel>>> fetchOffers();
}

import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/check%20out/data/models/check_out_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

import '../models/promo_code_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addOrder(OrderModel orderModel);
  Future<Either<Failure, PromoCodeModel>> validatePromoCode(String promoCode);
}

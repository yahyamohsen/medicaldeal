import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/your_service/data/models/order_details_model.dart';
import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class UserServicesRepo {
  Future<Either<Failure, List<UserServiceModel>>> fetchUserServices(
      {required String userId});
  Future<Either<Failure, List<OrderDetailsModel>>> fetchOrderDetails(
      {required String userId, required String orderId});
  Future<Either<Failure, void>> deleteService(
      {required String userId, required String orderId});
}

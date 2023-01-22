import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:sart_up_project/core/Error/failures.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications();
  Future<Either<Failure, void>> deleteNotification(
      {required String notificationId});
  Future<Either<Failure, void>> deleteAllNotifications();

  Future<Either<Failure, void>> markAllNotification();
}

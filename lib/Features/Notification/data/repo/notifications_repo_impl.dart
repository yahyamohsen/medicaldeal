import 'package:dio/dio.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sart_up_project/Features/Notification/data/repo/notification_repo.dart';
import 'package:sart_up_project/core/Error/failures.dart';
import 'package:sart_up_project/core/utils/api.dart';

import '../../../../constants.dart';
import '../../../../core/Error/exceptions.dart';
import '../../../../core/singleton/shared_prefrence_singleton.dart';

class NotificationRepoImpl implements NotificationRepo {
  final Api api;

  NotificationRepoImpl(this.api);

  @override
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications() async {
    try {
      var user = UserModel.fromJson(Prefs.getObject(kUserModel));
      var response = await api.post(
        endPoint: 'getUserNotifications',
        bearerToken: Prefs.prefs.getString(kToken),
        body: {
          "user_id": user.id,
        },
      );

      List<NotificationModel> notifications = [];

      for (var item in response.data) {
        notifications.add(NotificationModel.fromJson(item));
      }

      return right(notifications);
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
  Future<Either<Failure, void>> markAllNotification() {
    // TODO: implement markAllNotification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteAllNotifications() {
    // TODO: implement deleteAllNotifications
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteNotification(
      {required String notificationId}) async {
    try {
      var user = UserModel.fromJson(Prefs.getObject(kUserModel));
      var response = await api.post(
        endPoint: 'removeUserNotification',
        bearerToken: Prefs.prefs.getString(kToken),
        body: {
          "user_id": user.id,
          "notification_id": notificationId,
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
}

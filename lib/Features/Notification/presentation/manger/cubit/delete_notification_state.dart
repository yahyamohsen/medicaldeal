part of 'delete_notification_cubit.dart';

abstract class DeleteNotificationState {
  const DeleteNotificationState();
}

class DeleteNotificationInitial extends DeleteNotificationState {}

class DeleteNotificationSuccess extends DeleteNotificationState {}

class DeleteNotificationFailure extends DeleteNotificationState {
  final String errMessage;

  const DeleteNotificationFailure(this.errMessage);
}

part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificatiLodaing extends NotificationState {}

class NotificationFailure extends NotificationState {
  final String errMessage;

  const NotificationFailure(this.errMessage);
}

class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;

  const NotificationSuccess(this.notifications);
}

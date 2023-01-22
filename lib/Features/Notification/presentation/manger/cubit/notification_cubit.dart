import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:sart_up_project/Features/Notification/data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationsRepo) : super(NotificationInitial());

  final NotificationRepo notificationsRepo;
  fetchNotifications() async {
    emit(NotificatiLodaing());

    var result = await notificationsRepo.fetchNotifications();

    result.fold((failure) {
      emit(
        NotificationFailure(failure.errMessage),
      );
    }, (r) {
      emit(NotificationSuccess(r));
    });
  }
}

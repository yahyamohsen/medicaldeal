import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/notification_repo.dart';

part 'delete_notification_state.dart';

class DeleteNotificationCubit extends Cubit<DeleteNotificationState> {
  DeleteNotificationCubit(this.notificationsRepo)
      : super(DeleteNotificationInitial());

  final NotificationRepo notificationsRepo;
  deleteNotification({required String id}) async {
    var result = await notificationsRepo.deleteNotification(
      notificationId: id,
    );

    result.fold((failure) {
      emit(
        DeleteNotificationFailure(failure.errMessage),
      );
    }, (r) {
      emit(DeleteNotificationSuccess());
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:sart_up_project/Features/Notification/presentation/manger/cubit/delete_notification_cubit.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import 'custom_notification_item.dart';
import 'doctors_offers_widget.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({Key? key, required this.notifications})
      : super(key: key);

  final List<NotificationModel> notifications;

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  late List<NotificationModel> notifications;
  final GlobalKey<AnimatedListState> key = GlobalKey();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    notifications = [...widget.notifications];
    super.initState();
  }

  NotificationModel? currentDeletedNotificaion;
  int? deletedNotificationIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteNotificationCubit, DeleteNotificationState>(
      listener: (context, state) {
        if (state is DeleteNotificationSuccess) {
          sucessBar(context,
              message: S.current.notification_deleted_successfullty);
        }
        if (state is DeleteNotificationFailure) {
          errorBar(context, message: state.errMessage);
          insertItem();
        }
      },
      builder: (context, state) {
        return AnimatedList(
            key: key,
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            initialItemCount: notifications.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CustomNotificationItem(
                    onDelete: () {
                      BlocProvider.of<DeleteNotificationCubit>(context)
                          .deleteNotification(
                        id: notifications[index].id!,
                      );
                      deleteItem(index);
                    },
                    notificationModel: widget.notifications[index],
                  ),
                ),
              );
            });
      },
    );
  }

  void deleteItem(int index) {
    currentDeletedNotificaion = notifications[index];
    deletedNotificationIndex = index;
    notifications.removeAt(deletedNotificationIndex!);

    key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CustomNotificationItem(
            notificationModel: currentDeletedNotificaion!,
          ),
        ),
      );
    });
  }

  // instering the deleted item incase we failed to delete it from the api
  void insertItem() {
    notifications.insert(deletedNotificationIndex!, currentDeletedNotificaion!);
    key.currentState!.insertItem(deletedNotificationIndex!);
  }
}

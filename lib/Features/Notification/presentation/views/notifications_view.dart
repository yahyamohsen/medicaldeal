import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Notification/presentation/manger/cubit/notification_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        padding: 0,
        title: S.of(context).notificaitons,
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationSuccess) {
              return NotificationsViewBody(
                notifications: state.notifications,
              );
            } else if (state is NotificationFailure) {
              return CustomErrorWidget(text: state.errMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}

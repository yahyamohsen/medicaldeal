import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/views/login_view.dart';
import 'package:sart_up_project/Features/Notification/presentation/manger/cubit/notification_cubit.dart';
import 'package:sart_up_project/Features/Notification/presentation/views/notifications_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_view_header.dart';

import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../core/singleton/shared_prefrence_singleton.dart';
import '../../../../core/utils/functions/check_if_user_logged_in.dart';
import '../../../../styles.dart';
import '../../../Auth/models/user_model.dart';
import '../../../Profile/presentation/views/profile_details_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;

    return Padding(
      padding: EdgeInsets.only(top: height + 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () {
                    if (isUserLoggedIn(context)) {
                      Get.to(() => const ProfileDetailsView());
                    } else {
                      Get.to(() => const LoginView());
                    }
                  },
                  child: CustomProfileImage(
                    height: SizeConfig.defaultSize * 4.2,
                    width: SizeConfig.defaultSize * 4.2,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Prefs.prefs.containsKey(kToken)
                  ? Text(
                      '${getUserName()} !',
                      style: Styles.bodyText4.copyWith(
                        fontSize: 24,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Container(
            height: SizeConfig.defaultSize * 4.2,
            width: SizeConfig.defaultSize * 4.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.notifications,
                    size: 24, color: kPrimaryColor),
                onPressed: () {
                  BlocProvider.of<NotificationCubit>(context)
                      .fetchNotifications();
                  Get.to(() => const NotificationsView());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? getUserName() {
    return UserModel.fromJson(Prefs.getObject(kUserModel)).name;
  }
}

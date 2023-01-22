import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Home/presentaion/widget/offer_details_view._body.dart';
import 'package:sart_up_project/Features/Notification/presentation/widgets/notifications_details_view_body.dart';
import 'package:sart_up_project/Features/Notification/presentation/widgets/notifications_view_body.dart';

class NotificationsDetails extends StatelessWidget {
  const NotificationsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationsDetailsViewBody(
          notificationsModel: Get.arguments,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_view_body.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../Profile/presentation/widgets/custom_appbar_profile_details.dart';
import '../../../services/presentation/widgets/app_bar_left_curve_painter.dart';
import '../../../services/presentation/widgets/app_bar_right_curve_painater.dart';

class ServiceProviderView extends StatelessWidget {
  const ServiceProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
          title: S.of(context).service_privder,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          child: const ServiceProviderViewBody()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../widgets/selected_services_view_body.dart';

class SelectedServicesView extends StatelessWidget {
  const SelectedServicesView({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        backButtonAction: () {
          Get.back();
        },
        title: S.of(context).selected_services,
        child: SelectedServicesViewBody(
          title: title,
        ),
      ),
    );
  }
}

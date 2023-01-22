import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/app_bar_right_curve_painater.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../styles.dart';
import '../../../splash_view/presentaion/widgets/custom_top_curves.dart';

class CustomServicesAppBar extends StatelessWidget {
  const CustomServicesAppBar({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              Spacer(),
              Text(
                title ?? Get.arguments ?? S.of(context).lap_list,
                style: Styles.bodyText3.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              Spacer(),

              // im using it to help center the title
              Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

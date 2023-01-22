import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../core/widgets/custom_general_button.dart';
import 'choose_your_lap_list.dart';

class ChooseYourLapViewBody extends StatelessWidget {
  const ChooseYourLapViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceBox(
          height: 4,
        ),
        Text(
          S.of(context).choose_your_lap,
          style: Styles.bodyText2.copyWith(
            color: kBLACK,
          ),
        ),
        const SpaceBox(
          height: 1,
        ),
        const Expanded(
          child: ChooseYourLapList(),
        ),
        CustomButton(
          onTap: () {
            Get.to(
              () => const CheckoutView(),
              transition: Transition.fade,
              duration: kDurationTransion,
            );
          },
          text: 'Confirm',
          gradient: kLinearGradient,
          backGroundColor: kSecondaryColor,
        ),
        const SpaceBox(
          height: 2,
        ),
      ],
    );
  }
}

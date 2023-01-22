import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_view.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/manger/cubit/compare_cubit.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/views/choose_your_lap_view.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'compare_price_list.dart';
import 'custom_compare_price_taps.dart';

class ComparePriceViewBody extends StatelessWidget {
  const ComparePriceViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBox(height: 1.5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [kShadow],
          ),
          child: const ComparePriceTaps(
            selectedIndex: 0,
          ),
        ),
        const SpaceBox(
          height: 1.5,
        ),
        Text(
          S.of(context).your_services,
          style: Styles.bodyText2.copyWith(
            color: kBLACK,
          ),
        ),
        const SpaceBox(
          height: 1.5,
        ),
        const Expanded(child: ComparePriceList()),
        const SpaceBox(
          height: 2,
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

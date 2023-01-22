import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/select_language/presentation/views/select_language_view.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_bar_code_view.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/promo_code_with_bar_code.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import 'check_out_items.dart';
import 'check_out_view_body.dart';
import 'promo_code.dart';
import 'pyment_card.dart';
import 'total_and_discount.dart';

class CheckOutBarCodeViewBody extends StatelessWidget {
  const CheckOutBarCodeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SpaceBox(
            height: 2,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // const Flexible(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              //     child: CheckOutItems(),
              //   ),
              // ),
              PaymentCard(),
              PromoCodeWithBarCode(),
              SpaceBox(
                height: 2,
              ),
              // TotallAndDiscount(),
              SpaceBox(
                height: 2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              onTap: () {
                Get.to(() => SelectLanguageView(), transition: Transition.fade);
              },
              text: 'Confirm',
              gradient: kLinearGradient,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/total_and_discount.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'check_out_view_body.dart';
import 'custom_check_out_card.dart';

class PromoCodeWithBarCode extends StatelessWidget {
  const PromoCodeWithBarCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomCheckoutCard(
          child: Center(
            child: Icon(
              Icons.qr_code_2,
              size: SizeConfig.defaultSize * 25,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';

import '../widgets/check_out_view_body.dart';
import '../widgets/checkout_bar_code_view_body.dart';

class CheckoutBarCodeView extends StatelessWidget {
  const CheckoutBarCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        padding: 0,
        title: 'Check out',
        child: CheckOutBarCodeViewBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/widgets/compare_price_view_body.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';

class ComparePriceView extends StatelessWidget {
  const ComparePriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        title: S.of(context).compar_price,
        child: const ComparePriceViewBody(),
      ),
    );
  }
}

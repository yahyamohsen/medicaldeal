import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_view.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../widgets/custom_credit_card.dart';

class ProfilePaymentMethodView extends StatelessWidget {
  const ProfilePaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
          title: S.of(context).payment_method,
          end: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
            ),
          ),
          child: const ProfilePaymentViewBody()),
    );
  }
}

class ProfilePaymentViewBody extends StatelessWidget {
  const ProfilePaymentViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCreditCard();
  }
}

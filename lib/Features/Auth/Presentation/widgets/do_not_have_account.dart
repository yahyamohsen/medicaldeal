import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';
import '../views/sign_up_view.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).do_not_have_account,
          style: Styles.bodyText2.copyWith(
              color: Colors.grey, fontSize: SizeConfig.defaultSize * 1.4),
        ),
        TextButton(
            onPressed: () {
              Get.to(
                () => const SignUpView(),
                transition: Transition.fade,
              );
            },
            child: Text(
              S.of(context).sign_up,
              style: Styles.bodyText2.copyWith(
                  color: kSecondaryColor,
                  fontSize: SizeConfig.defaultSize * 1.4),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sart_up_project/Features/Auth/Presentation/widgets/signup_form.dart';

import '../../../../constants.dart';
import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/build_auth_header.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import 'already_have_account.dart';
import 'login_icon_buttons.dart';
import 'login_text_field.dart';
import 'other_sign.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthHeader(
          imageSize: SizeConfig.defaultSize * 13,
        ),
        Transform.translate(
          offset: const Offset(0, -16),
          child: Container(
            decoration: BoxDecoration(
              color: kWHITE,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceBox(height: SizeConfig.screenHeight * 0.003),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      S.of(context).create_your_account,
                      style: Styles.bodyText2
                          .copyWith(color: kBLACK, fontSize: 18),
                    ),
                  ),
                  const SpaceBox(height: 2),
                  const LoginIconButtons(),
                  SpaceBox(height: SizeConfig.screenHeight * 0.004),
                  const OtherSign(),
                  SpaceBox(height: SizeConfig.screenHeight * 0.004),
                  SignupForm(
                    emailLabel: S.of(context).enter_your_email_or_mobile,
                    passwordUpperText: S.of(context).password,
                    emailUpperText: S.of(context).your_email_or_mobile_phone,
                  ),
                  const AlreadyHaveAccount(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

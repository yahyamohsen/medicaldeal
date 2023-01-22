import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_info.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_details_view.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/widgets/custom_pin_widget.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/build_auth_header.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_general_button.dart';
import '../../../../../../core/widgets/space_box.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';
import 'enter_digits_text.dart';
import 'resend_button.dart';

class VerifyAccountBody extends StatelessWidget {
  const VerifyAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          AuthHeader(imageSize: SizeConfig.defaultSize * 12),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWHITE,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 34,
                      ),
                      Text(
                        S.of(context).verify_account,
                        style: Styles.bodyText3.copyWith(
                            color: kBLACK,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const EnterDigitsText(),
                      const SizedBox(
                        height: 48,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomPinTextField(
                            onChanged: (value) {},
                            onSubmitted: (value) {},
                            onSaved: (value) {}),
                      ),
                      const SizedBox(
                        height: 105,
                      ),
                      const ResendButton(),
                      Expanded(
                        child: const SizedBox(
                          height: 46,
                        ),
                      ),
                      Center(
                        child: CustomButton(
                            onTap: () {},
                            text: S.of(context).send,
                            gradient: kLinearGradient),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

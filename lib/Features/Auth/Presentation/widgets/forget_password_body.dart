import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/build_auth_header.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/widgets/space_box.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';
import 'forget_password_form_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          AuthHeader(imageSize: SizeConfig.defaultSize * 16),
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
                        S.of(context).forget_password_title,
                        style: Styles.bodyText3.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.defaultSize * 2),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      const ForgetPasswordFormField()
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

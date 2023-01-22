import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/mixins/validation_mixins.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../../../core/widgets/custom_general_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../views/verify_account_view.dart';

class ForgetPasswordFormField extends StatefulWidget {
  const ForgetPasswordFormField({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordFormField> createState() =>
      _ForgetPasswordFormFieldState();
}

class _ForgetPasswordFormFieldState extends State<ForgetPasswordFormField>
    with ValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).your_email_or_mobile_phone),
            SpaceBox(height: SizeConfig.screenHeight * 0.001),
            CustomTextFormField(
              validator: (value) {
                if (isFieldEmpty(value)) {
                  return S.current.field_is_required;
                } else if (value!.length != 11) {
                  return S.current.phone_number_validatioin_error;
                }
                return null;
              },
              title: S.of(context).enter_your_email_or_mobile,
              inputType: TextInputType.emailAddress,
            ),
            const Expanded(
              child: SizedBox(
                height: 16,
              ),
            ),
            Center(
              child: CustomButton(
                onTap: () => Get.to(
                  const VerifyAccountView(),
                  transition: Transition.fade,
                ),
                text: S.of(context).send,
                gradient: kLinearGradient,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';
import '../../../../generated/l10n.dart';

class LoginIconButtons extends StatelessWidget {
  const LoginIconButtons(
      {Key? key,
      this.facebookBackgroundColor,
      this.facebookIconColor,
      this.facebookTextColor})
      : super(key: key);
  final Color? facebookBackgroundColor;
  final Color? facebookIconColor;
  final Color? facebookTextColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          backGroundColor: const Color(0xff3B5998),
          text: S.of(context).facebook,
          textColor: kWHITE,
          icon: const Icon(
            FontAwesomeIcons.facebookF,
            color: kWHITE,
          ),
        ),
        CustomIconButton(
          text: S.of(context).google,
          icon: const Icon(
            FontAwesomeIcons.google,
            color: Color(0xffEA4335),
          ),
        ),
        const CustomIconButton(
          text: 'AppleID',
          textColor: kBLACK,
          icon: Icon(
            FontAwesomeIcons.apple,
            color: kBLACK,
          ),
        ),
      ],
    );
  }
}

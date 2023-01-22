import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';

class EnterDigitsText extends StatelessWidget {
  const EnterDigitsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        S.of(context).enter_digits_code,
        style: Styles.bodyText2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 21,
          color: const Color(0xffbcbcbc),
        ),
        softWrap: false,
      ),
    );
  }
}

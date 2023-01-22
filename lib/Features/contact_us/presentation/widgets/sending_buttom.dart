import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class SendingButton extends StatelessWidget {
  const SendingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: SizeConfig.defaultSize * 8,
        decoration: BoxDecoration(
          gradient: kLinearGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            S.of(context).send,
            style: Styles.bodyText3.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

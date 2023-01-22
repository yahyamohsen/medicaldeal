import 'package:flutter/material.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import '../../../../../../styles.dart';
import '../../../../generated/l10n.dart';

class OtherSign extends StatelessWidget {
  const OtherSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
      const SpaceBox(
        width: 2,
      ),
      Text(
        S.of(context).or_use,
        style: Styles.bodyText2.copyWith(
            color: const Color(0xff9B9B9B),
            fontSize: SizeConfig.defaultSize * 1.6,
            fontWeight: FontWeight.w500),
      ),
      const SpaceBox(
        width: 2,
      ),
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
    ]);
  }
}

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../styles.dart';

class TotallPrice extends StatelessWidget {
  const TotallPrice({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: SizeConfig.defaultSize * 5,
      color: kSecondaryColor.withOpacity(.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Totall',
            style: Styles.bodyText2.copyWith(
              color: kBLACK,
              fontSize: 14,
            ),
          ),
          Text(
            '$totalPrice',
          )
        ],
      ),
    );
  }
}

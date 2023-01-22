import 'package:flutter/material.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class ServicesCounter extends StatelessWidget {
  const ServicesCounter({
    Key? key,
    required this.selectedService,
    this.color,
    this.backgroundColor,
    this.style,
  }) : super(key: key);

  final int selectedService;

  final Color? color;
  final Color? backgroundColor;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBox(
          width: 2,
        ),
        CircleAvatar(
          backgroundColor: backgroundColor ?? kSecondaryColor,
          radius: 12,
          child: Text(
            '$selectedService',
            style: style ?? Styles.bodyText1,
          ),
        ),
        const SpaceBox(
          width: .5,
        ),
        Text(
          S.of(context).items,
          style: Styles.bodyText1.copyWith(
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

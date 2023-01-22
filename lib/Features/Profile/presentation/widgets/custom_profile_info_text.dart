import 'package:flutter/material.dart';
import '../../../../styles.dart';

class CustomProfileInfoText extends StatelessWidget {
  const CustomProfileInfoText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Styles.bodyText1.copyWith(
        color: textColor ?? const Color(0xff323133),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../styles.dart';

class CustomTextTap extends StatelessWidget {
  const CustomTextTap({
    Key? key,
    required this.backGroundColor,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final Color backGroundColor;

  final String text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.bodyText2
              .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

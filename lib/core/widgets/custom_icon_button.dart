import 'package:flutter/material.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import '../utils/size_config.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.backGroundColor,
      this.textColor,
      this.height,
      this.borderRadius,
      this.child,
      required this.icon})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final Color? backGroundColor;
  final Color? textColor;
  final double? height;
  final Widget icon;
  final double? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: backGroundColor ?? kWHITE,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffd7dbe2).withOpacity(.5),
              blurRadius: 30,
              spreadRadius: 4,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SpaceBox(
            width: .5,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: SizeConfig.defaultSize * 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

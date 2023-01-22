import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';

import '../../styles.dart';
import '../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backGroundColor;
  final Color? textColor;
  final BoxDecoration? decoration;
  final double? high;
  final double? width;
  final double? borderRadius;
  final Widget? child;
  final bool isLoading;
  final Gradient? gradient;
  const CustomButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.backGroundColor,
      this.borderRadius,
      this.textColor,
      this.decoration,
      this.high,
      this.width,
      this.child,
      this.gradient,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: high ?? SizeConfig.defaultSize * 5.5,
          width: width ?? SizeConfig.screenWidth,
          decoration: decoration ??
              BoxDecoration(
                gradient: gradient,
                color: backGroundColor,
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
          child: isLoading
              ? const CustomLoadingIndicator(
                  color: Colors.white,
                )
              : child ?? NonLoadingChild(text: text, textColor: textColor)),
    );
  }
}

class NonLoadingChild extends StatelessWidget {
  const NonLoadingChild({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Styles.bodyText2.copyWith(
          color: textColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

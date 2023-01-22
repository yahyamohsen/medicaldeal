import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../utils/size_config.dart';
import '../../Features/Profile/presentation/widgets/custom_appbar_profile_details.dart';
import '../../Features/services/presentation/widgets/app_bar_left_curve_painter.dart';
import '../../Features/services/presentation/widgets/app_bar_right_curve_painater.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground(
      {Key? key,
      required this.child,
      required this.title,
      this.leading,
      this.end,
      this.padding,
      this.backButtonAction,
      this.showAppBar = true,
      this.topPadding})
      : super(key: key);

  final Widget child;
  final String? title;
  final Widget? leading;
  final Widget? end;

  final bool showAppBar;
  final double? padding;
  final VoidCallback? backButtonAction;
  final int? topPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kLinearGradient,
      ),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
            painter: AppBarRightCurvePainter(),
          ),
          CustomPaint(
            size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
            painter: AppBarLeftCurvePainter(),
          ),
          showAppBar
              ? CustomProfileAppBar(
                  title: title ?? '',
                  leadingWidget: IconButton(
                    onPressed: backButtonAction ??
                        () {
                          Get.back();
                        },
                    icon: leading ??
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                  ),
                  child: end,
                )
              : const SizedBox(),
          Positioned.fill(
            bottom: 0,
            top: SizeConfig.defaultSize * (topPadding ?? 11),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding ?? 16,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../Features/splash_view/presentaion/widgets/custom_top_curves.dart';
import '../../constants.dart';
import '../../styles.dart';
import '../utils/Assets.dart';
import '../utils/size_config.dart';
import 'space_box.dart';

class AuthHeader extends StatelessWidget {
  AuthHeader({Key? key, this.headerHeight, required this.imageSize})
      : super(key: key);
  double? headerHeight;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.defaultSize * 24,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
          )),
          Positioned(
            right: 0,
            left: 0,
            bottom: 32,
            child: Image.asset(
              Assets.whiteLogo,
              height: imageSize,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
              painter: RightCurvePainter(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 17),
              painter: LeftCurvePainter(),
            ),
          ),
          Positioned(
            left: 0,
            top: SizeConfig.defaultSize,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceBox(
                      height: SizeConfig.defaultSize * 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

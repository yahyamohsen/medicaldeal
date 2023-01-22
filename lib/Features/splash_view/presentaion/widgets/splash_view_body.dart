import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/views/login_view.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/home_view.dart';
import 'package:sart_up_project/Features/select_language/presentation/views/select_language_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/Assets.dart';

import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/styles.dart';
import 'custom_bottom_curves.dart';
import 'custom_top_curves.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late Animation<double> _SizedAnimation;
  late AnimationController _SizeAnimationController;

  late AnimationController rightAnimationController;
  late Animation rightAnimation;

  late AnimationController leftAnimationController;
  late Animation leftAnimation;

  @override
  void initState() {
    super.initState();
    goToNextPage();
    initRightAnimation();
    initLeftAnimation();
    initSlideAnimation();
  }

  @override
  void dispose() {
    _SizeAnimationController.dispose();
    rightAnimationController.dispose();
    leftAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: SizedBox(
            height: rightAnimation.value,
            child: CustomPaint(
              painter: RightCurvePainter(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: SizedBox(
            height: leftAnimation.value,
            child: CustomPaint(
              painter: LeftCurvePainter(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: leftAnimation.value,
            child: CustomPaint(
              painter: BottomLeftCurve(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: rightAnimation.value,
            child: CustomPaint(
              painter: BottomRightCurve(),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                height: _SizedAnimation.value,
                child: Image.asset(
                  Assets.whiteLogo,
                ),
              ),
              // SlideTransition(
              //   position: _slideAnimation,
              //   child: Text(
              //     'Lorem ipsum',
              //     style: Styles.bodyText1,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  void goToNextPage() {
    bool isUserLogedIn = Prefs.prefs.containsKey(kToken);
    bool isLanguageSelected = Prefs.prefs.containsKey(kLanguageCode);
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        if (isLanguageSelected) {
          if (isUserLogedIn) {
            Get.off(() => const HomeView());
          } else {
            Get.off(() => const LoginView());
          }
        } else {
          Get.off(() => const SelectLanguageView());
        }
      },
    ); //Profile_Update  //LoginView
  }

  void initSlideAnimation() {
    _SizeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _SizedAnimation = Tween<double>(
            begin: SizeConfig.defaultSize * 5, end: SizeConfig.defaultSize * 15)
        .animate(
      CurvedAnimation(parent: _SizeAnimationController, curve: Curves.linear),
    );

    _SizeAnimationController.forward();
  }

  void initRightAnimation() {
    rightAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    rightAnimation = Tween<double>(
            begin: SizeConfig.defaultSize * 17,
            end: SizeConfig.defaultSize * 25)
        .animate(CurvedAnimation(
            parent: rightAnimationController, curve: Curves.linear));

    rightAnimationController.repeat(reverse: true);
  }

  void initLeftAnimation() {
    leftAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    leftAnimation = Tween<double>(
            begin: SizeConfig.defaultSize * 25,
            end: SizeConfig.defaultSize * 17)
        .animate(CurvedAnimation(
            parent: leftAnimationController, curve: Curves.linear));

    leftAnimationController.repeat(reverse: true);
    leftAnimation.addListener(() {
      setState(() {});
    });
  }
}

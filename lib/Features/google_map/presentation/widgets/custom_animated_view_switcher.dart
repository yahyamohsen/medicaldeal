import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../core/widgets/custom_background.dart';
import '../../../../generated/l10n.dart';
import '../../../check out/presentation/manger/cubit/checkout_cubit.dart';
import '../../../compare price/presentation/widgets/choose_your_lap_view_body.dart';
import '../../../compare price/presentation/widgets/compare_price_view_body.dart';
import '../cubits/animated_switcher_controller.dart';

import 'package:flutter/material.dart';

import 'custom_animated_switcher.dart';
import 'custom_views_taps.dart';
import 'google_map_view_body.dart';

class CustomViewAnimatedSwitcher extends StatefulWidget {
  const CustomViewAnimatedSwitcher({super.key});

  @override
  State<CustomViewAnimatedSwitcher> createState() =>
      _CustomViewAnimatedSwitcherState();
}

class _CustomViewAnimatedSwitcherState
    extends State<CustomViewAnimatedSwitcher> {
  late AnimatedSwitchController animatedSwitchController;

  @override
  void initState() {
    super.initState();

    initAnimatedSwitchController();
  }

  void initAnimatedSwitchController() {
    animatedSwitchController = AnimatedSwitchController();
    animatedSwitchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animatedSwitchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAnimatedSwitcher(
          animatedSwitchController: animatedSwitchController,
          children: [
            const GoogleMapViewBody(),
            CustomBackground(
              showAppBar: false,
              title: S.of(context).compar_price,
              child: const ComparePriceViewBody(),
            ),
            CustomBackground(
              showAppBar: false,
              backButtonAction: () {
                BlocProvider.of<CheckoutCubit>(context)
                    .placesWithServices
                    .clear();
                Get.back();
              },
              title: S.of(context).compar_price,
              child: const ChooseYourLapViewBody(),
            ),
          ],
        ),
        Positioned(
          top: 16,
          child: CustomViewTaps(
            currentIndex: animatedSwitchController.currentIndex,
            animatedSwitchControoler: animatedSwitchController,
          ),
        ),
      ],
    );
  }
}

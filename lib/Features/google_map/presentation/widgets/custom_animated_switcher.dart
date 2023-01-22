import 'package:flutter/material.dart';

import '../cubits/animated_switcher_controller.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({
    Key? key,
    required this.animatedSwitchController,
    required this.children,
  }) : super(key: key);

  final AnimatedSwitchController animatedSwitchController;

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      duration: const Duration(milliseconds: 600),
      child: children[animatedSwitchController.currentIndex],
    );
  }
}

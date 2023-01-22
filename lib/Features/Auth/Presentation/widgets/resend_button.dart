import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../generated/l10n.dart';

class ResendButton extends StatefulWidget {
  const ResendButton({Key? key}) : super(key: key);

  @override
  State<ResendButton> createState() => _ResendButtonState();
}

class _ResendButtonState extends State<ResendButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          style: Styles.bodyText1.copyWith(
            color: kBLACK,
          ),
          children: [
            TextSpan(
              text: S.of(context).Within,
              style: Styles.bodyText2.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: '${(animation.value as double).ceil()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: S.of(context).seconds_you_can,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  animationController.forward();
                },
              text: S.of(context).resend,
              style: Styles.bodyText2.copyWith(
                color: kSecondaryColor,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
          ],
        ),
        softWrap: false,
      ),
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));

    animation = Tween<double>(begin: 30, end: 0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });
  }
}

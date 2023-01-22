import 'package:flutter/material.dart';
import 'package:sart_up_project/constants.dart';

class CustomCheckoutCard extends StatelessWidget {
  const CustomCheckoutCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [kShadow],
      ),
      child: child,
    );
  }
}

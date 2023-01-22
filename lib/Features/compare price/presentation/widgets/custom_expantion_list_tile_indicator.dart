import 'package:flutter/material.dart';

class CustomExpantionTileIconIndicator extends StatelessWidget {
  const CustomExpantionTileIconIndicator({
    super.key,
    this.isExpanded = false,
  });

  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isExpanded ? 1 : 1.5,
      duration: const Duration(milliseconds: 300),
      child: const Icon(
        Icons.keyboard_arrow_up_outlined,
      ),
    );
  }
}

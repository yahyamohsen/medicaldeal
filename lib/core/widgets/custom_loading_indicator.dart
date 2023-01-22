import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? color;

  const CustomLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 32,
      color: color ?? kPrimaryColor,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(text),
      ),
    );
  }
}

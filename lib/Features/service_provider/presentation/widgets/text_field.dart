import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';

import '../../../../constants.dart';

class CustomServiceDetailsTextField extends StatelessWidget {
  const CustomServiceDetailsTextField(
      {Key? key, required this.text, this.isEnabled})
      : super(key: key);
  final String text;

  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        decoration: BoxDecoration(boxShadow: [
          kShadow,
        ]),
        child: CustomTextFormField(
          isEnabled: isEnabled,
          borderRadius: 32,
          fillColor: Colors.white,
          title: text,
          suffexIcon: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: Transform.rotate(
              angle: 1.5,
              child: const Icon(
                Icons.navigation,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

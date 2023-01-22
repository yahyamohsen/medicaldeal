import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../styles.dart';

class CustomContactUstextField extends StatelessWidget {
  const CustomContactUstextField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.maxLength,
      required this.onSaved})
      : super(key: key);

  final String title;
  final String hintText;
  final int? maxLength;
  final ValueSetter onSaved;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.bodyText2.copyWith(
              color: Color(0xff323133),
              fontWeight: FontWeight.normal,
              fontSize: 14),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: onSaved,
          title: hintText,
          maxLength: maxLength,
        ),
      ],
    );
  }
}

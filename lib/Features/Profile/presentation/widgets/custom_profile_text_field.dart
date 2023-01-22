import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:sart_up_project/core/mixins/validation_mixins.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class CustomProfileField extends StatelessWidget {
  const CustomProfileField(
      {Key? key,
      required this.hintText,
      required this.title,
      required this.onSaved,
      this.icon,
      this.isObsecure,
      this.onChanged})
      : super(key: key);
  final String hintText;
  final String title;
  final ValueSetter onSaved;
  final Widget? icon;
  final bool? isObsecure;
  final ValueSetter? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.bodyText2.copyWith(
            color: const Color(0xff323133),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        const SpaceBox(
          height: 1.2,
        ),
        CustomTextFormField(
          obsecureText: isObsecure,
          suffexIcon: icon,
          title: hintText,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

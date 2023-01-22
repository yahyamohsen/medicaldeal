import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sart_up_project/core/mixins/validation_mixins.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../styles.dart';

class MobileField extends StatelessWidget with ValidationMixin {
  final TextStyle? style;

  final ValueSetter<PhoneNumber?> onSaved;
  const MobileField({super.key, this.style, required this.onSaved});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).phone_number,
          style: Styles.bodyText2.copyWith(
            color: const Color(0xff323133),
            fontWeight: FontWeight.normal,
          ),
        ),
        const SpaceBox(
          height: 1.2,
        ),
        IntlPhoneField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF0F0F0),
            hintText: S.current.phone_number,
            disabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder(),
            border: buildBorder(),
          ),
          initialCountryCode: 'EG',
          onSaved: onSaved,
        ),
      ],
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color(0xffF0F0F0),
    ),
  );
}

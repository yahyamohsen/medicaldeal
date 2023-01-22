import 'package:flutter/material.dart';

import '../../../../core/mixins/validation_mixins.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class CustomProfilePasswordField extends StatefulWidget {
  const CustomProfilePasswordField({
    Key? key,
    required this.hintText,
    required this.title,
    required this.onSaved,
  }) : super(key: key);
  final String hintText;
  final String title;
  final ValueSetter onSaved;

  @override
  State<CustomProfilePasswordField> createState() =>
      _CustomProfilePasswordFieldState();
}

class _CustomProfilePasswordFieldState extends State<CustomProfilePasswordField>
    with ValidationMixin {
  IconData icon = Icons.remove_red_eye;
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Styles.bodyText2.copyWith(
            color: const Color(0xff323133),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        const SpaceBox(
          height: 1.2,
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return CustomTextFormField(
              validator: (value) {
                if (isFieldEmpty(value)) {
                  return S.current.field_is_required;
                } else if (value!.length < 6) {
                  return S.current.password_validation_error;
                }
                return null;
              },
              obsecureText: isObsecure,
              suffexIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObsecure = !isObsecure;
                      icon = isObsecure
                          ? Icons.remove_red_eye
                          : Icons.visibility_off;
                    });
                  },
                  child: Icon(
                    icon,
                  )),
              title: widget.hintText,
              onSaved: widget.onSaved,
            );
          },
        ),
      ],
    );
  }
}

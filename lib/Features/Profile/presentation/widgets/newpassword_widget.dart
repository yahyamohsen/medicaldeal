import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

class NewPassword_Widget extends StatelessWidget {
  const NewPassword_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Text(S.of(context).new_password),
              ),
            ],
          ),
          SpaceBox(height: 1),
          CustomTextFormField(
            suffexIcon: Icon(Icons.remove_red_eye),
            inputType: TextInputType.visiblePassword,
            obsecureText: true,
            enablePaste: false,
            filled: true,
            // fillColor: ,
          ),
        ],
      ),
    );
  }
}

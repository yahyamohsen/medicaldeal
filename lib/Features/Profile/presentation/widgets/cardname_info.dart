import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/widgets/space_box.dart';

class CardName_Info extends StatelessWidget {
  const CardName_Info({Key? key}) : super(key: key);

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
                child: Text(S.of(context).name_on_card),
              ),
            ],
          ),
          SpaceBox(height: 1),
          CustomTextFormField(
            title: S.of(context).name_on_card,
            inputType: TextInputType.text,
            filled: true,
            hintText: Text(
              S.of(context).name_on_card,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

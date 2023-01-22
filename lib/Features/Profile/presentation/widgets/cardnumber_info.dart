import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_text_field.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

class CardNumber_Info extends StatelessWidget {
  const CardNumber_Info({Key? key}) : super(key: key);

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
                child: Text(S.of(context).card_number),
              ),
            ],
          ),
          SpaceBox(
            height: 1,
          ),
          CustomTextFormField(
            inputType: TextInputType.number,
            filled: true,
            labelText: Text('  /  /  /  '),
          ),
        ],
      ),
    );
  }
}

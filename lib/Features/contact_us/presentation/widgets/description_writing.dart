import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

class DescriptionWriting extends StatelessWidget {
  const DescriptionWriting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'S.of(context).description',
          style: Styles.bodyText2.copyWith(
            color: Color(0xff323133),
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 25, top: 15),
          // alignment: Alignment.topLeft,
          height: SizeConfig.defaultSize * 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromRGBO(240, 240, 240, 1)),
          child: TextField(
            decoration: InputDecoration.collapsed(
                hintText: '${'S.of(context).type_your_descritption'}...',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

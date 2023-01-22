import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import '../../../../styles.dart';

class ServiceTypeInfo extends StatelessWidget {
  const ServiceTypeInfo({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Styles.bodyText2.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SpaceBox(
          height: 2,
        ),
        Text(
          description,
          style: Styles.bodyText1.copyWith(
            color: Colors.grey.withOpacity(.9),
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

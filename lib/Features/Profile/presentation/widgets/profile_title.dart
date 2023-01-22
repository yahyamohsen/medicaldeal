import 'package:flutter/material.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../styles.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name,
            style: Styles.title.copyWith(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            )),
      ],
    );
  }
}

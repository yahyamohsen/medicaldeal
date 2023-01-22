import 'package:flutter/material.dart';

import '../../../../styles.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Styles.bodyText2.copyWith(
          color: Colors.black,
        ));
  }
}

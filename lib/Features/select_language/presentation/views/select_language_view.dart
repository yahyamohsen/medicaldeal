import 'package:flutter/material.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../widgets/select_language_view_body.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SelectLanguageViewBody(),
    );
  }
}

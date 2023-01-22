import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';

import '../widgets/verify_account_body.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollableForm(
        child: VerifyAccountBody(),
      ),
    );
  }
}

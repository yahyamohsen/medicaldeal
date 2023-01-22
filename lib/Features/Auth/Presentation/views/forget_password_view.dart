import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollableForm(child: ForgetPasswordBody()),
    );
  }
}

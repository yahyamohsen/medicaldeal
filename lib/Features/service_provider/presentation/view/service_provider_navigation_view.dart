import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../widgets/service_provider_navigation_view_body.dart';

class ServiceProviderNavigationView extends StatelessWidget {
  const ServiceProviderNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
          title: S.of(context).service_privder,
          leading: const Icon(Icons.arrow_back_ios),
          child: const ServiceProviderNavigationViewBody()),
    );
  }
}

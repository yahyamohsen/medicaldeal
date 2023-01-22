import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_navigation_item.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/build_app_bar.dart';
import 'service_provider_navigation_list_view.dart';

class ServiceProviderNavigationViewBody extends StatelessWidget {
  const ServiceProviderNavigationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).service_privder,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SpaceBox(
            height: 2,
          ),
          const ServiceProviderNavigationListView(),
        ],
      ),
    );
  }
}

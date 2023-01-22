import 'package:flutter/material.dart';

import 'service_provider_navigation_item.dart';

class ServiceProviderNavigationListView extends StatelessWidget {
  const ServiceProviderNavigationListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return const ServiceProviderNavigationItem();
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey.withOpacity(.4),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

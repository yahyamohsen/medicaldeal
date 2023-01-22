import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_search_controller.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';

import '../../models/service_provider_model.dart';

class ServiceProviderList extends StatelessWidget {
  const ServiceProviderList({
    Key? key,
    required this.serviceProvider,
  }) : super(key: key);

  final List<ServiceProviderModel> serviceProvider;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.withOpacity(.4),
        );
      },
      padding: EdgeInsets.zero,
      itemCount: serviceProvider.length,
      itemBuilder: (context, index) {
        return ServiceProviderListViewItem(
          serviceProviderModel: serviceProvider[index],
        );
      },
    );
  }
}

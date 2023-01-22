import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';

import '../widgets/service_details_view_body.dart';

class ServiceProviderDetailsView extends StatelessWidget {
  const ServiceProviderDetailsView(
      {Key? key, required this.serviceProviderModel})
      : super(key: key);
  final ServiceProviderModel serviceProviderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ServiceProviderDetailsViewBody(
        serviceProvider: serviceProviderModel,
      ),
    ));
  }
}

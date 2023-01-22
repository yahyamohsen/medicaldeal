import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_cubit/service_provider_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_details.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list_item.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key, required this.services}) : super(key: key);

  final List<ServiceModel> services;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: services.length,
      itemBuilder: (context, index) {
        // return Text('hello');
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: ServicesListItem(
            serviceModel: services[index],
          ),
        );
      },
    );
  }
}

class HospitalServicesList extends StatelessWidget {
  const HospitalServicesList({Key? key, required this.services})
      : super(key: key);

  final List<ServiceProviderModel> services;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: services.length,
      itemBuilder: (context, index) {
        // return Text('hello');
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<ReviewsCubit>(context)
                  .getReviews(id: services[index].id.toString());
              Get.to(() => ServiceProviderDetailsView(
                  serviceProviderModel: services[index]));
            },
            child: ServiceProviderListViewItem(
              isDoctor: int.parse(services[index].categoryId!) > 6,
              serviceProviderModel: services[index],
            ),
          ),
        );
      },
    );
  }
}

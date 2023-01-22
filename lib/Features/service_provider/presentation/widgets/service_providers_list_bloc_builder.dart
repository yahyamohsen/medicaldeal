import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_search_controller.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/serves_list_bloc_builder.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../cubits/service_provider_cubit/service_provider_cubit.dart';

class ServiceProvidersListBlocBuilder extends StatelessWidget {
  const ServiceProvidersListBlocBuilder({
    Key? key,
    required this.serviceProviderSearchController,
  }) : super(key: key);

  final ServiceProviderSearchController serviceProviderSearchController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceProviderCubit, ServiceProviderState>(
      listener: ((context, state) {
        if (state is ServiceProviderSuccess) {
          serviceProviderSearchController.providers = [
            ...state.serviceProviders
          ];
        }
      }),
      builder: (context, state) {
        if (state is ServiceProviderSuccess) {
          return getSuccessWidget(state);
        } else if (state is ServiceProviderNetworkFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else if (state is ServiceProviderFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  StatelessWidget getSuccessWidget(ServiceProviderSuccess state) {
    if (serviceProviderSearchController.providers == null) {
      return ServiceProviderList(
        serviceProvider: state.serviceProviders,
      );
    } else {
      if (serviceProviderSearchController.providers!.isNotEmpty) {
        return ServiceProviderList(
          serviceProvider: serviceProviderSearchController.providers!,
        );
      } else {
        return const CustomEmptyWidget();
      }
    }
  }
}

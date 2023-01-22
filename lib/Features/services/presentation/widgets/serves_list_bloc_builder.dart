import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../generated/l10n.dart';
import '../manger/services_cubit/services_cubit.dart';

class ServesListBlocBuilder extends StatelessWidget {
  const ServesListBlocBuilder({
    Key? key,
    required this.title,
    required this.searchController,
  }) : super(key: key);

  final String title;

  final SearchController searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesSuccess) {
            var services;
            if (title == S.current.hospital ||
                title == S.current.doctor ||
                title == S.current.physical_therpay) {
              searchController.allProviders = state.serviceProviders;
              services = state.serviceProviders;
            } else {
              searchController.allServices = state.services;
              services = state.services;
            }

            return checkData(services);
          } else if (state is ServicesNetWorkFailure) {
            return CustomErrorWidget(text: S.current.no_internet_connection);
          } else if (state is ServicesLoading) {
            return const CustomLoadingIndicator();
          } else if (state is ServicesFailure) {
            return CustomErrorWidget(text: state.errMessage);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  StatelessWidget checkData(List services) {
    if (services.isNotEmpty) {
      if (title == S.current.hospital ||
          title == S.current.doctor ||
          title == S.current.physical_therpay) {
        // the first case we have is that the bool indicates that the list is not empty
        // but the list is empty
        // that's why we are checking two times to avoid an error from the first case
        // this could should be refactored
        if (!searchController.isFilterdProviderSearchResultEmpy) {
          return HospitalServicesList(
            services: searchController.filterdProviderList.isNotEmpty
                ? searchController.filterdProviderList
                : services as List<ServiceProviderModel>,
          );
        } else {
          return const CustomEmptyWidget();
        }
      } else {
        if (!searchController.isFilterdSearchResultEmpy) {
          return ServicesList(
            services: searchController.filterdList.isNotEmpty
                ? searchController.filterdList
                : services as List<ServiceModel>,
          );
        } else {
          return const CustomEmptyWidget();
        }
      }
    } else {
      return const CustomEmptyWidget();
    }
  }
}

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key, this.text = 'There is no data'});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Styles.bodyText2.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}

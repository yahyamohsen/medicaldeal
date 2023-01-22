import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_cubit/service_provider_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_search_controller.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/search_provider_text_search_result.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_providers_list_bloc_builder.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/core/widgets/build_app_bar.dart';
import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/custom_search_text_field.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';

class ServiceProviderViewBody extends StatefulWidget {
  const ServiceProviderViewBody({Key? key}) : super(key: key);

  @override
  State<ServiceProviderViewBody> createState() =>
      _ServiceProviderViewBodyState();
}

class _ServiceProviderViewBodyState extends State<ServiceProviderViewBody> {
  late final ServiceProviderSearchController searchController;

  String? text;
  @override
  void initState() {
    searchController = ServiceProviderSearchController();
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              searchProviders(text: value);
            },
            onChange: (value) {
              text = value;
            },
            onPressed: () {
              searchProviders(text: text);
            },
            suffixWidget: const SizedBox(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            S.of(context).service_privder,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SpaceBox(
            height: 1,
          ),
          SearchProviderTextSearchResult(searchController: searchController),
          Expanded(
            child: ServiceProvidersListBlocBuilder(
              serviceProviderSearchController: searchController,
            ),
          ),
        ],
      ),
    );
  }

  void searchProviders({required String? text}) {
    if (text != null && text.isNotEmpty) {
      List<ServiceProviderModel> providers = [
        ...?searchController.allProviders
      ];

      searchController.searhProviders(text: text, providers: providers);
    }
  }
}

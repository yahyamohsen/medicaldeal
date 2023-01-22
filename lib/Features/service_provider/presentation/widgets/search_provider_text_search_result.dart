import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/service_provider_search_controller.dart';

import '../../../../styles.dart';
import '../../../services/presentation/manger/search_controller.dart';

class SearchProviderTextSearchResult extends StatelessWidget {
  const SearchProviderTextSearchResult(
      {super.key, required this.searchController});

  final ServiceProviderSearchController searchController;

  @override
  Widget build(BuildContext context) {
    return searchController.text != null
        ? TextButton.icon(
            onPressed: () {
              searchController.resetData();
            },
            icon: const Icon(
              FontAwesomeIcons.xmark,
              size: 16,
              color: Colors.grey,
            ),
            label: Text(
              searchController.text!,
              style: Styles.bodyText2.copyWith(
                color: Colors.grey,
              ),
            ),
          )
        : const SizedBox();
  }
}

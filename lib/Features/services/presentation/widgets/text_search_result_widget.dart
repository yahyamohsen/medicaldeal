import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import '../manger/search_controller.dart';

class TextSearchResult extends StatelessWidget {
  const TextSearchResult(
      {super.key, required this.searchController, required this.title});

  final SearchController searchController;
  final String title;
  @override
  Widget build(BuildContext context) {
    return searchController.text != null
        ? TextButton.icon(
            onPressed: () {
              resetSearchResult();
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

  void resetSearchResult() {
    if (title == S.current.hospital ||
        title == S.current.doctor ||
        title == S.current.physical_therpay) {
      searchController.resetProviderSerachResult();
    } else {
      searchController.resetServicesSearchResult();
    }
  }
}

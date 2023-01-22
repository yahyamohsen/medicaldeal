import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Notification/presentation/views/notifications_view.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/branches_search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/serves_list_bloc_builder.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/styles.dart';

import 'branch_item.dart';

class BranchesListView extends StatelessWidget {
  const BranchesListView(
      {Key? key, required this.branches, required this.searchController})
      : super(key: key);
  final List<BranchModel> branches;

  final BranchesSearchController searchController;
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

  Widget getWidget() {
    if (searchController.branches == null) {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        padding: EdgeInsets.zero,
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return BrancheItem(
            branches: branches,
            brancheModel: branches[index],
          );
        },
      );
    } else {
      if (searchController.branches!.isNotEmpty) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          padding: EdgeInsets.zero,
          itemCount: searchController.branches!.length,
          itemBuilder: (context, index) {
            return BrancheItem(
              branches: searchController.branches!,
              brancheModel: searchController.branches![index],
            );
          },
        );
      } else {
        return const CustomEmptyWidget();
      }
    }
  }
}

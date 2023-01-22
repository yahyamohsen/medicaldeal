import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/branches_search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/core/widgets/custom_search_text_field.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../styles.dart';
import 'branches_list_view.dart';

class OurBranchesviewBody extends StatefulWidget {
  const OurBranchesviewBody({Key? key, required this.branches})
      : super(key: key);

  final List<BranchModel> branches;

  @override
  State<OurBranchesviewBody> createState() => _OurBranchesviewBodyState();
}

class _OurBranchesviewBodyState extends State<OurBranchesviewBody> {
  late BranchesSearchController branchesSearchController;

  @override
  void initState() {
    branchesSearchController = BranchesSearchController();
    branchesSearchController.allBranches = widget.branches;
    branchesSearchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String? text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceBox(
          height: 2,
        ),
        CustomSearchTextField(
          onSubmitted: (value) {
            branchesSearchController.searchBranches(
                text: value, branches: widget.branches);
          },
          suffixWidget: const SizedBox(),
        ),
        BranchesTextSearchResult(
            branchesSearchController: branchesSearchController),
        Expanded(
          child: BranchesListView(
            searchController: branchesSearchController!,
            branches: widget.branches,
          ),
        ),
      ],
    );
  }
}

class BranchesTextSearchResult extends StatelessWidget {
  const BranchesTextSearchResult(
      {super.key, required this.branchesSearchController});

  final BranchesSearchController branchesSearchController;

  @override
  Widget build(BuildContext context) {
    return branchesSearchController.text != null
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
              branchesSearchController.text!,
              style: Styles.bodyText2.copyWith(
                color: Colors.grey,
              ),
            ),
          )
        : const SizedBox();
  }

  void resetSearchResult() {
    branchesSearchController.resetData();
  }
}

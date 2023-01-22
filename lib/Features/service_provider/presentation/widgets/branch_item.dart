import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/custom_branch_google_map.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/is_english.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import '../../models/branche_model/branch_model.dart';

class BrancheItem extends StatelessWidget {
  const BrancheItem(
      {Key? key, required this.brancheModel, required this.branches})
      : super(key: key);

  final BranchModel brancheModel;
  final List<BranchModel> branches;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CustomBranchGoogleMap(
              branches: branches,
              branchModel: brancheModel,
              latLng: LatLng(
                double.parse(brancheModel.locationLat!),
                double.parse(brancheModel.locationLng!),
              ),
            ));
      },
      child: ListTile(
        title: Text(
          brancheModel.city ?? '',
          style: Styles.bodyText2.copyWith(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceBox(
              height: 1,
            ),
            Text(
              getLocalizedData(brancheModel.addressEn, brancheModel.addressAr),
              maxLines: 2,
              style: Styles.bodyText1.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Container(
          height: SizeConfig.defaultSize * 4,
          width: SizeConfig.defaultSize * 4,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.shortcut,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}

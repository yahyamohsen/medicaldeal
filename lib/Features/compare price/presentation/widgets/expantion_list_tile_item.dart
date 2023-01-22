import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/size_config.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class ExpantionListTileItem extends StatelessWidget {
  const ExpantionListTileItem({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * .5,
            child: Text(
              getLocalizedData(serviceModel.titleEn, serviceModel.title),
              style: Styles.bodyText2.copyWith(
                overflow: TextOverflow.ellipsis,
                color: kBLACK,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Spacer(),
          Text(
            serviceModel.price.toString(),
            style: Styles.bodyText1.copyWith(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SpaceBox(
            width: 1,
          ),
          Text(
            (serviceModel.price! - serviceModel.userDiscount!).toString(),
            style: Styles.bodyText3.copyWith(
              color: kSecondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

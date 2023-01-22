import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list_item.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../google_map/presentation/widgets/service_item.dart';

class ComparePriceItem extends StatelessWidget {
  const ComparePriceItem(
      {Key? key, required this.service, required this.placeModel})
      : super(key: key);

  final PlaceModel placeModel;
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kSecondaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffd7dbe2).withOpacity(.6),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getLocalizedData(service.titleEn, service.title),
              maxLines: 2,
              textAlign: TextAlign.left,
              style: Styles.bodyText1.copyWith(
                fontSize: 16,
                color: const Color(
                  0xff3A3A3A,
                ),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SpaceBox(
              height: 1.5,
            ),
            PriceWidget(
              oldPrice: service.price.toString(),
              newPrice: (service.price! - service.userDiscount!).toString(),
            ),
          ],
        ),
      ),
    );
  }
}

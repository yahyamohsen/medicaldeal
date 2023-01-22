import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sart_up_project/Features/Home/date/models/offer_model.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/offer_details.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_provider_list_view_item.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../styles.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({Key? key, required this.offer}) : super(key: key);

  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(() => const OfferDetailsView(), arguments: offer);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    CachedNetworkImageProvider('$kImageUrlPath${offer.image!}'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [kShadow],
            ),
          ),
        ),
      ),
    );
  }
}

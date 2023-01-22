import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sart_up_project/Features/Home/date/models/offer_model.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/offer_details.dart';
import 'package:sart_up_project/Features/Notification/data/models/notification_model.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../Home/presentaion/widget/custom_offer_details_image.dart';
import '../../../Home/presentaion/widget/details_cotnainer.dart';

class NotificationsDetailsViewBody extends StatelessWidget {
  const NotificationsDetailsViewBody(
      {super.key, required this.notificationsModel});

  final NotificationModel notificationsModel;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      padding: 0,
      topPadding: kTopPaddding,
      title: isEnglish() ? 'Notifications Details' : 'التفاصيل',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomOfferDetailsImage(
              image: notificationsModel.image!,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getLocalizedData(
                      notificationsModel.titleEn!, notificationsModel.title),
                  style: Styles.bodyText3.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: DetailsContainer(
              details: getLocalizedData(
                  notificationsModel.titleEn, notificationsModel.title),
            ),
          ),
        ],
      ),
    );
  }
}

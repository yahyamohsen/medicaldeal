import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/service_item.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';

class NearMePlaceServiceCard extends StatelessWidget {
  const NearMePlaceServiceCard({super.key, required this.place});

  final PlaceModel place;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.screenWidth,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffd7dbe2).withOpacity(.6),
                    blurRadius: 30,
                    spreadRadius: 4,
                  ),
                ],
                color: Colors.white.withOpacity(.3),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: SizeConfig.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // navigateToMapLocation(context);
                        },
                        child: ServiceItem(
                          placeModel: place,
                        )),
                    const SpaceBox(
                      height: 1,
                    ),
                    CustomButton(
                      onTap: () {
                        // addItemToCheckoutCart(
                        //     context, index, placeWithServices);
                        // Get.to(
                        //   () => const CheckoutView(),
                        //   duration: kDurationTransion,
                        // );
                      },
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: kSecondaryColor,
                          ),
                          color: Colors.white),
                      text: S.of(context).choose,
                      textColor: kSecondaryColor,
                      backGroundColor: kPrimaryColor,
                      gradient: kLinearGradient,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

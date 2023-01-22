import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

import '../../../services/presentation/widgets/services_counter.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'custom_check_out_card.dart';

class CheckOutItems extends StatelessWidget {
  const CheckOutItems({Key? key, required this.services, required this.title})
      : super(key: key);

  final List<ServiceModel> services;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomCheckoutCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Styles.bodyText2.copyWith(
                  color: kBLACK,
                  fontSize: 14,
                ),
              ),
              const SpaceBox(
                width: 3,
              ),
              ServicesCounter(
                selectedService: services.length,
                style: Styles.bodyText1.copyWith(
                  color: kPrimaryColor,
                ),
                backgroundColor: kSecondaryColor.withOpacity(.2),
                color: kSecondaryColor,
              )
            ],
          ),
          const SpaceBox(
            height: 3,
          ),
          Flexible(
            child: CheckoutServicesList(
              services: services,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutServicesList extends StatelessWidget {
  const CheckoutServicesList({Key? key, required this.services})
      : super(key: key);

  final List<ServiceModel> services;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: services.length,
        separatorBuilder: (context, index) {
          return const Divider(
            color: kSecondaryColor,
            height: 25,
            thickness: .3,
          );
        },
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getLocalizedData(
                    services[index].titleEn, services[index].title),
                style: Styles.bodyText1.copyWith(
                  color: kBLACK,
                  fontSize: 14,
                ),
              ),
              Text(
                '${services[index].price}\$',
              ),
            ],
          );
        });
  }
}

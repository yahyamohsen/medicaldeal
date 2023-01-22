import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

import '../../../services/presentation/widgets/services_counter.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'custom_check_out_card.dart';

class PhyarmcyCeckoutItems extends StatelessWidget {
  const PhyarmcyCeckoutItems(
      {Key? key, required this.title, required this.selectedServices})
      : super(key: key);

  final String title;
  final List<SelectedServiceModel> selectedServices;
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
                selectedService: selectedServices.length,
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
            child: PhaymceSelectedServiceListview(
              services: selectedServices,
            ),
          ),
        ],
      ),
    );
  }
}

class PhaymceSelectedServiceListview extends StatelessWidget {
  const PhaymceSelectedServiceListview({Key? key, required this.services})
      : super(key: key);

  final List<SelectedServiceModel> services;
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
            children: [
              Text(
                getLocalizedData(services[index].serviceModel.titleEn,
                    services[index].serviceModel.title),
                style: Styles.bodyText1.copyWith(
                  color: kBLACK,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text('${services[index].serviceModel.price} \$'),
              services[index].count > 0
                  ? ServicesCounter(
                      selectedService: services[index].count,
                      style: Styles.bodyText1.copyWith(
                        color: kPrimaryColor,
                      ),
                      backgroundColor: kSecondaryColor.withOpacity(.2),
                      color: kSecondaryColor,
                    )
                  : const SizedBox()
            ],
          );
        });
  }
}

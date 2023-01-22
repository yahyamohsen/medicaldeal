import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/check%20out/presentation/widgets/totall_price.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/constants.dart';

import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'check_out_view_body.dart';

class TotallAndDiscountWidget extends StatelessWidget {
  const TotallAndDiscountWidget(
      {super.key,
      required this.price,
      required this.discountPrice,
      required this.totalPrice});

  final double price, discountPrice, totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SubTotal',
                style: Styles.bodyText2.copyWith(
                  color: kBLACK,
                  fontSize: 14,
                ),
              ),
              Text(
                price.toString(),
              )
            ],
          ),
        ),
        const SpaceBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: Styles.bodyText2.copyWith(
                  color: kBLACK,
                  fontSize: 14,
                ),
              ),
              Text(
                '- $discountPrice',
                style: Styles.bodyText1.copyWith(
                  color: const Color(0xff2ACE90),
                ),
              )
            ],
          ),
        ),
        const SpaceBox(
          height: 2,
        ),
        TotallPrice(
          totalPrice: totalPrice,
        ),
      ],
    );
  }
}

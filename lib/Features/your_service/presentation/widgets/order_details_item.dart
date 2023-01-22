import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/get_localized_data.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import '../../data/models/order_details_model.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Row(
        children: [
          OrderInfo(orderDetailsModel: orderDetailsModel),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                openQrCodeImage(context);
              },
              child: const Hero(
                tag: 'zoom',
                child: Icon(
                  Icons.qr_code_2_outlined,
                  size: 82,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openQrCodeImage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Hero(
                  tag: "zoom",
                  child: QrImage(
                    data: jsonEncode(
                      {
                        'user_id': orderDetailsModel.userId,
                        'order_id': orderDetailsModel.orderId
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    Key? key,
    required this.orderDetailsModel,
  }) : super(key: key);

  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailsItem(
          text: 'Name: ',
          value: getLocalizedData(
            orderDetailsModel.titleEn,
            orderDetailsModel.title,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              'Price: ',
              style:
                  Styles.bodyText2.copyWith(fontSize: 16, color: Colors.black),
            ),
            Container(
              height: SizeConfig.defaultSize * 2,
              width: SizeConfig.defaultSize * 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  color: kSecondaryColor),
              child: const Icon(
                FontAwesomeIcons.dollarSign,
                size: 13,
                color: Colors.white,
              ),
            ),
            const SpaceBox(
              width: 1,
            ),
            Text(
              orderDetailsModel.cost!,
              style: Styles.bodyText2.copyWith(
                color: kSecondaryColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        DetailsItem(
          text: 'Amount: ',
          value: '${S.of(context).amount}: ${orderDetailsModel.amount}',
        ),
        const SizedBox(
          height: 4,
        ),
        DetailsItem(
            text: 'Total Price: ',
            value: '${S.of(context).total_price}: ${orderDetailsModel.total}')
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    Key? key,
    required this.value,
    required this.text,
  }) : super(key: key);

  final String value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.bodyText2.copyWith(fontSize: 16, color: Colors.black),
        ),
        Text(value,
            style: Styles.bodyText1.copyWith(
              color: Colors.black,
            )),
      ],
    );
  }
}

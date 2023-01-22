import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/service_item.dart';
import 'package:sart_up_project/Features/your_service/data/models/order_details_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import 'order_details_item.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.orderDetails});

  final List<OrderDetailsModel> orderDetails;
  @override
  Widget build(BuildContext context) {
    return OrderDetailsListview(
      orderDetails: orderDetails,
    );
  }
}

class OrderDetailsListview extends StatelessWidget {
  const OrderDetailsListview({super.key, required this.orderDetails});

  final List<OrderDetailsModel> orderDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderDetails.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OrderDetailsItem(
            orderDetailsModel: orderDetails[index],
          ),
        );
      },
    );
  }
}

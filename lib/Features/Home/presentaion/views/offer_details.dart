import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Home/presentaion/widget/offer_details_view._body.dart';

class OfferDetailsView extends StatelessWidget {
  const OfferDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OfferDetailsViewBody(
          offerModel: Get.arguments,
        ),
      ),
    );
  }
}

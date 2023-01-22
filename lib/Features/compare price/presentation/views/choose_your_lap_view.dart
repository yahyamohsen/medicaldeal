import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../check out/presentation/manger/cubit/checkout_cubit.dart';
import '../widgets/choose_your_lap_view_body.dart';

class ChooseYourLapView extends StatelessWidget {
  const ChooseYourLapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await onWillPopScrop(context);
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: CustomBackground(
          backButtonAction: () {
            BlocProvider.of<CheckoutCubit>(context).placesWithServices.clear();
            Get.back();
          },
          title: S.of(context).compar_price,
          child: const ChooseYourLapViewBody(),
        ),
      ),
    );
  }
}

Future<bool> onWillPopScrop(context) async {
  return Future.delayed(const Duration(milliseconds: 1), () {
    BlocProvider.of<CheckoutCubit>(context).placesWithServices.clear();
    return true;
  });
}

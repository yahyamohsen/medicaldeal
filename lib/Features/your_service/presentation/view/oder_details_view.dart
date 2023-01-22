import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/cubit/order_details_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/widgets/order_details_view_body.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../generated/l10n.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        title: S.current.your_services,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            if (state is OrderDetailsSuccess) {
              return OrderDetailsViewBody(
                orderDetails: state.orderDetails,
              );
            } else if (state is OrderDetailsFailure) {
              return CustomErrorWidget(text: state.errMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}

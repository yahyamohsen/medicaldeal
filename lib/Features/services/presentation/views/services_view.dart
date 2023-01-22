import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_view_success.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/add_pharmacy_order_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';

import '../widgets/services_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<SelectedServicesCubit>(context).reset();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: BlocConsumer<AddPharmacyOrderCubit, AddPharmacyOrderState>(
          listener: (context, state) {
            if (state is AddPharmacyOrderFailure) {
              errorBar(context, message: state.errMessage);
            }
            if (state is AddPharmacyOrderSuccess) {
              BlocProvider.of<AddPharmacyOrderCubit>(context).image = null;
              Get.offAll(
                () => const CheckoutViewSuccess(),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              progressIndicator: const CustomLoadingIndicator(),
              inAsyncCall: state is AddPharmacyOrderLoading ? true : false,
              child: CustomBackground(
                title: title,
                leading: IconButton(
                  onPressed: () {
                    BlocProvider.of<SelectedServicesCubit>(context).reset();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                child: ServicesViewBody(
                  title: title,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

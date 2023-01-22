import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/validate_promo_code_cubit.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list_item.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../services/presentation/manger/cubit/selected_services_cubit.dart';
import '../../data/repositries/check_out_repo_impl.dart';
import '../manger/cubit/checkout_cubit.dart';
import '../widgets/check_out_view_body.dart';
import '../widgets/checkout_view_for_pharmacy_body.dart';
import 'check_out_view_success.dart';

class CheckoutViewForPharmacy extends StatelessWidget {
  const CheckoutViewForPharmacy({super.key, required this.selectedServices});

  final List<SelectedServiceModel> selectedServices;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ValidatePromoCodeCubit(
        CheckoutRepoImpl(
          Api(
            NetWrokInfo(
              Connectivity(),
            ),
          ),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutFailure) {
                errorBar(context, message: state.errMessage);
              }

              if (state is CheckoutSuccess) {
                BlocProvider.of<SelectedServicesCubit>(context).reset();

                Get.to(() => const CheckoutViewSuccess());
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is CheckoutLoading ? true : false,
                color: Colors.transparent,
                progressIndicator: const CustomLoadingIndicator(),
                child: CheckoutViewForPharmacyBody(
                  selectedServices: selectedServices,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

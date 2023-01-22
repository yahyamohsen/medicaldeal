import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/checkout_cubit.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api.dart';
import '../../../services/presentation/manger/cubit/selected_services_cubit.dart';
import '../../data/repositries/check_out_repo_impl.dart';
import '../manger/cubit/validate_promo_code_cubit.dart';
import '../widgets/check_out_view_body.dart';
import 'check_out_view_success.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        padding: 0,
        title: 'Check out',
        child: BlocConsumer<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutFailure) {
              errorBar(context, message: state.errMessage);
            }

            if (state is CheckoutSuccess) {
              BlocProvider.of<SelectedServicesCubit>(context).reset();

              Get.offAll(() => const CheckoutViewSuccess());
            }
          },
          builder: (context, state) {
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
              child: ModalProgressHUD(
                  inAsyncCall: state is CheckoutLoading ? true : false,
                  color: Colors.transparent,
                  progressIndicator: const CustomLoadingIndicator(),
                  child: const CheckoutViewBody()),
            );
          },
        ),
      ),
    );
  }
}

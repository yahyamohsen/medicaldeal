import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Auth/Presentation/views/login_view.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/home_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/sign_out/sign_out_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/verfiy_order_cubit.dart/verify_order_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_view_body.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';

import '../../../../constants.dart';
import '../../../../core/singleton/shared_prefrence_singleton.dart';
import '../../../../core/widgets/error_bar.dart';
import '../../../../generated/l10n.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<VerifyOrderCubit, VerifyOrderState>(
        listener: (context, state) {
          if (state is VerifyOrderSuccess) {
            sucessBar(context, message: S.current.success);
          }

          if (state is VerifyOrderFailure) {
            errorBar(context, message: state.errMessgae);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is VerifyOrderLoading ? true : false,
            progressIndicator: const CustomLoadingIndicator(),
            child: bloc.BlocConsumer<SignOutCubit, SignOutState>(
              listener: (context, state) {
                if (state is SignOutSucess) {
                  Get.offAll(
                    () => const LoginView(),
                  );
                }

                if (state is SignOutNetworkFailure) {
                  errorBar(context, message: S.current.no_internet_connection);
                }

                if (state is SignOutFailure) {
                  errorBar(context, message: state.errMessage);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  progressIndicator: const CustomLoadingIndicator(),
                  inAsyncCall: (state is SignOutLoading) ? true : false,
                  child: const ProfileDetailsViewBody(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

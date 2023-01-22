import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change%20password/change_password_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_payment_method_view.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../widgets/profile_change_password_view_body.dart';

class ProfileChangePasswordView extends StatelessWidget {
  const ProfileChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackground(
        title: S.of(context).change_password,
        end: IconButton(
          onPressed: () {
            Get.to(() => const ProfilePaymentMethodView(),
                transition: Transition.fade);
          },
          icon: GestureDetector(
            onTap: () {
              var cubit = bloc.BlocProvider.of<ChangePasswordCubit>(context);
              if (cubit.formKey.currentState!.validate()) {
                cubit.formKey.currentState!.save();

                cubit.changePassword();
              }
            },
            child: const Icon(
              Icons.check,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        child: bloc.BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              sucessBar(context, message: S.current.success);
            }

            if (state is ChangePasswordNetWorkFailure) {
              errorBar(context, message: S.current.no_internet_connection);
            }

            if (state is ChangePasswordFailure) {
              errorBar(context, message: state.errMessage);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is ChangePasswordLoading ? true : false,
              child: const ProfileChangePasswordViewBody(),
            );
          },
        ),
      ),
    );
  }
}

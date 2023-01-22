import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change_phone/change_phone_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/change_phone_number_view_body.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';

class ChangePhoneNumberView extends StatelessWidget {
  const ChangePhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePhoneCubit, ChangePhoneState>(
      listener: (context, state) {
        if (state is ChangePhoneSuccess) {
          sucessBar(context, message: S.current.success);
        }

        if (state is ChangePhoneNetworkFailure) {
          errorBar(context, message: S.current.no_internet_connection);
        }

        if (state is ChangePhoneFailure) {
          errorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ChangePhoneLoading ? true : false,
          child: Scaffold(
            body: CustomBackground(
              end: IconButton(
                onPressed: () {},
                icon: GestureDetector(
                  onTap: () {
                    var cubit = BlocProvider.of<ChangePhoneCubit>(context);

                    if (cubit.formKey.currentState!.validate()) {
                      cubit.formKey.currentState!.save();

                      cubit.changePhone();
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
              title: S.current.change_phone_number,
              child: const ChangePhoneNumberViewBody(),
            ),
          ),
        );
      },
    );
  }
}

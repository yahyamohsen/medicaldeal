import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/register_cubit/register_cubit_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubitCubit, RegisterCubitState>(
        listener: (context, state) {
          if (state is Success) {
            sucessBar(context, message: 'Success');
            Get.back();
          }

          if (state is NoInternetConnection) {
            errorBar(context, message: S.current.no_internet_connection);
          }

          if (state is Failure) {
            errorBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is Loading ? true : false,
            child: const CustomScrollableForm(
              child: SignUpViewBody(),
            ),
          );
        },
      ),
    );
  }
}

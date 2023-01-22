import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/home_view.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bloc.BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Success) {
            Get.offAll(() => const HomeView(), transition: Transition.fade);
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
              child: LoginViewBody(),
            ),
          );
        },
      ),
    );
  }
}

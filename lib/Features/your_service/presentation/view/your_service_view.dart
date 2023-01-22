import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/user_services_cubit.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../widgets/your_service_view_body.dart';

class YourServiceView extends StatelessWidget {
  const YourServiceView({Key? key}) : super(key: key);

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
        child: BlocBuilder<UserServicesCubit, UserServicesState>(
          builder: (context, state) {
            if (state is UserServicesSuccess) {
              return YourServiceViewBody(
                userServices: state.userServices,
              );
            } else if (state is UserServicesFailure) {
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

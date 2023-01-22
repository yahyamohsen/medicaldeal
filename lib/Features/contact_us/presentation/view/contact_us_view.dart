import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/contact_us/presentation/cubits/cubit/contact_us_cubit.dart';
import 'package:sart_up_project/Features/contact_us/presentation/widgets/contact_us_view_body.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/core/widgets/custom_scrollable_form.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsSuccess) {
            sucessBar(context, message: S.current.success);
          }

          if (state is ContactUsNetworkFailure) {
            errorBar(context, message: S.current.no_internet_connection);
          }

          if (state is ContactUsFailure) {
            errorBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ContactUsLoading ? true : false,
            child: CustomBackground(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: S.of(context).contact_us,
              child: const CustomScrollableForm(
                child: ContactUsViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}

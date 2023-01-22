import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/EditProfile/edit_profile_cubit.dart';
import 'package:sart_up_project/Features/select_language/presentation/manger/lanugae_cubit/language_cubit.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';

import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/success_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/profile_edit_view_body.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            sucessBar(context, message: 'Success');

            BlocProvider.of<EditProfileCubit>(context).image = null;
            // we are just using this cubit to refresh the material app
            // so the new data saved locally from profile will be displayed
            // to lazy to create a new cubit for that
            // but you should create a new cubit rather than using this ^_^
            BlocProvider.of<LanguageCubit>(context)
                .updateLangugae(isEnglish() ? 'en' : 'ar');
          }

          if (state is EditProfileNetWorkFailure) {
            errorBar(context, message: S.current.no_internet_connection);
          }

          if (state is EditProfileFailure) {
            errorBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CustomLoadingIndicator(),
            inAsyncCall: state is EditProfileLoading ? true : false,
            child: const ProfileEditViewBody(),
          );
        },
      ),
    );
  }
}

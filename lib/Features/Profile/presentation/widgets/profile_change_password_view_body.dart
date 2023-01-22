import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/change%20password/change_password_cubit.dart';
import 'package:sart_up_project/generated/l10n.dart';

import 'custom_profile_change_password_view_body.dart';
import 'custom_profile_text_field.dart';

class ProfileChangePasswordViewBody extends StatelessWidget {
  const ProfileChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ChangePasswordCubit>(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomProfilePasswordField(
            hintText: '',
            title: S.of(context).password,
            onSaved: (value) {
              BlocProvider.of<ChangePasswordCubit>(context).currentPassword =
                  value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomProfilePasswordField(
            hintText: '',
            title: S.of(context).new_password,
            onSaved: (value) {
              BlocProvider.of<ChangePasswordCubit>(context).newPassword = value;
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/EditProfile/edit_profile_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/custom_profile_text_field.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/mobile_info.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/utils/size_config.dart';

class ProfileEditForm extends StatelessWidget {
  const ProfileEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    var editCubit = BlocProvider.of<EditProfileCubit>(context);
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: SizeConfig.defaultSize * 10 / 2 + 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomProfileField(
            onSaved: (value) {},
            hintText: UserModel.fromJson(Prefs.getObject(kUserModel)).name!,
            title: S.of(context).first_name,
            onChanged: (value) {
              editCubit.name = value;
            },
          ),
          const SpaceBox(height: 3),
          CustomProfileField(
            onSaved: (value) {},
            hintText: '',
            title: S.of(context).email,
            onChanged: (value) {
              editCubit.email = value;
            },
          ),
        ],
      ),
    );
  }
}

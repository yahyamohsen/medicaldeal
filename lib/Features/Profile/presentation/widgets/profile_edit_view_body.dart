import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/Profile/presentation/cubits/EditProfile/edit_profile_cubit.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_change_password_view.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_view_header.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_edit_form.dart';
import 'package:sart_up_project/core/utils/functions/pick_image.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../splash_view/presentaion/widgets/custom_top_curves.dart';
import 'custom_appbar_profile_details.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CustomLoadingIndicator(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize * 20,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                  )),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(
                          SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
                      painter: RightCurvePainter(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(
                          SizeConfig.screenWidth, SizeConfig.defaultSize * 17),
                      painter: LeftCurvePainter(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomProfileAppBar(
                        leadingWidget: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        title: S.of(context).your_profile,
                        child: IconButton(
                          onPressed: () async {
                            var editCubit =
                                bloc.BlocProvider.of<EditProfileCubit>(context);

                            editCubit.editProfile();
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 24,
                          ),
                        )),
                  ),
                  Positioned(
                    right: SizeConfig.screenWidth * .36,
                    bottom: -SizeConfig.defaultSize * 12 / 2,
                    left: SizeConfig.screenWidth * .36,
                    child: ImageBlocBuilder(
                      onTap: () async {
                        isLoading = true;
                        setState(() {});
                        var result = await pickImage();

                        result.fold((l) {
                          isLoading = false;
                          setState(() {});
                          errorBar(context,
                              message: S.current.failed_to_pick_image);
                        }, (r) {
                          isLoading = false;
                          setState(() {});
                          bloc.BlocProvider.of<EditProfileCubit>(context)
                              .image = r;

                          sucessBar(context,
                              message: S.current.picked_image_successfully);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SpaceBox(height: 2),
            const ProfileEditForm(),
          ],
        ),
      ),
    );
  }
}

class ImageBlocBuilder extends StatelessWidget {
  final VoidCallback onTap;

  const ImageBlocBuilder({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: getImage(context),
    );
  }

  dynamic getImage(BuildContext context) {
    return bloc.BlocProvider.of<EditProfileCubit>(context).image == null
        ? Stack(
            children: const [
              CustomProfileImage(),
              Positioned.fill(
                child: Center(
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              image: DecorationImage(
                image: FileImage(
                  File(bloc.BlocProvider.of<EditProfileCubit>(context)
                      .image!
                      .path),
                ),
                fit: BoxFit.fill,
              ),
            ),
            height: SizeConfig.defaultSize * 10,
            child: const Center(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          );
  }
}

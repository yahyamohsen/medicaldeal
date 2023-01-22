import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/select_language/presentation/manger/lanugae_cubit/language_cubit.dart';
import 'package:sart_up_project/Features/splash_view/presentaion/widgets/custom_top_curves.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import 'custom_appbar_profile_details.dart';

class ProfileDetailsViewHeader extends StatelessWidget {
  const ProfileDetailsViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .25,
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
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 20),
              painter: RightCurvePainter(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth, SizeConfig.defaultSize * 17),
              painter: LeftCurvePainter(),
            ),
          ),
          Positioned(
            bottom: -SizeConfig.defaultSize * 10 / 2,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomProfileImage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProfileAppBar(
                  title: S.of(context).your_profile,
                  child: GestureDetector(
                    onTap: () {
                      if (isEnglish()) {
                        BlocProvider.of<LanguageCubit>(context)
                            .updateLangugae('ar');
                      } else {
                        BlocProvider.of<LanguageCubit>(context)
                            .updateLangugae('end');
                      }
                    },
                    child: Text(
                      isEnglish() ? 'العربيه' : 'English',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    String? userImage =
        UserModel.fromJson(Prefs.getObject(kUserModel)).photo as String?;

    return userImage != null && userImage.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                kShadow,
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  '$kImageUrlPath$userImage',
                ),
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            height: height ?? SizeConfig.defaultSize * 10,
            width: width ?? SizeConfig.defaultSize * 10,
          )
        : Container(
            decoration: BoxDecoration(
              boxShadow: [
                kShadow,
              ],
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            height: height ?? SizeConfig.defaultSize * 10,
            width: width ?? SizeConfig.defaultSize * 10,
            child: const Icon(
              Icons.person_outline_outlined,
              size: 64,
            ),
          );
  }
}

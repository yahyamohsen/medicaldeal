import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/select_language/presentation/manger/lanugae_cubit/language_cubit.dart';
import 'package:sart_up_project/core/utils/Assets.dart';

import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/build_auth_header.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import '../../../Auth/Presentation/views/login_view.dart';

class SelectLanguageViewBody extends StatelessWidget {
  const SelectLanguageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          AuthHeader(imageSize: SizeConfig.defaultSize * 12),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kWHITE,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 101,
                  ),
                  Text(
                    S.of(context).select_language,
                    style: Styles.bodyText3.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.defaultSize * 2),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                    high: SizeConfig.screenHeight * 0.07,
                    width: SizeConfig.screenWidth * 0.65,
                    onTap: () {
                      BlocProvider.of<LanguageCubit>(context)
                          .updateLangugae('en');
                      Get.to(() => const LoginView());
                    },
                    text: S.of(context).english,
                    backGroundColor: kSecondaryColor,
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                    high: SizeConfig.screenHeight * 0.07,
                    width: SizeConfig.screenWidth * 0.65,
                    onTap: () {
                      BlocProvider.of<LanguageCubit>(context)
                          .updateLangugae('ar');
                      Get.to(() => const LoginView());
                    },
                    text: S.of(context).arabic,
                    textColor: kBLACK,
                    backGroundColor: kWHITE,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kSecondaryColor,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

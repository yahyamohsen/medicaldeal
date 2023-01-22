import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Profile/presentation/views/profile_edit_view.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../styles.dart';

class CustomEditProfileButton extends StatelessWidget {
  const CustomEditProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProfileEditView(), transition: Transition.fade);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: SizeConfig.defaultSize * 4,
            width: SizeConfig.defaultSize * 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: kSecondaryColor),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).edit_profile,
                    style: Styles.bodyText2.copyWith(
                      color: kSecondaryColor,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kSecondaryColor,
                    size: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

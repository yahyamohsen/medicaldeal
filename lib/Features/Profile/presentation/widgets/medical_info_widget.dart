import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/text_title.dart';
import 'package:sart_up_project/Features/services/presentation/views/services_view.dart';
import 'package:sart_up_project/Features/your_service/presentation/view/your_service_view.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import '../../../../core/utils/functions/determine_transtion.dart';
import '../../../../core/utils/functions/is_english.dart';
import 'custom_profile_info_text.dart';
import 'info_card.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onPressed})
      : super(key: key);

  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(
          title: title,
        ),
        const SizedBox(
          height: 16,
        ),
        InfoCard(
          child: CustomProfileInfoText(
            text: subTitle,
          ),
          onPresse: onPressed,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/text_title.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'custom_profile_info_text.dart';
import 'info_card.dart';

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(
          title: S.of(context).contact_us,
        ),
        InfoCard(
          child: CustomProfileInfoText(
            text: S.of(context).contact_us_info,
          ),
          onPresse: () {},
        )
      ],
    );
  }
}

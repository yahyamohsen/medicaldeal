import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key, required this.user}) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(.10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemInfo(
                title: S.of(context).name,
                subTitle: user.name!,
              ),
              const SizedBox(
                height: 16,
              ),
              ItemInfo(
                title: S.of(context).mobile_number,
                subTitle: user.phone!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.bodyText1.copyWith(
            color: Colors.grey,
          ),
        ),
        const SpaceBox(
          height: .5,
        ),
        Row(
          children: [
            Text(
              subTitle,
              style: Styles.bodyText1.copyWith(
                color: const Color(0xff323133),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

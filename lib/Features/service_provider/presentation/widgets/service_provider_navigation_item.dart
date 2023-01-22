import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/service_provider_details.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/service_details_view_body.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../core/utils/size_config.dart';

class ServiceProviderNavigationItem extends StatelessWidget {
  const ServiceProviderNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                16,
              ),
              child: Image.asset(
                Assets.mokhtabre,
                height: SizeConfig.defaultSize * 7,
              )),
          const SpaceBox(
            width: 3,
          ),
          Text(
            S.of(context).lab_name,
            style: Styles.TapText.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_info.dart';
import 'package:sart_up_project/Features/Profile/presentation/widgets/profile_details_view_header.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import '../../../../core/utils/size_config.dart';

class ProfileDetailsViewBody extends StatelessWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileDetailsViewHeader(),
          SizedBox(
            height: SizeConfig.defaultSize * 10 / 2 + 16,
          ),
          const ProfileDetailsInfo(),
        ],
      ),
    );
  }
}

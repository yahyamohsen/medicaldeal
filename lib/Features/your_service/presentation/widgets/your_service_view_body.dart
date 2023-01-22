import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/Auth/models/user_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/filter_list.dart';
import 'package:sart_up_project/Features/your_service/data/models/user_service_model.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/delete_order_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/manger/cubit/user_services_cubit.dart';
import 'package:sart_up_project/Features/your_service/presentation/widgets/service_proviedr_tap.dart';
import 'package:sart_up_project/Features/your_service/presentation/widgets/user_services_list.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/widgets/custom_search_text_field.dart';

import 'user_service_item.dart';

class YourServiceViewBody extends StatelessWidget {
  const YourServiceViewBody({super.key, required this.userServices});

  final List<UserServiceModel> userServices;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: UserServicesList(
        userServices: userServices,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/models/service_provider_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/branches_cubit/branches_cubit.dart';
import 'package:sart_up_project/Features/service_provider/presentation/view/our_branches_view.dart';
import 'package:sart_up_project/core/utils/functions/determine_transtion.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import '../../../../constants.dart';

class CustomServiceDetailsButton extends StatelessWidget {
  const CustomServiceDetailsButton(
      {Key? key, required this.serviceProviderModel})
      : super(key: key);

  final ServiceProviderModel serviceProviderModel;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        Get.to(() => const OurBranchesView(), transition: determinTranstion());
        BlocProvider.of<BranchesCubit>(context)
            .getBranches(id: serviceProviderModel.id!);
      },
      // ignore: sort_child_properties_last
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).our_branches,
              style: Styles.buttonText.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
      text: S.of(context).our_branches,
      gradient: kLinearGradient,
    );
  }
}

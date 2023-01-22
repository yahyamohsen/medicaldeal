import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/branches_cubit/branches_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_background.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/out_branches_view_body.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/generated/l10n.dart';

class OurBranchesView extends StatelessWidget {
  const OurBranchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomBackground(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: S.of(context).our_branches,
        child: BlocBuilder<BranchesCubit, BranchesState>(
          builder: (context, state) {
            if (state is BranchesSuccess) {
              return OurBranchesviewBody(
                branches: state.branches,
              );
            } else if (state is BranchesFailure) {
              return CustomErrorWidget(text: state.errMessage);
            } else if (state is BranchesLoading) {
              return const CustomLoadingIndicator();
            } else if (state is BranchesNetWorkFailure) {
              return CustomErrorWidget(text: S.current.no_internet_connection);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

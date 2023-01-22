import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';

import 'package:sart_up_project/core/widgets/custom_error_widget.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../styles.dart';

import 'reviews_list_view.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).reviews,
          style: Styles.bodyText2.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const SpaceBox(
          height: 2,
        ),
        BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state is ReviewsSuccess) {
              return const ReviewsList();
            } else if (state is ReviewsNetworkFailure) {
              return CustomErrorWidget(text: state.errMessage);
            } else if (state is ReviewsFailure) {
              return CustomErrorWidget(text: state.errMessage);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ],
    );
  }
}

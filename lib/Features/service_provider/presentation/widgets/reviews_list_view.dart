import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sart_up_project/Features/service_provider/models/review_model.dart';
import 'package:sart_up_project/Features/service_provider/presentation/cubits/reviews_cubit/reviews_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/serves_list_bloc_builder.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'rating_bar.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<ReviewsCubit>(context).reviews!.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: BlocProvider.of<ReviewsCubit>(context).reviews!.length,
          itemBuilder: (context, index) {
            return ReviewItem(
              review: BlocProvider.of<ReviewsCubit>(context).reviews![index],
            );
          });
    } else {
      return CustomEmptyWidget(
        text: S.of(context).there_is_no_reviews,
      );
    }
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key, required this.review}) : super(key: key);

  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor.withOpacity(.1),
        ),
        child: ListTile(
          trailing: Text(
            DateFormat('dd - MM').format(DateTime.parse(review.createdAt!)),
            style: Styles.bodyText1.copyWith(
              color: Colors.black,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.name!,
                style: Styles.bodyText2.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SpaceBox(
                height: 1,
              ),
              CustomRatingBar(
                rating: double.parse(review.rate!),
              ),
              const SpaceBox(
                height: 1,
              ),
            ],
          ),
          subtitle: Text(
            review.reviewComment!,
            style:
                Styles.bodyText1.copyWith(color: Colors.grey.withOpacity(.4)),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}

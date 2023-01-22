import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/core/widgets/custom_rating_bar_widget.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

import '../../../../styles.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({Key? key, required this.text, required this.rating})
      : super(key: key);
  final String text;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              style: Styles.bodyText2.copyWith(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomRatingIndicator(
                  rating: rating,
                ),
                const SpaceBox(
                  width: 1,
                ),
                Text(
                  rating.round().toString(),
                  style: Styles.bodyText1.copyWith(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    Key? key,
    this.rating = 0,
  }) : super(key: key);

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 16,
      // itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

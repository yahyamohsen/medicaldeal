import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/service_provider/presentation/widgets/rating_bar.dart';

class CustomRatingIndicator extends StatelessWidget {
  final double rating;

  const CustomRatingIndicator({super.key, required this.rating});
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: 16,
      rating: rating,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        FontAwesomeIcons.solidStar,
        color: Colors.amber,
      ),
    );
  }
}

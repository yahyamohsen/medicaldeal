import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../date/models/offer_model.dart';

class CustomOfferDetailsImage extends StatelessWidget {
  const CustomOfferDetailsImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider('$kImageUrlPath${image}'),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';

import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import '../../../google_map/presentation/widgets/service_item.dart';

class ExpanstionTitleWidget extends StatelessWidget {
  const ExpanstionTitleWidget({
    Key? key,
    this.isExpaned = true,
    required this.placeModel,
  }) : super(key: key);

  final bool? isExpaned;

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: SizeConfig.defaultSize * 5,
          width: SizeConfig.defaultSize * 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  '$kImageUrlPath${placeModel.image!}',
                ),
                fit: BoxFit.cover,
              )),
        ),
        const SpaceBox(
          width: 1,
        ),
        Title(
          isExpaned: isExpaned,
          text: getLocalizedData(
            placeModel.titleEn,
            placeModel.title,
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.isExpaned,
    required this.text,
  }) : super(key: key);

  final bool? isExpaned;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: Styles.bodyText2.copyWith(
        fontSize: 12,
        color: isExpaned! ? kBLACK : Colors.white,
      ),
    );
  }
}

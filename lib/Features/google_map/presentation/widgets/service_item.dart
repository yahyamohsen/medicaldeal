import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';

import '../../../../constants.dart';
import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.placeModel}) : super(key: key);

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                16,
              )),
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl: '$kImageUrlPath${placeModel.image}',
                    errorWidget: (conbtext, _, __) => const SizedBox(
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                const SpaceBox(
                  width: 3,
                ),
                ServiceInfo(
                  title:
                      (isEnglish() ? placeModel.titleEn : placeModel.title) ??
                          '',
                  subTitle: placeModel.serviceProviderId ?? '',
                  address: (isEnglish()
                          ? placeModel.addressEn
                          : placeModel.addressAr) ??
                      '',
                  dicount: placeModel.sPdiscount.toString(),
                  price: placeModel.price.toString(),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: isEnglish() ? 16 : null,
          left: isEnglish() ? null : 16,
          child: Container(
            width: SizeConfig.defaultSize * 6,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SpaceBox(
                  width: .5,
                ),
                Text(
                  '4',
                  style: Styles.bodyText1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceInfo extends StatelessWidget {
  const ServiceInfo({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.dicount,
    required this.address,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String price;
  final String dicount;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.bodyText2.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SpaceBox(
          height: .7,
        ),
        Text(
          '$subTitle Services',
          style: Styles.bodyText1.copyWith(
            color: Colors.black,
          ),
        ),
        const SpaceBox(
          height: 1.5,
        ),
        PriceWidget(
          newPrice: dicount,
          oldPrice: price,
        ),
        const SpaceBox(
          height: .7,
        ),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.locationPin,
              color: kSecondaryColor,
            ),
            const SpaceBox(
              width: 1,
            ),
            Text(
              address,
              overflow: TextOverflow.ellipsis,
              style: Styles.bodyText1.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    this.color,
    required this.oldPrice,
    required this.newPrice,
  }) : super(key: key);

  final Color? color;
  final String? oldPrice;
  final String? newPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: SizeConfig.defaultSize * 2,
          width: SizeConfig.defaultSize * 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4,
              ),
              color: kSecondaryColor),
          child: const Icon(
            FontAwesomeIcons.dollarSign,
            size: 13,
            color: Colors.white,
          ),
        ),
        const SpaceBox(
          width: 1,
        ),
        Text(
          oldPrice ?? '0',
          style: Styles.bodyText1.copyWith(
            decoration: TextDecoration.lineThrough,
            color: color ?? Colors.grey,
          ),
        ),
        const SpaceBox(
          width: 1,
        ),
        Text(
          newPrice ?? '0',
          style: Styles.bodyText2.copyWith(
            color: color ?? kBLACK,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_tap.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class CustomComparePriceTap extends StatelessWidget {
  const CustomComparePriceTap(
      {Key? key,
      required this.text,
      required this.image,
      required this.isSelected})
      : super(key: key);
  final bool isSelected;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GeneralTap(
        borderRadius: 32,
        inActiveColor: Colors.white,
        isSelected: isSelected,
        activeColor: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("$kImageUrlPath$image"),
              ),
              const SpaceBox(
                width: 1,
              ),
              Text(
                text,
                style: isSelected
                    ? Styles.TapText
                    : Styles.TapText.copyWith(
                        color: kBLACK,
                      ),
                textAlign: TextAlign.right,
              ),
              const SpaceBox(
                width: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

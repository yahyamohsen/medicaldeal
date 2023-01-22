import 'package:flutter/material.dart';
import 'package:sart_up_project/constants.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.text, required this.image, required this.onTap})
      : super(key: key);

  final String text;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          width: SizeConfig.defaultSize * 12,
          height: SizeConfig.defaultSize * 11,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [kShadow],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: SizeConfig.defaultSize * 4,
              ),
              const SpaceBox(
                height: 1,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Styles.bodyText1.copyWith(
                    fontSize: 12,
                    color: const Color(0xff3A3A3A),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

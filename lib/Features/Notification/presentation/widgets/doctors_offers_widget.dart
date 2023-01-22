import 'package:flutter/material.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class CustomDoctorOfferButton extends StatelessWidget {
  const CustomDoctorOfferButton(
      {Key? key, required this.text, this.textColor, this.gradient})
      : super(key: key);
  final String text;
  final Color? textColor;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      high: 40,
      decoration: BoxDecoration(
        gradient: gradient,
        border: Border.all(
          color: kSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      text: text,
      textColor: textColor ?? kSecondaryColor,
    );
  }
}

class DoctorOffersWidget extends StatelessWidget {
  const DoctorOffersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            S.of(context).doctor_offers,
            style: Styles.bodyText2.copyWith(
              color: Color(0xff323133),
              fontSize: 16,
            ),
          ),
          SpaceBox(
            height: 1.5,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 4 / 5,
            child: Text(
              'Lorem Ipsum Dolor Sit Amet, Consetetur Sadipscing Elitr, Sed Diam Nonumy Eirmod Tempor Invidunt Ut Labore Et Dolore Magna Aliquyam Erat, Sed Diam Voluptua',
              style: Styles.bodyText1.copyWith(
                color: Colors.black.withOpacity(.4),
              ),
              maxLines: 1,
            ),
          ),
          SpaceBox(
            height: 2,
          ),
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                child: CustomDoctorOfferButton(
                  text: S.of(context).details,
                ),
              ),
              SpaceBox(
                width: 1.5,
              ),
              Expanded(
                child: CustomDoctorOfferButton(
                  gradient: kLinearGradient,
                  textColor: Colors.white,
                  text: S.of(context).book,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

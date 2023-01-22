import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/custom_google_map_tap.dart';

import '../../../../core/utils/Assets.dart';
import '../../../../core/utils/size_config.dart';
import '../../../compare price/presentation/widgets/custom_compare_price_tap.dart';
import '../../../google_map/data/models/tap_model.dart';

class ServiceProviderTaps extends StatefulWidget {
  const ServiceProviderTaps({Key? key}) : super(key: key);

  @override
  State<ServiceProviderTaps> createState() => _ServiceProviderTapsState();
}

class _ServiceProviderTapsState extends State<ServiceProviderTaps> {
  int selectedIndex = 0;

  List<TapModel> taps = [
    TapModel(FontAwesomeIcons.borderAll, 'All'),
    TapModel(FontAwesomeIcons.hospital, 'Hospital '),
    TapModel(FontAwesomeIcons.prescriptionBottleMedical, 'lab'),
    TapModel(FontAwesomeIcons.stethoscope, 'pharmacy'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.defaultSize * 8,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: taps.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: CustomGoogleMapTap(
              isSelected: selectedIndex == index,
              text: taps[index].text,
              icon: taps[index].icon,
            ),
          );
        },
      ),
    );
  }
}

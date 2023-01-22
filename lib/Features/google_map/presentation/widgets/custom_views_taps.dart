import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/utils/functions/is_english.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../../../compare price/presentation/manger/cubit/compare_cubit.dart';
import '../../../services/presentation/manger/cubit/selected_services_cubit.dart';
import '../cubits/animated_switcher_controller.dart';
import 'custom_text_taps.dart';

class CustomViewTaps extends StatefulWidget {
  const CustomViewTaps(
      {super.key,
      required this.currentIndex,
      required this.animatedSwitchControoler});

  final int currentIndex;

  final AnimatedSwitchController animatedSwitchControoler;

  @override
  State<CustomViewTaps> createState() => _CustomViewTapsState();
}

class _CustomViewTapsState extends State<CustomViewTaps> {
  final List<String> taps = [
    S.current.map_view,
    S.current.list_view,
    S.current.check_box_view,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            children: [
              CustomContainerIcon(
                onChange: () {
                  Get.back();
                },
                backgrounColor: Colors.white,
                iconColor: kPrimaryColor,
                icon: isEnglish()
                    ? Icons.arrow_back_ios_new
                    : Icons.arrow_back_ios_outlined,
                size: SizeConfig.defaultSize * 5,
              ),
            ],
          ),
        ),
        SizedBox(
            height: 45,
            child: Center(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: taps.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          widget.animatedSwitchControoler.index = index;
                        },
                        child: CustomTextTap(
                          textColor: index == widget.currentIndex
                              ? Colors.white
                              : Colors.black,
                          text: taps[index],
                          backGroundColor: index == widget.currentIndex
                              ? kPrimaryColor
                              : Colors.white,
                        ),
                      ))),
            )),
      ],
    );
  }
}

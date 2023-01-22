import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class ServicesListItem extends StatefulWidget {
  const ServicesListItem({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;
  @override
  State<ServicesListItem> createState() => _ServicesListItemState();
}

class _ServicesListItemState extends State<ServicesListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          isSelected = false;
          BlocProvider.of<SelectedServicesCubit>(context)
              .deSelectService(SelectedServiceModel(widget.serviceModel, 1));
          setState(() {});
        } else {
          isSelected = true;
          BlocProvider.of<SelectedServicesCubit>(context).selectService(
            SelectedServiceModel(widget.serviceModel, 1),
          );

          setState(() {});
        }
      },
      child: AnimatedCrossFade(
        firstChild: SelectedService(
          text: (isEnglish()
                  ? widget.serviceModel.titleEn
                  : widget.serviceModel.title) ??
              '',
        ),
        secondChild: NotSelectedService(
          text: (isEnglish()
                  ? widget.serviceModel.titleEn
                  : widget.serviceModel.title) ??
              '',
        ),
        crossFadeState:
            isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}

class SelectedService extends StatelessWidget {
  const SelectedService({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffd7dbe2).withOpacity(.6),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Container(
                color: Colors.white,
                child: const Icon(
                  Icons.add,
                  color: kSecondaryColor,
                )),
          ),
          const SpaceBox(
            width: 1,
          ),
          const SpaceBox(
            width: 1,
          ),
          SizedBox(
            width: SizeConfig.defaultSize * 21,
            child: Text(
              text,
              maxLines: 2,
              style: Styles.bodyText1.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotSelectedService extends StatelessWidget {
  const NotSelectedService({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kSecondaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffd7dbe2).withOpacity(.6),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Colors.white,
                  border: Border.all(
                    color: kSecondaryColor,
                  )),
              child: const Icon(
                Icons.remove,
                color: kSecondaryColor,
              )),
          const SpaceBox(
            width: 1,
          ),
          const SpaceBox(
            width: 1,
          ),
          SizedBox(
            width: SizeConfig.defaultSize * 21,
            child: Text(
              text,
              maxLines: 2,
              style: Styles.bodyText1.copyWith(
                fontSize: 16,
                color: const Color(
                  0xff3A3A3A,
                ),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

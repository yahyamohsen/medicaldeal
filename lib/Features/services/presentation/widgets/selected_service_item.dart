import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/selected_service_count_bloc_builder.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import '../manger/cubit/selected_services_cubit.dart';
import 'custom_add_remove_button.dart';

class SelectedServiceItem extends StatelessWidget {
  const SelectedServiceItem(
      {Key? key, required this.selectedServiceModel, required this.itemIndex})
      : super(key: key);

  final SelectedServiceModel selectedServiceModel;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffd7dbe2).withOpacity(.6),
            blurRadius: 30,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.defaultSize * 21,
            child: Text(
              (isEnglish()
                      ? selectedServiceModel.serviceModel.titleEn
                      : selectedServiceModel.serviceModel.title) ??
                  '',
              maxLines: 2,
              style: Styles.bodyText1.copyWith(
                fontSize: 16,
                color: const Color(
                  0xff3A3A3A,
                ),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SpaceBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                onTap: () {
                  BlocProvider.of<SelectedServicesCubit>(context)
                      .deSelectService(selectedServiceModel);
                },
                width: SizeConfig.defaultSize * 10,
                high: SizeConfig.defaultSize * 4,
                text: S.of(context).delete,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffFE7979),
                    )),
                child: Center(
                  child: Text(
                    S.of(context).delete,
                    style: Styles.bodyText1.copyWith(
                      fontSize: 16,
                      color: const Color(0xffFE7979),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              AddorRemovePharmacy(
                  selectedServiceModel: selectedServiceModel,
                  itemIndex: itemIndex),
            ],
          ),
        ],
      ),
    );
  }
}

class AddorRemovePharmacy extends StatelessWidget {
  const AddorRemovePharmacy({
    Key? key,
    required this.selectedServiceModel,
    required this.itemIndex,
  }) : super(key: key);

  final SelectedServiceModel selectedServiceModel;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    var categoryType = Get.arguments ?? '';
    return Visibility(
      visible: categoryType == S.current.pharmacy ? true : false,
      child: Row(
        children: [
          const SpaceBox(
            width: 3,
          ),
          CustomAddRemoveButtom(
            isLeft: isEnglish() ? true : false,
            onTap: () {
              var count = selectedServiceModel.count;
              if (count > 1) {
                BlocProvider.of<SelectedServicesCubit>(context)
                    .decrementCount(itemIndex);
              }
            },
          ),
          const SpaceBox(
            width: 1,
          ),
          SelectedServiceCountBlocBuilder(
              selectedServiceModel: selectedServiceModel),
          const SpaceBox(
            width: 1,
          ),
          CustomAddRemoveButtom(
            onTap: () {
              BlocProvider.of<SelectedServicesCubit>(context)
                  .incrementCount(itemIndex);
            },
            isLeft: isEnglish() ? false : true,
          ),
        ],
      ),
    );
  }
}

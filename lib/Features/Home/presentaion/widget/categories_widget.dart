import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/services/presentation/manger/services_cubit/services_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/views/services_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'categories_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.defaultSize * 5.7 / 2 + 24, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).what_do_you_need,
            style: Styles.bodyText2.copyWith(
              color: kBLACK,
              fontSize: 20,
            ),
          ),
          const SpaceBox(
            height: 2,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(context, 1,
                          title: S.current.hospital);
                    },
                    text: S.of(context).hospital,
                    image: Assets.hospital,
                  ),
                  const SpaceBox(
                    width: 1.5,
                  ),
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(context, 7, title: S.current.doctor);
                    },
                    text: S.of(context).doctor,
                    image: Assets.doctor,
                  ),
                  const SpaceBox(
                    width: 1.5,
                  ),
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(context, 4,
                          title: S.current.pharmacy);
                    },
                    text: S.of(context).pharmacy,
                    image: Assets.pharmacy,
                  ),
                ],
              ),
              const SpaceBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(context, 5,
                          title: S.current.radiology);
                    },
                    text: S.of(context).radiology,
                    image: Assets.radiology,
                  ),
                  const SpaceBox(
                    width: 1.5,
                  ),
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(context, 2, title: S.current.lap);
                    },
                    text: S.of(context).lap,
                    image: Assets.lap,
                  ),
                  const SpaceBox(
                    width: 1.5,
                  ),
                  CategoryItem(
                    onTap: () {
                      fetchDataAndNavigate(
                        context,
                        6,
                        title: S.current.physical_therpay,
                      );
                    },
                    text: S.of(context).physical_therpay,
                    image: Assets.physicalTherpay,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void fetchDataAndNavigate(BuildContext context, id, {required String title}) {
    if (id == 1 || id == 7 || id == 6) {
      BlocProvider.of<ServicesCubit>(context)
          .fetchServicesByTypeId(id: id.toString());
    } else if (id != 4) {
      BlocProvider.of<ServicesCubit>(context).fetchServices(id: id.toString());
    } else {
      BlocProvider.of<ServicesCubit>(context).fetchMedicinesList();
    }
    Get.to(
      () => ServicesView(
        title: title,
      ),
      arguments: title,
    );
  }
}

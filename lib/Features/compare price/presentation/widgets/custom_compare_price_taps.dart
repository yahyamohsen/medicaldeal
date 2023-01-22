import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/manger/cubit/compare_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/utils/size_config.dart';
import '../../../check out/data/models/place_with_named_services.dart';
import '../../../check out/presentation/manger/cubit/checkout_cubit.dart';
import '../../../google_map/data/models/place_with_services_model.dart';
import '../../../services/models/service_model/service_model.dart';
import 'custom_compare_price_tap.dart';

class ComparePriceTaps extends StatefulWidget {
  const ComparePriceTaps({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;
  @override
  State<ComparePriceTaps> createState() => _ComparePriceTapsState();
}

class _ComparePriceTapsState extends State<ComparePriceTaps> {
  late int selectedIndex;
  late final ItemScrollController itemScrollController;

  @override
  void initState() {
    super.initState();
    initFields();

    Future.delayed(const Duration(milliseconds: 500), () {
      scrollToDefultIndex();
    });
  }

  void scrollToDefultIndex() {
    itemScrollController.scrollTo(
      index: selectedIndex,
      duration: const Duration(milliseconds: 300),
    );
  }

  void initFields() {
    selectedIndex = widget.selectedIndex;

    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var placesList = BlocProvider.of<PlacesCubit>(context).placesWithServices!;
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.defaultSize * 8,
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        padding: const EdgeInsets.all(0),
        itemCount: placesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
              var selectedServices =
                  BlocProvider.of<SelectedServicesCubit>(context)
                      .selectedServices;
              BlocProvider.of<CompareCubit>(context).updataData(
                placesList[selectedIndex].services,
                selectedServices,
                placesList[index],
              );
              BlocProvider.of<CheckoutCubit>(context)
                  .placesWithServices
                  .clear();
              BlocProvider.of<CheckoutCubit>(context)
                  .placesWithServices
                  .add(placesList[index]);
            },
            child: CustomComparePriceTap(
              isSelected: selectedIndex == index,
              text: (isEnglish()
                      ? placesList[index].placeModel.titleEn
                      : placesList[index].placeModel.title) ??
                  '',
              image: placesList[index].placeModel.image!,
            ),
          );
        },
      ),
    );
  }
}

getServices(PlaceWithServices placesList, context, List<int> ids) {
  var selectedServices =
      BlocProvider.of<SelectedServicesCubit>(context).selectedServices;

  List<ServiceModel> services = [];

  for (var service in selectedServices) {
    if (ids.contains(int.parse(service.serviceModel.id!))) {
      services.add(service.serviceModel);
    }
  }

  return services;
}

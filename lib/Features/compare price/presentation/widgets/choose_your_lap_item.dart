import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/check%20out/data/models/place_with_named_services.dart';
import 'package:sart_up_project/Features/check%20out/presentation/manger/cubit/checkout_cubit.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/constants.dart';

import '../../../google_map/presentation/widgets/service_item.dart';
import 'choose_your_lap_view_body.dart';
import 'custom_expantion_list_tile_indicator.dart';
import 'expanstion_title_widget.dart';
import 'expantion_list_tile_item.dart';

class ChooseYourLapItem extends StatefulWidget {
  const ChooseYourLapItem({
    Key? key,
    required this.placeModel,
    required this.services,
    this.onChanged,
    required this.selectedItemId,
  }) : super(key: key);

  final PlaceModel placeModel;
  final List<ServiceModel> services;
  final void Function(Object?)? onChanged;
  // radio button selected item
  final String selectedItemId;
  @override
  State<ChooseYourLapItem> createState() => _ChooseYourLapItemState();
}

class _ChooseYourLapItemState extends State<ChooseYourLapItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: widget.placeModel.id!,
          groupValue: widget.selectedItemId.toString(),
          onChanged: widget.onChanged,
          activeColor: kSecondaryColor,
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: kSecondaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: const BoxDecoration(
                gradient: kLinearGradient,
              ),
              child: ListTileTheme(
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    isExpanded = value;
                    setState(() {});
                  },
                  leading: ExpanstionTitleWidget(
                    isExpaned: isExpanded,
                    placeModel: widget.placeModel,
                  ),
                  trailing: FittedBox(
                    child: Row(
                      children: [
                        PriceWidget(
                          newPrice: widget.placeModel.sPdiscount,
                          oldPrice: widget.placeModel.price,
                          color: isExpanded ? Colors.black : Colors.white,
                        ),
                        CustomExpantionTileIconIndicator(
                          isExpanded: isExpanded,
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  iconColor: kBLACK,
                  collapsedIconColor: Colors.white,
                  tilePadding: const EdgeInsets.only(left: 12, right: 16),
                  title: const SizedBox(),
                  children: widget.services
                      .map((e) => ExpantionListTileItem(serviceModel: e))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kSecondaryColor,
      indent: 16,
      endIndent: 16,
      height: 5,
      thickness: .5,
    );
  }
}

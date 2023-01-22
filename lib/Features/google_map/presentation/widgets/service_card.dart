import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_view.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/manger/cubit/compare_cubit.dart';
import 'package:sart_up_project/Features/compare%20price/presentation/views/compare_price_view.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/google_map_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/service_item.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../check out/data/models/place_with_named_services.dart';
import '../../../check out/presentation/manger/cubit/checkout_cubit.dart';
import '../../../services/models/service_model/service_model.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {Key? key, required this.placeWithServices, required this.index})
      : super(key: key);

  final PlaceWithNamedServices placeWithServices;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffd7dbe2).withOpacity(.6),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        navigateToMapLocation(context);
                      },
                      child: ServiceItem(
                        placeModel: placeWithServices.placeModel,
                      )),
                  const SpaceBox(
                    height: 1,
                  ),
                  CustomButton(
                    onTap: () {
                      addItemToCheckoutCart(context, index, placeWithServices);
                      Get.to(
                        () => const CheckoutView(),
                        duration: kDurationTransion,
                      );
                    },
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kSecondaryColor,
                        ),
                        color: Colors.white),
                    text: S.of(context).choose,
                    textColor: kSecondaryColor,
                    backGroundColor: kPrimaryColor,
                    gradient: kLinearGradient,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // used to naviage to a place location on the map
  void navigateToMapLocation(BuildContext context) {
    var place = placeWithServices.placeModel;
    var location = LatLng(
      double.parse(place.locationLat!),
      double.parse(place.locationLng!),
    );
    BlocProvider.of<GoogleMapCubit>(context)
        .updateGoogleMapLocation(location, place);
  }

  // adds the selected item to the checkout cubit
  // first we are clearing the list cause we only need one item
  // then we are adding the item with the services[named] to it
  void addItemToCheckoutCart(BuildContext context, int index,
      PlaceWithNamedServices placeWithServices) {
    BlocProvider.of<CheckoutCubit>(context).placesWithServices.clear();
    BlocProvider.of<CheckoutCubit>(context)
        .placesWithServices
        .add(placeWithServices);
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
}

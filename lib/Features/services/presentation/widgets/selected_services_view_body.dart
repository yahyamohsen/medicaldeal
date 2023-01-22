import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/check_out_view.dart';
import 'package:sart_up_project/Features/check%20out/presentation/views/che_ckout_view_for_pharmacy.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/views/google_map_view.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/app_bar_left_curve_painter.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/app_bar_right_curve_painater.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/selected_service_item.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/selected_services_list.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/selected_services_list_bloc_builder.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_list.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/services_view_body.dart';
import 'package:sart_up_project/core/widgets/custom_general_button.dart';
import 'package:sart_up_project/generated/l10n.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/error_bar.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import 'custom_services_button.dart';

class SelectedServicesViewBody extends StatelessWidget {
  const SelectedServicesViewBody({Key? key, required this.title})
      : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBox(
          height: 2.5,
        ),
        Text(
          S.of(context).you_have_selected_this_services,
          style: Styles.bodyText2.copyWith(
            color: kBLACK,
          ),
        ),
        const SpaceBox(
          height: 2.5,
        ),
        const SelectedServicesList(),
        const SpaceBox(
          height: 1.5,
        ),
        CustomServicesViewButton(
          onTap: () {
            validatedSelectedServices(context);
          },
        ),
        const SpaceBox(
          height: 3,
        ),
      ],
    );
  }

  // making sure the user at least choosed one service before navigating
  void validatedSelectedServices(BuildContext context) {
    var selectedServices =
        bloc.BlocProvider.of<SelectedServicesCubit>(context).selectedServices;
    if (selectedServices.isNotEmpty) {
      if (S.current.pharmacy == title) {
        Get.to(
            () => CheckoutViewForPharmacy(
                  selectedServices: selectedServices,
                ),
            transition: Transition.fade);
      } else {
        List<int> servicesIds = getServicesIds(selectedServices);
        bloc.BlocProvider.of<PlacesCubit>(context).fetchPlacesByIds(
          ids: servicesIds,
          selectedServicesCubit:
              bloc.BlocProvider.of<SelectedServicesCubit>(context),
        );
        Get.to(() => const GoogleMapView(), transition: Transition.fade);
      }
    } else {
      errorBar(
        context,
        message: S.of(context).please_choose_at_least_one_service,
      );
    }
  }

  // looping over a list of services and getting their ids
  // notice that it would have been better to store the whole service not just the id
  // as we go through the app u will find that we also need the name of the services
  // which i didn't know at first
  // that caused for a lot more confusing operations than needed
  // should be refactored but currently i don't have enough time to do that
  // so hope you won't curse *_*
  List<int> getServicesIds(List<SelectedServiceModel> selectedServices) {
    List<int> servicesIds = [];
    for (var selectedService in selectedServices) {
      servicesIds.add(
        int.parse(selectedService.serviceModel.id!),
      );
    }
    return servicesIds;
  }
}

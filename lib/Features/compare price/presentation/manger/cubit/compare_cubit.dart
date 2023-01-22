import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sart_up_project/Features/check%20out/data/models/place_with_named_services.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';

part 'compare_state.dart';

class CompareCubit extends Cubit<CompareState> {
  CompareCubit() : super(CompareInitial());

  List<SelectedServiceModel> currentServices = [];

  // the initial id for the selected tap in compare price view
  // gets it's value from the index of the service card choosen
  int? defaultIndexOfTap;
  updataData(List<ServiceModel> ids, List<SelectedServiceModel> services,
      PlaceWithNamedServices placeWithServices) {
    List<SelectedServiceModel> currentServices = [];

    for (var service in services) {
      if (ids.contains(service.serviceModel)) {
        currentServices.add(service);
      }
    }

    emit(CompareDataUpdated(currentServices, placeWithServices));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sart_up_project/Features/check%20out/data/models/place_with_named_services.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/google_map/data/repositries/google_places_repo.dart';
import 'package:sart_up_project/Features/services/models/selected_service_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';

import '../../../../../core/Error/failures.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit(this.googlePlacesRepo) : super(PlacesInitial());

  final GooglePlacesRepo googlePlacesRepo;

  List<PlaceWithNamedServices>? placesWithServices;
  fetchPlacesByIds(
      {required List<int> ids,
      required SelectedServicesCubit selectedServicesCubit}) async {
    emit(PlacesLoading());
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var result = await googlePlacesRepo.fetchPlacesById(
      ids: ids,
      lat: 30.9977,
      long: 29.7432,
    );

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(PlacesNetworkFailure(failure.errMessage));
      } else {
        emit(PlacesFailure(failure.errMessage));
      }
    }, (places) {
      placesWithServices =
          groubServicesByPlaceAndAddPrice(places, selectedServicesCubit);
      emit(PlacesSuccess(placesWithServices: placesWithServices!));
    });
  }

  fetchByLatLong() async {
    emit(PlacesLoading());
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var result = await googlePlacesRepo.fetchPlacesByLocation(
        lat: location.latitude, long: location.longitude);

    result.fold((failure) {
      if (failure is NetWorkFailure) {
        emit(PlacesNetworkFailure(failure.errMessage));
      } else {
        emit(PlacesFailure(failure.errMessage));
      }
    }, (places) {
      emit(PlacesSuccess(places: places));
    });
  }

  // we are grouping the service by the place
  // every place contains more than one service
  // multible places might share the same service
  // that's why at firtst the selected service dosn't contain price
  // so we are adding the price to the selected services as well
  List<PlaceWithNamedServices> groubServicesByPlaceAndAddPrice(
      List<PlaceModel> places, SelectedServicesCubit selectedServicesCubit) {
    Map<PlaceModel, Set<ServiceModel>> data = {};

    for (var place in places) {
      if (data.containsKey(place)) {
        data[place]!
            .add(getService(place, selectedServicesCubit.selectedServices));
      } else {
        data[place] = {
          getService(place, selectedServicesCubit.selectedServices)
        };
      }
    }

    List<PlaceWithNamedServices> placesWithServices = [];
    data.forEach((key, value) {
      placesWithServices.add(PlaceWithNamedServices(key, value.toList()));
    });

    return placesWithServices;
  }
}

ServiceModel getService(
    PlaceModel place, List<SelectedServiceModel> selectedServices) {
  SelectedServiceModel? selectedServiceModel;

  for (var selectedService in selectedServices) {
    if (selectedService.serviceModel.id == place.servicesId) {
      selectedServiceModel = selectedService;
    }

    if (selectedServiceModel != null) {
      selectedServices.remove(selectedServiceModel);
      selectedServiceModel.serviceModel.price = double.parse(place.price!);
      selectedServiceModel.serviceModel.userDiscount =
          double.parse(place.userdiscount!);

      selectedServices.add(selectedServiceModel);
    }
  }

  return selectedServiceModel!.serviceModel;
}

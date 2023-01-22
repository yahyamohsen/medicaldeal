import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/services/models/service_model/service_model.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';

import '../../../check out/data/models/place_with_named_services.dart';
import '../../../check out/presentation/manger/cubit/checkout_cubit.dart';
import '../../../google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'choose_your_lap_item.dart';

class ChooseYourLapList extends StatefulWidget {
  const ChooseYourLapList({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseYourLapList> createState() => _ChooseYourLapListState();
}

class _ChooseYourLapListState extends State<ChooseYourLapList> {
  late String currentselectedItem;
  late List<PlaceWithNamedServices> placesList;
  @override
  void initState() {
    placesList = BlocProvider.of<PlacesCubit>(context).placesWithServices!;

    currentselectedItem = placesList[0].placeModel.id!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: placesList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ChooseYourLapItem(
            selectedItemId: currentselectedItem,
            onChanged: (value) {
              currentselectedItem = placesList[index].placeModel.id!;
              // clearing the list each time we are adding one
              // cause user is only allowed to choose one item only
              // this code should be refactored to work with only one item not a list
              addItemToCheckoutCart(context, index);

              setState(() {});
            },
            placeModel: placesList[index].placeModel,
            services: placesList[index].services,
          ),
        );
      },
    );
  }

  void addItemToCheckoutCart(BuildContext context, int index) {
    BlocProvider.of<CheckoutCubit>(context).placesWithServices.clear();
    BlocProvider.of<CheckoutCubit>(context)
        .placesWithServices
        .add(placesList[index]);
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

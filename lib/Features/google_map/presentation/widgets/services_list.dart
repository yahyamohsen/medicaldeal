import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/Auth/Presentation/manger/login_cubit/login_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/service_card.dart';

import '../../../../core/utils/size_config.dart';
import '../../../compare price/presentation/manger/cubit/compare_cubit.dart';
import '../../../services/presentation/manger/cubit/selected_services_cubit.dart';

class GoogleMapServicesList extends StatelessWidget {
  const GoogleMapServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesSuccess) {
          initFirstIteminListViewTap(context, state);
        }
      },
      builder: (context, state) {
        if (state is PlacesSuccess) {
          return SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.defaultSize * 29,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.placesWithServices!.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    index: index,
                    placeWithServices: state.placesWithServices![index],
                  );
                }),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  // this method is used to init the first item in the list view tap
  // we are choosing the first item in the list as the default choice
  void initFirstIteminListViewTap(BuildContext context, PlacesSuccess state) {
    var selectedServices =
        BlocProvider.of<SelectedServicesCubit>(context).selectedServices;
    BlocProvider.of<CompareCubit>(context).defaultIndexOfTap = 0;
    BlocProvider.of<CompareCubit>(context).updataData(
      state.placesWithServices![0].services,
      selectedServices,
      state.placesWithServices![0],
    );
  }
}

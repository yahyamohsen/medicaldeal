import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import '../widgets/custom_animated_view_switcher.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<PlacesCubit, PlacesState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is PlacesLoading ? true : false,
              progressIndicator: const CustomLoadingIndicator(),
              child: const CustomViewAnimatedSwitcher(),
            );
          },
        ),
      ),
    );
  }
}

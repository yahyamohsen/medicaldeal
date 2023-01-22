import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/nearest_me_filter_cubit.dart';

import '../widgets/custom_nearest_places_google_map.dart';
import '../widgets/near_places_view_body.dart';

class NearPlacesView extends StatelessWidget {
  const NearPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NearestMeFilterCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomNearestGoogleMap(),
        ),
      ),
    );
  }
}

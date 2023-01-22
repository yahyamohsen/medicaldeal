import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/Home/presentaion/views/home_view.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/google_map_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/services_list.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/custom_google_map.dart';
import 'package:sart_up_project/core/widgets/custom_search_text_field.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';

class GoogleMapViewBody extends StatelessWidget {
  const GoogleMapViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit(),
      child: Stack(
        children: const [
          CustomGoogleMap(),
          Positioned(
            bottom: 16,
            child: GoogleMapServicesList(),
          ),
        ],
      ),
    );
  }
}

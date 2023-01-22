import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';

import 'package:sart_up_project/Features/google_map/presentation/views/google_map_view.dart';
import 'package:sart_up_project/Features/google_map/presentation/views/near_places_view.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/cubits/location_cubit/location_cubit.dart';
import 'package:sart_up_project/core/utils/functions/check_location_permssion.dart';
import 'package:sart_up_project/core/utils/size_config.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';
import '../../styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    Key? key,
    this.onTap,
    this.hint,
    this.onChange,
    this.verticalPadding,
    this.suffixIcon,
    this.iconAction,
    this.onSubmitted,
    this.onPressed,
    this.suffixWidget,
  }) : super(key: key);

  final VoidCallback? onTap;

  final String? hint;

  final Widget? suffixWidget;
  final void Function(String?)? onChange;
  final double? verticalPadding;

  final void Function()? onPressed;
  final VoidCallback? iconAction;
  final IconData? suffixIcon;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: (verticalPadding ?? SizeConfig.defaultSize * 5.3) / 2 - 5,
          horizontal: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: suffixWidget ??
            CustomContainerIcon(
              onChange: iconAction,
              icon: suffixIcon,
              size: verticalPadding,
            ),
        hintText: hint ?? S.of(context).search_for_nearest_medical_service,
        hintStyle:
            Styles.bodyText1.copyWith(color: Colors.grey.withOpacity(.7)),
        prefixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.search,
            color: Color(0xff2E2E2E),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFD6D6D6),
            )),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFD6D6D6),
          ),
        ),
      ),
    );
  }
}

class CustomContainerIcon extends StatelessWidget {
  const CustomContainerIcon({
    Key? key,
    this.size,
    this.icon,
    this.iconColor,
    this.backgrounColor,
    this.onChange,
  }) : super(key: key);

  final VoidCallback? onChange;
  final double? size;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgrounColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onChange ??
            () {
              if (checkLocationPermission()) {
                BlocProvider.of<PlacesCubit>(context).fetchByLatLong();
                Get.to(() => const NearPlacesView());
              }
            },
        child: Container(
          height: size ?? SizeConfig.defaultSize * 5.3,
          width: size ?? SizeConfig.defaultSize * 5.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgrounColor ?? kPrimaryColor,
          ),
          child: Center(
            child: Icon(
              icon ?? Icons.near_me,
              size: 32,
              color: iconColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

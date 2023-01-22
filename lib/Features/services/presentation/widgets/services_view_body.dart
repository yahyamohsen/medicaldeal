import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/add_pharmacy_order_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/cubit/selected_services_cubit.dart';
import 'package:sart_up_project/Features/services/presentation/manger/search_controller.dart';
import 'package:sart_up_project/Features/services/presentation/views/selected_services_view.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/serves_list_bloc_builder.dart';
import 'package:sart_up_project/Features/services/presentation/widgets/text_search_result_widget.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/utils/functions/determine_transtion.dart';
import 'package:sart_up_project/core/utils/functions/pick_image.dart';
import 'package:sart_up_project/core/widgets/custom_search_text_field.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';
import 'package:sart_up_project/core/widgets/space_box.dart';
import 'package:sart_up_project/core/widgets/success_bar.dart';
import 'package:sart_up_project/generated/l10n.dart';
import 'package:sart_up_project/styles.dart';

import 'custom_services_button.dart';
import 'doctor_category_bottom_sheet.dart';

class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ServicesViewBody> createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
  late final SearchController searchController;

  @override
  void initState() {
    searchController = SearchController();
    searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBox(
          height: 2,
        ),
        CustomSearchTextField(
          suffixWidget: getWidget(),
          iconAction: () async {
            if (widget.title == S.current.pharmacy) {
              await pickPharmacyImage(context);
            } else {
              showDoctorBottomSheet(context);
            }
          },
          onChange: (value) {
            text = value ?? '';
          },
          onPressed: () {
            searchService(context);
          },
          suffixIcon: widget.title == S.current.pharmacy
              ? Icons.crop_free
              : Icons.filter_alt,
        ),
        const SpaceBox(
          height: 3,
        ),
        Text(
          S.of(context).select_your_services,
          style: Styles.bodyText2.copyWith(
            color: kBLACK,
            fontSize: 20,
          ),
        ),
        TextSearchResult(
          searchController: searchController,
          title: widget.title,
        ),
        const SpaceBox(
          height: 1.5,
        ),
        ServesListBlocBuilder(
          searchController: searchController,
          title: widget.title,
        ),
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
      Get.to(
        () => SelectedServicesView(
          title: widget.title,
        ),
        transition: determinTranstion(),
        arguments: widget.title,
      );
    } else {
      errorBar(
        context,
        message: S.of(context).please_choose_at_least_one_service,
      );
    }
  }

// used to display default suffex widget if we are displaying [dcotors , phrmacy]
// returnning null means that we are displaying the deafult suffex widget
// returnning Sized box means we want to display nothing
// check custom text field for more details
  SizedBox? getWidget() {
    return widget.title == S.current.doctor ||
            widget.title == S.current.pharmacy
        ? null
        : const SizedBox();
  }

// used to pick medical percipection image
// image will be upload to the medical api
  Future<void> pickPharmacyImage(BuildContext context) async {
    var result = await pickImageFromCamera();

    result.fold(
      (l) {
        errorBar(context, message: S.of(context).failed_to_pick_image);
      },
      (r) {
        sucessBar(context, message: S.current.picked_image_successfully);

        BlocProvider.of<AddPharmacyOrderCubit>(context).image = File(r.path);
        BlocProvider.of<AddPharmacyOrderCubit>(context).addPharmacyOrder();
      },
    );
  }

  void showDoctorBottomSheet(BuildContext context) {
    if (widget.title == S.current.doctor) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) {
            return DoctorCategoriesBottomSheet(
              searchController: searchController,
            );
          });
    }
  }

  void searchService(BuildContext context) {
    String title = widget.title;
    if (title == S.current.hospital ||
        title == S.current.doctor ||
        title == S.current.physical_therpay) {
      if (searchController.allProviders != null && text.isNotEmpty) {
        searchController.searchProviders(text);
      } else {
        errorBar(context, message: 'There is no data to search for');
      }
    } else {
      if (searchController.allServices != null && text.isNotEmpty) {
        searchController.searchServicesData(text);
      } else {
        errorBar(context, message: 'There is no data to search for');
      }
    }
  }
}

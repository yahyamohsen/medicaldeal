import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/google_map/data/models/location_pin_image_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/tap_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/filter_controller.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/custom_google_map_tap.dart';
import 'dart:math' as math;
import '../../../../core/utils/functions/get_images.dart';
import '../../../../core/utils/functions/get_localized_data.dart';
import '../../../../core/utils/size_config.dart';
import '../cubits/cubit/nearest_me_filter_cubit.dart';

class Filterlist extends StatefulWidget {
  final List<PlaceModel> places;
  final MapImageModel images;
  const Filterlist({super.key, required this.places, required this.images});
  @override
  State<Filterlist> createState() => _FilterlistState();
}

class _FilterlistState extends State<Filterlist> {
  int selectedIndex = 4;
  List<TapModel> taps = [
    TapModel(FontAwesomeIcons.houseChimneyMedical, 'Hospital'),
    TapModel(FontAwesomeIcons.flask, 'Lap'),
    TapModel(FontAwesomeIcons.prescriptionBottleMedical, 'Pharmacy'),
    TapModel(FontAwesomeIcons.stethoscope, 'Doctor'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.defaultSize * 11 / 1.8,
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                selectedIndex = taps.length;
                setState(() {});
                updateDate([...widget.places], widget.images, '4');
              },
              child: CustomGoogleMapTap(
                  isSelected: selectedIndex == taps.length, text: 'All')),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: taps.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});

                      updateDate([...widget.places], widget.images,
                          getId(taps[index].text));
                    },
                    child: CustomGoogleMapTap(
                      padding: 10,
                      icon: taps[index].icon,
                      text: taps[index].text,
                      isSelected: selectedIndex == index,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void updateDate(List<PlaceModel> places, MapImageModel images, String id) {
    Set<Marker> markers = {};

    for (var place in places) {
      var categoryId = place.categoryId;

      if (id != '4') {
        if (id == '7') {
          if (categoryId == '7' || int.parse(categoryId!) > 7) {
            addMarker(markers, place, images);
          }
        } else {
          if (categoryId == id) {
            addMarker(markers, place, images);
          }
        }
      } else {
        addMarker(markers, place, images);
      }
    }

    BlocProvider.of<NearestMeFilterCubit>(context).updateMarkers(markers);
  }

  void addMarker(Set<Marker> markers, PlaceModel place, MapImageModel images) {
    markers.add(
      Marker(
        markerId:
            MarkerId('${math.Random().nextDouble() * 256.0} ${DateTime.now()}'),
        position: LatLng(
          double.parse(place.locationLat!),
          double.parse(place.locationLng!),
        ),
        onTap: () {
          BlocProvider.of<NearestMeFilterCubit>(context).updatePlace(place);
          setState(() {});
        },
        infoWindow: InfoWindow(
          title: getLocalizedData(place.titleEn, place.title),
          snippet: getLocalizedData(place.addressEn, place.addressAr),
        ),
        icon: BitmapDescriptor.fromBytes(
          getImage(
            place.categoryId!,
            images,
          ),
        ),
      ),
    );
  }

  // returns the id of the category that was choosed
  String getId(String text) {
    if (text == 'Hospital') {
      return '1';
    } else if (text == 'Lap') {
      return '2';
    } else if (text == 'Pharmacy') {
      return '4';
    }

    return '7';
  }
}

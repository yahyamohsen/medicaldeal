import 'dart:async';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sart_up_project/Features/google_map/data/models/location_pin_image_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_model.dart';
import 'package:sart_up_project/Features/google_map/data/models/place_with_services_model.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/nearest_me_filter_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/filter_controller.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/places_cubit/places_cubit.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/Near_me_place_card.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/filter_list.dart';
import 'package:sart_up_project/Features/google_map/presentation/widgets/service_card.dart';
import 'package:sart_up_project/core/utils/Assets.dart';
import 'package:sart_up_project/core/utils/functions/image_to_location_icon.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';
import 'package:sart_up_project/core/widgets/custom_loading_indicator.dart';
import 'package:sart_up_project/generated/intl/messages_all.dart';

import '../../../../core/utils/functions/get_images.dart';
import '../../../../core/utils/functions/get_localized_data.dart';
import '../../../../core/utils/size_config.dart';

class CustomNearestGoogleMap extends StatefulWidget {
  const CustomNearestGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomNearestGoogleMap> createState() => _CustomNearestGoogleMap();
}

class _CustomNearestGoogleMap extends State<CustomNearestGoogleMap> {
  late GoogleMapController _controller;

  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(27.7137735, 85.315626),
    zoom: 14.476,
  );

  PlaceModel? placeWithServices;

  @override
  void initState() {
    super.initState();
    initMapImages();
  }

  Future<void> initMapImages() async {
    images.hospital = await convetImage(Assets.hospital);
    images.doctor = await convetImage(Assets.doctor);
    images.pharmacy = await convetImage(Assets.pharmacy);
    images.lap = await convetImage(Assets.lap);
    images.physicalTherpay = await convetImage(Assets.physicalTherpay);
    images.radiaolgy = await convetImage(Assets.radiology);
  }

  final Set<Marker> _markers = {};
  MapImageModel images = MapImageModel();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) async {
        if (state is PlacesSuccess) {
          if (state.places!.isNotEmpty) {
            initialPosition = CameraPosition(
              target: LatLng(
                double.parse(state.places!.first.locationLat!),
                double.parse(state.places!.first.locationLng!),
              ),
              zoom: 20,
            );
            _controller.animateCamera(
              CameraUpdate.newCameraPosition(
                initialPosition,
              ),
            );
            displayMarkers(state.places!);
          }
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is PlacesLoading ? true : false,
        progressIndicator: const CustomLoadingIndicator(),
        child: Stack(
          children: [
            BlocConsumer<NearestMeFilterCubit, NearestMeFilterState>(
              buildWhen: (previous, current) {
                if (current is NearestMeFilterDataUpdated) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                if (state is NearestMeFilterDataUpdated) {
                  if (state.markers.isNotEmpty) {
                    goToNewLocation(state.markers.first.position);
                  }
                }
              },
              builder: (context, state) => NearestMeGoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  markers:
                      BlocProvider.of<NearestMeFilterCubit>(context).markers!,
                  initialPosition: initialPosition),
            ),
            BlocBuilder<NearestMeFilterCubit, NearestMeFilterState>(
              buildWhen: (previous, current) {
                if (current is NearestMeFilterPlaceUpdated) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return PositionServiceCard();
              },
            ),
            Filterlist(
              places: state is PlacesSuccess ? state.places! : [],
              images: images,
            ),
          ],
        ),
      ),
    );
  }

  void displayMarkers(List<PlaceModel> placesWithServices) {
    for (var place in placesWithServices) {
      _markers.add(
        Marker(
          markerId: MarkerId(
              '${math.Random().nextDouble() * 256.0} ${DateTime.now()}'),
          position: LatLng(
            double.parse(place.locationLat!),
            double.parse(place.locationLng!),
          ),
          onTap: () {
            BlocProvider.of<NearestMeFilterCubit>(context).updatePlace(place);
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
    BlocProvider.of<NearestMeFilterCubit>(context).markers = {..._markers};
  }

  Future<Uint8List> convetImage(String image) async {
    return await convertImageToMapIcon(image, 100);
  }

  void goToNewLocation(postion) {
    CameraPosition cameraPosition = CameraPosition(
      target: postion,
      zoom: 30,
    );
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }
}

class NearestMeGoogleMap extends StatelessWidget {
  const NearestMeGoogleMap({
    Key? key,
    required Set<Marker> markers,
    required this.initialPosition,
    this.onMapCreated,
  })  : _markers = markers,
        super(key: key);

  final Set<Marker> _markers;
  final CameraPosition initialPosition;
  final Function(GoogleMapController)? onMapCreated;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      markers: _markers,
      mapType: MapType.normal,
      initialCameraPosition: initialPosition,
      onMapCreated: onMapCreated,
    );
  }
}

class PositionServiceCard extends StatelessWidget {
  const PositionServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<NearestMeFilterCubit>(context).placeModel != null
        ? Positioned(
            bottom: 0,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.defaultSize * 29,
              child: AbsorbPointer(
                absorbing: true,
                child: NearMePlaceServiceCard(
                  // this is just a random index you can remove it if you want

                  place: BlocProvider.of<NearestMeFilterCubit>(context)
                      .placeModel!,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

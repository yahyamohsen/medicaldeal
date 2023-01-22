import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/google_map_cubit.dart';

import '../utils/functions/is_english.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController _controller;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.476,
  );
  final Set<Marker> _markers = {};

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleMapCubit, GoogleMapState>(
      listener: (context, state) async {
        if (state is GoogleMapLocationUpdated) {
          goToNewLocation(state);
          _markers.add(
            Marker(
              markerId: MarkerId(state.placeModel.id.toString()),
              position: LatLng(
                double.parse(state.placeModel.locationLat!),
                double.parse(state.placeModel.locationLng!),
              ),
              infoWindow: InfoWindow(
                title: (isEnglish()
                    ? state.placeModel.titleEn!
                    : state.placeModel.title),
                snippet: (isEnglish()
                    ? state.placeModel.addressEn!
                    : state.placeModel.addressAr),
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        }
      },
      builder: (context, state) {
        return GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          markers: _markers,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
        );
      },
    );
  }

  void goToNewLocation(GoogleMapLocationUpdated state) {
    CameraPosition cameraPosition = CameraPosition(
      target: state.latLng,
      zoom: 14.476,
    );
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sart_up_project/Features/google_map/presentation/cubits/cubit/google_map_cubit.dart';
import 'package:sart_up_project/Features/service_provider/models/branche_model/branch_model.dart';
import 'package:sart_up_project/core/utils/functions/get_localized_data.dart';
import 'package:sart_up_project/core/utils/functions/is_english.dart';

class CustomBranchGoogleMap extends StatefulWidget {
  const CustomBranchGoogleMap({
    Key? key,
    required this.latLng,
    required this.branchModel,
    required this.branches,
  }) : super(key: key);

  final LatLng latLng;
  final BranchModel branchModel;
  final List<BranchModel> branches;
  @override
  State<CustomBranchGoogleMap> createState() => _CustomBranchGoogleMap();
}

class _CustomBranchGoogleMap extends State<CustomBranchGoogleMap> {
  late GoogleMapController _controller;

  late CameraPosition initialCameraPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: widget.latLng,
      zoom: 14.476,
    );

    for (var branch in widget.branches) {
      _markers.add(
        Marker(
          markerId: MarkerId(branch.id.toString()),
          position: LatLng(
            double.parse(branch.locationLat!),
            double.parse(branch.locationLng!),
          ),
          onTap: () {},
          infoWindow: InfoWindow(
            title: branch.city,
            snippet: getLocalizedData(
              branch.addressEn,
              branch.addressAr,
            ),
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
            Positioned(
              left: isEnglish() ? 0 : null,
              right: isEnglish() ? null : 0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
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

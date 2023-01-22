import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/models/place_model.dart';

class FilterController extends ChangeNotifier {
  // filterd markers Displayed on the map
  // defult is null
  // when null all markers all displayed
  Set<Marker>? _markers;

  // gets the markers
  Set<Marker>? get markers => _markers;

  // takes [markers] and then notify the listners if the value changed ;
  set markers(Set<Marker>? markers) {
    _markers = {...?markers};
    notifyListeners();
  }

  // place displayed on the map when any map icon is clicked
  // by default it's not visible on the ui
  PlaceModel? placeModel;

  // used to get the place dispalyed on the map when a map icon is clicked
  PlaceModel? get place => placeModel;

  // used to set the place displayed on the map when a map icon is clicke d
  set place(PlaceModel? place) {
    placeModel = place;
    notifyListeners();
  }
}

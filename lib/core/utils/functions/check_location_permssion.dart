import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

bool checkLocationPermission() {
  return Prefs.prefs.getBool(kLocationPermssionStatus) ?? false;
}

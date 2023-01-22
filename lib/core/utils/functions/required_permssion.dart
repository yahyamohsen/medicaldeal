import 'package:permission_handler/permission_handler.dart';
import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';

void requirstLocationPermssion() async {
  var permssioResult = await Permission.location.request();
  if (permssioResult.isGranted) {
    Prefs.prefs.setBool(kLocationPermssionStatus, true);
  } else {
    Prefs.prefs.setBool(kLocationPermssionStatus, false);
  }
}

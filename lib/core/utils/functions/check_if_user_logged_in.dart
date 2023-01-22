import 'package:sart_up_project/constants.dart';
import 'package:sart_up_project/core/singleton/shared_prefrence_singleton.dart';
import 'package:sart_up_project/core/widgets/error_bar.dart';

bool isUserLoggedIn(context) {
  if (Prefs.prefs.containsKey(kToken)) {
    return true;
  }

  errorBar(context, message: 'Please Log in First');
  return false;
}

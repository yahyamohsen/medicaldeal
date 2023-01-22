import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'is_english.dart';

Transition determinTranstion() {
  return isEnglish() ? Transition.rightToLeft : Transition.leftToRight;
}

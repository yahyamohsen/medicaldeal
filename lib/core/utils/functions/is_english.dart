import 'package:get/get.dart';

bool isEnglish() {
  if (Get.locale!.languageCode == 'en') return true;
  return false;
}

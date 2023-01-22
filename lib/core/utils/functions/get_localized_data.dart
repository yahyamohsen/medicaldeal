import 'is_english.dart';

String getLocalizedData(String? english, String? arabic) {
  return (isEnglish() ? english : arabic) ?? '';
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../../../../../core/singleton/shared_prefrence_singleton.dart';
import '../../../../../generated/l10n.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void updateLangugae(String locale) {
    var languageCode = locale.substring(0, 2);

    Get.updateLocale(
      Locale(languageCode),
    );
    Prefs.prefs.setString(
      kLanguageCode,
      languageCode,
    );
    S.load(Locale(languageCode));
  }
}

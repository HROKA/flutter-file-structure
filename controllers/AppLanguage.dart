import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../utils/index.dart';

class AppLanguageController extends GetxController {
  var appLocale = window.locale.toString().split('_')[0];
  LocalStorage localStorage = LocalStorage();

  @override
  void onInit() async {
    super.onInit();
    var languageCode = await localStorage.getFromStorage(key: LANGUAGE_KEY);
    appLocale = languageCode == null ? appLocale : languageCode;
    print('\x1B[33m App Language: $appLocale');
    Get.updateLocale(Locale(appLocale));
    update();
  }

  void changeLanguage() {
    appLocale = appLocale == ARABIC_VALUE ? ENGLISH_VALUE : ARABIC_VALUE;
    localStorage.saveToStorage(key: LANGUAGE_KEY, value: appLocale);
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import './screens/index.dart';
import '../controllers/AppLanguage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icons' color
  ));
  await GetStorage.init();
  Get.put(AppLanguageController());
  runApp(MyApp());
}

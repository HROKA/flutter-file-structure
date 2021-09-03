import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geolocator/geolocator.dart';

import '../index.dart';

final AppLanguageController appLanguageController =
    Get.find<AppLanguageController>();

/// get current location
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    print('Location services are disabled.');
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      print('Location permissions are denied');
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    print(
        'Location permissions are permanently denied, we cannot request permissions.');
    return null;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

// stop loading spinner
dismissLoading() {
  SmartDialog.dismiss();
}

/// return the result as current language
languageCondition(var arabicValue, var englishValue) {
  return appLanguageController.appLocale == ARABIC_VALUE
      ? arabicValue
      : englishValue;
}

/// print request error in debug console
printRequestError({error, time}) {
  print('🛑 \x1B[31m ******** Request Error ********* 🛑');
  print('\x1B[35m Time : \x1B[37m $time  \x1B[33m milliseconds');
  print('\x1B[35m Response :\x1B[37m $error');
  print(' \x1B[31m ************* END ************** ');
}

/// print successes response in debug console
printSuccessesResponse({response, time}) {
  print('📗\x1B[32m ******** Successe Request **********📗');
  print('\x1B[35m Time : \x1B[37m $time  \x1B[33m milliseconds');
  print('\x1B[35m Response :\x1B[37m $response');
  print('\x1B[32m  *************** END **************');
}

/// print request details
showRequestDetails({
  methoud,
  path,
  body,
}) {
  print('📘\x1B[36m ******** Request Details **********📘');
  print('\x1B[35m Full URL: \x1B[37m $BASE_URL$path');
  print('\x1B[35m Methoud: \x1B[37m $methoud');
  print('\x1B[35m Path: \x1B[37m $path');
  print('\x1B[35m Body: \x1B[37m $body');
  print('\x1B[36m  *************** END **************');
}

/// show alert
showMessage({
  String description,
  String type,
  int textColor,
  bool withBackground: false,
}) {
  Get.snackbar(
    'alert'.tr,
    description,
    titleText: HorizontalTypography(
      // style: TypographyStyles().defaultStyle().copyWith(
      //       fontColor: textColor == null ? Colors.yellow : textColor,
      //     ),
      // languageCondition(Alignment.topRight, Alignment.topLeft)
      text: 'alert'.tr,
    ),
    backgroundColor: withBackground ? Colors.white60 : null,
    barBlur: 2,
    overlayBlur: .5,
  );
}

/// start loading spinner
startLoading() {
  SmartDialog.showLoading(
    msg: '',
    maskColorTemp: Colors.black54,
    // clickBgDismissTemp: true,
    // widget: CircularProgressIndicator(
    //   strokeWidth: 5,
    //   valueColor: AlwaysStoppedAnimation(Colors.green),
    // ),
    // widget: Image.asset(
    //   BALL_GIF_IMAGE,
    //   width: DEVICE_WIDTH * 0.5,
    //   height: DEVICE_WIDTH * 0.5,
    // ),
  );
}

import 'dart:async';

import 'package:common_ui_toolkit/components/common_container/CommonContainer.dart';
import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';
import '../screens/index.dart';

class SplashScreen extends StatelessWidget {
  final MyAppController _myAppController = Get.find<MyAppController>();

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Get.offNamed(
      _myAppController.userData == null || _myAppController.userData.isEmpty
          ? SIGNUP_ROUTE
          : HOME_ROUTE,
    );
  }

  @override
  Widget build(BuildContext context) {
    startTime();
    return Stack(children: [
      CommonContainer(
        style: CommonContainerModel(
          width: DEVICE_WIDTH,
          height: DEVICE_HEIGHT,
          backgroundColor: Constants.WHITE_COLOR,
        ),
      ),
      Positioned(
        top: DEVICE_HEIGHT * 0.4,
        right: 0,
        left: 0,
        child: SvgPicture.asset(
          LOGO_ICON,
          width: DEVICE_WIDTH * 0.4,
          height: DEVICE_WIDTH * 0.4,
        ),
      ),
    ]);
  }
}

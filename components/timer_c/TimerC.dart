import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';

class TimerC extends StatelessWidget {
  Function onTimerFinish;
  CountdownController controller;

  int seconds;
  CommonContainerModel containerStyle;

  TimerC({
    @required this.controller,
    this.onTimerFinish,
    this.seconds = 60,
    this.containerStyle,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => {controller.start()});
    return CommonContainer(
      style: containerStyle,
      child: Countdown(
        controller: controller,
        seconds: seconds,
        build: (_, double time) => CommonText(
          style: CommonTextStyles().h4Style().copyWith(
                fontSize: H4_FONT,
                fontColor: Constants.BLACK_COLOR,
              ),
          text:
              '${(time ~/ 60).toString().padLeft(2, '0')}:${((time % 60).toInt()).toString().padLeft(2, '0')} ' +
                  'min'.tr,
        ),
        interval: Duration(milliseconds: 1000),
        onFinished: () {
          onTimerFinish();
        },
      ),
    );
  }
}

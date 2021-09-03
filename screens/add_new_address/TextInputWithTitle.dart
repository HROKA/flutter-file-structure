import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class TextInputWithTitle extends StatelessWidget {
  String title, keyboardType;

  TextInputController controller;

  TextInputWithTitle({
    this.title,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputC(
      textInputController: controller,
      headerHint: title,
      underlineColor: BLUE2_COLOR,
      underlineThikness: 3.0,
      marginBottom: DEVICE_HEIGHT * 0.018,
      isRequired: false,
      marginTop: DEVICE_HEIGHT * 0.018,
      withHintAbove: true,
      underlined: true,
      inputType: keyboardType,
    );
  }
}

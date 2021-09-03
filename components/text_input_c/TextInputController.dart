import 'package:flutter/widgets.dart';

import '../../index.dart';

class TextInputController extends GetxController {
  TextEditingController textEditingController;
  var suffixIcon;
  String _text;
  int maxLength;
  // This value is set to true when text matches the criteria of the TextInputField
  bool isContentVerified, isEnable, isReadOnly;

  TextInputController({
    String text = '',
    this.suffixIcon,
    this.isContentVerified = false,
    this.isEnable = true,
    this.isReadOnly = false,
    this.maxLength = 10,
  }) : _text = text;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController(text: _text);
  }

  changeEnableState(isEnable) {
    this.isEnable = isEnable;
    update();
  }

  clearText() {
    textEditingController.text = '';
    suffixIcon = null;
    isContentVerified = false;
    isEnable = true;
    update();
  }

  void setSuffixIcon(IconData suffixIcon) {
    this.suffixIcon = suffixIcon;
    update();
  }

  void setText(String text) {
    textEditingController.text = text;
  }

  String getText() => textEditingController.text;
}

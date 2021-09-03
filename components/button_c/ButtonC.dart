import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/ButtonCStyles.dart';
import '../../utils/Constants.dart' as Constant;
import '../index.dart';

class ButtonC extends StatelessWidget {
  CommonContainerModel style;
  Function onPress;
  String title;
  ButtonController buttonController;
  bool withEffect;
  Widget child;
  CommonTextModel titleStyle;

  ButtonC({
    this.style,
    this.buttonController,
    this.title,
    this.onPress,
    this.withEffect = false,
    this.child,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    style = style ?? ButtonCStyles().defaultStyle;
    buttonController = buttonController ?? ButtonController();
    titleStyle = titleStyle ?? CommonTextStyles().h3Style();

    return GetBuilder<ButtonController>(
      init: buttonController,
      global: false,
      builder: (controller) => CommonContainer(
        style: style,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: withEffect
                ? MaterialStateProperty.resolveWith(
                    (states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.black12
                          : null;
                    },
                  )
                : null,
            backgroundColor: MaterialStateProperty.all(Color(
              controller.isEnabled
                  ? style.backgroundColor
                  : Constant.DISABLED_COLOR,
            )),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(style.borderRaduis),
              ),
            ),
          ),
          onPressed: controller.isEnabled
              ? () {
                  if (onPress != null) {
                    onPress();
                  }
                }
              : null,
          child: child ??
              Text(
                title,
                style: TextStyle(
                  fontSize: titleStyle.fontSize,
                  color: Color(titleStyle.fontColor),
                  fontWeight: titleStyle.fontweight,
                ),
              ),
        ),
      ),
    );
  }
}

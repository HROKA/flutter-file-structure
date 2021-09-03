import 'package:common_ui_toolkit/components/common_container/CommonContainer.dart';
import 'package:common_ui_toolkit/index.dart';
import 'package:common_ui_toolkit/models/index.dart';
import 'package:flutter/material.dart';

import '../../styles/TypographyStyles.dart';
import '../../utils/index.dart';

class HorizontalTypography extends StatelessWidget {
  Widget child;
  String text;

  // You can send a child ot text or both.
  HorizontalTypography({
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonContainer(style: badgeContainerStyle()),
        SizedBox(width: DEVICE_WIDTH * 0.01),
        if (text != null)
          CommonText(
            style: TypographyStyles().boldTypography(),
            text: text,
          ),
        if (child != null) child,
        SizedBox(width: DEVICE_WIDTH * 0.01),
        CommonContainer(style: badgeContainerStyle()),
      ],
    );
  }

  badgeContainerStyle() => CommonContainerModel(
        borderRaduis: 10.0,
        width: DEVICE_WIDTH * 0.1,
        height: DEVICE_HEIGHT * 0.01,
        backgroundColor: BLUE_COLOR,
      );
}

import 'package:common_ui_toolkit/index.dart';

import '../../utils/index.dart';

class ButtonCStyles {
  CommonContainerModel defaultStyle = CommonContainerModel(
    backgroundColor: PRIMARY_COLOR,
    width: 0.85,
    borderRaduis: 23,
    height: DEVICE_HEIGHT * 0.055,
  );
  CommonContainerModel buttonIconStyle() => defaultStyle.copyWith(
        width: 0.6,
      );

  CommonContainerModel cardButtonStyle() => defaultStyle.copyWith(
        width: 0.35,
      );

  CommonContainerModel orderButtonStyle() => defaultStyle.copyWith(
        width: 0.25,
        height: 0.05,
      );

  CommonContainerModel orderCancelButtonStyle() => orderButtonStyle().copyWith(
        backgroundColor: GERY5_COLOR,
      );
  CommonContainerModel walletButtonStyle() => buttonIconStyle().copyWith(
        backgroundColor: BLUE_COLOR,
      );
}

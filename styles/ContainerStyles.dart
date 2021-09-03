import 'package:common_ui_toolkit/index.dart';

import '../../utils/Constants.dart' as Constants;
import '../utils/index.dart';

class ContainerStyles {
  CommonContainerModel defualtCategoryItemStyle() =>
      CommonContainerStyle().fullShadow.copyWith(
            width: 0.17,
            height: 0.16,
            borderRaduis: 60,
            shadowbBlurRadius: 6.0,
            marginHorizontal: DEVICE_WIDTH * 0.013,
            touchEffect: TouchableEffect(
              type: TouchTypes.opacity,
            ),
          );

  CommonContainerModel selectedCategoryItemStyle() =>
      defualtCategoryItemStyle().copyWith(
        backgroundColor: PRIMARY_COLOR,
      );

  CommonContainerModel categoryContainerStyle = CommonContainerModel(
    height: DEVICE_HEIGHT * 0.15,
    marginTop: DEVICE_HEIGHT * 0.02,
    touchEffect: TouchableEffect(
      type: TouchTypes.opacity,
    ),
  );

  CommonContainerModel screenShadowContainerStyle() =>
      CommonContainerStyle().bottomShadow.copyWith(
            height: 0.9,
            width: DEVICE_WIDTH,
            paddingTop: DEVICE_HEIGHT * 0.06,
            shadowOffsetDY: 20.0,
            shadowSpreadRadius: -15.0,
            shadowOpacity: 0.1,
            shadowbBlurRadius: 20.0,
          );

  CommonContainerModel textContainerStyle() => CommonContainerModel(
        paddingVertical: DEVICE_HEIGHT * 0.05,
      );

  CommonContainerModel addressCardStyle() =>
      CommonContainerStyle().fullShadow.copyWith(
            width: DEVICE_WIDTH,
            height: DEVICE_HEIGHT * 0.14,
            marginVertical: DEVICE_HEIGHT * 0.015,
          );

  CommonContainerModel deliveryScreenStyle() => CommonContainerModel(
        width: DEVICE_WIDTH * 0.6,
        backgroundColor: PRIMARY_COLOR,
        borderRaduis: 20.0,
        marginVertical: DEVICE_HEIGHT * 0.1,
      );

  CommonContainerModel pickupContainerStyle() => CommonContainerModel(
        backgroundColor: Constants.WHITE_COLOR,
        paddingHorizontal: DEVICE_WIDTH * 0.05,
        height: DEVICE_HEIGHT * 0.08,
      );

  CommonContainerModel addressContainerStyle() => CommonContainerModel(
        width: DEVICE_WIDTH * 0.85,
        marginBottom: DEVICE_HEIGHT * 0.02,
        borderRaduis: 20.0,
        paddingVertical: DEVICE_HEIGHT * 0.01,
        paddingHorizontal: DEVICE_WIDTH * 0.01,
        backgroundColor: Constants.WHITE_COLOR,
      );
}

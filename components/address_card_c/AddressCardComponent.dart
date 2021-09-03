import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../index.dart';
import '../../utils/index.dart';

class AddressCard extends StatelessWidget {
  bool isDelivery, istarking;
  String title, address, orderMethod, date, time;

  Function onTap;
  AddressCard({
    this.istarking = false,
    this.isDelivery = false,
    this.title,
    this.onTap,
    this.address,
    this.orderMethod,
    this.date,
    this.time,
  });

  CommonTextModel getTextStyle() {
    CommonTextModel style = CommonTextStyles().h3Style().copyWith(
          fontColor: isDelivery
              ? BLUE2_COLOR
              : istarking
                  ? BLACK1_COLOR
                  : PURPLE_COLOR,
          fontSize: isDelivery || istarking ? 16.0 : H3_FONT,
          textAlign: TextAlign.start,
        );
    return style;
  }

  CommonContainerModel getContainerStyle() {
    CommonContainerModel style = CommonContainerModel(
      width: DEVICE_WIDTH * 0.67,
      alignment: languageCondition(Alignment.centerRight, Alignment.centerLeft),
      marginLeft:
          isDelivery ? languageCondition(0.0, DEVICE_WIDTH * 0.08) : 0.0,
      marginRight:
          isDelivery ? languageCondition(DEVICE_WIDTH * 0.08, 0.0) : 0.0,
    );
    return style;
  }

  @override
  Widget build(BuildContext context) {
    return CommonTouchable(
      onTap: () {
        onTap();
      },
      touchEffect: TouchableEffect(
        type: TouchTypes.scaleAndFade,
        lowerBound: 0.95,
      ),
      child: Stack(
        children: [
          CommonContainer(
            style: ContainerStyles().addressCardStyle().copyWith(
                  width: istarking ? DEVICE_WIDTH * 0.85 : DEVICE_WIDTH,
                ),
            child: Row(
              children: [
                CommonContainer(
                  style: CommonContainerModel(
                    marginLeft: isDelivery
                        ? 0.0
                        : languageCondition(0.0, DEVICE_WIDTH * 0.08),
                    marginRight: isDelivery
                        ? 0.0
                        : languageCondition(DEVICE_WIDTH * 0.08, 0.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        style: TypographyStyles()
                            .addressCardHeaderStyle()
                            .copyWith(
                              fontSize: isDelivery ? HEADER_FONT : H2_FONT,
                            ),
                        containerStyle: CommonContainerModel(
                          marginBottom: languageCondition(
                              DEVICE_HEIGHT * 0.007, DEVICE_HEIGHT * 0.01),
                        ),
                        iconPath: isDelivery ? LOCATION_ICON : null,
                        text: istarking ? 'order_no'.tr + title : title,
                      ),
                      CommonText(
                        style: getTextStyle(),
                        text: istarking
                            ? 'order_method'.tr + orderMethod
                            : address,
                        containerStyle: getContainerStyle(),
                      ),
                      Visibility(
                        visible: istarking,
                        child: CommonText(
                          style: getTextStyle(),
                          text: 'date_and_time'.tr + "$date - $time",
                          containerStyle: getContainerStyle().copyWith(
                            marginTop:
                                languageCondition(0.0, DEVICE_HEIGHT * 0.01),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !istarking,
                  child: RotatedBox(
                    quarterTurns: languageCondition(2, 0),
                    child: SvgPicture.asset(ARROW_ICON),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: languageCondition(null, DEVICE_WIDTH * 0.001),
            right: languageCondition(DEVICE_WIDTH * 0.001, null),
            top: DEVICE_HEIGHT * 0.008,
            child: Visibility(
              visible: !isDelivery && !istarking,
              child: SvgPicture.asset(
                LINE_ICON,
                height: DEVICE_HEIGHT * 0.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

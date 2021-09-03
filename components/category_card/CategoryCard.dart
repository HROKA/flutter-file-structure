import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../index.dart';
import '../../utils/Constants.dart' as Constant;

class CategoryCard extends StatelessWidget {
  String title, subTitle, image;

  Function onPress;

  CategoryCard({
    this.title,
    this.subTitle,
    this.image,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      style: ContainerStyles().categoryContainerStyle,
      child: Stack(
        children: [
          CommonContainer(
            style: CommonContainerModel(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0x3F000000),
                      Color(0x3F000000),
                      Color(0x3F000000),
                      Color(0x7C000000),
                      Color(0x3F000000),
                    ],
                    stops: [
                      0.0,
                      0.25,
                      0.5,
                      0.75,
                      1.0
                    ]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(languageCondition(34.0, 15.0)),
                  bottomRight: Radius.circular(languageCondition(15.0, 34.0)),
                ),
              ),
              width: DEVICE_WIDTH * 0.9,
              topLeftRadius: 15.0,
              topRightRadius: 15.0,
              bottomLeftRadius: languageCondition(34.0, 15.0),
              bottomRightRadius: languageCondition(15.0, 34.0),
              backgroundImage: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            child: Row(
              children: [
                CommonText(
                  text: title,
                  style: TypographyStyles().categoryTypography(),
                ),
              ],
            ),
            top: DEVICE_HEIGHT * 0.03,
            left: DEVICE_WIDTH * 0.05,
            right: DEVICE_WIDTH * 0.05,
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: subTitle,
                  style: CommonTextStyles().h4Style().copyWith(
                        fontColor: Constant.WHITE_COLOR,
                      ),
                ),
                SvgPicture.asset(
                  languageCondition(LEFT_ARROW_ICON, RIGHT_ARROW_ICON),
                )
              ],
            ),
            bottom: DEVICE_HEIGHT * 0.03,
            left: DEVICE_WIDTH * 0.05,
            right: DEVICE_WIDTH * 0.05,
          )
        ],
      ),
    );
  }
}

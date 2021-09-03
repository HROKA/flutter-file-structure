import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../index.dart';

class ProductCard extends StatelessWidget {
  String image, title, description, price;
  Function onTap;

  ProductCard({
    this.image =
        "https://natashaskitchen.com/wp-content/uploads/2019/04/Best-Burger-4.jpg",
    this.title,
    this.description,
    this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: () {
        onTap();
      },
      style: ContainerStyles().addressCardStyle().copyWith(
            width: DEVICE_WIDTH * 0.9,
            height: DEVICE_HEIGHT * 0.18,
            marginVertical: DEVICE_HEIGHT * 0.01,
            marginHorizontal: DEVICE_WIDTH * 0.015,
            touchEffect: TouchableEffect(
              type: TouchTypes.opacity,
            ),
          ),
      child: Row(
        children: [
          CommonContainer(
            style: CommonContainerModel(
              height: DEVICE_HEIGHT * 0.18,
              width: DEVICE_WIDTH * 0.3,
              topLeftRadius: languageCondition(0.0, 20.0),
              topRightRadius: languageCondition(20.0, 0.0),
              bottomLeftRadius: languageCondition(0.0, 20.0),
              bottomRightRadius: languageCondition(20.0, 0.0),
              backgroundImage: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          CommonContainer(
            style: CommonContainerModel(
              width: DEVICE_WIDTH * 0.53,
              marginVertical: DEVICE_HEIGHT * 0.008,
              marginHorizontal: DEVICE_WIDTH * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  containerStyle: CommonContainerModel(
                    marginBottom: languageCondition(
                        DEVICE_HEIGHT * 0.003, DEVICE_HEIGHT * 0.015),
                  ),
                  style: CommonTextModel(
                    fontColor: PURPLE_COLOR,
                    fontweight: FontWeight.bold,
                    fontSize: H3_FONT,
                    textAlign: TextAlign.start,
                    maxlines: 1,
                  ),
                  text: title,
                ),
                CommonText(
                  style: CommonTextModel(
                    fontColor: BLUE_COLOR,
                    fontSize: 14.0,
                    textAlign: TextAlign.start,
                    maxlines: 2,
                    height: 1.2,
                  ),
                  text: description,
                ),
                Align(
                  alignment: languageCondition(
                      Alignment.bottomLeft, Alignment.bottomRight),
                  child: ButtonC(
                    style: CommonContainerModel(
                      height: DEVICE_HEIGHT * 0.04,
                      width: DEVICE_WIDTH * 0.3,
                      backgroundColor: PRIMARY_COLOR,
                      borderRaduis: 20.0,
                      marginTop: languageCondition(
                        DEVICE_HEIGHT * 0.002,
                        DEVICE_HEIGHT * 0.015,
                      ),
                    ),
                    child: CommonText(
                      rightChild: CommonContainer(
                        style: CommonContainerModel(
                          marginHorizontal: 2,
                        ),
                        child: languageCondition(SvgPicture.asset(CART_ICON),
                            SvgPicture.asset(FLIPPED_CART_ICON)),
                      ),
                      style: CommonTextModel(
                        fontSize: 14.0,
                        fontweight: FontWeight.bold,
                      ),
                      text: price + "SR",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

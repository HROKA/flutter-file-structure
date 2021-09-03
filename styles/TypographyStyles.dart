import 'package:common_ui_toolkit/index.dart';

import '../index.dart';
import '../utils/Constants.dart' as Constant;

class TypographyStyles {
  CommonTextModel defaultStyle() => CommonTextModel(
        fontColor: Constant.PRIMARY_COLOR,
        fontSize: 17.0,
        fontweight: FontWeight.normal,
        decoration: TextDecoration.none,
        textAlign: TextAlign.start,
      );

  CommonTextModel boldTypography() => CommonTextStyles().h3Style().copyWith(
        fontweight: FontWeight.bold,
        fontColor: Constant.BLUE_COLOR,
      );

  CommonTextModel categoryTypography() => CommonTextStyles().h2Style().copyWith(
        fontweight: FontWeight.bold,
        fontColor: Constant.PRIMARY_COLOR,
      );
  CommonTextModel headerStyle() => CommonTextStyles().h1Style().copyWith(
        fontweight: FontWeight.bold,
        fontColor: Constant.BLUE_COLOR,
      );
  CommonTextModel bodyTextStyle() => CommonTextStyles().h2Style().copyWith(
        fontColor: Constant.BLACK_COLOR,
        fontSize: 20,
      );

  CommonTextModel addressCardHeaderStyle() =>
      CommonTextStyles().headerStyle().copyWith(
            fontweight: FontWeight.bold,
            fontColor: Constant.PURPLE_COLOR,
            iconColor: Constant.PRIMARY_COLOR,
            iconMarginHorizontal: 6.0,
          );

  CommonTextModel deliveryScreenStyle() => CommonTextModel(
        fontSize: 22.0,
        fontColor: PURPLE_COLOR,
        fontweight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  CommonTextModel defaultCategoryItemStyle() => CommonTextModel(
        fontSize: H3_FONT,
        fontColor: Constant.BLUE_COLOR,
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        fontweight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  CommonTextModel categoriesScreenStyle() => CommonTextModel(
        fontSize: H2_FONT,
        fontColor: PURPLE_COLOR,
        fontStyle: FontStyle.italic,
        fontweight: FontWeight.bold,
      );
}

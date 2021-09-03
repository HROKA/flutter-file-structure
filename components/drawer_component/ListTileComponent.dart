import 'package:common_ui_toolkit/index.dart';
import 'package:common_ui_toolkit/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../index.dart';
import '../../utils/Constants.dart' as Constants;

class listTileWidget extends StatelessWidget {
  String title, icon, path;

  listTileWidget({@required this.icon, @required this.title, this.path});
  final MyAppController _myAppController = Get.find<MyAppController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: CommonText(
        text: title,
        style: CommonTextModel(
          fontSize: 18.0,
        ),
        containerStyle: CommonContainerModel(
            alignment: languageCondition(
          Alignment.topRight,
          Alignment.topLeft,
        )),
      ),
      leading: path == LOG_OUT_ROUTE
          ? Icon(
              Icons.logout,
              color: Color(
                Constants.BLUE_COLOR,
              ),
            )
          : SvgPicture.asset(
              icon,
            ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: DEVICE_WIDTH * 0.055,
      ),
      horizontalTitleGap: 8.0,
      onTap: () {
        Navigator.pop(context);

        if (path == LANGUAGE_ROUTE) {
          appLanguageController.changeLanguage();
          Get.updateLocale(Locale(appLanguageController.appLocale));
        } else if (path == LOG_OUT_ROUTE) {
          _myAppController.onSignOut();
        } else {
          Get.toNamed(path);
        }
      },
    );
  }
}

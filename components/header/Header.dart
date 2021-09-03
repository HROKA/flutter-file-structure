import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  String title;
  bool withLogo;
  bool withDrawer;
  bool withNotification;
  bool withBag;
  bool withDelete;
  bool withoutBackGround;
  Function onPressFilter;
  Function onPressBack;

  Header({
    this.title,
    this.withLogo = false,
    this.withDrawer = false,
    this.withNotification = false,
    this.withBag = false,
    this.withDelete = false,
    this.withoutBackGround = false,
    this.onPressBack,
    this.onPressFilter,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 12);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: kToolbarHeight + 12,
      backgroundColor:
          withoutBackGround ? Colors.transparent : Color(Constants.WHITE_COLOR),
      // back and drawer icons
      leading: CupertinoButton(
          padding: EdgeInsets.all(12),
          child: SvgPicture.asset(
            withDrawer
                ? DRAWER_ICON
                : languageCondition(
                    LEFT_BACK_HEADER_ICON,
                    RIGHT_BACK_HEADER_ICON,
                  ),
          ),
          onPressed: () {
            if (withDrawer) {
              Keys.drawerKey.currentState.openDrawer();
            } else {
              onPressBack != null ? onPressBack() : Get.back();
            }
          }),

      centerTitle: true,

      // title and icon
      title: withLogo
          ? SvgPicture.asset(
              LOGO_ICON,
              width: DEVICE_WIDTH * (0.02),
              height: DEVICE_HEIGHT * (0.05),
            )
          : Text(
              title ?? '',
              style: TextStyle(
                fontSize: H2_FONT,
                fontWeight: FontWeight.bold,
                color: Color(
                  Constants.BLUE_COLOR,
                ),
              ),
            ),

      // delete, Bag and notification
      actions: [
        Visibility(
          visible: withNotification,
          child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: SvgPicture.asset(
                NOTIFICATION_ICON,
              ),
              onPressed: () {
                // Get.toNamed(NOTIFICATIOINS_ROUTE);
              }),
        ),
        Visibility(
          visible: withBag,
          child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: SvgPicture.asset(
                BAG_ICON,
              ),
              onPressed: () {
                // Get.toNamed(NOTIFICATIOINS_ROUTE);
              }),
        ),
        Visibility(
          visible: withDelete,
          child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: SvgPicture.asset(
                DELETE_ICON,
              ),
              onPressed: () {
                // Get.toNamed(NOTIFICATIOINS_ROUTE);
              }),
        ),
      ],
    );
  }
}

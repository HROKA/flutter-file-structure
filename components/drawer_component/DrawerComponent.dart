import 'package:common_ui_toolkit/index.dart';
import 'package:common_ui_toolkit/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './ListTileComponent.dart';
import '../../utils/index.dart';

class DrawerComponent extends StatelessWidget {
  List dropdownItems = [
    {
      "title": 'home'.tr,
      "icon": HOME_ICON,
      "rout": HOME_ROUTE,
    },
    {
      "title": 'my_accout'.tr,
      "icon": MY_ACCOUNT_ICON,
      "rout": MY_ACCOUNT_ROUTE,
    },
    {
      "title": 'my_wallet'.tr,
      "icon": MY_WALLET_ICON,
      "rout": MY_WALLET_ROUTE,
    },
    {
      "title": 'my_orders'.tr,
      "icon": MY_ORDERS_ICON,
      "rout": MY_ORDER_ROUTE,
    },
    {
      "title": 'invite_friends'.tr,
      "icon": INVITE_FRIENDS_ICON,
      "rout": INVITE_FRIENDS_ROUTE,
    },
    {
      "title": 'find_us'.tr,
      "icon": FIND_US_ICON,
      "rout": FIND_US_ROUTE,
    },
    {
      "title": 'feedback'.tr,
      "icon": FEEDBACK_ICON,
      "rout": FEED_BACK_ROUTE,
    },
    {
      "title": 'rate_us'.tr,
      "icon": RATE_US_ICON,
      "rout": RATE_US_ROUTE,
    },
    {
      'title': 'language'.tr,
      'icon': LANGUAGE_ICON,
      'rout': LANGUAGE_ROUTE,
    },
    {
      'title': 'log out'.tr,
      'icon': LANGUAGE_ICON,
      'rout': LOG_OUT_ROUTE,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(languageCondition(0.0, 66.0)),
        bottomLeft: Radius.circular(languageCondition(66.0, 0.0)),
      ),
      child: Drawer(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(
                horizontal: DEVICE_WIDTH * 0.055,
              ),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Color(WHITE3_COLOR),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(TERRACE_LOGO),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(CLOSE_ICON),
                  )
                ],
              ),
            ),
            CommonContainer(
              style: CommonContainerModel(
                backgroundColor: WHITE3_COLOR,
                height: DEVICE_HEIGHT,
              ),
              child: ListView(
                children: [
                  ...(dropdownItems).map((element) {
                    return listTileWidget(
                      icon: element['icon'],
                      title: element['title'],
                      path: element['rout'],
                    );
                  }).toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

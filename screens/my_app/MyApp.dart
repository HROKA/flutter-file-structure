import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../controllers/AppLanguage.dart';
import '../../index.dart';
import '../../language/translation.dart';
import '../../utils/index.dart';

class MyApp extends StatelessWidget {
  final AppLanguageController appLanguageController =
      Get.find<AppLanguageController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(appLanguageController.appLocale),
      builder: (BuildContext context, Widget child) {
        return ScrollConfiguration(
          behavior:
              MyScrollBehavior(), // This behavior disables the effect of the default scroll behavior.
          child: FlutterSmartDialog(child: child),
        );
      },
      theme: ThemeData(
        fontFamily: appLanguageController.appLocale == ARABIC_VALUE
            ? 'GeFlow'
            : 'Futura',
      ),

      translations: Translation(),
      // we use the fallbackLocale to handel any error in language files and use the en as default language
      fallbackLocale: Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: SPLASH_ROUTE,
      getPages: [
        GetPage(name: SPLASH_ROUTE, page: () => SplashScreen()),
        GetPage(name: TEST_ROUTE, page: () => TestScreen()),
        GetPage(name: SIGNUP_ROUTE, page: () => Signup()),
        GetPage(name: COMPLETE_PROFILE_ROUTE, page: () => CompleteProfile()),
        GetPage(name: VERIFICATION_ROUTE, page: () => Verification()),
        GetPage(name: HOME_ROUTE, page: () => HomeScreen()),
        GetPage(name: MY_ACCOUNT_ROUTE, page: () => MyAccountScreen()),
        GetPage(name: MY_WALLET_ROUTE, page: () => MyWalletScreen()),
        GetPage(name: MY_ORDER_ROUTE, page: () => MyOrderScreen()),
        GetPage(name: INVITE_FRIENDS_ROUTE, page: () => InviteFriendsScreen()),
        GetPage(name: FIND_US_ROUTE, page: () => FindUsScreen()),
        GetPage(name: FEED_BACK_ROUTE, page: () => FeedBackScreen()),
        GetPage(name: RATE_US_ROUTE, page: () => RateUsScreen()),
        GetPage(name: DRAWER_ROUTE, page: () => DrawerComponent()),
        GetPage(name: DELIVERY_ROUTE, page: () => DeliveryScreen()),
        GetPage(name: PICKUP_ROUTE, page: () => PickupScreen()),
        GetPage(name: ADD_NEW_ADDRESS_ROUTE, page: () => AddNewAddress()),
        GetPage(name: SAVE_ON_MAP_ROUTE, page: () => SaveOnMap()),
        GetPage(name: CATEGORIES_ROUTE, page: () => CategoriesScreen()),
      ],
    );
  }
}

import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../components/index.dart';
import '../../index.dart';
import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';
import '../index.dart';

class HomeScreen extends StatelessWidget {
  HomeController _homeController = HomeController();

  List homeItems = [
    {
      'key': 'pick_up',
      'title': 'pick_up'.tr,
      'image':
          'https://i0.wp.com/www.eatthis.com/wp-content/uploads/2021/07/burger-king.jpg'
    },
    {
      'key': 'delivery',
      'title': 'delivery'.tr,
      'image':
          'https://media.discordapp.net/attachments/805735809809383444/872008246204977172/1474395998-ghk-0216-comfortfoodcover-meatballs.png'
    },
    {
      'key': 'dine_in',
      'title': 'dine_in'.tr,
      'image':
          'https://cdn2.lamag.com/wp-content/uploads/sites/6/2020/05/jason-leung-poI7DelFiVA-unsplash-scaled.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
        withNotification: true,
        withDrawer: true,
        withBag: true,
      ),
      key: Keys.drawerKey,
      drawer: DrawerComponent(),
      body: GetBuilder<HomeController>(
        init: _homeController,
        builder: (controller) => CommonContainer(
          isLoading: controller.deliveryMethods.isEmpty,
          style: CommonContainerModel(
            backgroundColor: Constants.WHITE_COLOR,
            loadingColor: TRANSPARENT_COLOR,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                HorizontalTypography(
                  child: Row(
                    children: [
                      CommonText(
                        style: TypographyStyles().boldTypography().copyWith(),
                        text: 'Welcome to',
                        containerStyle: CommonContainerModel(
                          marginVertical: DEVICE_WIDTH * 0.05,
                          marginHorizontal: DEVICE_WIDTH * 0.01,
                        ),
                      ),
                      CommonText(
                        style: CommonTextStyles().h3Style().copyWith(
                              fontColor: Constants.BLUE_COLOR,
                            ),
                        text: 'TERRACE N09',
                      ),
                    ],
                  ),
                ),
                CarouselSliderC(
                  images: controller.banners ??
                      [
                        'https://media.discordapp.net/attachments/805735809809383444/872008165800173608/varied-food-carbohydrates-protein-vegetables-fruits-dairy-legumes-on-picture-id1218254547.png',
                        'https://media.discordapp.net/attachments/805735809809383444/872008246204977172/1474395998-ghk-0216-comfortfoodcover-meatballs.png',
                        'https://media.discordapp.net/attachments/805735809809383444/872008394423279676/fideos-secos-tacos-FT-RECIPE0420-1.png'
                      ],
                ),
                SizedBox(
                  height: DEVICE_HEIGHT * 0.02,
                ),
                ...(controller.deliveryMethods.map((item) => CategoryCard(
                      title: item['name'],
                      subTitle: 'find_more'.tr,
                      image: item['icon'],
                      onPress: item['is_active']
                          ? () {
                              switch (item['id']) {
                                case 1:
                                  Get.toNamed(PICKUP_ROUTE);
                                  break;
                                case 2:
                                  Get.toNamed(DELIVERY_ROUTE);
                                  break;
                                default:
                              }
                            }
                          : null,
                    ))).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

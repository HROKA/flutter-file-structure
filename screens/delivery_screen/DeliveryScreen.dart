import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreenController controller = Get.put(DeliveryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
      ),
      body: GetBuilder<DeliveryScreenController>(
        init: controller,
        builder: (controller) => SingleChildScrollView(
          child: CommonContainer(
            style: CommonContainerModel(margin: DEVICE_WIDTH * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HorizontalTypography(
                  text: 'delivery'.tr,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                CommonText(
                  containerStyle: CommonContainerModel(
                    marginVertical: DEVICE_HEIGHT * 0.03,
                  ),
                  style: TypographyStyles().deliveryScreenStyle(),
                  text: 'please_select_your_address'.tr,
                ),
                ...(controller.deliveryList.map(
                  (item) => AddressCard(
                    title: item['title'],
                    address: item['full_address'],
                    isDelivery: true,
                    onTap: () {
                      Get.toNamed(CATEGORIES_ROUTE, arguments: {
                        'key': 'address_id',
                        'value': item['id'],
                      });
                    },
                  ),
                )).toList(),
                Align(
                  alignment: Alignment.center,
                  child: ButtonC(
                    titleStyle: CommonTextModel(
                      fontweight: FontWeight.normal,
                    ),
                    style: ContainerStyles().deliveryScreenStyle(),
                    title: 'add_new_address'.tr,
                    onPress: () {
                      Get.toNamed(
                        ADD_NEW_ADDRESS_ROUTE,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

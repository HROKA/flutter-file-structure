import 'package:common_ui_toolkit/components/common_container/CommonContainer.dart';
import 'package:common_ui_toolkit/index.dart';
import 'package:common_ui_toolkit/models/CommonContainerModel.dart';
import 'package:common_ui_toolkit/utils/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreenController controller = CategoriesScreenController();
  String name = Get.find<MyAppController>().userData['user']['full_name'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
        withBag: true,
      ),
      body: GetBuilder<CategoriesScreenController>(
        init: controller,
        builder: (controller) => CommonContainer(
          isLoading: controller.categoryController == null,
          style: CommonContainerModel(
            loadingColor: TRANSPARENT_COLOR,
            marginHorizontal: DEVICE_WIDTH * 0.02,
            marginVertical: DEVICE_WIDTH * 0.04,
          ),
          child: Column(
            children: [
              CommonText(
                containerStyle: CommonContainerModel(
                  alignment:
                      languageCondition(Alignment.topRight, Alignment.topLeft),
                ),
                text: 'hey'.tr + name + "!",
                style: TypographyStyles().categoriesScreenStyle(),
              ),
              CommonText(
                containerStyle: CommonContainerModel(
                  marginTop: DEVICE_HEIGHT * 0.01,
                  marginBottom: DEVICE_HEIGHT * 0.03,
                  alignment:
                      languageCondition(Alignment.topRight, Alignment.topLeft),
                ),
                text: 'what_would_you_like_to_order_today'.tr,
                style: TypographyStyles().categoriesScreenStyle().copyWith(
                      fontSize: HEADER_FONT,
                    ),
              ),
              CommonContainer(
                style: CommonContainerModel(
                  marginBottom: DEVICE_HEIGHT * 0.025,
                ),
                child: Category(
                  controller: controller.categoryController,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.productList[index];
                    return ProductCard(
                      title: item['name'],
                      description: item['description'],
                      price: item['price'].toString(),
                      image: item['image'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

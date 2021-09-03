import 'package:flutter/material.dart';
import 'package:terrace/api_manger/index.dart';

import '../../index.dart';

class CategoriesScreenController extends GetxController {
  List productList = [];
  CategoryController categoryController;
  ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    getMainCategoryData();
  }

  getMainCategoryData() {
    var arguments = Get.arguments;
    ApiRequest(
      path: MAIN_CATEGORY,
      methoud: POST_METHOUD,
      data: {
        arguments['key']: arguments['value'],
      },
    ).request(
      onSuccess: (data, response) {
        for (var item in data) {
          if (item['is_default'] == 1) {
            productList = data[0]['products'];
            categoryController = CategoryController(
              selectedId: item['id'],
              onCategoryPressed: getCategoryProducts,
            );
            categoryController.catItems = data;
            break;
          }
        }
        update();
      },
    );
  }

  getCategoryProducts(categoryId) {
    ApiRequest(
      path: CATEGORY_PRODUCTS,
      methoud: POST_METHOUD,
      data: {
        'category_id': categoryId,
      },
    ).request(
      onSuccess: (data, response) {
        productList = data;
        scrollController.jumpTo(0);
        update();
      },
    );
  }
}

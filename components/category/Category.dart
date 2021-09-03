import 'package:common_ui_toolkit/components/index.dart';
import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './CategoryController.dart';
import '../../styles/ContainerStyles.dart';
import '../../styles/index.dart';
import '../../utils/Constants.dart' as Constant;
import '../index.dart';

class Category extends StatelessWidget {
  CategoryController controller;

  Category({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: controller,
      builder: (contro) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.catItems != null
              ? controller.catItems
                  .map((e) =>
                      CateItem(contro, e['id'], e['name'], e['icon_url']))
                  .toList()
              : [],
        ),
      ),
    );
  }

  Column CateItem(
      CategoryController contro, int categoryId, String name, String iconUrl) {
    return Column(
      children: [
        CommonContainer(
          onPress: () {
            contro.onPress(categoryId);
          },
          style: contro.selectedId == categoryId
              ? ContainerStyles().selectedCategoryItemStyle().copyWith(
                    marginBottom: DEVICE_HEIGHT * 0.015,
                  )
              : ContainerStyles().defualtCategoryItemStyle(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.ac_unit,
                size: DEVICE_WIDTH * 0.1,
                color: contro.selectedId == categoryId
                    ? Color(Constant.WHITE_COLOR)
                    : Color(Constant.BLUE_COLOR),
              ),
              // Image.network(
              //   iconUrl,
              //   height: DEVICE_WIDTH * 0.1,
              //   width: DEVICE_WIDTH * 0.1,
              // ),
              CommonText(
                text: name,
                style: contro.selectedId == categoryId
                    ? TypographyStyles()
                        .defaultCategoryItemStyle()
                        .copyWith(fontColor: Constant.WHITE_COLOR)
                    : TypographyStyles().defaultCategoryItemStyle(),
                containerStyle: CommonContainerModel(
                  marginTop: DEVICE_HEIGHT * 0.006,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: contro.selectedId == categoryId,
          child: Image.network(
              'https://media.discordapp.net/attachments/805735479730765824/872367746787180554/unknown.png'),
        )
      ],
    );
  }
}

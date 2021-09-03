import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddressController controller = AddNewAddressController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        withLogo: true,
      ),
      body: GetBuilder<AddNewAddressController>(
        init: controller,
        builder: (controller) => SingleChildScrollView(
          child: CommonContainer(
            style: CommonContainerModel(
              margin: DEVICE_WIDTH * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonContainer(
                  style: CommonContainerModel(
                    marginTop: DEVICE_HEIGHT * 0.03,
                    marginBottom: DEVICE_HEIGHT * 0.05,
                  ),
                  child: HorizontalTypography(
                    text: 'add_new_address'.tr,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                ...(controller.inputList.map(
                  (item) => TextInputWithTitle(
                    title: item['title'],
                    keyboardType: item['input_type'],
                    controller: item['controller'],
                  ),
                )).toList(),
                Align(
                  alignment: Alignment.center,
                  child: ButtonC(
                    titleStyle: CommonTextModel(
                      fontweight: FontWeight.normal,
                    ),
                    style: ContainerStyles().deliveryScreenStyle(),
                    title: 'select_on_map'.tr,
                    onPress: () {
                      //Get.toNamed(SAVE_ON_MAP_ROUTE);
                      controller.saveAddress();
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

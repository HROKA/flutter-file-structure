import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../utils/Constants.dart' as Constant;
import '../../utils/index.dart';

class Signup extends StatelessWidget {
  SignUpController _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpController>(
        init: _signUpController,
        builder: (controller) => Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                SIGNUP_BACKGROUND_IMAGE,
                fit: BoxFit.fill,
                width: DEVICE_WIDTH,
                height: DEVICE_HEIGHT * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              child: CommonContainer(
                style: CommonContainerModel(
                  width: DEVICE_WIDTH,
                  borderRaduis: 15.0,
                  height: DEVICE_HEIGHT * 0.7,
                  padding: DEVICE_WIDTH * 0.05,
                  backgroundColor: Constant.WHITE_COLOR,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: 'welcome'.tr,
                      style: CommonTextModel(
                        fontColor: BLUE_COLOR,
                        fontweight: FontWeight.bold,
                        fontSize: H1_FONT,
                      ),
                    ),
                    CommonText(
                      text: 'enter_mobile_number'.tr,
                      style: CommonTextModel(fontSize: H3_FONT),
                      containerStyle: CommonContainerModel(
                        marginVertical: DEVICE_HEIGHT * 0.05,
                      ),
                    ),
                    TextInputC(
                      textInputController: controller.mobileNumberController,
                      hint: 'phone_number'.tr,
                      isRequired: true,
                      underlineColor: Constant.BLACK_COLOR,
                      underlineThikness: 1.0,
                      marginBottom: 16.0,
                      inputType: NUMBER_INPUT_TYPE,
                      withDoneIcon: true,
                      maxLenght: 9,
                      underlined: true,
                      prefixIcon: PHONE_ICON,
                      onChanged: controller.onChangeValue,
                    ),
                    ButtonC(
                        buttonController: controller.buttonController,
                        style: ButtonCStyles().defaultStyle.copyWith(
                              marginTop: DEVICE_HEIGHT * 0.1,
                            ),
                        title: 'sign_up'.tr,
                        onPress: () {
                          controller.onSubmit();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

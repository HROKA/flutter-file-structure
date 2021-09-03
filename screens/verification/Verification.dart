import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terrace/styles/ContainerStyles.dart';

import '../../components/index.dart';
import '../../styles/ButtonCStyles.dart';
import '../../utils/index.dart';
import '../index.dart';

class Verification extends StatelessWidget {
  VerificationController _verificationController =
      Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<VerificationController>(
          init: _verificationController,
          builder: (controller) => CommonContainer(
            style: ContainerStyles().screenShadowContainerStyle(),
            child: Column(
              children: [
                SvgPicture.asset(
                  LOGO_ICON,
                  width: DEVICE_WIDTH * 0.05,
                  height: DEVICE_HEIGHT * 0.1,
                ),
                CommonText(
                  text: 'Verification',
                  containerStyle: CommonContainerModel(
                    marginVertical: DEVICE_HEIGHT * 0.03,
                  ),
                  style: CommonTextStyles().h1Style().copyWith(
                        fontColor: BLUE_COLOR,
                        fontweight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          '4 digits verification code has been \n sent to mobile number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: H3_FONT,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' +966${controller.signupController.mobileNumber}',
                          style: TextStyle(
                            color: Color(BLUE_COLOR),
                            fontSize: H3_FONT,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                OTPInput(
                  onChange: controller.onOTPChange,
                ),
                ButtonC(
                  style: ButtonCStyles().defaultStyle.copyWith(
                        marginTop: DEVICE_HEIGHT * 0.08,
                      ),
                  // you can add style or let it null
                  title: 'Verify',
                  onPress: controller.verifyAccount,
                  buttonController: controller.verificationButton,
                ),
                TimerC(
                  containerStyle: CommonContainerModel(
                    marginVertical: DEVICE_HEIGHT * 0.03,
                  ),
                  controller: controller.countdownController,
                  onTimerFinish: controller.onTimerFinish,
                  seconds: 3,
                ),
                CommonText(
                  text: 'Didn’t receive a verification code?',
                  containerStyle: CommonContainerModel(
                    marginTop: DEVICE_HEIGHT * 0.03,
                    marginBottom: DEVICE_HEIGHT * 0.01,
                  ),
                  style: CommonTextStyles().h3Style().copyWith(
                        fontColor: BLUE_COLOR,
                      ),
                ),
                CommonText(
                  text: '|',
                  style: CommonTextStyles().h3Style().copyWith(
                        fontweight: FontWeight.bold,
                      ),
                  leftChild: CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    onPressed: controller.isTimerFinish
                        ? () {
                            controller.countdownController.restart();
                            controller.onTimerFinish();
                            controller.signupController.onSubmit();
                          }
                        : null,
                    child: CommonText(
                      style: CommonTextStyles().h3Style().copyWith(
                            fontColor: controller.isTimerFinish
                                ? BLUE_COLOR
                                : LIGHT_GREY_COLOR,
                          ),
                      text: 'Resend code',
                    ),
                  ),
                  rightChild: CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    onPressed: () {
                      Get.back();
                    },
                    child: CommonText(
                      style: CommonTextStyles().h3Style().copyWith(
                            fontColor: BLUE_COLOR,
                          ),
                      text: 'Change number',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

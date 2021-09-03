import 'package:common_ui_toolkit/index.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:terrace/index.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfileController _completeProfileController =
      CompleteProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CompleteProfileController>(
        init: _completeProfileController,
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              CommonContainer(
                style: ContainerStyles().screenShadowContainerStyle().copyWith(
                      paddingHorizontal: DEVICE_WIDTH * 0.05,
                      height: 0.0,
                    ),
                child: Column(
                  children: [
                    CommonContainer(
                      style: CommonContainerModel(
                        width: DEVICE_WIDTH,
                        height: 0.2,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: DEVICE_WIDTH * 0.02,
                            right: DEVICE_WIDTH * 0.02,
                            top: DEVICE_HEIGHT * 0.02,
                            child: SvgPicture.asset(
                              LOGO_ICON,
                              width: DEVICE_WIDTH * 0.2,
                              height: DEVICE_HEIGHT * 0.1,
                            ),
                          ),
                          Positioned(
                            top: DEVICE_HEIGHT * 0.04,
                            left: languageCondition(
                              null,
                              DEVICE_WIDTH * 0.01,
                            ),
                            right: languageCondition(
                              DEVICE_WIDTH * 0.01,
                              null,
                            ),
                            child: CommonContainer(
                              onPress: () {
                                Get.back();
                              },
                              style: CommonContainerModel(
                                touchEffect: TouchableEffect(
                                  type: TouchTypes.opacity,
                                ),
                                marginTop: 15,
                              ),
                              child: SvgPicture.asset(
                                languageCondition(
                                  LEFT_BACK_HEADER_ICON,
                                  RIGHT_BACK_HEADER_ICON,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    CommonText(
                      text: 'complete_profile'.tr,
                      style: TypographyStyles().headerStyle(),
                    ),
                    CommonText(
                      containerStyle: ContainerStyles().textContainerStyle(),
                      text: '${'please_fill'.tr} \n ${'to_complete'.tr}',
                      style: TypographyStyles().bodyTextStyle(),
                    ),
                    ...controller.inputItems
                        .map<Widget>(
                          (item) => TextInputC(
                            marginBottom: DEVICE_HEIGHT * 0.04,
                            textInputController: item['controller'],
                            hint: item['hint'],
                            prefixIcon: item['icon'],
                            inputType: item['inputType'],
                            onChanged: (value) =>
                                controller.onChangevalue(item['icon'], value),
                            onTap: item['icon'] == DOB_PROFILE_ICON
                                ? () {
                                    DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      // minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime.now(),
                                      // onChanged: (date) {
                                      //   print('change $date');
                                      // },
                                      onConfirm: controller.onChangeDate,
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en,
                                    );
                                  }
                                : null,
                          ),
                        )
                        .toList(),
                    // getGenderSection(controller),
                    ButtonC(
                      style: ButtonCStyles().defaultStyle.copyWith(
                            width: DEVICE_WIDTH,
                            marginTop: DEVICE_HEIGHT * 0.08,
                            marginBottom: DEVICE_HEIGHT * 0.05,
                          ),
                      title: 'continue'.tr,
                      onPress: controller.onSubmit,
                      buttonController: controller.completeProfilebutton,
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: CommonContainerModel(height: DEVICE_HEIGHT * 0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

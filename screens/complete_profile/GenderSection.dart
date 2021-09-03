import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:terrace/index.dart';

getGenderSection(controller) => CommonContainer(
      style: CommonContainerModel(
        marginHorizontal: DEVICE_WIDTH * 0.07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'gender'.tr,
            style: CommonTextModel(
              fontColor: PURPLE_COLOR,
              fontSize: H3_FONT,
            ),
          ),
          Row(
            children: [
              generateRadioButton(controller, 'male'.tr, Gender.male),
              CommonContainer(
                style: CommonContainerModel(
                  width: DEVICE_WIDTH * 0.22,
                ),
              ),
              generateRadioButton(controller, 'female'.tr, Gender.female)
            ],
          ),
        ],
      ),
    );

generateRadioButton(controller, text, value) => Row(
      children: [
        Radio<Gender>(
          activeColor: Color(PURPLE_COLOR),
          value: value,
          groupValue: controller.gender,
          onChanged: controller.onGenderChange,
        ),
        CommonText(
          text: text,
        ),
      ],
    );

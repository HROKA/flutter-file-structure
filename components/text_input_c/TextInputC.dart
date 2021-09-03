import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './index.dart';
import '../../index.dart';
import '../../utils/Constants.dart' as Constants;
import '../../utils/index.dart';

class TextInputC extends StatelessWidget {
  var prefixIcon;
  var textColor;
  var foucsNode;

  String hint, fontFamily, inputType, edgeText, headerHint;

  int fontWeight,
      prefixIconColor,
      suffixIconColor,
      underlineColor,
      disabledBorderColor,
      focusBorderColor,
      hintColor,
      fillColor,
      minLenght,
      maxLenght;

  bool isRequired,
      withBorderSide,
      underlined,
      underlinededgeText,
      isCollapsed,
      withDoneIcon,
      withHintAbove,
      closeKeyboardAfterVerifiedLength;

  double prefixIconWidth,
      prefixIconHight,
      suffixIconWidth,
      suffixIconHight,
      underlineThikness,
      disabledBorderWidth,
      focusBorderWidth,
      marginTop,
      marginLeft,
      marginRight,
      marginBottom,
      marginVertical,
      marginHorizontal,
      width,
      fontSize,
      radius,
      contentVerticalPadding,
      contentHorizontalPadding;

  Function onChanged, onEdgeTextPress;
  TextAlign textAlign;

  TextInputController textInputController;

  Pattern textInputFormat;

  Function onTap, afterVerifiyed;

  TextInputC({
    @required this.textInputController,
    this.hint,
    this.headerHint,
    // types: (EMAIL_INPUT_TYPE, TEXT_INPUT_TYPE , NUMBER_INPUT_TYPE, PASSWORD_INPUT_TYPE)
    this.inputType = TEXT_INPUT_TYPE,
    this.isRequired = false,
    this.withBorderSide = true,
    this.underlinededgeText = false,
    this.underlined = false,
    this.isCollapsed = false,
    this.withHintAbove = false,
    this.minLenght = 6,
    this.maxLenght = 100,
    // ex: (prefixIcon || suffixIcon) = Icons.done ( runtimeType: TypeIconData)
    //      (prefixIcon || suffixIcon) = assets/icons/done.svg (runtimeType: String)
    this.prefixIcon,
    this.fillColor = TRANSPARENT_COLOR,
    this.edgeText,
    this.foucsNode,
    this.suffixIconColor = GREEN_COLOR,
    this.underlineColor = Constants.BLUE2_COLOR,
    this.prefixIconColor = Constants.PURPLE_COLOR,
    this.suffixIconHight = 10,
    this.suffixIconWidth = 10,
    this.prefixIconHight = 40,
    this.prefixIconWidth = 40,
    this.underlineThikness = 3.0,
    this.disabledBorderWidth = 1.0,
    this.marginTop = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginBottom = 0.0,
    this.marginHorizontal = 0.0,
    this.marginVertical = 0.0,
    this.contentVerticalPadding = 15.0,
    this.contentHorizontalPadding = 15.0,
    this.width = double.infinity,
    this.radius = 24.0,
    this.hintColor = GREY_COLOR,
    this.disabledBorderColor = GREY_COLOR,
    this.focusBorderWidth = 2.0,
    this.focusBorderColor = GREY_COLOR,
    this.textColor = Constants.BLACK_COLOR,
    this.textAlign = TextAlign.start,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.onChanged,
    this.onEdgeTextPress,
    // ex: RegExp(r'^\d*')
    this.textInputFormat,
    this.onTap,
    this.withDoneIcon = true,
    this.closeKeyboardAfterVerifiedLength = true,
    this.afterVerifiyed,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextInputController>(
      init: textInputController,
      global: false,
      builder: (controller) => Container(
        margin: EdgeInsets.fromLTRB(
          marginLeft > 0 ? marginLeft : marginHorizontal,
          marginTop > 0 ? marginTop : marginVertical,
          marginRight > 0 ? marginRight : marginHorizontal,
          marginBottom > 0 ? marginBottom : marginVertical,
        ),
        child: Column(
          children: [
            Visibility(
              visible: withHintAbove,
              child: Column(
                children: [
                  Row(
                    children: [
                      CommonText(
                        text: headerHint,
                        style: CommonTextModel(fontColor: Constants.GREY_COLOR),
                      ),
                    ],
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.01),
                ],
              ),
            ),
            TextFormField(
              // textInputAction: TextInputAction.,
              onTap: onTap != null ? onTap : () {},
              textAlign: textAlign,
              focusNode: foucsNode,
              style: TextStyle(
                color: Color(textColor),
                fontSize: fontSize,
              ),
              controller: controller.textEditingController,
              scrollPhysics: BouncingScrollPhysics(),
              minLines: inputType == MULTI_LINE ? 6 : null,
              maxLines: inputType == MULTI_LINE ? null : 1,
              inputFormatters: textInputFormat != null
                  ? [
                      FilteringTextInputFormatter.allow(textInputFormat),
                    ]
                  : null,
              readOnly: controller.isReadOnly,
              maxLength: inputType == MULTI_LINE ? null : maxLenght,
              obscureText: inputType == PASSWORD_INPUT_TYPE,
              keyboardType: inputType == TEXT_INPUT_TYPE
                  ? TextInputType.text
                  : inputType == MULTI_LINE
                      ? TextInputType.multiline
                      : inputType == EMAIL_INPUT_TYPE
                          ? TextInputType.emailAddress
                          : inputType == NUMBER_INPUT_TYPE
                              ? TextInputType.number
                              : TextInputType.text,
              enabled: controller.isEnable,
              decoration: InputDecoration(
                fillColor: Color(fillColor),
                filled: fillColor != null,
                counterText: "",
                suffixIconConstraints: BoxConstraints(
                  minHeight: suffixIconHight,
                  minWidth: suffixIconWidth,
                ),
                suffixIcon: edgeText == null
                    ? getIcon(
                        icon: controller.suffixIcon,
                        isSuffix: true,
                        color: suffixIconColor,
                        controller: controller,
                      )
                    : CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        onPressed: () {
                          if (onEdgeTextPress != null &&
                              controller.getText().length > 0) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            onEdgeTextPress();
                          }
                        },
                        child: CommonText(
                          style: TypographyStyles().defaultStyle().copyWith(
                                fontColor: controller.getText().length == 0
                                    ? GREY2_COLOR
                                    : BLUE_COLOR,
                                textDecoration: underlinededgeText
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                          containerStyle: CommonContainerModel(
                            backgroundColor: TRANSPARENT_COLOR,
                          ),
                          text: edgeText,
                        ),
                      ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: prefixIconHight,
                  minWidth: prefixIconWidth,
                ),
                isCollapsed: isCollapsed,
                prefixIcon: getIcon(
                  icon: prefixIcon,
                  isSuffix: false,
                  color: prefixIconColor,
                  controller: controller,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  color:
                      controller.isEnable ? Color(hintColor) : Colors.grey[300],
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: contentVerticalPadding,
                  horizontal: contentHorizontalPadding,
                ),
                border: getOutlineInputBorder(
                  raduis: radius,
                  borderColor: disabledBorderColor,
                  borderWidth: disabledBorderWidth,
                ),
                ////The border to display when the InputDecorator has the focus and is not showing an error.
                focusedBorder: getOutlineInputBorder(
                  raduis: radius,
                  borderColor: focusBorderColor,
                  borderWidth: focusBorderWidth,
                ),
                enabledBorder: getOutlineInputBorder(
                  raduis: radius,
                  borderColor: focusBorderColor,
                  borderWidth: focusBorderWidth,
                ),
                alignLabelWithHint: true,
              ),
              onChanged: (value) {
                if ((value.length >= maxLenght &&
                        inputType == NUMBER_INPUT_TYPE) ||
                    (inputType == EMAIL_INPUT_TYPE &&
                        RegExp(r'^[^@]+@[^@]+\.(com|net)').hasMatch(value))) {
                  if (withDoneIcon) {
                    controller.setSuffixIcon(Icons.done);
                  }
                  controller.isContentVerified = true;
                  if (value.length == maxLenght &&
                      inputType == NUMBER_INPUT_TYPE) {
                    if (closeKeyboardAfterVerifiedLength)
                      FocusScope.of(context).requestFocus(FocusNode());
                    if (afterVerifiyed != null) afterVerifiyed();
                  }
                } else {
                  controller.setSuffixIcon(null);
                  controller.isContentVerified = false;
                }
                if (onChanged != null) {
                  onChanged(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  getIcon(
      {var icon, bool isSuffix, int color, TextInputController controller}) {
    return icon != null
        ? icon.runtimeType == String && icon.contains('png')
            ? Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                  fit: BoxFit.fill,
                  width: DEVICE_WIDTH * 0.1,
                  height: DEVICE_HEIGHT * 0.03,
                ),
              )
            : icon.runtimeType == String && icon.contains('svg')
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SvgPicture.asset(
                      icon,
                      color:
                          Color(controller.isEnable ? color : DISABLED_COLOR),
                      fit: BoxFit.none,
                    ),
                  )
                : Icon(
                    icon,
                    color: Color(controller.isEnable ? color : DISABLED_COLOR),
                  )
        : isRequired && controller.getText().length <= 0 && isSuffix
            ? Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '*',
                  style: TextStyle(
                    color: Color(Constants.RED_COLOR),
                  ),
                ),
              )
            : null;
  }

  getOutlineInputBorder({double raduis, int borderColor, double borderWidth}) {
    return underlined
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(underlineColor),
              width: underlineThikness,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            borderSide: withBorderSide
                ? BorderSide(
                    color: Color(disabledBorderColor),
                    width: disabledBorderWidth,
                  )
                : BorderSide.none,
          );
  }
}

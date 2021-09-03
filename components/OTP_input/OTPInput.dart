import 'package:common_ui_toolkit/index.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPInput extends StatelessWidget {
  Function onCompleted, onChange;
  int otpLength;

  OTPInput({
    this.onChange,
    this.onCompleted,
    this.otpLength = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.1),
      child: PinCodeTextField(
        // pinTheme: PinTheme(
        //   activeColor: Colors.grey, // Default is [Colors.green]
        //   selectedColor: Colors.grey, // Default is [Colors.blue]
        //   inactiveColor: Colors.grey, // Default is [Colors.red]
        // ),
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        onChanged: (value) {
          if (onChange != null) {
            onChange(value);
          }
        },
        onCompleted: (pin) {
          if (onCompleted != null) {
            onCompleted(pin);
          }
        },
        length: 4,
        appContext: context,
      ),
    );
  }
}

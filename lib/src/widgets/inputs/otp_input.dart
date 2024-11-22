import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

class OtpInput extends StatelessWidget {
  final void Function(String)? onSubmit;
  final void Function(String)? onCodeChanged;
  final List<TextEditingController?> controls;

  const OtpInput({
    super.key,
    this.onSubmit,
    this.onCodeChanged,
    required this.controls,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      handleControllers: (controllers) {
        controls.clear();
        controls.addAll(controllers);
      },
      filled: true,
      showFieldAsBox: true,
      borderColor: Colors.blue,
      fillColor: Color(0xFFE8EDF1),
      onCodeChanged: onCodeChanged,
      numberOfFields: controls.length,
      borderRadius: BorderRadius.all(Radius.circular(60)),
      clearText: true,
      autoFocus: true,
      fieldWidth: 80,
      fieldHeight: 130,
      disabledBorderColor: Colors.grey,
      enabledBorderColor: Color(0xFFE8EDF1),
      focusedBorderColor: Colors.blue,
      contentPadding: EdgeInsets.all(20),
      showCursor: false,
      textStyle: context.titleText,
      onSubmit: onSubmit,
    );
  }
}

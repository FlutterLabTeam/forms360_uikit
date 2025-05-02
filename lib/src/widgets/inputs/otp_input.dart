import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/src/extension/context_extension.dart';

import 'otp_text_field.dart';

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
      fieldWidth: 80,
      clearText: true,
      autoFocus: true,
      fieldHeight: 130,
      showFieldAsBox: true,
      borderColor: Colors.blue,
      onCodeChanged: onCodeChanged,
      fillColor: Color(0xFFE8EDF1),
      numberOfFields: controls.length,
      disabledBorderColor: Colors.grey,
      enabledBorderColor: Color(0xFFE8EDF1),
      borderRadius: BorderRadius.all(Radius.circular(60)),
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
      focusedBorderColor: Colors.blue,
      contentPadding: EdgeInsets.all(20),
      showCursor: false,
      textStyle: context.titleText.copyWith(height: 1.7),
      onSubmit: onSubmit,
    );
  }
}

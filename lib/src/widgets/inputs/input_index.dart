import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';

class Inputs {
  Widget primary({
    bool enabled = true,
    required String label,
    required bool isPassword,
    required String hintText,
    void Function(String)? onChanged,
    TextEditingController? controller,
    final String? Function(String?)? validator,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLACK,
  }) =>
      PrimaryInput(
        label: label,
        enabled: enabled,
        hintText: hintText,
        validator: validator,
        onChanged: onChanged,
        isPassword: isPassword,
        inputColor: inputColor,
        controller: controller,
      );
}

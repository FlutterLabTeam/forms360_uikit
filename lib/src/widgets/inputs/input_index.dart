import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';

class Inputs {
  Widget primary({
    required String label,
    required bool isPassword,
    required String hintText,
    final bool enabled = true,
    final void Function(String)? onChanged,
    final TextEditingController? controller,
    required PrimaryInputColorKit inputColor,
    final String? Function(String?)? validator,
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

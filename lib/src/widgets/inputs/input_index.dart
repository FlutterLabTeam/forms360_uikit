import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/widgets/inputs/dropdown_writable_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';

class Inputs {
  Widget primary({
    bool enabled = true,
    required String label,
    bool isPassword = false,
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

  Widget dropdownWritableInput({
    bool enabled = true,
    required String label,
    bool isPassword = false,
    required String hintText,
    required List<String> items,
    void Function(String)? onChanged,
    List<String> selectedValues = const [],
    final String? Function(String?)? validator,
    required Function(String) onSuggestionSelected,
    Function(List<String>)? onSelectedValuesChanged,
    required TextEditingController dropdownSearchFieldController,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLACK,
    DropdownWritableInputType type = DropdownWritableInputType.SINGLE,
  }) =>
      DropdownWritableInput(
        type: type,
        label: label,
        items: items,
        hintText: hintText,
        inputColor: inputColor,
        selectedValues: selectedValues,
        onSuggestionSelected: onSuggestionSelected,
        onSelectedValuesChanged: onSelectedValuesChanged,
        dropdownSearchFieldController: dropdownSearchFieldController,
      );
}

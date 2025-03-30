import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:forms360_uikit/src/model/custom_form_model.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/model/tag_model.dart';
import 'package:forms360_uikit/src/widgets/inputs/check_box.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_form.dart';
import 'package:forms360_uikit/src/widgets/inputs/date_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/dynamic_dropdown_writable_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/otp_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_row_text_inputs.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_text_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/dropdown_writable_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/search_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/tag_widget.dart';

class Inputs {
  Widget primary({
    required String label,
    required String hintText,
    int? maxLength,
    Icon? suffixIcon,
    double? fontSize,
    bool isBig = false,
    bool enabled = true,
    String? initialValue,
    TextStyle? textStyle,
    bool isPassword = false,
    EdgeInsets? contentPadding,
    TextInputType? keyboardType,
    void Function()? onIconPressed,
    bool isSuffixIconEnabled = false,
    void Function(String)? onChanged,
    TextEditingController? controller,
    final Function(String?)? onFieldSubmitted,
    final String? Function(String?)? validator,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLACK,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      PrimaryInput(
        isBig: isBig,
        label: label,
        enabled: enabled,
        hintText: hintText,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        isPassword: isPassword,
        inputColor: inputColor,
        controller: controller,
        suffixIcon: suffixIcon,
        keyboardType: keyboardType,
        initialValue: initialValue,
        onIconPressed: onIconPressed,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        isSuffixIconEnabled: isSuffixIconEnabled,
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
    String? initialValue,
    double? fontSize,
    EdgeInsets? contentPadding,
  }) =>
      DropdownWritableInput(
        type: type,
        label: label,
        items: items,
        hintText: hintText,
        validator: validator,
        inputColor: inputColor,
        selectedValues: selectedValues,
        onSuggestionSelected: onSuggestionSelected,
        onSelectedValuesChanged: onSelectedValuesChanged,
        dropdownSearchFieldController: dropdownSearchFieldController,
        enabled: enabled,
        initialValue: initialValue,
        contentPadding: contentPadding,
        fontSize: fontSize,
      );

  Widget dynamicDropDown<T>({
    bool enabled = true,
    required String label,
    bool isPassword = false,
    required String hintText,
    required List<T> items,
    void Function(T)? onChanged,
    List<T> selectedValues = const [],
    final String? Function(T?)? validator,
    required Function(T) onSuggestionSelected,
    Function(List<T>)? onSelectedValuesChanged,
    required TextEditingController dropdownSearchFieldController,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLACK,
    DropdownWritableInputType type = DropdownWritableInputType.SINGLE,
    T? initialValue,
    double? fontSize,
    EdgeInsets? contentPadding,
    required Function(T) getSuggetions,
  }) =>
      DynamicDropdownWritableInput<T>(
        getSuggetions: getSuggetions,
        type: type,
        label: label,
        items: items,
        hintText: hintText,
        validator: validator,
        inputColor: inputColor,
        selectedValues: selectedValues,
        onSuggestionSelected: onSuggestionSelected,
        onSelectedValuesChanged: onSelectedValuesChanged,
        dropdownSearchFieldController: dropdownSearchFieldController,
        enabled: enabled,
        initialValue: initialValue,
        contentPadding: contentPadding,
        fontSize: fontSize,
      );

  Widget otpInput({
    Function(String)? onSubmit,
    Function(String)? onCodeChanged,
    required List<TextEditingController?> controls,
  }) =>
      OtpInput(
        onSubmit: onSubmit,
        controls: controls,
        onCodeChanged: onCodeChanged,
      );

  Widget checkBox({
    required bool state,
    required Function(bool) onTap,
    bool enabled = true,
  }) =>
      CheckBox(
        onTap: onTap,
        state: state,
        enabled: enabled,
      );

  Widget searchInput({
    int? maxLength,
    required String label,
    required String hintText,
    required TextEditingController controller,
    final String? Function(String?)? validator,
    bool isClearButtonVisible = false,
  }) =>
      SearchInput(
        label: label,
        hintText: hintText,
        validator: validator,
        maxLength: maxLength,
        controller: controller,
      );
  Widget dateInput({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool isClearButtonVisible,
    required double width,
    required int? maxLength,
    required GestureTapCallback? onTap,
    required String? Function(String?)? validator,
  }) =>
      DateInput(
        label: label,
        hintText: hintText,
        validator: validator,
        maxLength: maxLength,
        controller: controller,
        isClearButtonVisible: isClearButtonVisible,
        onTap: onTap,
        width: width,
      );

  Widget tagInput<T>({
    String addText = 'Add',
    required List<TagModel<T>> tagList,
    required Function(TagModel<T>) onTap,
    required Function(BuildContext) onTapAdd,
    String? selectedTag,
    String? allText,
    double? itemHeight,
    double? itemWidth,
    bool showAddButton = false,
  }) =>
      TagWidget<T>(
        onTap: onTap,
        tagList: tagList,
        onTapAdd: onTapAdd,
        addText: addText,
        itemHeight: itemHeight,
        itemWidth: itemWidth,
        showAddButton: showAddButton,
        selectedTag: selectedTag,
        allText: allText ?? 'All',
      );

  Widget customForm({
    required String? title,
    required String? description,
    required String? buttonText,
    required List<Widget> children,
    required Function() onValidationSuccess,
    required Function() onValidationFailed,
  }) =>
      CustomForm(
        buttonText: buttonText,
        description: description,
        title: title,
        onValidationFailed: onValidationFailed,
        onValidationSuccess: onValidationSuccess,
        children: children,
      );

  Widget popUpTextInput({
    required String label,
    required String hintText,
    required TextEditingController? controller,
    required Function(String)? onChanged,
    required String? Function(String?)? validator,
    bool isSuffixIconEnabled = false,
    Icon? suffixeIcon,
    Function()? suffixIconOnPressed,
    double? width,
    bool isEnabled = true,
  }) =>
      PopUpTextInput(
        label: label,
        hintText: hintText,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        isSuffixIconEnabled: isSuffixIconEnabled,
        suffixeIcon: suffixeIcon,
        suffixIconOnPressed: suffixIconOnPressed,
        width: width,
        isEnabled: isEnabled,
      );

  Widget popUpRowTextFields(
    CustomFormFieldModel field1,
    CustomFormFieldModel field2,
  ) =>
      PopUpRowTextInputs(
        field1: field1,
        field2: field2,
      );
}

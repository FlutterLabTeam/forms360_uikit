import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/tag_model.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/model/custom_form_model.dart';
import 'package:forms360_uikit/src/widgets/inputs/check_box.dart';
import 'package:forms360_uikit/src/widgets/inputs/otp_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/date_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/phone_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/tag_widget.dart';
import 'package:forms360_uikit/src/widgets/inputs/custom_form.dart';
import 'package:forms360_uikit/src/widgets/inputs/search_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/primary_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_text_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_row_text_inputs.dart';
import 'package:forms360_uikit/src/widgets/inputs/dropdown_writable_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/dynamic_dropdown_writable_input.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Inputs {
  Widget primary({
    int? maxLength,
    Icon? suffixIcon,
    Widget? prefixWidget,
    double? fontSize,
    bool isBig = false,
    bool enabled = true,
    String? initialValue,
    TextStyle? textStyle,
    required String label,
    bool isPassword = false,
    required String hintText,
    EdgeInsets? contentPadding,
    TextInputType? keyboardType,
    void Function()? onIconPressed,
    bool isSuffixIconEnabled = false,
    void Function(String)? onChanged,
    TextEditingController? controller,
    final Function(String?)? onFieldSubmitted,
    final String? Function(String?)? validator,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLUE,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      PrimaryInput(
        isBig: isBig,
        label: label,
        enabled: enabled,
        hintText: hintText,
        textStyle: textStyle,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        isPassword: isPassword,
        inputColor: inputColor,
        controller: controller,
        suffixIcon: suffixIcon,
        keyboardType: keyboardType,
        prefixWidget: prefixWidget,
        initialValue: initialValue,
        onIconPressed: onIconPressed,
        contentPadding: contentPadding,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        isSuffixIconEnabled: isSuffixIconEnabled,
      );

  Widget dropdownWritableInput({
    double? fontSize,
    bool enabled = true,
    String? initialValue,
    required String label,
    bool isPassword = false,
    required String hintText,
    EdgeInsets? contentPadding,
    String addNewItemTitle = "",
    required List<String> items,
    void Function(String)? onChanged,
    List<String> selectedValues = const [],
    final String? Function(String?)? validator,
    required Function(String) onSuggestionSelected,
    Function(List<String>)? onSelectedValuesChanged,
    Widget Function(BuildContext, String)? buildSuggestionItem,
    required TextEditingController dropdownSearchFieldController,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLUE,
    DropdownWritableInputType type = DropdownWritableInputType.SINGLE,
  }) =>
      DropdownWritableInput(
        type: type,
        label: label,
        items: items,
        enabled: enabled,
        fontSize: fontSize,
        hintText: hintText,
        validator: validator,
        inputColor: inputColor,
        initialValue: initialValue,
        contentPadding: contentPadding,
        selectedValues: selectedValues,
        addNewItemTitle: addNewItemTitle,
        buildSuggestionItem: buildSuggestionItem,
        onSuggestionSelected: onSuggestionSelected,
        onSelectedValuesChanged: onSelectedValuesChanged,
        dropdownSearchFieldController: dropdownSearchFieldController,
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
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLUE,
    DropdownWritableInputType type = DropdownWritableInputType.SINGLE,
    T? initialValue,
    double? fontSize,
    EdgeInsets? contentPadding,
    required String Function(T) getStringValue,
    required Function(String) onSuggestionCallback,
  }) =>
      DynamicDropdownWritableInput<T>(
        getStringValue: getStringValue,
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
        onSuggestionCallback: onSuggestionCallback,
      );

  Widget otpInput({
    Function(String)? onSubmit,
    required List<TextEditingController> controllers,
  }) =>
      OtpInput(
        onSubmit: onSubmit,
        controllers: controllers,
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
    double? fontSize,
    required String label,
    required double width,
    required int? maxLength,
    required String hintText,
    void Function()? onTapOutside,
    required bool isClearButtonVisible,
    required GestureTapCallback? onTap,
    required TextEditingController controller,
    required String? Function(String?)? validator,
  }) =>
      DateInput(
        label: label,
        onTap: onTap,
        width: width,
        fontSize: fontSize,
        hintText: hintText,
        maxLength: maxLength,
        validator: validator,
        controller: controller,
        onTapOutside: onTapOutside,
        isClearButtonVisible: isClearButtonVisible,
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
    required String? buttonText,
    required String? description,
    required List<Widget> children,
    Future<void> Function()? onValidationFailed,
    required Future<void> Function() onValidationSuccess,
  }) =>
      CustomForm(
        title: title,
        children: children,
        buttonText: buttonText,
        description: description,
        onValidationFailed: onValidationFailed,
        onValidationSuccess: onValidationSuccess,
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
    int? maxLength,
    double? height,
    Widget? prefixWidget,
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
        maxLength: maxLength,
        height: height,
        prefixWidget: prefixWidget,
      );

  Widget popUpRowTextFields(
    CustomFormFieldModel field1,
    CustomFormFieldModel field2,
  ) =>
      PopUpRowTextInputs(
        field1: field1,
        field2: field2,
      );

  Widget phoneInput({
    required String label,
    required String hintText,
    required TextEditingController controller,
    final String? Function(PhoneNumber?)? validator,
    bool isSuffixIconEnabled = false,
    Icon? suffixeIcon,
    Function()? suffixIconOnPressed,
    double? width,
    double? height,
    bool isEnabled = true,
    int? maxLength,
    required Function(String)? onChanged,
    required Function(PhoneNumber) onCountryCodeChanged,
    String? initialValue,
  }) =>
      PhoneInput(
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
        maxLength: maxLength,
        height: height,
        initialValue: initialValue,
        onCountryCodeChanged: onCountryCodeChanged,
      );
}

import 'package:flutter/cupertino.dart';
import 'package:forms360_uikit/src/model/input_types.dart';
import 'package:forms360_uikit/src/model/tag_model.dart';
import 'package:forms360_uikit/src/widgets/inputs/check_box.dart';
import 'package:forms360_uikit/src/widgets/inputs/date_input.dart';
import 'package:forms360_uikit/src/widgets/inputs/otp_input.dart';
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
    TextStyle? textStyle,
    bool isPassword = false,
    EdgeInsets? contentPadding,
    void Function()? onIconPressed,
    bool isSuffixIconEnabled = false,
    void Function(String)? onChanged,
    TextEditingController? controller,
    final Function(String?)? onFieldSubmitted,
    final String? Function(String?)? validator,
    PrimaryInputColorKit inputColor = PrimaryInputColorKit.BLACK,
  }) =>
      PrimaryInput(
        isBig: isBig,
        label: label,
        enabled: enabled,
        fontSize: fontSize,
        hintText: hintText,
        textStyle: textStyle,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        isPassword: isPassword,
        inputColor: inputColor,
        controller: controller,
        suffixIcon: suffixIcon,
        onIconPressed: onIconPressed,
        contentPadding: contentPadding,
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
  }) =>
      CheckBox(
        onTap: onTap,
        state: state,
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
}

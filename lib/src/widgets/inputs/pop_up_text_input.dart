import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';

class PopUpTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isSuffixIconEnabled;
  final Icon? suffixeIcon;
  final Widget? prefixWidget;
  final Function()? suffixIconOnPressed;
  final double? width;
  final bool isEnabled;
  final int? maxLength;
  final double? height;

  const PopUpTextInput({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.isSuffixIconEnabled = false,
    this.suffixeIcon,
    this.suffixIconOnPressed,
    this.width,
    this.isEnabled = true,
    this.maxLength,
    this.height,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FormsKit.widget.inputs.primary(
        prefixWidget: prefixWidget,
        label: label,
        hintText: hintText,
        isSuffixIconEnabled: isSuffixIconEnabled,
        suffixIcon: suffixeIcon,
        onIconPressed: suffixIconOnPressed,
        controller: controller,
        inputColor: PrimaryInputColorKit.BLUE,
        contentPadding:
            EdgeInsets.only(top: 18, bottom: 22, left: 19.21, right: 19.21),
        onChanged: onChanged,
        validator: validator,
        fontSize: 20,
        enabled: isEnabled,
        maxLength: maxLength,
      ),
    );
  }
}

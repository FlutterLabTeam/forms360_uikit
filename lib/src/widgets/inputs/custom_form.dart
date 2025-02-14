import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/custom_button.dart';

class CustomForm extends StatefulWidget {
  final List<Widget> children;
  final String? title;
  final String? description;
  final String? buttonText;
  final onValidationFailed;
  final onValidationSuccess;

  const CustomForm({
    Key? key,
    this.title,
    this.description,
    this.buttonText,
    required this.onValidationFailed,
    required this.onValidationSuccess,
    required this.children,
  }) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          SizedBox(height: 20),
          buildDescription(context),
          SizedBox(height: 20),
          ...widget.children,
          SizedBox(height: 38),
          CustomButton(
            customSize: 86,
            title: widget.buttonText ?? 'Save',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (widget.onValidationSuccess != null)
                  widget.onValidationSuccess();
              } else {
                if (widget.onValidationFailed != null)
                  widget.onValidationFailed();
              }
            },
            buttonType: ButtonTypeKit.primary,
            sizeButton: SizeButtonKit.big,
            buttonState: ButtonStateKit.enabled,
          )
        ],
      ),
    );
  }

  Widget buildDescription(BuildContext context) {
    return Center(
      child: widget.description != null
          ? Text(
              widget.description!,
              style:
                  context.secondaryText.copyWith(color: context.primaryColor),
              textAlign: TextAlign.center,
            )
          : Container(),
    );
  }

  buildTitle() {
    return Center(
      child: widget.title != null
          ? Text(
              widget.title!,
              style: context.primaryText.copyWith(color: context.primaryColor),
            )
          : Container(),
    );
  }
}

buildFormFields({
  label,
  hintText,
  controller,
  onChanged,
  validator,
  isSuffixIconEnabled = false,
  suffixeIcon,
  suffixIconOnPressed,
  width,
}) {
  return Container(
    width: width,
    child: FormsKit.widget.inputs.primary(
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
    ),
  );
}

buildRowTextFields(CustomFormFieldModel field1, CustomFormFieldModel field2) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: buildFormFields(
          label: field1.label,
          hintText: field1.hintText,
          controller: field1.controller,
          onChanged: field1.onChanged,
          validator: field1.validator,
          isSuffixIconEnabled: field1.isSuffixIconEnabled,
          suffixeIcon: field1.suffixeIcon,
          suffixIconOnPressed: field1.suffixIconOnPressed,
          width: field1.width,
        ),
      ),
      SizedBox(width: 3),
      Expanded(
        child: buildFormFields(
          label: field2.label,
          hintText: field2.hintText,
          controller: field2.controller,
          onChanged: field2.onChanged,
          validator: field2.validator,
          isSuffixIconEnabled: field2.isSuffixIconEnabled,
          suffixeIcon: field2.suffixeIcon,
          suffixIconOnPressed: field2.suffixIconOnPressed,
          width: field2.width,
        ),
      ),
    ],
  );
}

class CustomFormFieldModel {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  final Function validator;
  final bool isSuffixIconEnabled;
  final Widget? suffixeIcon;
  final Function? suffixIconOnPressed;
  final double? width;

  CustomFormFieldModel({
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator,
    this.width,
    this.suffixeIcon,
    this.suffixIconOnPressed,
    this.isSuffixIconEnabled = false,
  });
}

import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/custom_form_model.dart';
import 'package:forms360_uikit/src/widgets/buttons/custom_button/custom_button.dart';

class CustomForm extends StatefulWidget {
  final String? title;
  final String? buttonText;
  final String? description;
  final List<Widget> children;
  final Future<void> Function() onValidationSuccess;
  final Future<void> Function()? onValidationFailed;

  const CustomForm({
    Key? key,
    this.title,
    this.buttonText,
    this.description,
    required this.children,
    this.onValidationFailed,
    required this.onValidationSuccess,
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
                await widget.onValidationSuccess.call();
              } else {
                await widget.onValidationFailed?.call();
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

buildRowTextFields(CustomFormFieldModel field1, CustomFormFieldModel field2) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: FormsKit.widget.inputs.popUpTextInput(
          label: field1.label,
          hintText: field1.hintText,
          controller: field1.controller,
          onChanged: field1.onChanged,
          validator: field1.validator,
          isSuffixIconEnabled: field1.isSuffixIconEnabled,
          suffixeIcon: field1.suffixIcon,
          suffixIconOnPressed: field1.suffixIconOnPressed,
          width: field1.width,
        ),
      ),
      SizedBox(width: 3),
      Expanded(
        child: FormsKit.widget.inputs.popUpTextInput(
          label: field2.label,
          hintText: field2.hintText,
          controller: field2.controller,
          onChanged: field2.onChanged,
          validator: field2.validator,
          isSuffixIconEnabled: field2.isSuffixIconEnabled,
          suffixeIcon: field2.suffixIcon,
          suffixIconOnPressed: field2.suffixIconOnPressed,
          width: field2.width,
        ),
      ),
    ],
  );
}

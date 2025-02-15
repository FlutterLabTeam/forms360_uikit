import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/model/custom_form_model.dart';
import 'package:forms360_uikit/src/widgets/inputs/pop_up_text_input.dart';

class PopUpRowTextInputs extends StatelessWidget {
  final CustomFormFieldModel field1;
  final CustomFormFieldModel field2;

  const PopUpRowTextInputs({
    Key? key,
    required this.field1,
    required this.field2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: PopUpTextInput(
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
          child: PopUpTextInput(
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
}

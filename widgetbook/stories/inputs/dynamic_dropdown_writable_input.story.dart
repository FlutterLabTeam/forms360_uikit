import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/inputs/dynamic_dropdown_writable_input.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Single Selection',
  type: DynamicDropdownWritableInput,
)
Widget singleSelectionDropdown(BuildContext context) {
  final controller = TextEditingController();
  final items = ['Apple', 'Banana', 'Orange', 'Mango', 'Grape'];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: DynamicDropdownWritableInput<String>(
      label: 'Fruits',
      hintText: 'Select a fruit',
      items: items,
      inputColor: PrimaryInputColorKit.BLUE,
      dropdownSearchFieldController: controller,
      onSuggestionSelected: (value) {
        print('Selected: $value');
      },
      getStringValue: (item) => item,
      onSuggestionCallback: (pattern) {
        return items
            .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Multi Selection',
  type: DynamicDropdownWritableInput,
)
Widget multiSelectionDropdown(BuildContext context) {
  final controller = TextEditingController();
  final items = ['Red', 'Blue', 'Green', 'Yellow', 'Purple'];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: DynamicDropdownWritableInput<String>(
      label: 'Colors',
      hintText: 'Select colors',
      items: items,
      type: DropdownWritableInputType.MULTI,
      inputColor: PrimaryInputColorKit.BLUE,
      dropdownSearchFieldController: controller,
      onSuggestionSelected: (value) {
        print('Selected: $value');
      },
      onSelectedValuesChanged: (values) {
        print('Selected values: $values');
      },
      getStringValue: (item) => item,
      onSuggestionCallback: (pattern) {
        return items
            .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disabled',
  type: DynamicDropdownWritableInput,
)
Widget disabledDropdown(BuildContext context) {
  final controller = TextEditingController();
  final items = ['Option 1', 'Option 2', 'Option 3'];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: DynamicDropdownWritableInput<String>(
      label: 'Disabled Input',
      hintText: 'Cannot select',
      items: items,
      enabled: false,
      inputColor: PrimaryInputColorKit.BLACK,
      dropdownSearchFieldController: controller,
      onSuggestionSelected: (value) {
        print('Selected: $value');
      },
      getStringValue: (item) => item,
      onSuggestionCallback: (pattern) {
        return items
            .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'With Initial Value',
  type: DynamicDropdownWritableInput,
)
Widget initialValueDropdown(BuildContext context) {
  final controller = TextEditingController();
  final items = ['Cat', 'Dog', 'Bird', 'Fish', 'Rabbit'];
  const initialValue = 'Dog';

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: DynamicDropdownWritableInput<String>(
      label: 'Pets',
      hintText: 'Select a pet',
      items: items,
      initialValue: initialValue,
      inputColor: PrimaryInputColorKit.BLUE,
      dropdownSearchFieldController: controller,
      onSuggestionSelected: (value) {
        print('Selected: $value');
      },
      getStringValue: (item) => item,
      onSuggestionCallback: (pattern) {
        return items
            .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
    ),
  );
}

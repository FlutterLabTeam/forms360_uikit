import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

class DynamicDropdownWritableInput<T> extends StatefulWidget {
  DynamicDropdownWritableInput({
    super.key,
    this.validator,
    this.initialValue,
    this.fontSize = 16,
    required this.items,
    this.enabled = true,
    this.contentPadding,
    required this.label,
    required this.hintText,
    this.onSelectedValuesChanged,
    required this.getStringValue,
    this.selectedValues = const [],
    PrimaryInputColorKit? inputColor,
    required this.onSuggestionCallback,
    required this.onSuggestionSelected,
    required this.dropdownSearchFieldController,
    this.type = DropdownWritableInputType.SINGLE,
    this.getItemWidget,
  }) : inputColor = inputColor ?? PrimaryInputColorKit.BLUE;

  final String label;
  final bool enabled;
  final String hintText;
  final double? fontSize;
  final List<T> items;
  final T? initialValue;
  final List<T> selectedValues;
  final DropdownWritableInputType type;
  final PrimaryInputColorKit inputColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(T?)? validator;
  final Function(T) onSuggestionSelected;
  final Function(List)? onSelectedValuesChanged;
  final TextEditingController dropdownSearchFieldController;
  final String Function(T) getStringValue;
  final FutureOr<List<T>> Function(String) onSuggestionCallback;
  final Widget Function(dynamic)? getItemWidget;

  /// Converts an item of type T into a String using the provided getStringValue function.
  String convertToString(item) {
    return getStringValue(item as T);
  }

  @override
  State<DynamicDropdownWritableInput> createState() =>
      _DynamicDropdownWritableInputState<T>();
}

class _DynamicDropdownWritableInputState<T>
    extends State<DynamicDropdownWritableInput> {
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.dropdownSearchFieldController.text = widget.convertToString(
        widget.initialValue!,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownSearchFormField<T>(
          enabled: widget.enabled,
          textFieldConfiguration: TextFieldConfiguration(
            enabled: widget.enabled,
            style: AppearanceKitTextTheme.build().input.copyWith(
              color: _generateColor(),
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: _generateColor(),
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hintText,
              contentPadding: widget.contentPadding,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _generateColor()),
              ),
              hintStyle: AppearanceKitTextTheme.build().input.copyWith(
                color: _generateColor(),
                fontSize: widget.fontSize,
              ),
              labelStyle: AppearanceKitTextTheme.build().input.copyWith(
                color: _generateColor(),
                fontSize: widget.fontSize,
              ),
            ),
            controller: widget.dropdownSearchFieldController,
          ),
          suggestionsCallback: (pattern) =>
              widget.onSuggestionCallback(pattern) as FutureOr<Iterable<T>>,
          itemBuilder: (context, dynamic suggestion) {
            if (widget.getItemWidget != null) {
              return ListTile(title: widget.getItemWidget!(suggestion));
            }
            return ListTile(
              title: Text(widget.convertToString(suggestion as T)),
            );
          },
          itemSeparatorBuilder: (context, index) => Divider(),
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (T suggestion) {
            if (widget.type == DropdownWritableInputType.MULTI) {
              if (widget.selectedValues.contains(suggestion)) {
                widget.selectedValues.remove(suggestion);
              } else {
                widget.selectedValues.add(suggestion);
              }

              setState(() {});
              if (widget.onSelectedValuesChanged != null) {
                widget.onSelectedValuesChanged!(widget.selectedValues);
              }
              widget.onSuggestionSelected(suggestion);
            } else {
              widget.dropdownSearchFieldController.text = widget
                  .convertToString(suggestion);
              widget.onSuggestionSelected(suggestion);
            }
          },
          suggestionsBoxController: suggestionBoxController,
          validator:
              widget.validator ??
              (value) {
                if (value!.isEmpty &&
                    widget.type == DropdownWritableInputType.SINGLE) {
                  return 'Please select a value';
                } else {
                  return null;
                }
              },
          onSaved: (value) => widget.selectedValues.add(value!),
          displayAllSuggestionWhenTap: widget.enabled,
        ),
        if (widget.selectedValues.isNotEmpty)
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(widget.selectedValues.length, (
              int index,
            ) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Chip(
                  label: Text(
                    widget.convertToString(widget.selectedValues[index]),
                    style: TextStyle(fontSize: widget.fontSize),
                  ),
                  onDeleted: () {
                    widget.selectedValues.remove(widget.selectedValues[index]);
                    setState(() {});
                    if (widget.onSelectedValuesChanged != null) {
                      widget.onSelectedValuesChanged!(widget.selectedValues);
                    }
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Color _generateColor() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}

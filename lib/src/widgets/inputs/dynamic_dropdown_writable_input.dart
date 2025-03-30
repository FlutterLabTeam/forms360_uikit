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
    required this.inputColor,
    this.onSelectedValuesChanged,
    this.selectedValues = const [],
    required this.onSuggestionSelected,
    required this.dropdownSearchFieldController,
    required this.getSuggetions,
    this.type = DropdownWritableInputType.SINGLE,
  });

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
  final void Function(T) onSuggestionSelected;
  final Function(List<T>)? onSelectedValuesChanged;
  final TextEditingController dropdownSearchFieldController;
  final Function(T) getSuggetions;

  @override
  State<DynamicDropdownWritableInput> createState() =>
      _DynamicDropdownWritableInputState();
}

class _DynamicDropdownWritableInputState
    extends State<DynamicDropdownWritableInput> {
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  // List<String> getSuggestions(String query) {
  //   List<String> matches = <String>[];
  //   matches.addAll(widget.items);

  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }

  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.dropdownSearchFieldController.text = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownSearchFormField(
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
          suggestionsCallback: (pattern) => widget.getSuggetions(pattern),
          itemBuilder: (context, String suggestion) {
            return ListTile(title: Text(suggestion));
          },
          itemSeparatorBuilder: (context, index) => Divider(),
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (String suggestion) {
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
              widget.dropdownSearchFieldController.text = suggestion;
              widget.onSuggestionSelected(suggestion);
            }
          },
          suggestionsBoxController: suggestionBoxController,
          validator: widget.validator ??
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
            children: List<Widget>.generate(
              widget.selectedValues.length,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Text(widget.selectedValues[index],
                        style: TextStyle(
                          fontSize: widget.fontSize,
                        )),
                    onDeleted: () {
                      widget.selectedValues
                          .remove(widget.selectedValues[index]);
                      setState(() {});
                      if (widget.onSelectedValuesChanged != null) {
                        widget.onSelectedValuesChanged!(widget.selectedValues);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
      ],
    );
  }

  Color _generateColor() {
    if (widget.inputColor == PrimaryInputColorKit.BLACK) return Colors.black;
    return Theme.of(context).colorScheme.primary;
  }
}
